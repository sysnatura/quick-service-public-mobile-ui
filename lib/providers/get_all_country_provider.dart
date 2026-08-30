import 'dart:convert';

import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
class GetAllCountryProvider extends ChangeNotifier {
  List<dynamic> _responseString = [];
  bool _error = false;
  String _errorMessage = "";

  List<dynamic> get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> GetAllCountry() async {
    final response = await get(
      Uri.parse(AppUrl.get_all_country_url),
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