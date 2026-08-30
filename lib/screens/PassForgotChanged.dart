
import 'package:aqscustomer/screens/ForgotConfirmPassword.dart';
import 'package:aqscustomer/screens/OTP_ForgotPassWord.dart';
import 'package:aqscustomer/screens/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
class PasswordChangedPage extends StatefulWidget {
  const PasswordChangedPage({Key key}) : super(key: key);

  @override
  _PasswordChangedPageState createState() => _PasswordChangedPageState();
}

class _PasswordChangedPageState extends State<PasswordChangedPage> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   //color: Colors.blue,
                //     margin: EdgeInsets.only(top: 30),
                //     padding: EdgeInsets.only(left: 30),
                //     child: SvgPicture.asset("images/splashscreen_logo.svg",height: 70,width: 150,)),
                // Align(
                //     alignment: Alignment.center,
                //     child: Container(
                //         margin: EdgeInsets.only(top: 140),
                //         child: SvgPicture.asset("images/success_icon.svg",height: 120,width: 240,))),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('PASSWORD CHANGED !',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('YOUR PASSWORD CHANGED SUCCESSFULLY',style: TextStyle(fontSize: 14,color: Colors.black),)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30,top: 50),
                  width: width*1,
                  height: 50,
                  child: RaisedButton(
                      color: headcolor,
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogIn()
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "log In",
                                style: TextStyle(
                                    color: whitecolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Lato Regular'),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: CupertinoColors.white,
                              )
                            ]),
                      )),
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
        MaterialPageRoute(builder: (newContext) => LogIn()));
    return true;
  }
}