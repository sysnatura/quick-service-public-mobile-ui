import 'dart:convert';

import 'package:aqscustomer/models/get_single_address_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GetSingleAddressProvider extends ChangeNotifier {
  String to = "_240";
  List<GetSingleAddressModel> _responseString;
  bool _error = false;
  String _errorMessage = "";

  List<GetSingleAddressModel> get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<List<List<GetSingleAddressModel>>> GetSingleAddress() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int customerId=preferences.getInt("customerId");
    int addressId=preferences.getInt("addressId");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };
    final response = await get(
      Uri.parse(AppUrl.get_single_address+"id=$customerId&adid=$addressId"),
      headers: header
    );
    print(response.statusCode);

    if(response.statusCode == 200){
      try{

        _responseString = getSingleAddressModelFromJson(response.body);
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
      _errorMessage = "Something went wrong in Get Single Address Api, please try again later";
      // _responseString = SignUpModel();
    }
    notifyListeners();
    print(_error);
    print(_errorMessage);
  }
}