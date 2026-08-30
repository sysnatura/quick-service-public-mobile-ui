import 'package:aqscustomer/screens/chat_screen.dart';
import 'package:aqscustomer/screens/home_fragment.dart';
import 'package:aqscustomer/screens/notification.dart';
import 'package:aqscustomer/screens/order_history_tab_all.dart';
import 'package:aqscustomer/screens/profile_screen.dart';
import 'package:aqscustomer/utils/BNBCustomPainter.dart';
import 'package:flutter/material.dart';
class BottomNavigationTwo extends StatefulWidget {
  final int currentIndex;
  const BottomNavigationTwo({Key key,this.currentIndex}) : super(key: key);

  @override
  _BottomNavigationTwoState createState() => _BottomNavigationTwoState();
}

class _BottomNavigationTwoState extends State<BottomNavigationTwo> {
  int _selectedIndex;
  final List<Widget> screens=[
    HomeFragment(),
    OrderHistoryTabAll(),
    NotificationScreen(),
    ChatScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currrentscreen = HomeFragment();
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }
  setBottomBarIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none, children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(backgroundColor: Colors.orange, child: Icon(Icons.shopping_basket), elevation: 0.1, onPressed: () {}),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: _selectedIndex == 0 ? Colors.orange : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);

                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.restaurant_menu,
                              color: _selectedIndex == 1 ? Colors.orange : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: _selectedIndex == 2 ? Colors.orange : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: _selectedIndex == 3 ? Colors.orange : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
