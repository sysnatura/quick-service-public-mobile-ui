import 'package:aqscustomer/providers/service_list_provider.dart';
import 'package:aqscustomer/screens/book_service.dart';
import 'package:aqscustomer/screens/bottom_navigation.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/module_image.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/service_list_model.dart';
import '../utils/base_url.dart';
class ServicesList extends StatefulWidget {
  String serviceName;
  String img;
  ServicesList({Key key, @required this.serviceName,@required this.img}) : super(key: key);

  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {

  Future<List<GetAllServicesModel>> GetList() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int moduleId=preferences.getInt("moduleId");
    print(moduleId.toString());
    final response = await get(
      Uri.parse(AppUrl.service_list_url+"/$moduleId"),
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      final List<GetAllServicesModel> user = getAllServicesModelFromJson(response.body);

      return user;

    }else{
      throw Exception('Failed to load');
    }
  }
  Future<List<GetAllServicesModel>> allServiceList;

  @override
  void initState(){
    super.initState();
    allServiceList = GetList();
    widget.serviceName;
    widget.img;
  }

  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primaryColor,
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: RefreshIndicator(
          onRefresh: ()async{},
          child: FutureBuilder(
            future: allServiceList,
            builder: (BuildContext context, AsyncSnapshot<List<GetAllServicesModel>> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }else{
                if (snapshot.data == null) {
                  return const Center(child: Text("No items Found"));
                }else{
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                color: Color(0xFFf3eeff), height: height * 1),
                            Positioned(
                                top: 280,
                                child: Container(
                                  height: height * 1,
                                  width: width * 1,
                                  decoration: const BoxDecoration(
                                      color: whitecolor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25))),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 15,right: 15,top: 5),
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics: ScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: 0.8,
                                              mainAxisSpacing: 8,
                                              crossAxisSpacing: 8
                                          ),
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context,index){
                                            return InkResponse(
                                              onTap: ()async{
                                                SharedPreferences preferences =
                                                await SharedPreferences.getInstance();
                                                int addressId=snapshot.data[index].attributeId;
                                                preferences.setInt("attributeId", addressId);
                                                Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (newContext) => BookService(serviceName: widget.serviceName,img: widget.img,)));
                                              },
                                              child: Container(
                                                height: 75,
                                                width: 75,
                                                child: Card(
                                                  color: secondaryPrimaryColor,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        child: Image.network(
                                                            AppUrl.base_url+"AttributeImages/"+snapshot.data[index].imagePath,
                                                            fit: BoxFit.fill,
                                                            height: 55,
                                                            width: 75),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0),
                                                        child: Text(snapshot.data[index].name,
                                                            style: textwithblackrobotolight()),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Positioned(
                                right: 10,
                                top: 40,
                                child: Container(
                                  height: 240,
                                  child: moduleImage(widget.img,
                                      color: headcolor
                                  )
                                )),
                            Positioned(
                              left: 15,
                              top: 245,
                              child: Text(widget.serviceName,style: textwithrobotobold()),
                            ),
                             Positioned(
                              left: 15,
                              top: 50,
                              child:GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
                              onTap: (){
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (newContext) => BottomNavigation(currentIndex: 0)));
                              },
                              ),
                            )
                          ],
                        )


                      ],
                    ),
                  );
                }
              }

            },
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
