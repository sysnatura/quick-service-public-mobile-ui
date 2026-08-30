import 'dart:convert';
import 'package:aqscustomer/models/h_t_t_p_response_model.dart';
import 'package:aqscustomer/models/sign_up_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordProvider extends ChangeNotifier{
  HTTPResponseModel _responseString = HTTPResponseModel();
  bool _error = true;
  String _errorMessage = "";

  HTTPResponseModel get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<HTTPResponseModel> changePassword(String passwordHash, String currentPassword) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");
    int customerId = preferences.getInt("customerId");
    print(customerId);
    var header = {
      "authorization": "BearerCompany $tokenValue",
      "Content-Type": "application/json"
    };

    final Map<String, dynamic> apiBody = {
      "accountDto": {
        "passwordHash": passwordHash,
        "currentPassword": currentPassword
      },
      "customerId": customerId
    };

    final response = await post(
        Uri.parse(AppUrl.change_password_url),
        body : json.encode(apiBody),
        headers : header
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      try{
        _responseString = HTTPResponseModel.fromJson(json.decode(response.body));
        _error = false;
        _errorMessage = "Success";

      }catch(e){
        _error = true;
        _errorMessage = e.toString();
      }

    }else{
      _error = true;
      _errorMessage = "Something went wrong , please try again later";
      // _responseString = SignUpModel();
    }
    notifyListeners();
    print(_errorMessage);
    // print(_responseString.statusCode);
    return HTTPResponseModel();
  }
}
