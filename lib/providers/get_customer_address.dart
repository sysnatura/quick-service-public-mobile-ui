import 'dart:convert';

import 'package:aqscustomer/models/get_customer_address_list_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GetCustomerAddressProvider extends ChangeNotifier {
  List<GetCustomerAddressList> _responseString;
  bool _error = false;
  String _errorMessage = "";

  List<GetCustomerAddressList> get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<List<List<GetCustomerAddressList>>> GetCustomerAddress() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int customerId=preferences.getInt("customerId");
    final response = await get(
      Uri.parse(AppUrl.get_customer_address_url+"$customerId"),
    );
    print(response.statusCode);

    if(response.statusCode == 200){
      try{

        _responseString = getCustomerAddressListFromJson(response.body).reversed.toList();
        _error = true;
        _errorMessage = "Success";
        print(response.body);

      }catch(e){
        _error = false;
        _errorMessage = e.toString();
        // _responseString = SignUpModel();
      }

    }else{
      _error = false;
      _errorMessage = "Something went wrong , please try again later";
      // _responseString = SignUpModel();
    }
    notifyListeners();
    print(_error);
    print(_errorMessage);
  }
}