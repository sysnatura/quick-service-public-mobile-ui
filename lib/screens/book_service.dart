import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:aqscustomer/ModelClasses/save_service_one.dart';
import 'package:aqscustomer/ModelClasses/save_service_two.dart';
import 'package:aqscustomer/ModelClasses/set_as_primary_address.dart';
import 'package:aqscustomer/providers/get_customer_address.dart';
import 'package:aqscustomer/providers/get_service_questions_provider.dart';
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

class _BookServiceState extends State<BookService> {
  String serviceName;
  String img;
  String you = "_240";
  var dateValue;
  List selectedItemValue = [];
  List <CheckBoxList>mainList = [];
  List<CheckBoxList> checkBoxListGetItem = [];
  List<DropDown> DropdownListGetItem = [];
  List<RadioButton> RadioButtonGetList = [];
  List<DropDown> textAreaValueList = [];
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


  String houseNumber;
  String location;
  int cityId;
  int stateId;
  String latitude;
  String longitude;
  String geoLocation;
  int customerAddressId;
  DateTime d1;
  DateTime d2;

  /// controller for textArea in Related Question
  TextEditingController host = TextEditingController();

  String checkedItem;
  int _radioSelectedButton;
  int _curval;
  bool loader;
  /// Set Address As Primary Api
  Future<SetAsPrimary> SetPrimaryAddressFn(int id) async {

    print('customer address id $id');
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int addressId = preferences.getInt("addressId");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$you",
      "Content-Type": "application/json"
    };

