import 'dart:convert';

import 'package:aqscustomer/models/log_in_model.dart';
import 'package:aqscustomer/models/single_customer_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleCustomerProvider extends ChangeNotifier{
  SingleCustomerModel _responseString = SingleCustomerModel();
  bool _error = true;
  String _errorMessage = "";

  SingleCustomerModel get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<SingleCustomerModel> GetCustomer() async {

    SharedPreferences preferences=await SharedPreferences.getInstance();
    int customerId=preferences.getInt("customerId");
    print("customerid is $customerId");
    final response = await get(
      Uri.parse(AppUrl.single_customer_details_url+"$customerId"),
      // headers : {'Content-Type':'application/json'}
    );

    print(response.statusCode);
    if(response.statusCode == 200){
      try{
        _responseString = SingleCustomerModel.fromJson(json.decode(response.body));
        _error = false;
        _errorMessage = "Success";


      }catch(e){
        _error = true;
        _errorMessage = e.toString();
        // _responseString = SignUpModel();
      }

    }else{
      _error = true;
      _errorMessage = "Something went wrong , please try again later";
      // _responseString = SignUpModel();
    }
    notifyListeners();
    print(_errorMessage);
    print(_error.toString());
    print(_responseString.customerName);
    return SingleCustomerModel();
  }
}