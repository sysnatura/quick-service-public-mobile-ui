import 'package:aqscustomer/screens/SplashScreen.dart';
import 'package:aqscustomer/screens/home_fragment.dart';
import 'package:aqscustomer/screens/log_in.dart';
import 'package:aqscustomer/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}