    final response = await http.get(
        Uri.parse(AppUrl.setAsPrimary_url+'$id'),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final SetAsPrimary user = setAsPrimaryFromJson(response.body);
      activeInactiveFunction();
      if(user.statusCode == 200){
        setState(() {
          context.read<GetCustomerAddressProvider>().GetCustomerAddress();
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(user.statusDescription)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(user.statusDescription)));
      }
      return user;
    } else {
      throw Exception('Failed to load');
    }
  }

  /// Save Service Api
  Future<SaveServiceTwo> Save(String customerID, DateTime date,DateTime date2,
      String houseno,String location,int cityid,int stateid,int countryid,
      String lat,String long,String geolocation,int customeraddressid,int isurgent,
      String description,int attributrid,List<CheckBoxList> getServiceOrderItem) async {
    // SaveServiceOne customer = saveServiceOne;
    List<Map<String,dynamic>> AttributeList;
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");

    for(int i=0;i<getServiceOrderItem.length;i++)
      {
        AttributeList=[{
          "serviceOrderItemAnswerDto": {
            "answer": getServiceOrderItem[i].name,
            "attributeoptionvalue": getServiceOrderItem[i].id,
            "attributeQuestionsId": getServiceOrderItem[i].qstnId
          }
        }];
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
            "attributeQuestionDtoList": AttributeList
          }
        }
      ]
    };
    String requestBody = json.encode(apibody);
    print("this is Api Body $apibody");
    var header = {
      "authorization": "BearerCustomer $tokenValue$you",
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.book_service),
        body: requestBody,
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      print("save service order response ${response.body}");
      final SaveServiceTwo user = saveServiceTwoFromJson(response.body);
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

    context.read<GetCustomerAddressProvider>().GetCustomerAddress();
    context.read<GetServiceQuestionsProvider>().GetQuestions();
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
              Consumer<GetCustomerAddressProvider>(
                  builder: (context, value, child) {
                    return !value.error
                        ? Center(child: CircularProgressIndicator())
                        : value.error && value.responseString.isEmpty
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
                              children: List.generate(value.responseString.length, (index) {
                              value.responseString[index].setPrimary = false;
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
                                      if (value.responseString[index].customer
                                          .customerName !=
                                          null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            value.responseString[index].customer.customerName,
                                            style: textwithblackrobotoregular(),
                                          ),
                                        ),


                                      if (value.responseString[index].address.stateDto.name != null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            value.responseString[index]
                                                .address.stateDto.name,
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),
                                      if (value.responseString[index].address.stateDto.name == null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(" ",
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),


                                      if (value.responseString[index].address.location != null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            value.responseString[index]
                                                .address.location,
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),
                                      if (value.responseString[index].address.location == null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(" ",
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),


                                      if (value.responseString[index].address.geoLocation != null)
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            value.responseString[index]
                                                .address.geoLocation,
                                            style:
                                            textwithblackrobotoregular(),
                                          ),
                                        ),
                                      if (value.responseString[index].address.geoLocation == null)
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
                                          StatefulBuilder(
                                          builder: (context, setState) {
                                            if(value.responseString[index].isPrimary == 1){
                                              value.responseString[index].setPrimary = true;
                                              int customerId = value.responseString[index].customerId;
                                              print("customerId $customerId");
                                              houseNumber = value.responseString[index].address.houseNo;
                                              print("houseNumber$houseNumber");
                                              customerAddressId = value.responseString[index].customerAddressId;
                                              location = value.responseString[index].address.location;
                                              cityId = value.responseString[index].address.cityId;
                                              stateId = value.responseString[index].address.stateId;
                                              latitude = value.responseString[index].address.latitude;
                                              longitude = value.responseString[index].address.longitude;
                                              geoLocation = value.responseString[index].address.geoLocation;
                                            }
                                          return
                                            Checkbox(
                                              value: value.responseString[index].setPrimary,
                                              onChanged: (bool val) async {
                                                SharedPreferences preferences =
                                                await SharedPreferences.getInstance();
                                                int customerAddressId = value.responseString[index].customerAddressId;
                                                print("customerAddressId id is this $customerAddressId");
                                                setState(() {
                                                  value.responseString[index]
                                                      .setPrimary = val;
                                                  if (val == true) {
                                                    SetPrimaryAddressFn(customerAddressId);

                                                  }
                                                });
                                              },
                                            );
                                          } ),
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
              GestureDetector(
                onTap: () {
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

              Consumer<GetServiceQuestionsProvider>(
                builder: (context, value, child) {
                  children.clear();
                  return !value.error ? const CircularProgressIndicator() :value.error && value.responseString == null ? const Center(child: Text("No Data"),):
                   ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value.responseString.length,
                        itemBuilder: (context, index) {
                          for(int i=0;i<value.responseString[index].attributeQuestionDtoList.length;i++){
                            // print(value.responseString[index].attributeQuestionDtoList[i].description);
                            children.add(
                              Container(
                                  margin: EdgeInsets.only(top: 5,left: 10,right: 10),
                                  height: 40,
                                  width: width*2,
                                  padding: EdgeInsets.all(5),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(value.responseString[index].attributeQuestionDtoList[i].description,style: TextStyle(color: headcolor,fontSize: 18),))),
                            );

                            var iD;
                              /// Showing TextArea
                              if(value.responseString[index].attributeQuestionDtoList[i].inputType == 0){
                                for(var p=0; p<value.responseString[index].attributeQuestionDtoList[i].attributeOptionDtoList.length; p++){

                                  DropDown(id: value.responseString[index].attributeQuestionDtoList[i]
                                      .attributeOptionDtoList[p].attributeOptionId, name: value.responseString[index].attributeQuestionDtoList[i]
                                      .attributeOptionDtoList[p].name,qstnId: value.responseString[index].attributeQuestionDtoList[i].attributeQuestionId,
                                      title: value.responseString[index].attributeQuestionDtoList[i].description);

                                  iD = value.responseString[index].attributeQuestionDtoList[i].attributeQuestionId;
                                }
                                children.add(
                                    Container(
                                      margin: EdgeInsets.only(top: 5,left: 10,right: 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Answer..",
                                            hintStyle: TextStyle(color: Colors.blue),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(new Radius.circular(15.0))),
                                            labelStyle: TextStyle(color: Colors.black54)),
                                        textAlign: TextAlign.left,
                                        style:  const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.0,
                                        ),
                                        controller: host,
                                            onSaved:(value){
                                           setState(() {
                                             textAreaValueList.add(DropDown(id: 0, name: host.text, qstnId: iD));
                                          });
                                        }
                                      ),
                                    ),
                                );
                              }


                              for(int j=0;j<value.responseString[index].attributeQuestionDtoList[i].attributeOptionDtoList.length;j++){
                                // print(value.responseString[index].attributeQuestionDtoList[i].attributeOptionDtoList[j].name);
///----------------------------------------------------------------------------------------------------------------------------------------------------------///

                                ///showing checkboxTile
                                if(value.responseString[index].attributeQuestionDtoList[i].inputType == 4){
                                  List<CheckBoxList> checkBoxListItem = [];

                                  //checkBoxListItem.clear();
                                  for(var p=0; p<value.responseString[index].attributeQuestionDtoList[i].attributeOptionDtoList.length; p++){

                                    checkBoxListItem.add(CheckBoxList(id: value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].attributeOptionId, name: value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].name,isCheck: value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].isDefault,qstnId: value.responseString[index].attributeQuestionDtoList[i].attributeQuestionId,
                                         title: value.responseString[index].attributeQuestionDtoList[i].description));
                                  }

                                    children.add(
                                      Column(
                                        children: [
                                          Column(
                                            children: checkBoxListItem.map((item){
                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                   // checkBoxListItem.clear();
                                                    return CheckboxListTile(
                                                      title: Text(item.name),
                                                      value: item.isCheck,
                                                      onChanged: (newValue){
                                                        setState(() {
                                                          item.isCheck = newValue;
                                                          print("This is new value of CheckBox Get List is $newValue");
                                                        });

                                                        /// Adding selected checked value(item) to CheckBoxListGetItem

                                                        if(item.isCheck == true){
                                                          checkBoxListGetItem.add(CheckBoxList(id: item.id, name: item.name,isCheck: newValue,
                                                          qstnId: item.qstnId,title:item.title ));

                                                          ///only To >show< sElected CheckBox Items in the checkBoxListGetItem
                                                          for(int l=0; l<checkBoxListGetItem.length; l++){
                                                            print("Value Added to drop Down GetList Item Id is ${checkBoxListGetItem[l].id}");
                                                            print("Value Added to drop Down GetList Item Name is ${checkBoxListGetItem[l].name}");
                                                            print("Value Added to drop Down GetList Item Question Id is ${checkBoxListGetItem[l].qstnId}");
                                                            print("Value Added to drop Down GetList Item Title is ${checkBoxListGetItem[l].title}");
                                                          }
                                                        }else if(item.isCheck == false){
                                                          for(int h=0; h<checkBoxListGetItem.length; h++){
                                                            if(item.id == checkBoxListGetItem[h].id){
                                                              checkBoxListGetItem.removeAt(index);
                                                              print("Removed Item from CheckBox GetList is ${item.name}");
                                                              print(item.id);
                                                            }
                                                          }
                                                        }
                                                        print(checkBoxListGetItem);
                                                        print("No:of Items in CheckBox GetList are ${checkBoxListGetItem.length.toString()}");

                                                      },
                                                    );
                                                  });
                                            }).toList()
                                          ),
                                        ],
                                      ),
                                    );
                                }
///----------------------------------------------------------------------------------------------------------------------------------------------------------///

                                ///Showing DropDown lIST
                                if(value.responseString[index].attributeQuestionDtoList[i].inputType == 3){


                                  List<String> dropDownValues = [];

                                  /// Adding values to DropDown list
                                  List<DropDown> DropDownList = [];
                                  DropDownList.clear();
                                  for(int p=0; p<value.responseString[index].attributeQuestionDtoList[i].attributeOptionDtoList.length; p++) {

                                    ///To >show< value in DropDown "FirstValue"

                                      checkedItem = value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].name;

                                      dropDownValues.add(checkedItem);

                                    DropDownList.add(DropDown(id: value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].attributeOptionId, name: value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].name,qstnId: value.responseString[index].attributeQuestionDtoList[i].attributeQuestionId,
                                         title: value.responseString[index].attributeQuestionDtoList[i].description,)

                                    );
                                  }
                                  print("values in that dropdown are $dropDownValues");

                                  DropdownListGetItem.clear();
                                  children.add(
                                    StatefulBuilder(
                                    builder: (context, setState) {
                                      for(int q=0;q<dropDownValues.length; q++) {
                                        return Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          padding: const EdgeInsets.only(left: 10, right: 10),
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              height: 1.0,
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors.transparent,
                                                          width: 0.0))),
                                            ),
                                            items: DropDownList.map((item) {
                                              return DropdownMenuItem(
                                                child: Text(item.name),
                                                value: item.name.toString(),
                                              );
                                            }).toList(),
                                            value: dropDownValues[q],
                                            onChanged: (newVal) {
                                              setState(() {
                                                dropDownValues[q] = newVal;
                                                print("Selected value from the dropDown is $newVal");
                                              });

                                              /// Adding ONLY Selected Value fROM DropDown to List name-DropdownListGetItem
                                              for (int r = 0; r < DropDownList.length; r++) {
                                                if (dropDownValues[q] == DropDownList[r].name) {
                                                  DropdownListGetItem.clear();
                                                  DropdownListGetItem.add(DropDown(
                                                      id: DropDownList[r].id,
                                                      name: DropDownList[r].name,
                                                      qstnId: DropDownList[r].qstnId,
                                                      title: DropDownList[r].title
                                                  ));
                                                }
                                              }
                                              ///only To >show< sElected DropDown Items in the DropdownListGetItem
                                              for (int g = 0; g < DropdownListGetItem.length; g++) {
                                                print("Value Added to drop Down GetList Item Id is ${DropdownListGetItem[g].id}");
                                                print("Value Added to drop Down GetList Item Name is ${DropdownListGetItem[g].name}");
                                                print("Value Added to drop Down GetList Item Question Id is ${DropdownListGetItem[g].qstnId}");
                                                print("Value Added to drop Down GetList Item Title is ${DropdownListGetItem[g].title}");
                                              }
                                              print("Selected Dropdown Count is ${DropdownListGetItem.length}");
                                            },
                                          ),
                                        );
                                      }
                                      return Container();
                                    }),
                                  );
                                }

