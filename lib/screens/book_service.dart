import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:aqscustomer/ModelClasses/save_service_one.dart';
import 'package:aqscustomer/ModelClasses/save_service_two.dart';
import 'package:aqscustomer/ModelClasses/set_as_primary_address.dart';
import 'package:aqscustomer/providers/get_customer_address.dart';
import 'package:aqscustomer/models/get_customer_address_list_model.dart' as customer_address;
import 'package:aqscustomer/providers/get_service_questions_provider.dart';
import 'package:aqscustomer/models/get_service_questions_model.dart' as questions;
import 'package:aqscustomer/providers/service_list_provider.dart';
import 'package:aqscustomer/screens/bottom_navigation.dart';
import 'package:aqscustomer/screens/home_fragment.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:http/http.dart' as http;
import 'package:aqscustomer/screens/add_new_address.dart';
import 'package:aqscustomer/screens/services_list.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/datetime_format.dart';

class BookService extends StatefulWidget {
  String serviceName;
  String img;
  String bookingDate;
  String alternativeDate;
  BookService({Key key, @required this.serviceName, @required this.img, @required this.bookingDate, @required this.alternativeDate}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

enum _AddressState { loading, success, empty, failure }

class _BookServiceState extends State<BookService> {
  String serviceName;
  String img;
  String you = "_240";
  var dateValue;
  List selectedItemValue = [];
  List<questions.GetServiceQuestionsModel> _questionGroups;
  bool _questionFailure = false;
  final Map<int, TextEditingController> _textAnswers = {};
  final Map<int, Set<int>> _checkboxAnswers = {};
  final Map<int, int> _dropdownAnswers = {};
  final Map<int, int> _radioAnswers = {};
  bool isClicked = false;
  String _bookingDate;
  String _alternativeTime;
  int _radioSelected = 0;
  int radiogroupvalue;
  bool primaryValue = false;

  String _radioVal;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _description = TextEditingController();
  int questionId;
  List<dynamic> _questions = [];
  List _answers = [];
  final children = <Widget>[];
  final children1 = <Widget>[];

  var size,height,width;

  /// value set to checkBoxTie
  bool _value = false;
  bool _isChecked;


  _AddressState _addressState = _AddressState.loading;
  List<customer_address.GetCustomerAddressList> _addresses = [];
  customer_address.GetCustomerAddressList _selectedAddress;
  int _addressRequestId = 0;
  int _addressCustomerId;
  bool _primaryUpdating = false;
  DateTime d1;
  DateTime d2;

  /// controller for textArea in Related Question

  String checkedItem;
  int _radioSelectedButton;
  int _curval;
  bool loader;
  Future<void> _loadQuestions() async {
    try {
      final provider = context.read<GetServiceQuestionsProvider>();
      await provider.GetQuestions();
      if (!mounted) return;
      if (!provider.error || provider.responseString == null) {
        throw StateError('Question request failed');
      }
      final groups = provider.responseString;
      final seen = <int>{};
      for (final group in groups) {
        for (final question in group.attributeQuestionDtoList ?? <questions.AttributeQuestionDtoList>[]) {
          final id = question.attributeQuestionId;
          if (id == null || id <= 0 || !seen.add(id)) {
            throw StateError('Invalid question identity');
          }
          final options = _options(question);
          if (question.inputType == 0) {
            _textAnswers.putIfAbsent(id, () => TextEditingController());
          } else if (question.inputType == 4) {
            _checkboxAnswers.putIfAbsent(id, () => options
                .where((option) => option.isDefault == true)
                .map((option) => option.attributeOptionId).toSet());
          } else if (question.inputType == 3 && options.isNotEmpty) {
            // Preserve the previously displayed first-option dropdown default.
            _dropdownAnswers.putIfAbsent(id, () => options.first.attributeOptionId);
          }
          // Radio questions previously started without a selection.
        }
      }
      setState(() { _questionGroups = groups; });
    } catch (_) {
      if (mounted) setState(() { _questionFailure = true; });
    }
  }

  List<questions.AttributeOptionDtoList> _options(questions.AttributeQuestionDtoList question) {
    return (question.attributeOptionDtoList ?? <questions.AttributeOptionDtoList>[])
        .where((option) => option != null && option.attributeOptionId != null && option.attributeOptionId > 0)
        .toList();
  }

  List<CheckBoxList> _answerSnapshot() {
    final answers = <CheckBoxList>[];
    for (final group in _questionGroups) {
      for (final question in group.attributeQuestionDtoList ?? <questions.AttributeQuestionDtoList>[]) {
        final id = question.attributeQuestionId;
        if (question.inputType == 0) {
          answers.add(CheckBoxList(id: 0, name: _textAnswers[id].text, qstnId: id));
        } else {
          final selected = question.inputType == 4
              ? (_checkboxAnswers[id] ?? <int>{})
              : question.inputType == 3
                  ? <int>{_dropdownAnswers[id]}
                  : question.inputType == 2 ? <int>{_radioAnswers[id]} : <int>{};
          for (final option in _options(question)) {
            if (selected.contains(option.attributeOptionId)) {
              answers.add(CheckBoxList(id: option.attributeOptionId, name: option.name ?? '', qstnId: id));
            }
          }
        }
      }
    }
    return List<CheckBoxList>.unmodifiable(answers);
  }

  List<Map<String, dynamic>> _serializeAnswers(List<CheckBoxList> answers) {
    return answers.map((answer) => <String, dynamic>{
      'serviceOrderItemAnswerDto': {
        'answer': answer.name,
        // ServiceOrderItemAnswerDto.AttributeOptionValue is a backend string.
        'attributeoptionvalue': answer.id.toString(),
        'attributeQuestionsId': answer.qstnId,
      },
    }).toList();
  }

  Widget _buildQuestion(questions.AttributeQuestionDtoList question) {
    final id = question.attributeQuestionId;
    final options = _options(question);
    Widget input = const SizedBox.shrink();
    if (question.inputType == 0) {
      input = TextFormField(
        key: ValueKey('text-$id'),
        controller: _textAnswers[id],
        enabled: !isClicked,
        decoration: buildInputDecorationWithIcon('Answer..', Icons.edit),
      );
    } else if (question.inputType == 4) {
      input = Column(children: [
        for (final option in options)
          CheckboxListTile(
            key: ValueKey('checkbox-$id-${option.attributeOptionId}'),
            title: Text(option.name ?? ''),
            value: _checkboxAnswers[id].contains(option.attributeOptionId),
            onChanged: isClicked ? null : (checked) {
              setState(() {
                if (checked == true) {
                  _checkboxAnswers[id].add(option.attributeOptionId);
                } else {
                  _checkboxAnswers[id].remove(option.attributeOptionId);
                }
              });
            },
          ),
      ]);
    } else if (question.inputType == 3 && options.isNotEmpty) {
      input = DropdownButton<int>(
        key: ValueKey('dropdown-$id'),
        isExpanded: true,
        value: _dropdownAnswers[id],
        items: options.map((option) => DropdownMenuItem<int>(
          value: option.attributeOptionId,
          child: Text(option.name ?? ''),
        )).toList(),
        onChanged: isClicked ? null : (value) {
          setState(() { _dropdownAnswers[id] = value; });
        },
      );
    } else if (question.inputType == 2) {
      input = Column(children: [
        for (final option in options)
          RadioListTile<int>(
            key: ValueKey('radio-$id-${option.attributeOptionId}'),
            title: Text(option.name ?? ''),
            value: option.attributeOptionId,
            groupValue: _radioAnswers[id],
            onChanged: isClicked ? null : (value) {
              setState(() { _radioAnswers[id] = value; });
            },
          ),
      ]);
    }
    return Padding(
      key: ValueKey('question-$id'),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(question.description ?? '', style: const TextStyle(color: headcolor, fontSize: 18)),
        input,
      ]),
    );
  }

