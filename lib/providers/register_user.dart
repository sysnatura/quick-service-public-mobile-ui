import 'dart:convert';
import 'package:aqscustomer/models/sign_up_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisterUserProvider extends ChangeNotifier{
  SignUpModel _responseString = SignUpModel();
  bool _error = true;
  String _errorMessage = "";

  SignUpModel get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<SignUpModel> registerUser(String firstName, String lastName,
      String mobileNumber, String email, String password) async {
    final Map<String, dynamic> apiBody = {
      "firstName": firstName,
      "lastName": lastName,
      "contactDto": {"mobileNumber": mobileNumber, "emailAddress": email},
      "password": password,
      "customerAddressDtoList": null,
      "accountDto": {"passwordHash": password}
    };

    final response = await post(
        Uri.parse(AppUrl.register_url),
        body : json.encode(apiBody),
        headers : {'Content-Type':'application/json'}
    );
    print(response.statusCode);
    if(response.statusCode == 200){
        try{
          _responseString = SignUpModel.fromJson(json.decode(response.body));
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
   // return SignUpModel();
  }
}
