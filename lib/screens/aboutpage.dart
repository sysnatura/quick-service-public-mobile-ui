import 'package:aqscustomer/screens/settings_screen.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';

import '../utils/terms_conndition_text.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
          onTap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (newContext) => SettingsScreen()));
          },
        ),
        title: const Text(
          'About',
          style: TextStyle(color: headcolor, fontSize: 18),
        ),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          termsconditiotext,
                          style: TextStyle(color: Colors.black87),
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_right_rounded,
                              size: 15,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    termsconditiotext1,
                                    style: TextStyle(color: Colors.black87),
                                    softWrap: true,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    termsconditiotext1,
                                    style: TextStyle(color: Colors.black87),
                                    softWrap: true,
                                  ),
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
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_right_rounded,
                              size: 15,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    termsconditiotext1,
                                    style: TextStyle(color: Colors.black87),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Card(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, bottom: 15, top: 15),
                      color: secondaryPrimaryColor,
                      child: ListTile(
                        title: Text(
                          "Help",
                          style: textwithblackrobotoregular(),
                        ),
                        subtitle: Text("Find answer to your question here",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13)),
                      )),
                  Card(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      color: secondaryPrimaryColor,
                      child: ListTile(
                        title: Text(
                          "App Version",
                          style: textwithblackrobotoregular(),
                        ),
                        subtitle: Text("1.0.01",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (newContext) => SettingsScreen()));
    return true;
  }
}
