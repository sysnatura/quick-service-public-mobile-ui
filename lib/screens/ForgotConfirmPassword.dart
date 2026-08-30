
import 'dart:convert';
import 'dart:math';

import 'package:aqscustomer/ModelClasses/forgot_confirm_password_one.dart';
import 'package:aqscustomer/ModelClasses/forgot_confirm_password_two.dart';
import 'package:aqscustomer/screens/OTP_ForgotPassWord.dart';
import 'package:aqscustomer/screens/PassForgotChanged.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/base_url.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({Key key}) : super(key: key);

  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool isHiddenPassword = true;
  bool isHiddenPassword2 = true;
  bool isClicked = false;
  double height, width;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();


  Future<ForgotConfirmPasswordTwo> ForgotConfirmPassFn(ForgotConfirmPasswordOne forgotConfirmPasswordOne) async {
    ForgotConfirmPasswordOne customer = forgotConfirmPasswordOne;

    final Map<String, dynamic> data = customer.toJson();
    String requestBody = json.encode(data);
    print((data));
    var header = {
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.confirm_password),
        body: requestBody,
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      loader = false;
      print(response.body);

      final ForgotConfirmPasswordTwo ForgotUserConfirm = forgotConfirmPasswordTwoFromJson(response.body);
      if(ForgotUserConfirm.statusCode == 200){

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(ForgotUserConfirm.statusDescription)));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PasswordChangedPage()
            ));

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(ForgotUserConfirm.statusDescription)));
      }
      //return user;
    } else {
      throw Exception('Failed to load change forgot password');
    }
  }
  Future<ForgotConfirmPasswordTwo> item;



  bool loader = false;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(top: 30),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black45,
              size: 17,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpForgotPage()
                  )
              );
            },
          ),
        ),),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Container(
            //margin: EdgeInsets.only(top: 90),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    //child: Image(image:AssetImage('images/forgotpassword.png'),height: 400,width: double.infinity,)
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Reset',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight:FontWeight.w700,fontFamily: 'Roboto Bold')),
                        Text('Password?',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight:FontWeight.w700,fontFamily: 'Roboto Bold')),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                   Container(
                          height: 60,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 25, right: 15),
                              child: TextFormField(
                                controller: _newPassword,
                                  cursorHeight: 20,
                                  autofocus: false,
                                  obscureText: isHiddenPassword,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 0.0,
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                                    ),
                                    hintText: 'New Password',
                                    hintStyle: TextStyle(fontSize: 14),
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          isHiddenPassword = !isHiddenPassword;
                                        });
                                      },
                                      icon:Icon(
                                          isHiddenPassword ?
                                          Icons.visibility_off : Icons.visibility),
                                    ),
                                  )))),

                  SizedBox(height: 10),

                   Container(
                          height: 60,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 25, right: 15),
                              child: TextFormField(
                                controller: _confirmPassword,
                                  cursorHeight: 20,
                                  autofocus: false,
                                  obscureText: isHiddenPassword2,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 0.0,
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                                    ),
                                    hintText: 'Confirm new password',
                                    hintStyle: TextStyle(fontSize: 14),
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          isHiddenPassword2 = !isHiddenPassword2;
                                        });
                                      },
                                      icon:Icon(
                                          isHiddenPassword2 ?
                                          Icons.visibility_off : Icons.visibility),
                                    ),
                                  ),
                                 validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Password';
                                  } else if (value != _newPassword.text) {
                                    return "Password Not Matching";
                                  } else {
                                    return null;
                                  }
                                },
                              ))),

         Container(
           padding: EdgeInsets.only(
                 left: 20, right: 10),
                      height: 50,
                      margin: EdgeInsets.only(left: 5, right: 5,top: 20),
                      width: double.infinity,
                      child: RaisedButton(
                        color: headcolor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        onPressed: () async {
                          if (_form.currentState.validate()) {
                            _form.currentState.save();
                            loader = true;

                            SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                            String emailId = preferences.getString("emailvalue");
                            print("email of forgot mail with otp is $emailId");
                            setState(() {

                              item = ForgotConfirmPassFn(ForgotConfirmPasswordOne(email: emailId,password: _confirmPassword.text));

                            });

                          } else {
                            print("Not Validated");
                          }
                        },
                        child: (loader == false) ? Text("Submit",
                          style: TextStyle(color: Colors.white),) : CircularProgressIndicator(),
                      ),
                    ),
                  if(isClicked == true)FutureBuilder(
                      future: item,
                      builder: (context, AsyncSnapshot<ForgotConfirmPasswordTwo> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }else{
                          if(snapshot.data == null){
                            return Center(child: Text("Something went wrong"));
                          }else{
                            if(snapshot.data.statusCode == 200){
                              print("OTP varified ${snapshot.data.statusCode}");
                              print("success");
                              return
                                Container(
                                    child:  Text(snapshot.data.statusDescription));}
                            else{
                              print("reset failed");
                            }
                            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }
                      })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _togglePasswordView(){
    if(isHiddenPassword == true){
      isHiddenPassword = false;
    }else {
      isHiddenPassword = true;
    }
    setState(() {

    });
  }
  void _togglePasswordView2(){
    setState(() {
      isHiddenPassword2 = !isHiddenPassword2;
    });
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => OtpForgotPage()));
    return true;
  }
}
