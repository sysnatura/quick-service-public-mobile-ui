
import 'dart:convert';

import 'package:aqscustomer/ModelClasses/forgot_confirm_password_two.dart';
import 'package:aqscustomer/ModelClasses/forgototpone.dart';
import 'package:aqscustomer/ModelClasses/forgototptwo.dart';
import 'package:aqscustomer/screens/ForgotConfirmPassword.dart';
import 'package:aqscustomer/screens/forgot_password.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/base_url.dart';
class OtpForgotPage extends StatefulWidget {
  const OtpForgotPage({Key key}) : super(key: key);

  @override
  _OtpForgotPageState createState() => _OtpForgotPageState();
}

class _OtpForgotPageState extends State<OtpForgotPage> {
  double height, width;
  bool isClicked = false;
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();


  Future<ForgotOtptwo> ForgotOTPfn(ForgotOtpone forgotOtpone) async {
    ForgotOtpone customer = forgotOtpone;


    final Map<String, dynamic> data = customer.toJson();
    String requestBody = json.encode(data);
    print((data));
    var header = {
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.signup_OTP_Varify),
        body: requestBody,
        headers: header);

    print(response.body);
    if (response.statusCode == 200) {
      loader = false;
      print(response.body);
       final ForgotOtptwo user = forgotOtptwoFromJson(response.body);
       if(user.statusCode == 200){
         ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
                 content: Text(user.statusDescription)));
         Navigator.pushReplacement(
             context,
             MaterialPageRoute(
                 builder: (context) => ConfirmPassword()
             ));
       }else{
         ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
                 content: Text(user.statusDescription)));
       }
      // return user;
    } else {
      throw Exception('Failed to load ');
    }
  }

  Future<ForgotOtptwo> item;

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
                      builder: (context) => ForgotPassword()
                  )
              );
            },
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   //color: Colors.blue,
                //     margin: EdgeInsets.only(top: 30),
                //     padding: EdgeInsets.only(left: 30),
                //     child: SvgPicture.asset("images/splashscreen_logo.svg",height: 70,width: 150,)),
                Container(
                  height: 250,
                  //child: Image(image:AssetImage('images/forgotpassword.png'),height: 400,width: double.infinity,)
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('Enter OTP',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight:FontWeight.w700,fontFamily: 'Roboto Bold'))),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "An 4 Digit code has been sent to your",style: TextStyle(color: Colors.grey[600],fontSize: 12)
                      ),
                      Text(
                          "Email ID",style: TextStyle(color: Colors.grey[600],fontSize: 12)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 30,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 55,width: 50,
                          child: TextFormField(
                            onChanged: (value){
                              if(value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: one,
                            decoration: InputDecoration(hintText: '0'),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center ,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 55,width: 50,
                          child: TextFormField(
                            onChanged: (value){
                              if(value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: two,
                            decoration: InputDecoration(hintText: '0'),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center ,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 55,width: 50,
                          child: TextFormField(
                            onChanged: (value){
                              if(value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: three,
                            decoration: InputDecoration(hintText: '0'),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center ,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 55,width: 50,
                          child: TextFormField(
                            onChanged: (value){
                              if(value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: four,
                            decoration: InputDecoration(hintText: '0'),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center ,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 55,width: 50,
                          child: TextFormField(
                            onChanged: (value){
                              if(value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: five,
                            decoration: InputDecoration(hintText: '0'),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center ,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 55,width: 50,
                          child: TextFormField(
                            onChanged: (value){
                              if(value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: six,
                            decoration: InputDecoration(hintText: '0'),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center ,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30,top: 40),
                  width: width*1,
                  height: 50,
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    width: double.infinity,
                    child: RaisedButton(
                      color: headcolor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      onPressed: ()async {
                        loader = true;
                        var otpnumber = (one.text.toString()+two.text.toString()+three.text.toString()+four.text.toString()+five.text.toString()+six.text.toString());
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        String emailId = preferences.getString("emailvalue");
                        print(emailId);
                        setState(() {

                          item = ForgotOTPfn(ForgotOtpone(email: emailId,otp: otpnumber,otpType: 1));
                        });
                      },
                      child: (loader == false) ? Text("Send",
                        style: TextStyle(color: Colors.white),) : CircularProgressIndicator(),
                    ),
                  ),
                ),
                if(isClicked == true)FutureBuilder(
                    future: item,
                    builder: (context, AsyncSnapshot<ForgotOtptwo> snapshot) {
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
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => ForgotPassword()));
    return true;
  }
}
