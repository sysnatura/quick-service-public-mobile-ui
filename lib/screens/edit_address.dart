import 'dart:convert';

import 'package:aqscustomer/ModelClasses/editaddressfirst.dart';
import 'package:aqscustomer/ModelClasses/editaddresssecond.dart';
import 'package:aqscustomer/ModelClasses/getallcities.dart';
import 'package:aqscustomer/models/get_customer_address_list_model.dart';
import 'package:aqscustomer/models/get_single_address_model.dart';
import 'package:aqscustomer/models/log_in_model.dart';
import 'package:aqscustomer/providers/get_all_city_provider.dart';
import 'package:aqscustomer/providers/get_all_country_provider.dart';
import 'package:aqscustomer/providers/get_all_state_provider.dart';
import 'package:aqscustomer/providers/get_single_address_provider.dart';
import 'package:aqscustomer/providers/real_estate_provider.dart';
import 'package:aqscustomer/screens/add_new_address.dart';
import 'package:aqscustomer/screens/address_list.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditAddress extends StatefulWidget {
   int radioSelected;
   bool editAddressCheckBox;
   int realEstateId;
   String stateIdValue;
   String cityIdValue;
   EditAddress({Key key, @required this.radioSelected, @required this.editAddressCheckBox, @required this.realEstateId,
     @required this.stateIdValue, @required this.cityIdValue}) : super(key: key);

  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  String to = "_240";
  bool isClicked = false;
  bool cityShow;
  TextEditingController _address, _geolocation;
  //int _radioSelected = 0;
  bool _checkbox = false;
  String _countryName;
  String _radioVal;
  bool _realEstateValue = false;
  int _realEstate;
  String _stateName;
  String _cityName;

  Future<EditAddressSecond> Add(EditAddressOne editAddressOne) async {
    EditAddressOne customer = editAddressOne;

    SharedPreferences preferences=await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");

    final Map<String, dynamic> data = customer.toJson();
    String requestBody = json.encode(data);
    print((data));
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.update_customerAddress),
        body: requestBody,
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      print("Update Customer address response ${response.body}");
      final EditAddressSecond user = editAddressSecondFromJson(response.body);
      if(user.statusCode == 200){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (newContext) => AddressList()));
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Updated Successfully')));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed to update !')));
      }
      return user;
    } else {
      throw Exception('Failed Address Update');
    }
  }
  Future<EditAddressSecond> item;

  Future<List<GetSingleAddressModel>> Getaddress() async {
    print(user);
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int customerId=preferences.getInt("customerId");
    int addressId=preferences.getInt("addressId");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };

    final response = await http.get(
        Uri.parse(
            AppUrl.get_single_address+"id=$customerId&adid=$addressId"),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List<GetSingleAddressModel> user = getSingleAddressModelFromJson(response.body);
      _address = TextEditingController(text: user[0].address.location);
      _geolocation = TextEditingController(text: user[0].address.geoLocation);
      _countryName =  user[0].address.countryId.toString();
      //_stateName = user[0].address.stateId.toString();
      //_cityName = user[0].address.cityId.toString();
      context.read<GetAllStateProvider>().GetAllState(_countryName);

      return user;
    } else {
      throw Exception('Failed to load');
    }
  }
  Future<List<GetSingleAddressModel>> adds;

  Future<List<GetAllCityModel>> GetAllCity(String s) async {
    cityShow = true;
    print("StateId In Edit Address Function $s");

    SharedPreferences preferences=await SharedPreferences.getInstance();
    int addressId=preferences.getInt("addressId");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };

    final response = await http.get(
        Uri.parse(
            AppUrl.get_all_city_url+s),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List<GetAllCityModel> user = getAllCityModelFromJson(response.body);
      if(user.isNotEmpty){

      }
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

 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    adds = Getaddress();
    context.read<GetAllCityProvider>().GetAllCity(widget.stateIdValue);
    city = GetAllCity(widget.stateIdValue);
  }

  @override
  Widget build(BuildContext context) {
    //String name,houseno,geolocation,country, state, city;
    context.read<GetSingleAddressProvider>().GetSingleAddress();
    context.read<GetAllStateProvider>().GetAllState;
    context.read<RealEstateProvider>().GetRealEstateList();
    context.read<GetAllCityProvider>().GetAllCity;


    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(

        centerTitle: false,
        title: Text(
          "Edit Address",
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
          // child: Consumer<GetSingleAddressProvider>(
          //   builder: (context,value,child){
          //     print(houseno);
          //     return !value.error
          //         ? Center(child: CircularProgressIndicator())
          //         : ListView.builder(
          //         shrinkWrap: true,
          //       itemCount: value.responseString.length,
          //         itemBuilder: (context,index){
          //
          //           houseno = value.responseString[index].address.houseNo;
          //           geolocation=value.responseString[index].address.geoLocation;
          //           country = value.responseString[index].address.countryDto.name;
          //           state = value.responseString[index].address.stateDto.name;
          //           city =  value.responseString[index].address.cityDto.name;
          //         return Container(
          //           margin: EdgeInsets.all(10),
          //           child: Column(
          //             children: [
          //               Container(
          //                   alignment: Alignment.topLeft,
          //                   child: Text("Name",
          //                       style: textwithblackrobotolight())),
          //               TextFormField(
          //                 initialValue: name,
          //                 onChanged: (newvalue){
          //                   name=newvalue;
          //                 },
          //                 onSaved: (value){
          //                   name=value;
          //                 },
          //               ),
          //
          //               SizedBox(height: 15),
          //               Container(
          //                   alignment: Alignment.topLeft,
          //                   child: Text("Address",
          //                       style: textwithblackrobotolight())),
          //               TextFormField(
          //                 initialValue: houseno,
          //                 onChanged: (newvalue){
          //                   houseno=newvalue;
          //                 },
          //                 onSaved: (value){
          //                   houseno=value;
          //                 },
          //               ),
          //               SizedBox(height: 15),
          //               Container(
          //                   alignment: Alignment.topLeft,
          //                   child: Text("Geo Location",
          //                       style: textwithblackrobotolight())),
          //               TextFormField(
          //                 initialValue: geolocation,
          //                 onChanged: (newvalue){
          //                   geolocation=newvalue;
          //                 },
          //                 onSaved: (value){
          //                   geolocation=value;
          //                 },
          //               ),
          //
          //
          //               SizedBox(height: 15),
          //               Container(
          //                   alignment: Alignment.topLeft,
          //                   child: Text("Country", style: textwithblackrobotolight())),
          //               Consumer<GetAllCountryProvider>(
          //                 builder: (context, value, child) {
          //                   return SizedBox(
          //                     child: Container(
          //                       child: DropdownButton(
          //                         hint: Text(country),
          //                         isExpanded: true,
          //                         underline: Container(
          //                           height: 1.0,
          //                           decoration: const BoxDecoration(
          //                               border: Border(
          //                                   bottom: BorderSide(
          //                                       color: Colors.transparent,
          //                                       width: 0.0))),
          //                         ),
          //                         items: value.responseString.map((item) {
          //                           return new DropdownMenuItem(
          //                               child: Text(item['name']),
          //                               value: item['countryId'].toString());
          //                         }).toList(),
          //                         onChanged: (newVal) {
          //                           setState(() {
          //                             _countryName = newVal as String;
          //                             context.read<GetAllStateProvider>().GetAllState(_countryName);
          //                             print(_countryName);
          //                           });
          //                         },
          //                         value: _countryName,
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               ),
          //
          //               SizedBox(height: 15),
          //               Container(
          //                   alignment: Alignment.topLeft,
          //                   child: Text("State", style: textwithblackrobotolight())),
          //               Consumer<GetAllStateProvider>(
          //                 builder: (context, value, child) {
          //                   return SizedBox(
          //                     child: Container(
          //                       child: DropdownButton(
          //                         hint: Text(state),
          //                         isExpanded: true,
          //                         underline: Container(
          //                           height: 1.0,
          //                           decoration: const BoxDecoration(
          //                               border: Border(
          //                                   bottom: BorderSide(
          //                                       color: Colors.transparent,
          //                                       width: 0.0))),
          //                         ),
          //                         items: value.responseString.map((item) {
          //                           return new DropdownMenuItem(
          //                               child: Text(item['name']),
          //                               value: item['stateId'].toString());
          //                         }).toList(),
          //                         onChanged: (newVal) {
          //                           setState(() {
          //                             _stateName = newVal as String;
          //                             context.read<GetAllCityProvider>().GetAllCity(_stateName);
          //                             print(_stateName);
          //                           });
          //                         },
          //                         value: _stateName,
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               ),
          //
          //               SizedBox(height: 15),
          //               Container(
          //                   alignment: Alignment.topLeft,
          //                   child: Text("City", style: textwithblackrobotolight())),
          //               Consumer<GetAllCityProvider>(
          //                 builder: (context, value, child) {
          //                   return SizedBox(
          //                     child: Container(
          //                       child: DropdownButton(
          //                         hint: Text(city),
          //                         isExpanded: true,
          //                         underline: Container(
          //                           height: 1.0,
          //                           decoration: const BoxDecoration(
          //                               border: Border(
          //                                   bottom: BorderSide(
          //                                       color: Colors.transparent,
          //                                       width: 0.0))),
          //                         ),
          //                         items: value.responseString.map((item) {
          //                           return new DropdownMenuItem(
          //                               child: Text(item['name']),
          //                               value: item['cityId'].toString());
          //                         }).toList(),
          //                         onChanged: (newVal) {
          //                           setState(() {
          //                             _cityName = newVal as String;
          //                             print(_cityName);
          //                           });
          //                         },
          //                         value: _cityName,
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               ),
          //
          //               SizedBox(height: 15),
          //               Container(
          //                   alignment: Alignment.topLeft,
          //                   child: Text("Address Type",
          //                       style: textwithblackrobotolight())),
          //
          //               // ToggleSwitch(
          //               //   minWidth: 90.0,
          //               //   minHeight: 90.0,
          //               //   fontSize: 16.0,
          //               //   initialLabelIndex: 1,
          //               //   activeBgColor: [Colors.green],
          //               //   activeFgColor: Colors.white,
          //               //   inactiveBgColor: Colors.grey,
          //               //   inactiveFgColor: Colors.grey[900],
          //               //   totalSwitches: 3,
          //               //   labels: ['Tall', 'Grande', 'Venti'],
          //               //   onToggle: (index) {
          //               //     print('switched to: $index');
          //               //   },
          //               // ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 children: [
          //                   Radio(
          //                     value: 0,
          //                     groupValue: _radioSelected,
          //                     activeColor: buttoncolor,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _radioSelected = value as int;
          //                         _radioVal = 'Residential';
          //                       });
          //                     },
          //                   ),
          //                   Text('Residential', style: textwithblackrobotoregular()),
          //                   Radio(
          //                     value: 1,
          //                     groupValue: _radioSelected,
          //                     activeColor: buttoncolor,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _radioSelected = value as int;
          //                         _radioVal = 'Commercial';
          //                       });
          //                     },
          //                   ),
          //                   Text('Commercial', style: textwithblackrobotoregular()),
          //                 ],
          //               ),
          //
          //               GestureDetector(
          //                 onTap: () async {
          //                   SharedPreferences preferences=await SharedPreferences.getInstance();
          //                   int customerId = preferences.getInt("customerId");
          //                   setState(()  {
          //                     isClicked = true;
          //                     Address address = Address(
          //                       houseNo: ,
          //                       geoLocation: geolocation,
          //                       latitude: 9.066729076516385,
          //                       longitude: 76.54446092757433,
          //                       cityId: 1,
          //                       countryId:1,
          //                       stateId:1,
          //                     );
          //                     item = Add(address);
          //                   });
          //
          //
          //                 },
          //                 child: Container(
          //                   margin: EdgeInsets.only(left: 20, right: 20),
          //                   width: double.infinity,
          //                   child: RaisedButton(
          //                     color: headcolor,
          //                     elevation: 0,
          //                     hoverElevation: 0,
          //                     focusElevation: 0,
          //                     highlightElevation: 0,
          //                     shape: bordershape(),
          //                     onPressed: () {},
          //                     child: Text(
          //                       "Update",
          //                       style: TextStyle(
          //                           color: whitecolor,
          //                           fontSize: 14,
          //                           fontFamily: 'Roboto Regular'
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //
          //             ],
          //           ),
          //         );
          //         }
          //     );
          //   },
          // ),
          child: FutureBuilder(
            future: adds,
            builder:  (BuildContext context, AsyncSnapshot<List<GetSingleAddressModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }else {
                if (snapshot.data == null) {
                  return Center(child: Text("No items Found"));
                } else {
                  return Container(
                    height:800,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Container(
                                          alignment: Alignment.topLeft,
                                          child: Text("Address",
                                              style: textwithblackrobotolight())),
                                        TextFormField(
                                          controller: _address,
                                          // onChanged: (newvalue){
                                          //   _address.text = newvalue;
                                          // },
                                          // onSaved: (value){
                                          //   _address.text = value;
                                          // },
                                        ),
                                        SizedBox(height: 15),
                                        Container(
                                            alignment: Alignment.topLeft,
                                            child: Text("Geo Location",
                                                style: textwithblackrobotolight())),
                                        TextFormField(
                                          controller: _geolocation,
                                        //   onChanged: (newvalue){
                                        //     _geolocation.text = newvalue;
                                        //   },
                                        //   onSaved: (value){
                                        //     _geolocation.text = value;
                                        //   },
                                         ),

                                        SizedBox(height: 15),

                                        SizedBox(height: 15),
                                        Container(
                                            alignment: Alignment.topLeft,
                                            child: Text("Country", style: textwithblackrobotolight())),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                            alignment: Alignment.topLeft,
                                            child: Text("Qatar", style: TextStyle(fontSize: 16))),
                                        // Consumer<GetAllCountryProvider>(
                                        //   builder: (context, value, child) {
                                        //     return SizedBox(
                                        //       child: Container(
                                        //         child: DropdownButton(
                                        //           hint: Text("Select Country"),
                                        //           isExpanded: true,
                                        //           underline: Container(
                                        //             height: 1.0,
                                        //             decoration: const BoxDecoration(
                                        //                 border: Border(
                                        //                     bottom: BorderSide(
                                        //                         color: Colors.transparent,
                                        //                         width: 0.0))),
                                        //           ),
                                        //           items: value.responseString.map((item) {
                                        //             return new DropdownMenuItem(
                                        //                 child: Text(item['name']),
                                        //                 value: item['countryId'].toString());
                                        //           }).toList(),
                                        //           onChanged: (newVal) {
                                        //             setState(() {
                                        //               _countryName = newVal;
                                        //               context.read<GetAllStateProvider>().GetAllState(_countryName);
                                        //               print(_countryName);
                                        //             });
                                        //           },
                                        //           value: _countryName,
                                        //         ),
                                        //       ),
                                        //     );
                                        //   },
                                        // ),

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
                                                      widget.cityIdValue = null;
                                                      widget.stateIdValue = newVal;
                                                      city = GetAllCity(widget.stateIdValue);
                                                      context.read<GetAllCityProvider>().GetAllCity(widget.stateIdValue);
                                                      print(widget.stateIdValue);
                                                    });
                                                  },
                                                  value: widget.stateIdValue,
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
                                                return const Center(
                                                  child: CircularProgressIndicator(),
                                                );
                                              }else if (snapshot == null) {
                                                return Text('City Not Found');
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
                                                          widget.cityIdValue = newVal;
                                                          print(widget.cityIdValue);
                                                        });
                                                      },
                                                      value: widget.cityIdValue,
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                          ),
                                        ),

                                        // Consumer<GetAllCityProvider>(
                                        //   builder: (context, value, child) {
                                        //     return SizedBox(
                                        //       child: Container(
                                        //         child: DropdownButton(
                                        //           hint: Text("Select City"),
                                        //           isExpanded: true,
                                        //           underline: Container(
                                        //             height: 1.0,
                                        //             decoration: const BoxDecoration(
                                        //                 border: Border(
                                        //                     bottom: BorderSide(
                                        //                         color: Colors.transparent,
                                        //                         width: 0.0))),
                                        //           ),
                                        //           items: value.responseString.map((item) {
                                        //             return new DropdownMenuItem(
                                        //                 child: Text(item['name']),
                                        //                 value: item['cityId'].toString());
                                        //           }).toList(),
                                        //           onChanged: (newVal) {
                                        //             setState(() {
                                        //               _cityName = newVal;
                                        //               print(_cityName);
                                        //             });
                                        //           },
                                        //           value: _cityName,
                                        //         ),
                                        //       ),
                                        //     );
                                        //   },
                                        // ),
                                        SizedBox(height: 5),

                                        Container(
                                            alignment: Alignment.topLeft,
                                            child: Text("Address Type",
                                                style: textwithblackrobotolight())),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: 0,
                                              groupValue: widget.radioSelected,
                                              activeColor: buttoncolor,
                                              onChanged: (value) {
                                                setState(() {
                                                  widget.radioSelected = value;
                                                  _radioVal = 'Residential';
                                                });
                                              },
                                            ),
                                            Text('Residential', style: textwithblackrobotoregular()),
                                            Radio(
                                              value: 1,
                                              groupValue: widget.radioSelected,
                                              activeColor: buttoncolor,
                                              onChanged: (value) {
                                                setState(() {
                                                  widget.radioSelected = value;
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
                                            value: widget.editAddressCheckBox,
                                            onChanged: (newValue) {
                                              setState(() {
                                                widget.editAddressCheckBox = newValue;
                                              });
                                              print("check box value ${widget.editAddressCheckBox}");
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
                                                  hint: Text("Choose Real Estate"),
                                                  isExpanded: true,
                                                  underline: Container(
                                                    height: 1.0,
                                                    decoration: const BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors.transparent,
                                                                width: 0.0))),
                                                  ),
                                                  items: widget.editAddressCheckBox == true ? value.responseString.map((item) {
                                                    return DropdownMenuItem(
                                                        child: Text(item['name']),
                                                        value: item['realEstateId']);
                                                  }).toList(): null,
                                                  onChanged: (newVal) {
                                                    _realEstateValue = true;
                                                    print("realEstate value add edit address is $_realEstateValue");
                                                    setState(() {
                                                      widget.realEstateId = newVal;
                                                      print('add edit address realEstate value is ${widget.realEstateId}');
                                                    });
                                                  },
                                                  value: widget.realEstateId,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            SharedPreferences preferences=await SharedPreferences.getInstance();
                                            int customerId = preferences.getInt("customerId");
                                            int addressId = preferences.getInt("addressId");
                                            int customerAddressId = preferences.getInt("customerAddressId");
                                            setState(()  {
                                              isClicked = true;
                                              Addressone address = Addressone(
                                                addressId: addressId,
                                                location: _address.text,
                                                geoLocation: _geolocation.text,
                                                latitude: 9.042136492679557,
                                                longitude: 76.54038552956914,
                                                cityId: widget.cityIdValue,
                                                countryId:2.toString(),
                                                stateId:widget.stateIdValue,
                                              );

                                              item = Add(EditAddressOne(address: address,
                                                  addressId:addressId,
                                                  customerAddressId: customerAddressId,
                                                  isResidential: widget.radioSelected,
                                                  isRealEstate: _realEstateValue,
                                                  realEstateId: widget.realEstateId,
                                                  isApprovedByRealEstate: _checkbox,
                                                  customerId: customerId,
                                                  isPrimary: 0
                                              ));
                                              print("radio selected value ${widget.radioSelected}");
                                              print("address Id is ${address.addressId}");
                                              print("city id is ${address.cityId}");
                                              print("state id is ${address.stateId}");
                                              print("geo location is ${address.geoLocation}");
                                              print("country id is ${address.countryId}");
                                              print("customer uid is $customerId");
                                              print("customer Address id is ${customerAddressId}");
                                            });

                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: headcolor),
                                              child: Center(
                                                child: Text(
                                                  'Update',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                            );
                        }),
                  );

                }
              }
            }
          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => AddressList()));
    return true;
  }
}
