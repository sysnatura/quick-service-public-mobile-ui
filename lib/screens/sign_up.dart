import 'package:aqscustomer/ModelClasses/profilechangepasswordone.dart';
import 'package:aqscustomer/ModelClasses/signup_one.dart';
import 'package:aqscustomer/ModelClasses/signup_two.dart';
import 'package:aqscustomer/models/sign_up_model.dart';
import 'package:aqscustomer/providers/register_user.dart';
import 'package:aqscustomer/screens/OTP_SignUpVarification.dart';
import 'package:aqscustomer/screens/log_in.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:aqscustomer/utils/validator.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/sign_up_model.dart';
import '../utils/base_url.dart';
class SignUp extends StatefulWidget {
  const SignUp({ Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _emailSign = TextEditingController();
  double height, width;
  bool isClicked = false;
  @override

  Future<SignUpTwo> SignupFn(SignUpOne signUpOne) async {
    SignUpOne customer = signUpOne;

    final Map<String, dynamic> data = customer.toJson();
    String requestBody = json.encode(data);
    print((data));
    var header = {
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.register_url),
        body: requestBody,
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      final SignUpTwo signupresponse = signUpTwoFromJson(response.body);

      switch(signupresponse.statusCode){
        case 200 : {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(signupresponse.statusDescription)));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUpOTPpage()
              ));
        }break;

        case 400 : {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Email already exist")));
        }break;

        case 300 : {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Phone number already exist")));
        }break;

