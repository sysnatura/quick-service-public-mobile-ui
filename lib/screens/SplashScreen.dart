import 'dart:async';
import 'dart:convert';

import 'package:aqscustomer/Remember_Me/createdatabase.dart';
import 'package:aqscustomer/models/log_in_model.dart';
import 'package:aqscustomer/screens/bottom_navigation.dart';
import 'package:aqscustomer/screens/log_in.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String tokenval,
      userid,
      username,
      branchid,
      departmentid,
      designation,
      branchname;
  SharedPreferences sharedPreferences;
  final dbHelper = DatabaseHelper.instance;

  List<String> RolePermissions=[];
  @override
  void initState() {
    super.initState();
    getToken().then((_) {
      Timer(
          Duration(seconds: 4),
              () {
                if (!mounted) return;
                Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => tokenval == null || tokenval.trim().isEmpty
                      ? LogIn()
                      : BottomNavigation(currentIndex: 0)));
              });
    });
  }
  Future getToken() async{
    tokenval = null;
    try {
    final allUser = await dbHelper.queryAllRows();
    if (allUser.isEmpty) {
      tokenval = null;
      return LogInModel();
    }
    String _emailId=allUser[0]['username'];
    String _password=allUser[0]['password'];

    if(_emailId!=null&&_emailId.trim().isNotEmpty&&
        _password!=null&&_password.isNotEmpty){

        final Map<String, dynamic> apiBody = {
          "username": _emailId,
          "password": _password,
          "deviceDetail": "sample string 3"
        };

        final response = await post(
            Uri.parse(AppUrl.login_url),
            body : json.encode(apiBody),
            headers : {'Content-Type':'application/json'}
        );
        if(response.statusCode == 200){
          final LogInModel model = LogInModel.fromJson(json.decode(response.body));
          if (model.tokenValue == null || model.tokenValue.trim().isEmpty) {
            return LogInModel();
          }
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(
              "tokenValue", model.tokenValue);
          await preferences.setInt("customerId", model.customerId);
          await preferences.setString("email", _emailId);
          await preferences.setString("password",_password );
          tokenval = model.tokenValue;

        }
        }else {
          tokenval = null;
        }
    } catch (_) {
      tokenval = null;
    }
        return LogInModel();

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80),
          child: Image.asset("images/aqscuslogo.png"),
        ),
      ),
    );
  }
}
