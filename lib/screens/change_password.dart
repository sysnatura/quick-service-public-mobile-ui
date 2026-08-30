import 'dart:convert';
import 'package:aqscustomer/ModelClasses/pofilechangepasswordtwo.dart';
import 'package:aqscustomer/ModelClasses/profilechangepasswordone.dart';
import 'package:aqscustomer/screens/add_new_address.dart';
import 'package:aqscustomer/screens/settings_screen.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/base_url.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool isClicked = false;

  Future<Profilepasswordchangetwo> ChangePass(Profilepasswordchangeone profilepasswordchangeone) async {
    Profilepasswordchangeone customer = profilepasswordchangeone;

    SharedPreferences preferences=await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");

    final Map<String, dynamic> data = customer.toJson();
    String requestBody = json.encode(data);
    print((data));
    var header = {
      "authorization": "BearerCompany$tokenValue",
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.change_password_url),
        body: requestBody,
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      final Profilepasswordchangetwo user = profilepasswordchangetwoFromJson(response.body);
      if(user.statusCode == 200){
        changedProfilePassword();
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(user.statusDescription)));
      }
      return user;
    } else {
      throw Exception('Failed to load change password profile');
    }
  }
  Future<Profilepasswordchangetwo> item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
          onTap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (newContext) => SettingsScreen()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Change Password",
          style: textwithrobotoregular(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: primaryColor),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text("Current Password",
                        style: textwithblackrobotolight())),
                TextFormField(
                  controller: _currentPassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecorationWithIcon("", Icons.password),
                ),
                SizedBox(height: 15),
                Container(
                    alignment: Alignment.topLeft,
                    child:
                        Text("New Password", style: textwithblackrobotolight())),
                TextFormField(
                  controller: _newPassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecorationWithIcon("", Icons.password),
                ),
                SizedBox(height: 15),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text("Confirm Password",
                        style: textwithblackrobotolight())),
                TextFormField(
                  controller: _confirmPassword,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    } else if (value != _newPassword.text) {
                      return "Password Not Matching";
                    } else {
                      return null;
                    }
                  },
                  decoration: buildInputDecorationWithIcon("", Icons.password),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  child: RaisedButton(
                    color: headcolor,
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    shape: bordershape(),
                    onPressed: () async {
                      if (_form.currentState.validate()) {
                        _form.currentState.save();
                        if(_newPassword.text == _confirmPassword.text){
                          print("Validated");
                          SharedPreferences preferences=await SharedPreferences.getInstance();
                          int customerId = preferences.getInt("customerId");
                          String password = preferences.getString("password");

                          if(_currentPassword.text != password){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Current password is wrong')));
                          }else{

                            setState(()  {
                              isClicked = true;
                              AccountDto dto = AccountDto(
                                  currentPassword:password,
                                  passwordHash: _confirmPassword.text
                              );
                              Profilepasswordchangeone model = Profilepasswordchangeone(
                                accountDto: dto,
                                customerId: customerId,
                              );
                              item = ChangePass(model);
                            });
                          }

                        }else{
                          print("is not equal");
                        }
                      }
                      else{
                        print("Not Validated");
                      }
                    },
                    child: Text(
                      "Change Password",
                        style:  TextStyle(
                            color: whitecolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Roboto Regular'
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => SettingsScreen()));
    return true;
  }
  Future<bool> changedProfilePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          title: Text('Password changed Successfully',style: TextStyle(color: headcolor),),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok',style: TextStyle(color: Colors.black87)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (newContext) => SettingsScreen()));
              },
            )
          ],
        );
      },
    ) ?? false;
  }
}