  @override
  void dispose() {
    for (final controller in _textAnswers.values) {
      controller.dispose();
    }
    _description.dispose();
    super.dispose();
  }

  bool _validAddress(customer_address.GetCustomerAddressList item) {
    final address = item?.address;
    return _addressCustomerId != null && _addressCustomerId > 0 &&
        item != null && item.customerId == _addressCustomerId &&
        item.customerAddressId != null && item.customerAddressId > 0 &&
        item.addressId != null && item.addressId > 0 && address != null &&
        address.cityId != null && address.cityId > 0 &&
        address.stateId != null && address.stateId > 0 &&
        address.countryId != null && address.countryId > 0 &&
        address.location != null && address.location.trim().isNotEmpty &&
        address.location.length <= 500 &&
        (address.houseNo == null || address.houseNo.length <= 500);
  }

  String get _addressProblem {
    if (_primaryUpdating) return 'Please wait for the address update to finish.';
    if (_addressState == _AddressState.loading) return 'Please wait for addresses to load.';
    if (_addressState == _AddressState.failure) return 'Unable to confirm your address. Please refresh and try again.';
    if (_addressState == _AddressState.empty) return 'Please add an address before booking.';
    if (!_validAddress(_selectedAddress)) return 'Choose one complete address as primary before booking.';
    return null;
  }

