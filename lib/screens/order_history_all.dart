import 'package:aqscustomer/ModelClasses/getAllServiceOrder.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:aqscustomer/utils/datetime_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
class OrderHistoryAll extends StatefulWidget {
  const OrderHistoryAll({Key key}) : super(key: key);

  @override
  _OrderHistoryAllState createState() => _OrderHistoryAllState();
}

class _OrderHistoryAllState extends State<OrderHistoryAll> {
  List<Datum> reverseList = [];
  String to = "_240";

  Future<ServiceHistory> service() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int customerId = preferences.getInt("customerId");
    print(customerId);
    String token = preferences.getString("tokenValue");

    var header = {
      "authorization": "BearerCustomer $token$to",
      "Content-Type": "application/json"};

    final response = await http.get(
        Uri.parse(
            AppUrl.get_all_service_orderbystatus+'id=$customerId&status=ALL'),
        headers: header);
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      final ServiceHistory user = serviceHistoryFromJson(response.body);
      return user;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<ServiceHistory> allService;

  @override
  void initState(){
    super.initState();
    allService = service();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: FutureBuilder(
          future: allService,
          builder:
              (BuildContext context, AsyncSnapshot <ServiceHistory> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data.data.isEmpty) {
                return Center(child: Text("No items Found"));
              } else {
                return Container(
                  color: primaryColor,
                  //height: 650,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),

                      itemCount: snapshot.data.data.length,
                      itemBuilder: (BuildContext context, int index) {
                      reverseList = snapshot.data.data.reversed.toList();
                        return
                          SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(left: 7,right: 7),
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      side: BorderSide(width: 0.3, color:headcolor)),
                                  elevation: 0,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                    decoration: const BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      // gradient: LinearGradient(
                                      //   begin: Alignment.centerLeft,
                                      //   end: Alignment.topRight,
                                      //   colors: [Color(0xffd8d6d6), Color(0xFFf3eeff
                                      //       )])
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 25,
                                          padding: EdgeInsets.only(left: 5,right: 5),
                                           child:   Text("Order Number: ${reverseList[index].orderNo.toString()}",style: TextStyle(color:headcolor,fontSize: 14,fontWeight: FontWeight.w600),),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Service date",style: TextStyle(color: Colors.black54),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(DateandTime(reverseList[index].serviceDate)),
                                                const SizedBox(width: 3,),
                                                Text(GetTimeAmPm(reverseList[index].serviceDate.toString()))
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Alternative service date",style: TextStyle(color: Colors.black54)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(DateandTime(reverseList[index].alternativeServiceDate)),
                                                const SizedBox(width: 3,),
                                                Text(GetTimeAmPm(reverseList[index].alternativeServiceDate.toString()))
                                              ],
                                            )
                                          ],
                                        ),
                                        if(reverseList[index].serviceOrderDtoList.isNotEmpty)const SizedBox(
                                          height: 4,
                                        ),
                                        if(reverseList[index].serviceOrderDtoList.isNotEmpty)Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Placed date",style: TextStyle(color: Colors.black54)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                if(reverseList[index].serviceOrderDtoList.isNotEmpty)Text(DateandTime(reverseList[index].serviceOrderDtoList[0].createdOn)),
                                                const SizedBox(width: 3,),
                                                if(reverseList[index].serviceOrderDtoList.isNotEmpty)Text(GetTimeAmPm(reverseList[index].serviceOrderDtoList[0].createdOn.toString()))
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Order status",style: TextStyle(color: Colors.black54)),
                                            Text(reverseList[index].orderStatusEnumValue.toUpperCase(),style: TextStyle(color:headcolor,fontSize: 14,fontWeight: FontWeight.w600),)
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          );
                      }),
                );

              }
            }
          })
    );
  }
}