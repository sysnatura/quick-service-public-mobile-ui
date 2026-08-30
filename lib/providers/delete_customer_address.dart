import 'dart:convert';

import 'package:aqscustomer/models/h_t_t_p_response_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteCustomerAddressProvider extends ChangeNotifier {
  HTTPResponseModel _responseString = HTTPResponseModel();
  bool _error = false;
  String _errorMessage = "";

  HTTPResponseModel get responseString => _responseString;

  bool get error => _error;

  String get errorMessage => _errorMessage;

  Future<HTTPResponseModel> DeleteAddress(String addressId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue",
      "Content-Type": "application/json"
    };

    final response = await get(
        Uri.parse(AppUrl.delete_customer_address_url+"$addressId"),
        headers: header);

    print(response.statusCode);

    if (response.statusCode == 200) {
      try {
        _responseString = HTTPResponseModel.fromJson(json.decode(response.body));
        _error = true;
        _errorMessage = "Success";
        print(response.body);
      } catch (e) {
        _error = false;
        _errorMessage = e.toString();
        // _responseString = SignUpModel();
      }
    } else {
      _error = false;
      _errorMessage = "Something went wrong , please try again later";
      // _responseString = SignUpModel();
    }
    notifyListeners();
    print(_error);
    print(_errorMessage);
    return HTTPResponseModel();
  }
}