  Future<void> _loadAddresses({int expectedPrimaryId}) async {
    final requestId = ++_addressRequestId;
    setState(() {
      _addressState = _AddressState.loading;
      _selectedAddress = null;
    });
    try {
      final preferences = await SharedPreferences.getInstance();
      final customerId = preferences.getInt("customerId");
      if (!mounted || requestId != _addressRequestId) return;
      final addresses = await context.read<GetCustomerAddressProvider>().GetCustomerAddress();
      if (!mounted || requestId != _addressRequestId) return;
      if (addresses == null) throw StateError('Address request failed');
      final primaries = addresses.where((item) => item.isPrimary == 1).toList();
      setState(() {
        _addressCustomerId = customerId;
        _addresses = addresses;
        _addressState = addresses.isEmpty ? _AddressState.empty : _AddressState.success;
        _selectedAddress = primaries.length == 1 && _validAddress(primaries.single) &&
            addresses.where((item) => item.customerAddressId == primaries.single.customerAddressId).length == 1 &&
            (expectedPrimaryId == null || primaries.single.customerAddressId == expectedPrimaryId)
            ? primaries.single : null;
      });
    } catch (_) {
      if (!mounted || requestId != _addressRequestId) return;
      setState(() {
        _addressState = _AddressState.failure;
        _selectedAddress = null;
      });
    }
  }

