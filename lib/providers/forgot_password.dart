import 'dart:convert';

import 'package:aqscustomer/models/h_t_t_p_response_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ForgotPasswordProvider extends ChangeNotifier{
  HTTPResponseModel _responseString = HTTPResponseModel();
  bool _error = true;
  String _errorMessage = "";

  HTTPResponseModel get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<HTTPResponseModel> ResetPassword(String eMail) async {

    final response = await get(
        Uri.parse(AppUrl.forgotpassword_url+"?uEmail=$eMail"),
        // headers : {'Content-Type':'application/json'}
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      try{
        _responseString = HTTPResponseModel.fromJson(json.decode(response.body));
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
    return HTTPResponseModel();
  }
}