///----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------///

                                ///Showing Radio Button lIST
                                if(value.responseString[index].attributeQuestionDtoList[i].inputType == 2) {

                                  List<RadioButton> RadioList = [];
                                  RadioList.clear();
                                  for (var p = 0; p < value.responseString[index].attributeQuestionDtoList[i].attributeOptionDtoList.length; p++) {
                                    RadioList.add(RadioButton(id: value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].attributeOptionId, name: value.responseString[index].attributeQuestionDtoList[i]
                                        .attributeOptionDtoList[p].name,isCheck: false,groupValue: p,title: value.responseString[index].attributeQuestionDtoList[i]
                                        .description)

                                    );
                                    print("Group value is ${RadioList[p].groupValue}");
                                  }

                                    children.add(
                                      StatefulBuilder(
                                      builder: (context, setState) {
                                        return Column(
                                            children: [
                                              Container(
                                                margin:EdgeInsets.only(left: 10,right: 10),
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .start,
                                                    children: RadioList.map((
                                                        elements) {
                                                      return Row(
                                                        children: [
                                                          Radio(
                                                            value: elements.groupValue-1,
                                                            groupValue: _curval,
                                                            activeColor: headcolor,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _curval = value;
                                                              });
                                                               print("Selected Radio Button Id is ${elements.id}");
                                                              // print("group value" + elements.groupValue.toString());
                                                              // print("value" + value.toString());


                                                                for(int e=0; e<RadioList.length; e++){
                                                                  if(elements.id == RadioList[e].id){
                                                                    RadioButtonGetList.clear();
                                                                    RadioButtonGetList.add(RadioButton(id: RadioList[e].id,
                                                                        name: RadioList[e].name,
                                                                        isCheck: RadioList[e].isCheck,
                                                                        groupValue: RadioList[e].groupValue,
                                                                        title: RadioList[e].title));
                                                                  }
                                                                }

                                                              for (int g = 0; g < RadioButtonGetList.length; g++) {
                                                                print("Value Added to RadioButtonGetList Title is ${RadioButtonGetList[g].title}");
                                                                print("Value Added to RadioButtonGetList Id is ${RadioButtonGetList[g].id}");
                                                                print("Value Added to RadioButtonGetList Name is ${RadioButtonGetList[g].name}");
                                                              }
                                                              print("Selected Dropdown Count is ${RadioButtonGetList.length}");


                                                                // print(_stateName);
                                                            },
                                                          ),
                                                          Text(elements.name)
                                                        ],
                                                      );
                                                      // return StatefulBuilder(
                                                      // builder: (context, setState) {
                                                      //   // RadioList.clear();
                                                      //
                                                      // }
                                                      // );
                                                    }).toList()
                                                ),
                                              ),
                                            ]
                                        );
                                      })
                                    );

                                }break;
                              }

                          }
                          return Column(
                            children: children,
                          );
                        },

                    );
                },
              ),
              GestureDetector(
                onTap: () async {
                  if(_form.currentState.validate()){
                    _form.currentState.save();

                    for(int i=0; i< textAreaValueList.length; i++){
                      mainList.add(CheckBoxList(id: textAreaValueList[i].id, name: textAreaValueList[i].name, qstnId: textAreaValueList[i].qstnId));
                    }
                    for(int i=0; i<checkBoxListGetItem.length; i++){
                      mainList.add(CheckBoxList(name: checkBoxListGetItem[i].name, id: checkBoxListGetItem[i].id, qstnId: checkBoxListGetItem[i].qstnId));
                    }
                    for(int i=0; i<DropdownListGetItem.length; i++){
                      mainList.add(CheckBoxList(name: DropdownListGetItem[i].name,id: DropdownListGetItem[i].id, qstnId: DropdownListGetItem[i].qstnId));
                    }
                    for(int i=0; i<RadioButtonGetList.length; i++){
                      mainList.add(CheckBoxList(name: RadioButtonGetList[i].name,id: RadioButtonGetList[i].id, qstnId: RadioButtonGetList[i].groupValue));
                    }
                    for(int i=0; i<mainList.length; i++){
                      print("main list - id ${mainList[i].id}");
                      print("main list - name ${mainList[i].name}");
                      print("main list - qstn Id ${mainList[i].qstnId}");
                      print("main list - title ${mainList[i].title}");
                    }

                    List<Map<String,dynamic>> serviceOrderItem;
                    for(int z=0;z<mainList.length;z++)
                    {
                      serviceOrderItem = [{
                        "serviceOrderItemAnswerDto": {
                          "answer": mainList[z].name,
                          "attributeoptionvalue": mainList[z].id,
                          "attributeQuestionsId": mainList[z].qstnId
                        }
                      }];
                      print("ohhhhhhhhhhhhhhhhhhhhhhhhhh$mainList");
                    }

                    SharedPreferences preferences=await SharedPreferences.getInstance();
                    int customerId = preferences.getInt("customerId");
                    int addressId = preferences.getInt("addressId");
                    //int customerAddressId = preferences.getInt("customerAddressId");
                    int attributeId = preferences.getInt("attributeId");
                    setState(()  {
                      isClicked = true;
                      // ServiceOrderAddressDto seviceorderaddressdto = ServiceOrderAddressDto(
                      //   cityId: 7,
                      //   countryId: 3,
                      //   stateId: 10,
                      //   customerAddressId: customerAddressId,
                      //   geoLocation: "Qatar",
                      //   houseNo: "1st Floor",
                      //   latitude: "25.354826",
                      //   longitude: "51.183884",
                      //   location: "Infoventures Villa, Doha, Qatars"
                      // );

                      Save(customerId.toString(), DateTime.parse(_bookingDate), DateTime.parse(_alternativeTime),
                          houseNumber,location, cityId, stateId, 2, latitude, longitude,
                          geoLocation, customerAddressId,_radioSelected,_description.text,attributeId, mainList);
                      // service = Save(SaveServiceOne(
                      //   customerId: customerId.toString(),
                      //   alternativeServiceDate: DateTime.parse(_bookingDate),
                      //   serviceDate:DateTime.parse(_bookingDate),
                      //   serviceOrderAddressDto: seviceorderaddressdto,
                      //   serviceOrderItemDto: serviceOrderItem,
                      // )
                      // );

                    });

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
    showDialog(
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
                setState(() {
                  Provider.of<GetCustomerAddressProvider>(context,listen: false).GetCustomerAddress();
                });
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    ) ?? false;
  }
}
class DropDown{
  DropDown({
    @required this.id,
    @required this.name,
    @required this.qstnId,
    @required this.title,

  });
  int id;
  String name;
  int qstnId;
  String title;

}

class CheckBoxList{
  CheckBoxList({
    @required this.id,
    @required this.name,
    @required this.isCheck,
    @required this.qstnId,
    @required this.title,
  });
  int id;
  String name;
  bool isCheck;
  int qstnId;
  String title;
}
class RadioButton{
  RadioButton({
    @required this.id,
    @required this.name,
    @required this.isCheck,
    @required this.groupValue,
    @required this.title

  });
  int id;
  String name;
  bool isCheck;
  int groupValue;
  String title;
}
