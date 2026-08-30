import 'dart:convert';

import 'package:aqscustomer/screens/profile_screen.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
class ActivityLog extends StatefulWidget {
  const ActivityLog({Key key}) : super(key: key);

  @override
  _ActivityLogState createState() => _ActivityLogState();
}

class _ActivityLogState extends State<ActivityLog> {

  double height, width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Order Details",
          style: textwithrobotoregular(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: primaryColor),
        ),
        leading: Container(
          margin: EdgeInsets.only(top: 5),

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
                      builder: (context) => ProfileScreen()
                  )
              );
            },
          ),
        ),
      ),
      body:  WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          color: primaryColor,
          child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
               children: getStatus(),
              ),
            ],
    )),
          ),
        ),
      )
    );
  }
  int countt = 0;
  List<Widget> getStatus() {
    List<Map<String, dynamic>> itemsTask = [
      {
        "date": "2022-06-11",
        "time": "09:00 am",
        "status": "Task Status Updated to completed, From Started",
      },
      {
        "date": "2022-06-10",
        "time": "08:00 am",
        "status": "Job Task Oil change  had updated the Field Start Date and End Date",
      },
      {
        "date": "2022-06-15",
        "time": "05:00 am",
        "status": "Working in progress",
      },
      {
        "date": "2022-06-15",
        "time": "07:00 am",
        "status": "Task Status Updated to completed, From Started",
      },
      {
        "date": "2022-06-10",
        "time": "09:00 am",
        "status": "Task Status Updated to completed, From Started",
      },
      {
        "date": "2022-06-09",
        "time": "11:00 am",
        "status": "Job Task Oil change had updated the Field Start Date and End Date",
      },
      {
        "date": "2022-06-10",
        "time": "10:00 am",
        "status": "WORKING is Stopped because on some",
      },
      {
        "date": "2022-06-09",
        "time": "04:00 am",
        "status": "Task Status Updated to completed, From Started",
      },
      {
        "date": "2022-06-04",
        "time": "10:00 am",
        "status": "Job Task Oil change had updated the Field Start Date and End Date",
      },
      {
        "date": "2022-06-04",
        "time": "10:00 am",
        "status": "Job Task Oil change had updated the Field Start Date and End Date",
      },
      {
        "date": "2022-06-01",
        "time": "02:00 am",
        "status": "The job in progress",
      }
    ];

    /// sorting all task into ascending order by the date
    itemsTask.sort((a, b) => b['date'].compareTo(a['date']));

    itemsTask.toSet().toList().toString();


    /// takes out the date without duplicate using set to list method
    List result = [];
    List<Map<String, dynamic>> g = [];
    final jsonList = itemsTask.map((k) => jsonEncode(k['date'])).toList();
    final uniqueJsonList = jsonList.toSet().toList();
    result = uniqueJsonList.map((item) => jsonDecode(item)).toList();
    print(result);

    List<Widget> list = [];

    for (int i = 0; i < result.length; i++) {
      for (int j = 0; j < itemsTask.length; j++) {
        if (result[i] == itemsTask[j]['date']) {
          countt = countt + 1;

          itemsTask.isNotEmpty ?
          list.add(Wrap(
            children: [
              Visibility(
                visible: countt > 1 ? false : true,
                child: Align(
                    alignment: Alignment.center,
                      child: Text(
                          result[i]
                      ),
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                        itemsTask[j]['time'],
                        // itemsTask[i]['time'],
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ),
                  Container(
                    width: width * 0.72,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: headcolor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                            )),
                        Expanded(
                          flex: 40,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: primaryColor,
                            ),
                            child: ListTile(
                              //padding: EdgeInsets.all(10),
                              title: Text(itemsTask[j]["status"],
                                  // itemsTask[i]['status'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black54)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
          )
              : Container();
        }
      }
      countt = 0;
    }
    return list;
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => ProfileScreen()));
    return true;
  }
}
