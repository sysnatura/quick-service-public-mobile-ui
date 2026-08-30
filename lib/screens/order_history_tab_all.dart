import 'package:aqscustomer/screens/bottom_navigation.dart';
import 'package:aqscustomer/screens/home_fragment.dart';
import 'package:aqscustomer/screens/order_history_all.dart';
import 'package:aqscustomer/screens/order_history_arriving.dart';
import 'package:aqscustomer/screens/order_history_delivered.dart';
import 'package:aqscustomer/screens/order_history_processing.dart';
import 'package:aqscustomer/screens/oreder_history_placed.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';

import 'order_history_cancelled.dart';
import 'order_history_rejected.dart';
class OrderHistoryTabAll extends StatefulWidget {
  const OrderHistoryTabAll({Key key}) : super(key: key);

  @override
  _OrderHistoryTabAllState createState() => _OrderHistoryTabAllState();
}

class _OrderHistoryTabAllState extends State<OrderHistoryTabAll> {
  TabBar get _tabBar =>  TabBar(
    isScrollable: true,
    indicatorColor: headcolor,
    tabs: [
      Tab(
        child: Text(
          "ALL",
          style: textwithblackrobotoregular(),
        ),
      ),
      Tab(
        child: Text(
            "PLACED",
          style: textwithblackrobotoregular(),
        ),
      ),
      Tab(
        child: Text(
          "PROCESSING",
          style: textwithblackrobotoregular(),
        ),
      ),
      Tab(
        child: Text(
          "ARRIVING",
          style: textwithblackrobotoregular(),
        ),
      ),
      Tab(
        child: Text(
          "DELIVERED",
          style: textwithblackrobotoregular(),
        ),
      ),
      Tab(
        child: Text(
          "CANCELLED",
          style: textwithblackrobotoregular(),
        ),
      ),
      Tab(
        child: Text(
          "REJECTED",
          style: textwithblackrobotoregular(),
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Order Details",
              style: textwithrobotoregular(),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(color: primaryColor),
            ),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                color: Color(0xFFf3eeff),
                child: _tabBar,
              ),
            ),
          ),
          body: WillPopScope(
            onWillPop: _onWillPop,
            child: TabBarView(
              children: [
                Tab(child: OrderHistoryAll()),
                Tab(child: OrderHistoryPlacedPage()),
                Tab(child: OrderHistoryProcessingPage()),
                Tab(child: OrderHistoryArrivingPage()),
                Tab(child: OrderHistoryDeliveredPage()),
                Tab(child: OrderHistoryCancelledPage()),
                Tab(child: OrderHistoryRejectedPage()),
              ],
            ),
          ),
        )
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => BottomNavigation(currentIndex: 0)));
    return true;
  }
}
