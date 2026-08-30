import 'dart:convert';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ServiceCategoryProvider extends ChangeNotifier{

  List<dynamic> _responseString = [];
  bool _error = false;
  String _errorMessage = "";

  List<dynamic> get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> GetCategories() async {
    final response = await get(
      Uri.parse(AppUrl.catrgoty_listing_url),
    );
    print(response.statusCode);

    if(response.statusCode == 200){
      try{

        _responseString = json.decode(response.body);
        _error = true;
        _errorMessage = "Success";
        print(response.body);

      }catch(e){
        _error = false;
        _errorMessage = e.toString();
      }

    }else{
      _error = false;
      _errorMessage = "Something went wrong , please try again later";
    }
    notifyListeners();
    print(_error);
    print(_errorMessage);
  }
}