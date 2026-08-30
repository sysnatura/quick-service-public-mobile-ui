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
    getToken().whenComplete(() async {
      Timer(
          Duration(seconds: 4),
              () async => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => tokenval == null
                      ? LogIn()
                      : BottomNavigation(currentIndex: 0))));
    });
  }
  Future getToken() async{
    final allUser = await dbHelper.queryAllRows();
    String _emailId=allUser[0]['username'];
    String _password=allUser[0]['password'];
    print(_emailId);
    print(_password);

    if(_emailId!=null&&_password!=null){

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
        print("you bloody ${response.statusCode}");
        if(response.statusCode == 200){
          final LogInModel model = LogInModel.fromJson(json.decode(response.body));
          tokenval = model.tokenValue;
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(
              "tokenValue", model.tokenValue);
          preferences.setInt("customerId", model.customerId);
          preferences.setString("email", _emailId);
          preferences.setString("password",_password );

        }
        }else {
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