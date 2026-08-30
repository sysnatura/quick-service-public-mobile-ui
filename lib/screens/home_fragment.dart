import 'dart:ffi';

import 'package:aqscustomer/ModelClasses/editaddresssecond.dart';
import 'package:aqscustomer/providers/service_category_provider.dart';
import 'package:aqscustomer/screens/services_list.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  double height, width;
  TextEditingController _searchcontroller = TextEditingController();

  List<dynamic> _items = [];
  List<dynamic> _searchList = [];

  bool elementfound = true;

  getUser()async{
    await context.read<ServiceCategoryProvider>().GetCategories();
    _searchList = context.read<ServiceCategoryProvider>().responseString;
    _items.addAll(_searchList);
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    context.read<ServiceCategoryProvider>().GetCategories();
    return Scaffold(
        backgroundColor: primaryColor,
        body: WillPopScope(
          onWillPop: () => _onBackPressed(),
          child: RefreshIndicator(
            onRefresh: () async {},
            child:  Consumer<ServiceCategoryProvider>(
                builder: (context, value, child) {
                  return !value.error
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                              child: Column(
                              children: [
                                   Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                          color: Color(0xFFf3eeff), height: height*1.2
                                      ),
                                      Positioned(
                                          top: 280,
                                          child: Container(
                                            height: height * 1.2,
                                            width: width * 1,
                                            decoration: const BoxDecoration(
                                                color: whitecolor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(25),
                                                    topRight: Radius.circular(25))),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 20),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 15, top: 15,bottom: 15),
                                                  alignment: Alignment.topLeft,
                                                  child: (Text(
                                                    "Service Categories",
                                                    style: textwithrobotoregular(),
                                                  )),
                                                ),
                                                 _items.isNotEmpty?Container(
                                                    margin: const EdgeInsets.only(
                                                        left: 15, right: 15, bottom: 15),
                                                    child: GridView.builder(
                                                      scrollDirection: Axis.vertical,
                                                      shrinkWrap: true,
                                                      physics: ScrollPhysics(),
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                               childAspectRatio: 0.95,
                                                              mainAxisSpacing: 16,
                                                              crossAxisSpacing: 16),
                                                      itemCount:_items.length,
                                                      itemBuilder: (context, index) {

                                                        return InkResponse(
                                                          onTap: () async {
                                                            //saving data to sharedpreference
                                                            SharedPreferences preferences =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            preferences.setInt(
                                                                "moduleId",
                                                                value.responseString[index]
                                                                    ["moduleId"]);
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (newContext) =>
                                                                        ServicesList(serviceName: _items[index]['name'],img: value.responseString[index]["imagePath"],)));
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.only(left: 5,right: 5),
                                                            decoration: const BoxDecoration(
                                                                color:
                                                                    secondaryPrimaryColor,
                                                                borderRadius:
                                                                    BorderRadius.all(Radius.circular(10))),
                                                            height: 75,
                                                            width: 75,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  // alignment:
                                                                  //     Alignment.center,
                                                                  child: Image.network(
                                                                      "https://aqsapi.aspiromtech.com/ModuleImages/"+value.responseString[index]["imagePath"],
                                                                      color: Colors.lightBlue,
                                                                      height: 45,
                                                                      width: 45),
                                                                ),
                                                                Text(_items[index]['name'],
                                                                  style:
                                                                      textwithrobotolight(),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ):const Center(
                                                   child: CircularProgressIndicator(),
                                                 ),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          top: 20,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            child: Image(
                                              image:
                                              AssetImage("images/aqscuslogo.png"),height: 30,width: 30,
                                            ),
                                          )),
                                      Positioned(
                                          right: 10,
                                          top: 70,
                                          child: Container(
                                            height: 240,
                                            child: Image(
                                              image:
                                                  AssetImage("images/homebannerimg.png"),height: 800,width: 250,
                                            ),
                                          )),
                                      Positioned(
                                        left: 40,
                                        right: 40,
                                        top: 255,
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color:
                                              whitecolor,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(15)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.3),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2), // changes position of shadow
                                                ),
                                              ]),

                                          padding: const EdgeInsets.all(4.0),
                                          child: TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  SearchItem(value.toLowerCase());
                                                });
                                              },
                                              controller: _searchcontroller,
                                              decoration: InputDecoration(
                                                  hintText: "Search",
                                                  border: InputBorder.none,
                                                  prefixIcon: Icon(Icons.search,color: headcolor,),),
                                            ),

                                        ),
                                      ),
                                    ],
                                  ),
                                SizedBox(
                                  height: 20,
                                  width: double.infinity,
                                )
                              ],
                          ),
                            ),
                      );
                },
              ),
          ),
        ));
  }

  void SearchItem(String val){

    List<dynamic> dummySearchList = List();
    dummySearchList.addAll(_searchList);
    if(val.isNotEmpty){
      List<dynamic> newlist = [];
      dummySearchList.forEach((element) {
        if (element['name'].toLowerCase().contains(val)){
          newlist.add(element);
          print(element['name']);
          print("found");
          setState(() {
            elementfound=true;
          });

        }
        else if(newlist.isEmpty){
          print("No item found");
          setState(() {
            elementfound=false;
          });
        }
      });
      setState(() {
        _items.clear();
        _items.addAll(newlist);
      });
      return;
    }
    else
    {
      setState(() {
        elementfound=true;
        _items.clear();
        _items.addAll(_searchList);
      });
    }
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog  (
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
          title: Text('Are you sure?',style: TextStyle(color: headcolor),),
          content: Text('Do you really want to exit App'),
          actions: <Widget>[
              FlatButton(
                child: Text('No',style: TextStyle(color: headcolor)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            FlatButton(
              child: Text('Yes',style: TextStyle(color: Colors.black87)),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    ) ?? false;
  }
}
