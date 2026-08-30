import 'dart:convert';

import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
class GetAllCityProvider extends ChangeNotifier {
  List<dynamic> _responseString = [];
  bool _error = false;
  String _errorMessage = "";

  List<dynamic> get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> GetAllCity(String cityId) async {
    final response = await get(
      Uri.parse(AppUrl.get_all_state_url+"$cityId"),
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
      _errorMessage = "oops! error msg in get All city";
      // _responseString = SignUpModel();
    }
    notifyListeners();
    print(_error);
    print(_errorMessage);
  }
}