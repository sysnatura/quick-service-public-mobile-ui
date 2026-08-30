import 'package:aqscustomer/screens/settings_screen.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/terms_conndition_text.dart';
import 'package:flutter/material.dart';

class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({Key key}) : super(key: key);

  @override
  _TermsAndConditionPageState createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
          onTap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (newContext) => SettingsScreen()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Terms of Service',style: TextStyle(color: headcolor,fontSize: 20),textAlign: TextAlign.center,),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          height: double.infinity,
          child:ListView(
            children : [
             Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Text(termsconditiotext,style: TextStyle(color: Colors.black87),
                    softWrap: true,),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_right_rounded,size: 15,),
                      Expanded(
                        child: Column(
                          children: [
                            Text(termsconditiotext1,style: TextStyle(color:Colors.black87),
                              softWrap: true,),
                            SizedBox(
                              height: 5,
                            ),
                            Text(termsconditiotext1,style: TextStyle(color:Colors.black87),
                              softWrap: true,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_right_rounded,size: 15,),
                      Expanded(
                        child: Column(
                          children: [
                            Text(termsconditiotext1,style: TextStyle(color:Colors.black87),
                              softWrap: true,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ]),
        ),
      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => SettingsScreen()));
    return true;
  }
}
