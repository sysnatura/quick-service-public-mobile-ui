import 'package:aqscustomer/Remember_Me/createdatabase.dart';
import 'package:aqscustomer/screens/aboutpage.dart';
import 'package:aqscustomer/screens/log_in.dart';
import 'package:aqscustomer/screens/profile_screen.dart';
import 'package:aqscustomer/screens/terms_and_conditionpage.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';

import 'change_password.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
          onTap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (newContext) => ProfileScreen()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: textwithrobotoregular(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: primaryColor),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: ListView(
          children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ChangePassword()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.vpn_key,color: blackcolor,),
                    title: Text("change Password",style: textwithblackrobotoregular(),),
                  ),
                ),
                Divider(color: blackcolor),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionPage()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.subject,color: blackcolor,),
                    title: Text("Terms & Condition",style: textwithblackrobotoregular(),),
                  ),
                ),
                Divider(color: blackcolor),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AboutPage()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.subject,color: blackcolor,),
                    title: Text("About",style: textwithblackrobotoregular(),),
                  ),
                ),
                Divider(color: blackcolor),
                GestureDetector(
                  onTap: ()async{
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LogIn()));
                    final id = await dbHelper.queryRowCount();
                    print("my id is $id");
                    dbHelper.delete(id);

                  },
                  child: ListTile(
                    leading: Icon(Icons.logout,color: blackcolor,),
                    title: Text("Log Out",style: textwithblackrobotoregular(),),
                  ),
                )
          ],
        ),
      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => ProfileScreen()));
    return true;
  }
}