        default : {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("something went wrong")));
        }
      }
      //return user;
    } else {
      throw Exception('Failed to Sign up');
    }
  }
  Future<SignUpTwo> signItem;
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context)=>RegisterUserProvider(),
      child: Scaffold(
        backgroundColor: whitecolor,
        body: WillPopScope(
        onWillPop: _onWillPop,
        child:Builder(
          builder: (BuildContext newContext){
           return SingleChildScrollView(
             child:
               Column(
                 children: [
                   Stack(
                     clipBehavior: Clip.none,
                     children: [
                       Container(color: Color(0xFFf3eeff),height: height*1,width: width*1),
                       Positioned(
                         top: 185.0,
                         child: Container(
                           height: height*1,
                           width: width*1,
                           decoration: BoxDecoration(
                               color: whitecolor,
                               borderRadius: BorderRadius.only(
                                   topLeft: Radius.circular(25),
                                   topRight: Radius.circular(25))),
                           child: Form(
                             // autovalidate: true,
                             key: _form,
                             child: Column(
                               children: [
                                 SizedBox(height:10),
                                 Container(
                                   margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                                   child: TextFormField(
                                     keyboardType: TextInputType.name,
                                     controller: _firstname,
                                     autovalidateMode: AutovalidateMode.onUserInteraction,
                                     validator: (value){
                                       if(value == null || value.isEmpty){
                                         return "This field cannot be empty";

                                       }else{
                                         return null;
                                       }
                                     },
                                     decoration: buildInputDecorationWithIcon("First Name", Icons.person),
                                   ),
                                 ),
                                 SizedBox(height: 10),
                                 Container(
                                   margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                                   child: TextFormField(
                                     controller: _lastname,
                                     keyboardType: TextInputType.name,
                                     decoration: buildInputDecorationWithIcon("Last Name", Icons.person),
                                   ),
                                 ),
                                 SizedBox(height: 10),

                                 Container(
                                   margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                                   child: TextFormField(
                                     controller: _emailSign,
                                     keyboardType: TextInputType.emailAddress,
                                     autovalidateMode: AutovalidateMode.onUserInteraction,
                                     validator: (value)=>validateEmail(value),
                                     decoration: buildInputDecorationWithIcon("Email", Icons.email),
                                   ),
                                 ),
                                 SizedBox(height: 10),

                                 Container(
                                   margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                                   child: TextFormField(
                                     controller: _mobileNumber,
                                     keyboardType: TextInputType.number,
                                     validator: (value)=>validateMobile(value),
                                     autovalidateMode: AutovalidateMode.onUserInteraction,
                                     decoration: buildInputDecorationWithIcon("Mobile Number", Icons.phone),
                                   ),
                                 ),
                                 SizedBox(height: 10),
                                 Container(
                                   margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                                   child: TextFormField(
                                     keyboardType: TextInputType.text,
                                     controller: _pass,
                                     obscureText: true,
                                     decoration: buildInputDecorationWithIcon("Create Password", Icons.password),
                                   ),
                                 ),
                                 SizedBox(height: 10),
                                 Container(
                                   margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                                   child: TextFormField(
                                     keyboardType: TextInputType.text,
                                     controller: _confirmPass,
                                     obscureText: true,
                                     autovalidateMode: AutovalidateMode.onUserInteraction,
                                     validator: (value) {
                                       if (value == null || value.isEmpty) {
                                         return 'Enter Password';
                                       } else if (value != _pass.text) {
                                         return "Password Not Matching";
                                       } else {
                                         return null;
                                       }
                                     },
                                     decoration: buildInputDecorationWithIcon("Confirm Password", Icons.password),
                                   ),
                                 ),
                                 SizedBox(height: 10),
                                 Container(
                                   margin: EdgeInsets.only(left: 20,right: 20),
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

                                         SharedPreferences preferences =
                                         await SharedPreferences.getInstance();
                                         String emailSign = _emailSign.text;
                                         preferences.setString("emailvalue", emailSign);
                                         print("email of forgot mail with otp is $emailSign");
                                         setState(() {
                                           isClicked = true;
                                           AccountDtoSignup acc = AccountDtoSignup(
                                             passwordHash: _confirmPass.text
                                           );
                                           ContactDtoSignup cc = ContactDtoSignup(
                                             emailAddress: _emailSign.text,
                                             mobileNumber: _mobileNumber.text
                                           );

                                           signItem = SignupFn(SignUpOne(password: _confirmPass.text,accountDto: acc,contactDto:cc, firstName: _firstname.text,
                                           lastName: _lastname.text,customerAddressDtoList: null
                                           ));


                                         });

                                       } else {
                                         print("Not Validated");
                                       }
                                     },
                                     child: Text("Sign Up",
                                       style:  TextStyle(
                                           color: whitecolor,
                                           fontWeight: FontWeight.w500,
                                           fontSize: 14,
                                           fontFamily: 'Roboto Regular'
                                       ),),
                                   ),
                                 ),
                                 Container(
                                     child: Row(
                                       children: <Widget>[
                                         Text('Already have an account?',
                                             style: textwithblackrobotoregular()
                                         ),
                                         FlatButton(
                                           textColor: textcolor,
                                           child: Text(
                                             'Log In',
                                             style: textwithrobotoregular(),
                                           ),
                                           onPressed: () {
                                             Navigator.pushReplacement(context,
                                                 MaterialPageRoute(builder: (context) => LogIn()));
                                           },
                                         )
                                       ],
                                       mainAxisAlignment: MainAxisAlignment.center,
                                     ))
                               ],
                             ),
                           ),
                         ),
                       ),
                       Positioned(
                         top: 0,
                         left: 0,
                         child: Container(
                           height: 100,
                           width: 125,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: AssetImage("images/bannerbgline.png"),
                                 fit: BoxFit.cover,
                               )
                           ),
                         ),
                       ),
                       Positioned(
                         top: 40,
                         right: 25,
                         child: Container(
                           height: 180,
                           width: 200,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage("images/signupbg.png"),
                                   fit: BoxFit.fitHeight
                               )
                           ),
                         ),
                       ),
                       Positioned(
                           top: 150,
                           left: 15,
                           child: Text(
                             "Sign Up Here",
                             style: TextStyle(
                                 color: headcolor,
                                 fontSize: 25,
                                 fontFamily: 'Roboto Bold'),
                           )),
                       Positioned(
                           top: 5,
                           left: 0,
                           right: 0,
                           child: Container(
                             child: Image(
                               image:
                               AssetImage("images/aqscuslogo.png"),height: 30,width: 30,
                             ),
                           )),
                     ],
                   )
                 ],

               ),

              // child: Column(
              //   children: [
              //     Stack(
              //       clipBehavior: Clip.none,
              //       children: [
              //         Container(color: Color(0xFFf3eeff),height: height*1),
              //         Positioned(
              //           top: 250.0,
              //           child: Container(
              //             height: height*1,
              //             width: width*1,
              //             decoration: BoxDecoration(
              //                 color: whitecolor,
              //                 borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(25),
              //                     topRight: Radius.circular(25))),
              //             child: Form(
              //               // autovalidate: true,
              //               key: _form,
              //               child: Column(
              //                 children: [
              //                   SizedBox(height: 50),
              //                   Container(
              //                     margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              //                     child: TextFormField(
              //                       keyboardType: TextInputType.name,
              //                       controller: _firstname,
              //                       validator: (value){
              //                         if(value == null || value.isEmpty){
              //                           return "This field cannot be empty";
              //
              //                         }else{
              //                           return null;
              //                         }
              //                       },
              //                       decoration: buildInputDecorationWithIcon("First Name", Icons.person),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15),
              //                   Container(
              //                     margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              //                     child: TextFormField(
              //                       controller: _lastname,
              //                       keyboardType: TextInputType.name,
              //                       decoration: buildInputDecorationWithIcon("Last Name", Icons.person),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15),
              //
              //                   Container(
              //                     margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              //                     child: TextFormField(
              //                       controller: _email,
              //                       keyboardType: TextInputType.emailAddress,
              //                       validator: (value)=>validateEmail(value),
              //                       decoration: buildInputDecorationWithIcon("Email", Icons.email),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15),
              //
              //                   Container(
              //                     margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              //                     child: TextFormField(
              //                       controller: _mobileNumber,
              //                       keyboardType: TextInputType.number,
              //                       validator: (value)=>validateMobile(value),
              //                       decoration: buildInputDecorationWithIcon("Mobile Number", Icons.phone),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15),
              //                   Container(
              //                     margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              //                     child: TextFormField(
              //                       keyboardType: TextInputType.text,
              //                       controller: _pass,
              //                       obscureText: true,
              //                       decoration: buildInputDecorationWithIcon("Create Password", Icons.password),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15),
              //                   Container(
              //                     margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              //                     child: TextFormField(
              //                       keyboardType: TextInputType.text,
              //                       controller: _confirmPass,
              //                       obscureText: true,
              //                       validator: (val) {
              //                         if (val.isEmpty) {
              //                           return null;
              //                         } else if (val != _pass.text) {
              //                           return "Password Not Matching";
              //                         } else {
              //                           return null;
              //                         }
              //                       },
              //                       decoration: buildInputDecorationWithIcon("Confirm Password", Icons.password),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15),
              //                   Container(
              //                     margin: EdgeInsets.only(left: 20,right: 20),
              //                     width: double.infinity,
              //                     child: RaisedButton(
              //                       color: headcolor,
              //                       elevation: 0,
              //                       hoverElevation: 0,
              //                       focusElevation: 0,
              //                       highlightElevation: 0,
              //                       shape: bordershape(),
              //                       onPressed: () {
              //                         if (_form.currentState.validate()) {
              //                           _form.currentState.save();
              //                           Provider.of<RegisterUserProvider>(newContext,listen: false).registerUser(_firstname.text,_lastname.text, _mobileNumber.text,_email.text,_pass.text);
              //                           if(!Provider.of<RegisterUserProvider>(newContext,listen: false).error==true){
              //                             CircularProgressIndicator();
              //                           }else{
              //                             print("Something went wrong");
              //                           }
              //                           print("Validated");
              //
              //                         } else {
              //                           print("Not Validated");
              //                         }
              //                       },
              //                       child: Text("Sign Up",
              //                         style:  TextStyle(
              //                             color: whitecolor,
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: 14,
              //                             fontFamily: 'Roboto Regular'
              //                         ),),
              //                     ),
              //                   ),
              //                   Container(
              //                       child: Row(
              //                         children: <Widget>[
              //                           Text('Already have an account?',
              //                               style: textwithblackrobotoregular()
              //                           ),
              //                           FlatButton(
              //                             textColor: textcolor,
              //                             child: Text(
              //                               'Log In',
              //                               style: textwithrobotoregular(),
              //                             ),
              //                             onPressed: () {
              //                               Navigator.pushReplacement(context,
              //                                   MaterialPageRoute(builder: (context) => LogIn()));
              //                             },
              //                           )
              //                         ],
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                       ))
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //         Positioned(
              //           top: 0,
              //           left: 0,
              //           child: Container(
              //             height: 100,
              //             width: 125,
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(
              //                   image: AssetImage("images/bannerbgline.png"),
              //                   fit: BoxFit.cover,
              //                 )
              //             ),
              //           ),
              //         ),
              //         Positioned(
              //           top: 60,
              //           right: 25,
              //           child: Container(
              //             height: 240,
              //             width: 200,
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(
              //                     image: AssetImage("images/signupbg.png"),
              //                     fit: BoxFit.cover
              //                 )
              //             ),
              //           ),
              //         ),
              //         Positioned(
              //             top: 200,
              //             left: 15,
              //             child: Text(
              //               "Sign Up Here",
              //               style: TextStyle(
              //                   color: headcolor,
              //                   fontSize: 25,
              //                   fontFamily: 'Roboto Bold'),
              //             )),
              //         Positioned(
              //             top: 5,
              //             left: 0,
              //             right: 0,
              //             child: Container(
              //               child: Image(
              //                 image:
              //                 AssetImage("images/aqscuslogo.png"),height: 30,width: 30,
              //               ),
              //             )),
              //       ],
              //     )
              //   ],
              //
              // ),
            );
          },
        ),
      ),
    )
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => LogIn()));
    return true;
  }
}
