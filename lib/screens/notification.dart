import 'package:aqscustomer/ModelClasses/notification.dart';
import 'package:aqscustomer/screens/bottom_navigation.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/datetime_format.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/base_url.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  String to = '_-330';
  List<NotificationPage> reverseList = [];

  Future<List<NotificationPage>> GetAllNotification() async {

    SharedPreferences preferences=await SharedPreferences.getInstance();
    String tokenValue = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $tokenValue$to",
      "Content-Type": "application/json"
    };

    final response = await http.get(
        Uri.parse(
            AppUrl.get_notifications),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List<NotificationPage> user = notificationPageFromJson(response.body);
      reverseList = user.reversed.toList();

      return reverseList;
    } else {
      throw Exception('Failed to load');
    }
  }
  Future<List<NotificationPage>> allNotification;
  @override
  void initState(){
    super.initState();
    allNotification = GetAllNotification();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notifications",
          style: textwithrobotoregular(),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: primaryColor),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: FutureBuilder(
            future: allNotification,
            builder:
                (BuildContext context, AsyncSnapshot<List<NotificationPage>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }else{
                    if (snapshot.data.isEmpty) {
                      return const Center(child: Text("No items Found"));
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                            color: primaryColor,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text(simplyFormat(time: snapshot.data[index].createdDate,dateOnly: true)),
                                      Text(GetTime(snapshot.data[index].createdDate.toString()))
                                    ]),
                                  SizedBox(height: 5),
                                  Text(snapshot.data[index].heading),
                                  SizedBox(height: 5),
                                  Text(snapshot.data[index].details,style: textwithblackrobotoregular())
                                ],
                              ),
                            ),

                          );
                        },
                      );
                    }
                  }
                })



      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => BottomNavigation(currentIndex: 0)));
    return true;
  }
  GetTime(String val){   //Format : 11:14:09 AM
    //DateFormat('hh:mm a').format(DateTime.now());
    return DateFormat.jm().format(DateTime.parse(val));
  }
}
