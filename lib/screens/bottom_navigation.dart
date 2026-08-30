import 'package:aqscustomer/screens/chat_screen.dart';
import 'package:aqscustomer/screens/notification.dart';
import 'package:aqscustomer/screens/home_fragment.dart';
import 'package:aqscustomer/screens/profile_screen.dart';
import 'package:aqscustomer/utils/BNBCustomPainter.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'order_history_tab_all.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;

  const BottomNavigation(
      {Key key,  this.currentIndex})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
   int _selectedIndex=0;

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

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(
        child: currrentscreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: headcolor,
        autofocus: true,
        child: Icon(Icons.person),
        onPressed: (){
          setState(() {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          });

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: primaryColor,
        child: Container(
          height: 60,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   MaterialButton(
                     minWidth: 40,
                       onPressed: ()
                   {
                     setState(() {
                       currrentscreen=HomeFragment();
                       _selectedIndex=0;
                     });
                   },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.home_outlined,size: 25,
                           color:_selectedIndex == 0 ? Colors.blue : Colors.grey,
                         ),
                         Text("Home",style: textwithblackrobotoregular(),)
                       ],
                     ),

                   ),
                   MaterialButton(
                     minWidth: 40,
                     onPressed: ()
                     {
                       setState(() {
                         currrentscreen=OrderHistoryTabAll();
                         _selectedIndex=1;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.description,size: 24,
                           color:_selectedIndex == 1 ? Colors.blue : Colors.grey,
                         ),
                         Text("Order Screen",style: textwithblackrobotoregular(),)
                       ],
                     ),

                   )
                 ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   MaterialButton(
                     minWidth: 40,
                     onPressed: ()
                     {
                       setState(() {
                         currrentscreen=NotificationScreen();
                         _selectedIndex=2;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.notifications_none_rounded,size: 27,
                           color:_selectedIndex == 2 ? Colors.blue : Colors.grey,
                         ),
                         Text("Notification",style: textwithblackrobotoregular(),)
                       ],
                     ),

                   ),
                   MaterialButton(
                     minWidth: 40,
                     onPressed: ()
                     {
                       setState(() {
                         currrentscreen=ChatScreen();
                         _selectedIndex=3;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.chat_rounded,size: 22,
                           color:_selectedIndex == 3 ? Colors.blue : Colors.grey,
                         ),
                         Text("Chat",style: textwithblackrobotoregular(),)
                       ],
                     ),

                   )
                 ],
               ),

             ],
           ),


        ),

      ),
    );
    // return Scaffold(
    //   body: IndexedStack(
    //     index: _selectedIndex,
    //     children: [
    //       HomeFragment(),
    //       OrderHistoryTab(),
    //       ProfileScreen(),
    //     ],
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //     backgroundColor: primaryColor,
    //     items: [
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.home),
    //           title: Text(
    //             "Home",
    //             style: textwithrobotoregular(),
    //           )),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.history),
    //           title: Text(
    //             "History",
    //             style: textwithrobotoregular(),
    //           )),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.person),
    //           title: Text(
    //             "Profile",
    //             style: textwithrobotoregular(),
    //           ))
    //     ],
    //     currentIndex: _selectedIndex,
    //     onTap: _onItemTap,
    //     selectedItemColor: buttoncolor,
    //   ),
    // );
  }
}
