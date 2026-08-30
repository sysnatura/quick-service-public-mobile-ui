import 'package:aqscustomer/providers/single_customer_provider.dart';
import 'package:aqscustomer/screens/Profile_edit.dart';
import 'package:aqscustomer/screens/activity_log.dart';
import 'package:aqscustomer/screens/address_list.dart';
import 'package:aqscustomer/screens/change_password.dart';
import 'package:aqscustomer/screens/edit_profile.dart';
import 'package:aqscustomer/screens/settings_screen.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    context.read<SingleCustomerProvider>().GetCustomer();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (newContext) => BottomNavigation(currentIndex: 0)));
            },
          ),
          backgroundColor: Color(0xFFf3eeff),
          actions: [
            GestureDetector(
              onTap: () async{
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                int _customerId = Provider.of<SingleCustomerProvider>(context,listen: false).responseString.customerId;
                preferences.setInt("customerId", _customerId);
                int _contactId = Provider.of<SingleCustomerProvider>(context,listen: false).responseString.contactId;
                preferences.setInt("contactId", _contactId);
                String _customerName = Provider.of<SingleCustomerProvider>(context,listen: false).responseString.customerName;
                preferences.setString("customerName", _customerName);
                String _emailId = Provider.of<SingleCustomerProvider>(context,listen: false).responseString.contactDto.emailAddress;
                preferences.setString("emailAddress", _emailId);
                String _mobileNumber = Provider.of<SingleCustomerProvider>(context,listen: false).responseString.contactDto.mobileNumber;
                preferences.setString("emailAddress", _mobileNumber);
                if(Provider.of<SingleCustomerProvider>(context,listen: false).responseString.profilePicture != null){
                String _profilePic = Provider.of<SingleCustomerProvider>(context,listen: false).responseString.profilePicture;
                preferences.setString("profilePic", _profilePic);}
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileEditScreen()));
              },
                child: Container(
                    margin: EdgeInsets.only(right: 20,top: 20),
                    child: Icon(Icons.edit_note_outlined,color: headcolor,)))
          ],
        ),
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: Consumer<SingleCustomerProvider>(
            builder: (context,value,child){
              return value.error ? Center(child: CircularProgressIndicator()) :
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: height * .4,
                      decoration: BoxDecoration(color: Color(0xFFf3eeff)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (value.responseString.profilePicture != null) ? Container(
                              width: 110.0,
                              height: 110.0,
                              decoration:  BoxDecoration(
                                  color: secondaryPrimaryColor,
                                  shape: BoxShape.circle,
                                  image:  DecorationImage(
                                      fit: BoxFit.fill,
                                      image:NetworkImage("https://aqsapi.aspiromtech.com/ProfilePic/${value.responseString.profilePicture}")))) :
                          Container(
                              width: 110.0,
                              height: 110.0,
                              decoration:  BoxDecoration(
                                border: Border.all(color: headcolor),
                                  shape: BoxShape.circle,
                                  ),
                            child: Icon(Icons.person,size: 40,),
                          ),
                          const SizedBox(height: 10 ),
                          Text(value.responseString.customerName, style: textwithrobotobold()),
                          Text(value.responseString.contactDto.emailAddress,
                              style: textwithblackrobotoregular()),
                          Text(value.responseString.contactDto.mobileNumber,
                              style: textwithblackrobotoregular())
                        ],
                      ),
                    ),
                    Container(
                      height: height * .6,
                      decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: [

                          SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddressList()));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    color: secondaryPrimaryColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.my_library_books_sharp,color: headcolor,size: 30,
                                              ),
                                        ),
                                        Text(
                                          "Address",
                                          style: textwithblackrobotolight(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),


                                GestureDetector(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    color: secondaryPrimaryColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.list,color: headcolor,size: 30,),
                                        ),
                                        Text(
                                          "Activity Log",
                                          style: textwithblackrobotolight(),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ActivityLog()
                                        )
                                    );
                                  },
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsScreen()));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    color: secondaryPrimaryColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child:Icon(Icons.settings,color: headcolor,size: 30,),
                                        ),
                                        Text(
                                          "Settings",
                                          style: textwithblackrobotolight(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
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