  /// Keep selection tied to the primary address confirmed by the backend.
  Future<SetAsPrimary> SetPrimaryAddressFn(int id) async {
    if (_primaryUpdating || isClicked || _addressState != _AddressState.success) return null;
    final matches = _addresses.where((item) => item.customerAddressId == id).toList();
    if (matches.length != 1 || !_validAddress(matches.single)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('This address is incomplete. Please choose another address.'),
      ));
      return null;
    }
    setState(() {
      _primaryUpdating = true;
      _selectedAddress = null;
    });
    ++_addressRequestId;
    try {
      final preferences = await SharedPreferences.getInstance();
      final tokenValue = preferences.getString("tokenValue");
      if (!mounted) return null;
      if (preferences.getInt("customerId") != _addressCustomerId) {
        throw StateError('Address session changed');
      }
      final response = await http.get(
        Uri.parse(AppUrl.setAsPrimary_url+'$id'),
        headers: {
          "authorization": "BearerCustomer $tokenValue$you",
          "Content-Type": "application/json"
        },
      ).timeout(const Duration(seconds: 30));
      if (response.statusCode != 200) throw StateError('Address update failed');
      final SetAsPrimary user = setAsPrimaryFromJson(response.body);
      if (user.statusCode != 200) throw StateError('Address update rejected');
      if (!mounted) return null;
      await _loadAddresses(expectedPrimaryId: id);
      if (!mounted) return null;
      if (_selectedAddress?.customerAddressId != id) {
        throw StateError('Address update not confirmed');
      }
      activeInactiveFunction();
      return user;
    } catch (_) {
      if (mounted) {
        setState(() {
          _addressState = _AddressState.failure;
          _selectedAddress = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Unable to confirm the address update. Please refresh before booking.'),
        ));
      }
      return null;
    } finally {
      if (mounted) setState(() { _primaryUpdating = false; });
    }
  }

  /// Save Service Api
  Future<SaveServiceTwo> Save(String customerID, DateTime date,DateTime date2,
      String houseno,String location,int cityid,int stateid,int countryid,
      String lat,String long,String geolocation,int customeraddressid,int isurgent,
      String description,int attributrid,List<CheckBoxList> getServiceOrderItem) async {
    if (!mounted || !isClicked || _addressProblem != null) {
      throw StateError('Address is not ready');
    }
    // SaveServiceOne customer = saveServiceOne;
    final attributeList = _serializeAnswers(getServiceOrderItem);
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");
    if (!mounted || !isClicked || _addressProblem != null ||
        preferences.getInt("customerId").toString() != customerID) {
      throw StateError('Booking session changed');
    }

    final Map<String, dynamic> apibody = {
      "customerId": customerID,
      "serviceDate": date.toIso8601String(),
      "alternativeServiceDate": date2.toIso8601String(),
      "serviceOrderAddressDto": {
        "houseNo": houseno,
        "location": location,
        "cityId": cityid,
        "stateId": stateid,
        "countryId": countryid,
        "latitude": lat,
        "longitude": long,
        "geoLocation": geolocation,
        "customerAddressId": customeraddressid
      },
      "serviceOrderItemDto": [
        {
          "isUrgent": isurgent,
          "description": description,
          "attributeId": attributrid,
          "attributeDto": {
            "attributeQuestionDtoList": attributeList
          }
        }
      ]
    };
    String requestBody = json.encode(apibody);
    var header = {
      "authorization": "BearerCustomer $tokenValue$you",
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.book_service),
        body: requestBody,
        headers: header);
    if (response.statusCode == 200) {
      final SaveServiceTwo user = saveServiceTwoFromJson(response.body);
      if (!mounted) return user;
      if(user.statusCode == 200){
        loader = false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigation(currentIndex: 0,)));
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Order Placed Successfully")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed to Place Your Order !')));
      }
      return user;
    } else {
      throw Exception('Failed in Order Placing Function');
    }
  }
  Future<SaveServiceTwo> service;

  bool dateCheck = false;
  String alter = TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 2))).toString();

  @override
  void initState(){
    super.initState();
    serviceName = widget.serviceName;
    img = widget.img;
    _bookingDate = widget.bookingDate;
    _alternativeTime = widget.alternativeDate;
    _loadAddresses();
    _loadQuestions();
  }
  @override
  Widget build(BuildContext context) {
    print("this is alter $alter");
    TimeOfDay initialTime = TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 2)));
    //DateTime alter2 = DateTime.parse(alter);
    //dynamic alter2 = DateFormat('hh:mm a').format(alter);

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    // context.read<ServiceListProvider>().GetList();
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
        onTap: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (newContext) => ServicesList(serviceName: serviceName,img: img,)));
        },
        ),
        title: Text(
          "Book Service",
          style: textwithrobotoregular(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: primaryColor),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(children:<Widget> [
              Container(
                margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Date & Time",
                  style: textwithblackrobotoregular(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Theme(
                          data: ThemeData(
                              inputDecorationTheme: const InputDecorationTheme(
                                border: InputBorder.none,
                              )),
                          child: DateTimePicker(
                            initialValue: _bookingDate,
                            // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                            type: DateTimePickerType.dateTime,
                            dateMask: 'd MMM, yyyy hh:mm a',
                            dateLabelText: 'Service Date and Time',
                            timePickerEntryModeInput: false,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            icon: const Icon(Icons.event),
                            initialTime: initialTime,
                            initialDatePickerMode: DatePickerMode.day,
                            initialDate: DateTime.now().toUtc(),
                            // This will add one year from current date
                            autofocus: false,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "This field cannot be empty";
                              }else{
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  _bookingDate =  value;
                                  print("Booking Date $_bookingDate");
                                });
                              }
                            },
                            // We can also use onSaved
                            onSaved: (value) {
                              if (value.isNotEmpty) {
                                 print("Booking Date two $_bookingDate");
                                _bookingDate = value;
                              }
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Theme(
                          data: ThemeData(
                              inputDecorationTheme: const InputDecorationTheme(
                                border: InputBorder.none,
                              )),
                          child: DateTimePicker(
                            initialValue:_alternativeTime,
                            // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                            type: DateTimePickerType.dateTime,
                            dateMask: 'd MMM, yyyy hh:mm a',
                            dateLabelText: 'Alternative Date and Time',
                            timePickerEntryModeInput: false,
                            initialTime: TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 2))),
                            firstDate:DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            icon: Icon(Icons.event),
                            // This will add one year from current date
                            autovalidate: true,
                            validator: (value){
                              print("alternative value $value");
                              print("boolean value in checkDate is $dateCheck");
                              if(value == null || value.isEmpty){
                                return "This field cannot be empty";
                              }else {
                                if(dateCheck == true){
                                  return "Alternate service time must be 30 minutes greater than the service date";
                                }
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  if(_bookingDate != null) d1 = DateTime.parse(_bookingDate);
                                  print("inmyfn ${_bookingDate}");
                                  if(value != null)d2 = DateTime.parse(value);
                                  print("inmyfn ${value}");
                                  if(d2.isAfter(d1)) {
                                    dateCheck = false;
                                    print('correct');
                                  }else{
                                    dateCheck = true;
                                    print("boolean set to  $dateCheck");
                                    print("incorrect");
                                  }
                                    _alternativeTime = value;
                                    print("alternative date is $_alternativeTime");

                                });
                              }
                            },
                            // We can also use onSaved
                            onSaved: (value) {
                              if (value.isNotEmpty) {
                                _alternativeTime = value;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Address",
                  style: textwithblackrobotoregular(),
                ),
              ),
              Builder(
                  builder: (context) {
                    return _addressState == _AddressState.loading
                        ? Center(child: CircularProgressIndicator())
                        : _addressState == _AddressState.failure
                        ? Text('Unable to load or confirm addresses. Please refresh.', style: textwithrobotoregular())
                        : _addressState == _AddressState.empty
                        ? Center(
                      child: Text(
                        "No Address",
                        style: textwithrobotoregular(),
                      ),
                    )
                        : Container(
                        margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: LayoutBuilder(
                          builder: (context, constraints) => SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(_addresses.length, (index) {
                              return Card(
                                child: Container(
                                  width: constraints.maxWidth < 308
                                      ? constraints.maxWidth - 8
                                      : 300,
                                  color: primaryColor,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      if (_addresses[index].customer
                                          .customerName !=
                                          null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            _addresses[index].customer.customerName,
                                            style: textwithblackrobotoregular(),
                                          ),
                                        ),


                                      if (_addresses[index].address.stateDto.name != null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            _addresses[index]
                                                .address.stateDto.name,
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),
                                      if (_addresses[index].address.stateDto.name == null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(" ",
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),


                                      if (_addresses[index].address.location != null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            _addresses[index]
                                                .address.location,
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),
                                      if (_addresses[index].address.location == null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(" ",
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),


                                      if (_addresses[index].address.geoLocation != null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            _addresses[index]
                                                .address.geoLocation,
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),
                                      if (_addresses[index].address.geoLocation == null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child:  Text(" ", style:
                                          textwithblackrobotoregular(),
                                          ),
                                        ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Flexible(child: Text("Set as Primary",style: textwithblackrobotolight())),
                                            Checkbox(
                                              value: _selectedAddress?.customerAddressId == _addresses[index].customerAddressId,
                                              onChanged: _primaryUpdating || isClicked ? null : (bool val) {
                                                if (val == true) SetPrimaryAddressFn(_addresses[index].customerAddressId);
                                              },
                                            ),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              );
                            }),
                            ),
                          ),
                        ));
                  }),
              Row(
                children: [
                  Expanded(child: Text(_addressProblem ?? 'Primary address confirmed.')),
                  TextButton(
                    onPressed: _primaryUpdating || isClicked ? null : () { _loadAddresses(); },
                    child: const Text('Refresh addresses'),
                  ),
                ],
              ),
              GestureDetector(
                onTap: _primaryUpdating || isClicked ? null : () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AddNewAddress(nav: 1,serviceName: serviceName,img: img,bookingDate: _bookingDate,alternativeDate: _alternativeTime,)));
                },
                child: Container(

                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  alignment: Alignment.topRight,
                  child: const Text(
                    "Add New Address",
                    style: TextStyle(
                        color: headcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'Roboto Regular'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Urgency",
                  style: textwithblackrobotoregular(),
                ),
              ),
              StatefulBuilder(
                builder: (context, setState){
                return Container(
                  margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _radioSelected,
                              activeColor: headcolor,
                              onChanged: (values) {
                                setState(() {
                                  _radioSelected = 0;
                                  _radioVal = 'Not Urgent';
                                });
                              },
                            ),
                            Text('Not Urgent', style: textwithrobotoregular()),
                            Radio(
                              value: 1,
                              groupValue: _radioSelected,
                              activeColor: headcolor,
                              onChanged: (values) {
                                setState(() {
                                  _radioSelected = 1;
                                  _radioVal = 'Urgent';
                                });
                              },
                            ),
                            Text('Urgent', style: textwithrobotoregular()),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 15),
                          child: TextFormField(
                            controller: _description,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: buildInputDecorationWithIcon(
                                "Description", Icons.description),
                          ),
                        ),
                      ],
                    ),
                  ),
                );}
              ),
              Container(
                height: 35,
                color: headcolor,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Related Questions",
                  style: TextStyle(color: whitecolor),
                ),
              ),

              if (_questionFailure)
                const Text('Unable to load questions. Please reopen this booking screen.')
              else if (_questionGroups == null)
                const Center(child: CircularProgressIndicator())
              else
                Column(children: [
                  for (final group in _questionGroups)
                    for (final question in group.attributeQuestionDtoList ?? <questions.AttributeQuestionDtoList>[])
                      _buildQuestion(question),
                ]),
              GestureDetector(
                onTap: () async {
                  if (isClicked) return;
                  if (_questionGroups == null || _questionFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please wait for questions to load, or reopen this booking screen if loading failed.'),
                    ));
                    return;
                  }
                  final addressProblem = _addressProblem;
                  if (addressProblem != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(addressProblem)));
                    return;
                  }
                  if(_form.currentState.validate()){
                    final selected = _selectedAddress;
                    final address = selected.address;
                    final snapshot = Map<String, dynamic>.unmodifiable({
                      'customerAddressId': selected.customerAddressId,
                      'houseNo': address.houseNo,
                      'location': address.location,
                      'cityId': address.cityId,
                      'stateId': address.stateId,
                      'countryId': address.countryId,
                      'latitude': address.latitude,
                      'longitude': address.longitude,
                      'geoLocation': address.geoLocation,
                    });
                    setState(() { isClicked = true; });
                    try {
                    _form.currentState.save();

                    final answerSnapshot = _answerSnapshot();

                    SharedPreferences preferences=await SharedPreferences.getInstance();
                    int customerId = preferences.getInt("customerId");
                    //int customerAddressId = preferences.getInt("customerAddressId");
                    int attributeId = preferences.getInt("attributeId");
                    if (!mounted) return;
                    if (_addressProblem != null || selected != _selectedAddress ||
                        customerId != selected.customerId || attributeId == null || attributeId <= 0) {
                      throw StateError('Booking prerequisites changed');
                    }
                    await Save(customerId.toString(), DateTime.parse(_bookingDate), DateTime.parse(_alternativeTime),
                        snapshot['houseNo'], snapshot['location'], snapshot['cityId'], snapshot['stateId'],
                        snapshot['countryId'], snapshot['latitude'], snapshot['longitude'],
                        snapshot['geoLocation'], snapshot['customerAddressId'],
                        _radioSelected, _description.text, attributeId, answerSnapshot);
                    } catch (_) {
                      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Unable to confirm booking. Check your orders before trying again.'),
                      ));
                    } finally {
                      if (mounted) setState(() { isClicked = false; });
                    }

                  }else{
                    print("Not Validated");
                  }


                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: headcolor),
                    child: const Center(
                      child: Text(
                        'Place Order',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (newContext) => ServicesList(serviceName: serviceName,img: img,)));
    return true;
  }
  Future<bool> activeInactiveFunction() {
    if (!mounted) return Future<bool>.value(false);
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          title: Text('Address selected as primary',style: TextStyle(color: Colors.black),),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok',style: TextStyle(color: Colors.black87)),
              onPressed: () {
                if (!mounted) return;
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    );
  }
}
class CheckBoxList {
  CheckBoxList({@required this.id, @required this.name, @required this.qstnId});
  final int id;
  final String name;
  final int qstnId;
}
