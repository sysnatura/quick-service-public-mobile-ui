import 'package:aqscustomer/ModelClasses/delete_address.dart';
import 'package:aqscustomer/models/get_customer_address_list_model.dart';
import 'package:aqscustomer/providers/delete_customer_address.dart';
import 'package:aqscustomer/providers/get_customer_address.dart';
import 'package:aqscustomer/screens/add_new_address.dart';
import 'package:aqscustomer/screens/edit_address.dart';
import 'package:aqscustomer/screens/profile_screen.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ModelClasses/set_as_primary_address.dart';
import '../utils/base_url.dart';
import 'bottom_navigation.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key key}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() async {
      if (mounted) await _refreshAddresses();
    });
  }

  Future<void> _refreshAddresses() async {
    if (!mounted) return;
    await context.read<GetCustomerAddressProvider>().GetCustomerAddress();
  }

  int customerAddressId;

  String to = '_240';
  int groupValue;
  bool isSwitched = false;
  int _selectedIndex;
  void _handleTap(index) {
    setState(() {
      _selectedIndex=index;
    });
  }

  /// Set Address As Primary Api
  Future<SetAsPrimary> SetPrimaryAddressFn(int id) async {
    String you = "_240";
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
      if(user.statusCode == 200){
        activeInactiveFunction();
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

  Future<DeleteAddress> Delete(String s) async {
    print('address id $s');
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int addressId=preferences.getInt("addressId");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };

    final response = await http.get(
        Uri.parse(AppUrl.delete_customer_address_url+s),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      deleteCustomerAddress();
      final DeleteAddress user = deleteAddressFromJson(response.body);

      return user;
    } else {
      throw Exception('Failed to load');
    }
  }

  int radioSelected;
  bool editAddressCheckBox;
  int realEstateIdValue;
  String stateIdValue;
  String cityIdValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
          onTap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (newContext) => ProfileScreen()));
          },
        ),
        centerTitle: false,
        title: Text(
          "My Address",
          style: textwithrobotoregular(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: primaryColor),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: RefreshIndicator(
          onRefresh: _refreshAddresses,
          child: Consumer<GetCustomerAddressProvider>(
              builder: (context, value, child) {
            if (value.status == CustomerAddressStatus.failure) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(value.errorMessage, textAlign: TextAlign.center),
                    TextButton(
                      onPressed: _refreshAddresses,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return value.status == CustomerAddressStatus.loading
                ? Center(child: CircularProgressIndicator())
                : value.status == CustomerAddressStatus.empty
                    ? Center(
                        child: Text(
                          "No Address",
                          style: textwithrobotoregular(),
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.responseString.length,
                        itemBuilder: (context, index) {
                          value.responseString[index].setPrimary = false;
                          return Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.all(15),
                                child: Align(
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              if (value.responseString[index].customer.customerName !=
                                                  null)
                                                Container(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      value.responseString[index].customer.customerName,
                                                      style: textwithheadcolorrobotoregular(),
                                                    )),

                                            SizedBox(width: 20),
                                            Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: ()async{
                                                          SharedPreferences preferences =
                                                          await SharedPreferences.getInstance();
                                                          int addressId=value.responseString[index].addressId;
                                                          print("address id is this $addressId");
                                                          preferences.setInt("addressId", addressId);
                                                          int customerAddressId = value.responseString[index].customerAddressId;
                                                          print("customer address id is this $customerAddressId");
                                                          preferences.setInt("customerAddressId", customerAddressId);
                                                          if(value.responseString[index].isResidential == true){
                                                            radioSelected = 1;
                                                          }else{
                                                            radioSelected = 0;
                                                          }
                                                            editAddressCheckBox = value.responseString[index].isRealEstate;
                                                            realEstateIdValue = value.responseString[index].realEstateId;
                                                            stateIdValue = value.responseString[index].address.stateDto.stateId.toString();
                                                            print("State id in AddressListPage $stateIdValue");
                                                            cityIdValue = value.responseString[index].address.cityDto.cityId.toString();
                                                            print("cityIdValue in addressList Page $cityIdValue");

                                                          Navigator.pushReplacement(context,
                                                              MaterialPageRoute(builder: (context) => EditAddress(radioSelected: radioSelected,editAddressCheckBox: editAddressCheckBox,realEstateId: realEstateIdValue,
                                                              stateIdValue: stateIdValue,cityIdValue: cityIdValue,
                                                              )));
                                                        },
                                                    child: Icon(Icons.edit_note,color: headcolor,)),
                                                    GestureDetector(
                                                      onTap: (){
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(20)),
                                                              title: const Text('Are you sure?',style: TextStyle(color: headcolor),),
                                                              content: const Text('Address wil be deleted permanently'),
                                                              actions: <Widget>[
                                                                FlatButton(
                                                                  child: Text('No',style: TextStyle(color: headcolor)),
                                                                  onPressed: () {
                                                                    Navigator.of(context).pop(false);
                                                                  },
                                                                ),
                                                                FlatButton(
                                                                  child: Text('Yes',style: TextStyle(color: Colors.black87)),
                                                                  onPressed: () {
                                                                    Delete(value.responseString[index].customerAddressId.toString());

                                                                    Navigator.of(context).pop(true);
                                                                  },
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        ) ?? false;
                                                        // print(value.responseString[index].address.addressId);
                                                        // Provider.of<DeleteCustomerAddressProvider>(context,listen: false).DeleteAddress(value.responseString[index].address.addressId.toString());
                                                      },
                                                      child: Container(
                                                          margin:EdgeInsets.only(left: 30),
                                                          child: Icon(Icons.delete,color: Colors.black26,)),
                                                    ),

                                                  ],
                                                ),

                                            ],
                                          ),
                                          // if (value.responseString[index].customer.customerName !=
                                          //     null)
                                            // Container(
                                            //     alignment: Alignment.topLeft,
                                            //     child: Text(
                                            //       value.responseString[index].customer.customerName,
                                            //       style: textwithheadcolorrobotoregular(),
                                            //     )),
                                          SizedBox(height: 8),
                                          if (value.responseString[index].address.houseNo !=
                                              null)
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  value.responseString[index].address.houseNo,
                                                  style: textwithblackrobotoregular(),
                                                )),
                                          SizedBox(height: 8),
                                          Divider(
                                            color: headcolor,
                                            thickness: 0.3,
                                          ),
                                          if (value.responseString[index].address.location !=
                                              null)
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  value.responseString[index].address.location,
                                                  style: textwithblackrobotoregular(),
                                                )),
                                          SizedBox(height: 8),
                                          if (value.responseString[index].address.geoLocation !=
                                              null)
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  value.responseString[index].address.geoLocation,
                                                  style: textwithblackrobotoregular(),
                                                )),
                                          SizedBox(height: 8),
                                          if (value.responseString[index].address.cityDto.name !=
                                              null)
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  value.responseString[index].address.cityDto.name,
                                                  style: textwithblackrobotoregular(),
                                                )),
                                          SizedBox(height: 8),
                                          if (value.responseString[index].address.stateDto.name !=
                                              null)
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  value.responseString[index].address.stateDto.name,
                                                  style: textwithblackrobotoregular(),
                                                )),
                                          SizedBox(height: 8),
                                          if (value.responseString[index].address.countryDto.name !=
                                              null)
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  value.responseString[index].address.countryDto.name,
                                                  style: textwithblackrobotoregular(),
                                                )),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Set as Primary",style: textwithblackrobotolight()),
                                              StatefulBuilder(
                                                  builder: (context, setState) {
                                                    if(value.responseString[index].isPrimary == 1){
                                                      value.responseString[index].setPrimary = true;
                                                    }
                                                    return
                                                      Checkbox(
                                                        value: value.responseString[index].setPrimary,
                                                        onChanged: (bool val) async {
                                                          customerAddressId = value.responseString[index].customerAddressId;
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
                                  ),
                                ),
                              ),

                          );
                        },
                      );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddNewAddress()));
        },
        child: const Icon(Icons.add,color: whitecolor,),
        backgroundColor: headcolor,
      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => ProfileScreen()));
    return true;
  }
  Future<bool> deleteCustomerAddress() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          title: Text('Address deleted..!',style: TextStyle(color: headcolor),),
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
