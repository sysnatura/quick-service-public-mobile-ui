
import 'package:aqscustomer/providers/login.dart';
import 'package:aqscustomer/screens/bottom_navigation.dart';
import 'package:aqscustomer/screens/forgot_password.dart';
import 'package:aqscustomer/screens/sign_up.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Remember_Me/createdatabase.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isObscure = false;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  double height, width;
  bool _checkbox = false;
  bool _isChecked = false;
  final dbHelper = DatabaseHelper.instance;
  bool loader = false;

  @override
  void initState() {
    _loadUserEmailPassword();
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
      create: (context) => LoginProvider(),
      child: Scaffold(
          backgroundColor: whitecolor,
          body: Builder(
            builder: (BuildContext newContext) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(color: Color(0xFFf3eeff),height: height*1),
                        Positioned(
                            top: 300.0,
                            child: Container(
                                height: height*1,
                                width: width*1,
                                decoration: BoxDecoration(
                                    color: whitecolor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Form(
                                  key: _form,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 100),
                                      Container(
                                        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                                        child: TextFormField(
                                          controller: _email,
                                          decoration:
                                          buildInputDecorationWithIcon("Email", Icons.person),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Email is empty";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                                        child: TextFormField(
                                          obscureText: true,
                                          controller: _password,
                                          decoration:
                                          buildInputDecorationWithIcon("Password", Icons.password),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Password is empty";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15, top: 3),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Checkbox(
                                                value: _checkbox,
                                                activeColor: headcolor,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _checkbox = newValue;
                                                  });
                                                  print("check box value $_checkbox");
                                                },
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(right: 40),
                                              child: Text("Remember me",
                                                  style: TextStyle(fontSize: 14,color: headcolor)),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 15),
                                              alignment: Alignment.topRight,
                                              child: FlatButton(
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ForgotPassword()));
                                                },
                                                textColor: textcolor,
                                                child: Text('Forgot Password?', style: textwithrobotoregular()),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        width: double.infinity,
                                        child: SizedBox(
                                          height: 60,
                                          child: RaisedButton(
                                            color: headcolor,
                                            elevation: 0,
                                            hoverElevation: 0,
                                            focusElevation: 0,
                                            highlightElevation: 0,
                                            shape: bordershape(),
                                            onPressed: () async{
                                              if (_form.currentState.validate()){
                                                _form.currentState.save();
                                                print("Validated");
                                                setState(() {
                                                  loader = true;
                                                });
                                                await Provider.of<LoginProvider>(newContext,listen: false).loginUser(_email.text, _password.text);
                                                if(Provider.of<LoginProvider>(newContext,listen: false).error==false){
                                                  SharedPreferences preferences =
                                                  await SharedPreferences.getInstance();
                                                  String email = _email.text;
                                                  preferences.setString("email", email);
                                                  String password = _password.text;
                                                  preferences.setString("password", password);
                                                  print("password of login is $password");
                                                  int _customerId=Provider.of<LoginProvider>(newContext,listen: false).responseString.customerId;
                                                  String _tokenValue=Provider.of<LoginProvider>(newContext,listen: false).responseString.tokenValue;
                                                  preferences.setInt("customerId", _customerId);
                                                  preferences.setString("tokenValue", _tokenValue);

                                                  Navigator.pushReplacement(context,
                                                      MaterialPageRoute(builder: (context) => BottomNavigation(currentIndex: 0)));

                                                  if(_checkbox == true){
                                                    Map<String, dynamic> row = {
                                                      DatabaseHelper.columnUsername: _email.text.trim(),
                                                      DatabaseHelper.columnPassword:_password.text.trim(),
                                                    };
                                                    final id = await dbHelper.insert(row);
                                                    print('inserted row id: $id');
                                                  }
                                                }else{
                                                  setState(() {
                                                    loader = false;
                                                  });
                                                  final snackBar = SnackBar(
                                                    content: const Text('Login Failed',style: TextStyle(
                                                        color: whitecolor,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        fontFamily: 'Roboto Regular'
                                                    ),),
                                                    backgroundColor: (Colors.black),
                                                    action: SnackBarAction(
                                                      label: 'dismiss',
                                                      onPressed: () {
                                                      },
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                              } else {
                                                print("Not Validated");
                                              }
                                            },
                                            child: (loader == false) ? Text(
                                              "Sign In",
                                              style:  TextStyle(
                                                  color: whitecolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 22,
                                                  fontFamily: 'Roboto Bold'
                                              ),
                                            ) : CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text("Don't have an account yet?"),
                                              FlatButton(
                                                textColor: buttoncolor,
                                                child: Text(
                                                  'Sign Up',
                                                  style: textwithrobotoregular(),
                                                ),
                                                onPressed: () {
                                                  Navigator.pushReplacement(context,
                                                      MaterialPageRoute(builder: (context) => SignUp()));
                                                },
                                              )
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.center,
                                          ))
                                    ],
                                  ),
                                )
                            )
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
                          top: 85,
                          left: 0,
                          child: Container(
                            height: 350,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/signinimg.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          right: 0,
                          child: Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/bannerbglogo.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),),
                        Positioned(
                            top: 250,
                            right: 25,
                            child: Text(
                              "Sign in Here",
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
                    ),

                  ],
                ),
              );


            },
          )),
    );
  }
  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        _email = _email ?? "";
        _password = _password ?? "";
      }
    } catch (e)
    {
      print(e);
    }
  }
}

