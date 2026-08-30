import 'dart:convert';

import 'package:aqscustomer/models/h_t_t_p_response_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealEstateProvider extends ChangeNotifier {
  String to = "_240";
  List<dynamic> _responseString = [];
  bool _error = false;
  String _errorMessage = "";

  List<dynamic> get responseString => _responseString;

  bool get error => _error;

  String get errorMessage => _errorMessage;

  Future<void> GetRealEstateList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };

    final response = await get(
        Uri.parse(AppUrl.real_estate_url),
      headers: header);

    print(response.statusCode);

    if (response.statusCode == 200) {
      try {
        _responseString = json.decode(response.body);
        _error = true;
        _errorMessage = "Success";
        print(response.body);
      } catch (e) {
        _error = false;
        _errorMessage = e.toString();
      }
    } else {
      _error = false;
      _errorMessage = "oops Error msg in realEstate api";
    }
    notifyListeners();
    print(_error);
    print(_errorMessage);
  }
}
