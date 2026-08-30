import 'dart:convert';

import 'package:aqscustomer/ModelClasses/getallcities.dart';
import 'package:aqscustomer/ModelClasses/newaddress_second.dart';
import 'package:aqscustomer/providers/get_all_city_provider.dart';
import 'package:aqscustomer/providers/get_all_country_provider.dart';
import 'package:aqscustomer/providers/get_all_state_provider.dart';
import 'package:aqscustomer/providers/real_estate_provider.dart';
import 'package:aqscustomer/screens/address_list.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../ModelClasses/newaddress_first.dart';
import 'book_service.dart';

class AddNewAddress extends StatefulWidget {
  int nav;
  String serviceName;
  String img;
  String bookingDate;
  String alternativeDate;
  AddNewAddress({Key key , @required this.nav,@required this.serviceName, @required this.img, @required this.bookingDate, @required this. alternativeDate}) : super(key: key);

  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}
Future<AddressSecond> user;
class _AddNewAddressState extends State<AddNewAddress> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _geolocation = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();

  String serviceName;
  String img;
  String bookingDate;
  String alternativeDate;

  bool isClicked = false;
  bool cityShow;
  int _radioSelected = 0;
  bool _checkbox = false;
  String _radioVal;
  final children = <Widget>[];
  int _realEstate;
  bool _realEstateValue = false;
  String _countryName;
  String _stateName;
  String _cityName;

  Future<AddressSecond> Add(AddressFirst address) async {
    AddressFirst customer = address;

    final Map<String, dynamic> data = customer.toJson();
    String requestBody = json.encode(data);
    print((data));
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCompany$tokenValue",
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.add_customer_addess),
        body: requestBody,
        headers: header);
    print("add address past ${response.body}");
    if (response.statusCode == 200) {
      print("add address ${response.body}");
      final AddressSecond user = addressSecondFromJson(response.body);
      if(user.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(user.statusDescription)));
        if(flag == 1){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BookService()
              ));
        }else{
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AddressList()
              ));
        }
      }
      return user;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<AddressSecond> item;

  Future<List<GetAllCityModel>> GetAllCity(String s) async {
    cityShow = true;

    SharedPreferences preferences=await SharedPreferences.getInstance();
    int addressId=preferences.getInt("addressId");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCompany$tokenValue",
      "Content-Type": "application/json"
    };

    final response = await http.get(
        Uri.parse(
            AppUrl.get_all_city_url+"$s"),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List<GetAllCityModel> user = getAllCityModelFromJson(response.body);
      // for(var i=0; i<response.body.length; i++){
      //   _cityName = user[i].name.toString();
      // }
      //  context.read<GetAllStateProvider>().GetAllState(_countryName);
      //context.read<GetAllCityProvider>().GetAllCity(_stateName);
      //context.read<GetAllCityModel>().cityId;

      return user;
    } else {
      throw Exception('Failed to load');
    }
  }
  Future<List<GetAllCityModel>> city;

  int flag;
  @override
  void initState() {
    super.initState();
    _countryName =  2.toString();
    context.read<GetAllStateProvider>().GetAllState(_countryName);
    context.read<GetAllCityProvider>().GetAllCity(_stateName);
    flag = widget.nav;
    serviceName = widget.serviceName;
    img = widget.img;
    bookingDate = widget.bookingDate;
    alternativeDate = widget.alternativeDate;
  }

  @override
  Widget build(BuildContext context) {
    context.read<RealEstateProvider>().GetRealEstateList();
     context.read<GetAllCityProvider>().GetAllCity;
     context.read<GetAllStateProvider>().GetAllState;
     context.read<GetAllCountryProvider>().GetAllCountry();
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        leading: GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
          onTap: (){
          if(flag == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (newContext) =>
                    BookService(serviceName: serviceName, img: img,bookingDate: bookingDate,alternativeDate: alternativeDate,)));
          }else{
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AddressList()
                ));
          }
          },
        ),
        centerTitle: false,
        title: Text(
          "Add New Address",
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
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            alignment: Alignment.center,
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Address", style: textwithblackrobotolight())),
                  TextFormField(
                    validator: (val) => val.isNotEmpty ? null : 'Empty field',
                    controller: _address,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Address"
                    ),
                  ),
                  SizedBox(height: 15),

                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Geo Location",
                          style: textwithblackrobotolight())),
                  TextFormField(
                    validator: (val) => val.isNotEmpty ? null : 'Empty field',
                    controller: _geolocation,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Geo Location"
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Country", style: textwithblackrobotolight())),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Text("Qatar", style: TextStyle(fontSize: 16))),


                  SizedBox(height: 15),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("State", style: textwithblackrobotolight())),
                  Consumer<GetAllStateProvider>(
                    builder: (context, value, child) {
                      return SizedBox(
                        child: Container(
                          child: DropdownButton(
                            hint: Text("Select State"),
                            isExpanded: true,
                            underline: Container(
                              height: 1.0,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0))),
                            ),
                            items: value.responseString.map((item) {
                              return  DropdownMenuItem(
                                  child: Text(item['name']),
                                  value: item['stateId'].toString());
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                _cityName = null;
                                _stateName = newVal;
                                city = GetAllCity(_stateName);
                                context.read<GetAllCityProvider>().GetAllCity(_stateName);
                                print(_stateName);
                              });
                            },
                            value: _stateName,
                          ),
                        ),
                      );
                    },
                  ),


                  SizedBox(height: 15),
                  if(cityShow == true)Container(
                      alignment: Alignment.topLeft,
                      child: Text("City", style: textwithblackrobotolight())),
                  if(cityShow == true)Container(
                    alignment: Alignment.topLeft,
                    child: FutureBuilder(
                        future: city,
                        builder: (BuildContext context, AsyncSnapshot<List<GetAllCityModel>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }else
                          if (snapshot.data == null) {
                            return const Center(
                              child: Text(" "),
                            );
                          } else {
                            return SizedBox(
                              child: Container(
                                child: DropdownButton(
                                  hint: Text("Select City"),
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1.0,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0))),
                                  ),
                                  items: snapshot.data.map((item) {
                                    return  DropdownMenuItem(
                                        child: Text(item.name),
                                        value: item.cityId.toString());
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      _cityName = newVal;
                                      print(_cityName);
                                    });
                                  },
                                  value: _cityName,
                                ),
                              ),
                            );
                          }
                        }
                    ),
                  ),

                  SizedBox(height: 15),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Address Type",
                          style: textwithblackrobotolight())),

                  // ToggleSwitch(
                  //   minWidth: 90.0,
                  //   minHeight: 90.0,
                  //   fontSize: 16.0,
                  //   initialLabelIndex: 1,
                  //   activeBgColor: [Colors.green],
                  //   activeFgColor: Colors.white,
                  //   inactiveBgColor: Colors.grey,
                  //   inactiveFgColor: Colors.grey[900],
                  //   totalSwitches: 3,
                  //   labels: ['Tall', 'Grande', 'Venti'],
                  //   onToggle: (index) {
                  //     print('switched to: $index');
                  //   },
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioSelected,
                        activeColor: buttoncolor,
                        onChanged: (value) {
                          setState(() {
                            _radioSelected = value;
                            _radioVal = 'Residential';
                          });
                        },
                      ),
                      Text('Residential', style: textwithblackrobotoregular()),
                      Radio(
                        value: 1,
                        groupValue: _radioSelected,
                        activeColor: buttoncolor,
                        onChanged: (value) {
                          setState(() {
                            _radioSelected = value;
                            _radioVal = 'Commercial';
                          });
                        },
                      ),
                      Text('Commercial', style: textwithblackrobotoregular()),
                    ],
                  ),
                   SizedBox(height: 15),
                  Container(
                    alignment: Alignment.topLeft,
                    child: CheckboxListTile(
                      title: Text("Property Managed by Real Estate Agency",
                          style: textwithblackrobotoregular()),
                      value: _checkbox,
                      onChanged: (newValue) {
                        setState(() {
                          _checkbox = newValue;
                        });
                        print("check box value $_checkbox");
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  ),

                  SizedBox(height: 15),
                  Container(
                      alignment: Alignment.topLeft,
                      child:
                          Text("Real Estate", style: textwithblackrobotolight())),
                  Consumer<RealEstateProvider>(
                    builder: (context, value, child) {
                      return SizedBox(
                        child: Container(
                          child: DropdownButton(
                            onTap: (){
                              return null;
                            },
                            hint: const Text("Choose Real Estate"),
                            isExpanded: true,
                            disabledHint: const Text('Choose Real Estate'),
                            underline: Container(
                              height: 1.0,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0))),
                            ),
                            items: _checkbox == true ? value.responseString.map((item) {
                              return  DropdownMenuItem(
                                  child: Text(item['name']),
                                  value: item['realEstateId']);
                            }).toList() : null,
                            onChanged: (newVal) {
                              _realEstateValue = true;
                              print("realEstate value add add new address is $_realEstateValue");
                              setState(() {
                                _realEstate = newVal;

                                print('add new address realEstate value is $_realEstate');
                              });
                            },
                            value: _realEstate,
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences preferences=await SharedPreferences.getInstance();
                      int customerId = preferences.getInt("customerId");
                      setState(()  {
                        isClicked = true;
                        Address address = Address(
                          location: _address.text,
                          geoLocation: _geolocation.text,
                          latitude: "9.066729076516385",
                          longitude: "76.54446092757433",
                          cityId: _cityName,
                          countryId:2.toString(),
                          stateId:_stateName,
                        );
                        AddressFirst model = AddressFirst(
                          isResidential: _radioSelected,
                          isRealEstate: _realEstateValue,
                          realEstateId: _realEstate,
                          address: address,
                          customerId: customerId,
                        );
                        item = Add(model);
                      });
                      print("value of radio selected in add new address is $_radioSelected");

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if(isClicked == true)FutureBuilder(
                      future: item,
                      builder: (context, AsyncSnapshot<AddressSecond> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }else{
                          if(snapshot.data == null){
                            return Center(child: Text("Something went wrong"));
                          }else{
                            if(isClicked == true){
                              print('hello ${snapshot.data.statusDescription}');
                              }
                            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop() async {
    if(flag == 1){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (newContext) => BookService(serviceName: serviceName,img: img,bookingDate: bookingDate,alternativeDate: alternativeDate,)));
      return true;
    }else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (newContext) => AddressList()));
      return true;
    }
  }
}
