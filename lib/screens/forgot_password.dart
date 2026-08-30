import 'package:aqscustomer/ModelClasses/forgotPassword.dart';
import 'package:aqscustomer/providers/forgot_password.dart';
import 'package:aqscustomer/screens/OTP_ForgotPassWord.dart';
import 'package:aqscustomer/screens/log_in.dart';
import 'package:aqscustomer/screens/sign_up.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/validator.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/base_url.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();

  Future<ForgotReset> forgotEmailFn(String e) async {

    var header = {"Content-Type": "application/json"};

    final response = await http.get(
        Uri.parse(
            AppUrl.forgotPass_email_varification+'Email=$e'),
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      loader == false;

      print(response.body);
      print(response.statusCode);

      final ForgotReset user = forgotResetFromJson(response.body);
      if(user.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
                content: Text(user.statusDescription)));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OtpForgotPage()
            ));
        print("success");
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
                content: Text(user.statusDescription)));
        print("reset failed");
      }
      //return user;
    } else {

      throw Exception('Failed to load');
    }
  }

  Future<ForgotReset> all;

  @override
  void initState() {
    super.initState();
    // all = Login();
  }
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    print(loader);
    return ChangeNotifierProvider(
      create: (context)=>ForgotPasswordProvider(),
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.only(top: 10),
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
                        builder: (context) => LogIn()
                    )
                );
              },
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: Builder(
            builder: (BuildContext newContext){
              return Form(
                key: _form,
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(top: 30, left: 50),
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/bannerbglogo.png"),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20,top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Forgot',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight:FontWeight.w700,fontFamily: 'Roboto Bold')),
                              Text('Password?',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight:FontWeight.w700,fontFamily: 'Roboto Bold')),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                         Container(
                           margin: EdgeInsets.only(left: 20),
                           child:Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 "Don't worry it happens. Please enter the",style: TextStyle(color: Colors.grey[600],fontSize: 12)
                               ),
                               Text(
                                   "Email address associated with your account",style: TextStyle(color: Colors.grey[600],fontSize: 12)
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            cursorHeight: 20,
                            autofocus: false,
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => validateEmail(value),
                            decoration: InputDecoration(
                              hintText: "example@gmail.com",
                              contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(color: Colors.grey, width: 0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(color: Colors.grey, width: 0.8),
                              ),

                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          child: RaisedButton(
                            color: headcolor,
                             elevation: 0,
                            // hoverElevation: 0,
                            // focusElevation: 0,
                            // highlightElevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            onPressed: () async{
                              if (_form.currentState.validate()) {
                                _form.currentState.save();
                                loader = true;
                                setState(() {
                                  forgotEmailFn(_email.text);
                                });
                                SharedPreferences preferences = await SharedPreferences.getInstance();
                                String emailvalue = _email.text;
                                preferences.setString("emailvalue", emailvalue);
                                print("email of forgot mail with otp is $emailvalue");

                              } else {
                                print("Not Validated");
                              }
                            },
                            child: (loader == false) ? Text("Submit",
                              style: TextStyle(color: Colors.white),): CircularProgressIndicator()
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?  ",style: TextStyle(color: Colors.black45,fontSize: 14)),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()
                                      ));
                                },
                                child: Text("Sign Up",
                                  style: TextStyle(color: headcolor),),
                              ),
                            ],
                          ),
                        ),
                        Container(color: Colors.white,height: 200)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => LogIn()));
    return true;
  }

}
