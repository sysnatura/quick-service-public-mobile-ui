import 'dart:convert';

import 'package:aqscustomer/models/order_history_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GetAllBookingsProvider extends ChangeNotifier {
  List<OrderHistoryModel> _responseString;
  bool _error = false;
  String _errorMessage = "";

  List<OrderHistoryModel> get responseString => _responseString;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<List<OrderHistoryModel>> GetAllBookings() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int customerId=preferences.getInt("customerId");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCompany$tokenValue",
      "Content-Type": "application/json"
    };
    final response = await get(
      Uri.parse(AppUrl.get_all_bookings+"id=$customerId&status=ALL"),
      headers: header
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      try{

        _responseString = orderHistoryModelFromJson(response.body);
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