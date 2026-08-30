import 'dart:convert';
import 'package:aqscustomer/models/get_service_questions_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetServiceQuestionsProvider extends ChangeNotifier{
  String to = "_240";

  List<GetServiceQuestionsModel> _responseString;
  bool _error = false;
  String _errorMessage = "";

  List<GetServiceQuestionsModel>  get responseString => _responseString;
  // List<dynamic> get questions => _questions;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<List<GetServiceQuestionsModel>> GetQuestions() async {

    SharedPreferences preferences=await SharedPreferences.getInstance();
    int moduleId=preferences.getInt("moduleId");
    int attributeId=preferences.getInt("attributeId");
    print("THIS IS MID ${moduleId.toString()}");
    print("THIS IS AID ${attributeId.toString()}");
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };
    final response = await get(
      Uri.parse(AppUrl.get_service_questions+"id=$moduleId&serviceid=$attributeId"),
      headers: header
    );
    // print(response.statusCode);
    // print(response.body);
    if(response.statusCode == 200){
      try{
        _responseString = getServiceQuestionsModelFromJson(response.body);
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
      _errorMessage = "Something went wrong , please try again later AFTER SOMETIMES";
      // _responseString = SignUpModel();
    }
    notifyListeners();
    print(_error);
    print(_errorMessage);
  }
}