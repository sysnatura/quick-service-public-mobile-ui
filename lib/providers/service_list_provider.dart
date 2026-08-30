import 'dart:convert';
import 'package:aqscustomer/models/service_category_model.dart';
import 'package:aqscustomer/models/service_list_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceListProvider extends ChangeNotifier{

  List<GetAllServicesModel> _responseString;
  bool _error = false;
  String _errorMessage = "";

  List<GetAllServicesModel>  get responseString => _responseString;
  // List<dynamic> get questions => _questions;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<List<GetAllServicesModel>> GetList() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int moduleId=preferences.getInt("moduleId");
    print(moduleId.toString());
    final response = await get(
      Uri.parse(AppUrl.service_list_url+"/$moduleId"),
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      try{
        _responseString = getAllServicesModelFromJson(response.body);
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