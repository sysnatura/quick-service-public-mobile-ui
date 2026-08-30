import 'dart:convert';

import 'package:aqscustomer/models/log_in_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginProvider extends ChangeNotifier{
  LogInModel _responseString = LogInModel();
  bool _error = true;
  String _errorMessage = "";

  LogInModel get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<LogInModel> loginUser(String userName, String passWord) async {
    final Map<String, dynamic> apiBody = {
      "username": userName,
      "password": passWord,
      "deviceDetail": "sample string 3"
    };

    final response = await post(
        Uri.parse(AppUrl.login_url),
        body : json.encode(apiBody),
        headers : {'Content-Type':'application/json'}
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      try{
        _responseString = LogInModel.fromJson(json.decode(response.body));
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
    print(_responseString.customerDto?.firstName.toString());
    return LogInModel();
  }
}