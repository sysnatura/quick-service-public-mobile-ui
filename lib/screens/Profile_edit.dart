import 'dart:convert';
import 'dart:io';
import 'package:aqscustomer/ModelClasses/profileedit_one.dart';
import 'package:aqscustomer/ModelClasses/profileedit_two.dart';
import 'package:aqscustomer/providers/single_customer_provider.dart';
import 'package:aqscustomer/screens/profile_screen.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ModelClasses/profile_pic_update.dart';
import '../utils/base_url.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileEditScreen> {

  String to = "_240";
  String _dob;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  double height, width;

  Future<ProfileEditModeltwo> ProfileEditFn(ProfileEditModelone profileEditModelone) async {
    ProfileEditModelone customer = profileEditModelone;

    final Map<String, dynamic> data = customer.toJson();
    String requestBody = json.encode(data);
    print((data));
    SharedPreferences preferences=await SharedPreferences.getInstance();
    int customerId = preferences.getInt("customerId");
    print(customerId);
    String token = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $token$to",
      "Content-Type": "application/json"
    };

    final response = await http.post(
        Uri.parse(
            AppUrl.customer_update_Profile),
        body: requestBody,
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      final ProfileEditModeltwo profile = profileEditModeltwoFromJson(response.body);
      if(profile.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Profile Updated Successfully")));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ProfileScreen()
            ));

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Not Updated")));
      }
      return profile;
    } else {
      throw Exception('Failed to Update Profile');
    }
  }
  Future<ProfileEditModeltwo> item;

  Future<ProfilePicUpdate> updateProfilePicFunction(String base64) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int customerId = preferences.getInt("customerId");
    print(customerId);
    String token = preferences.getString("tokenValue");
    var header = {
      "authorization": "BearerCustomer $token$to",
      "Content-Type": "application/json"
    };

    Map<String, dynamic> data ={
      "customerId": customerId,
      "base64": base64
    };
    print(data);

    final response = await post(
        Uri.parse(AppUrl.update_profile_pic_url),
        body : json.encode(data),
        headers: header
    );
    print('response update profile Pic ${response.body}');
    print(response.statusCode);
    if(response.statusCode == 200){
      loader = false;
      setState(() {
        SingleCustomerProvider().GetCustomer();
      });
      final ProfilePicUpdate updateResponse = profilePicUpdateFromJson(response.body);
      return updateResponse;
    }
    else{
      print("Something went wrong");
    }
    return ProfilePicUpdate();
  }

  File _image;
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    context.read<SingleCustomerProvider>().GetCustomer();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:primaryColor,
          leading:  GestureDetector(child: const Icon(Icons.arrow_back_ios,color: headcolor,size: 20,),
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (newContext) => ProfileScreen()));
            },
          ),
        ),
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: Consumer<SingleCustomerProvider>(
            builder: (context,value,child){
               TextEditingController _emailAddress = TextEditingController(text:value.responseString.contactDto.emailAddress);
               TextEditingController _firstName = TextEditingController(text: value.responseString.firstName);
               TextEditingController _lastName = TextEditingController(text: value.responseString.lastName);
               TextEditingController _mobileNumber = TextEditingController(text: value.responseString.contactDto.mobileNumber);
               return value.error ? Center(child: CircularProgressIndicator()) :

              Container(
                color: primaryColor,
                child: SingleChildScrollView(
                          child: Form(
                            key: _form,
                            child: Column(
                              children: [
                                Container(
                                  height: height * .2,
                                  width: double.infinity,
                                      color: primaryColor,
                                      child:Stack(
                                        children:[
                                          if(value.responseString.profilePicture != null) Positioned(
                                              top: 10,
                                              left: 0,
                                              right: 0,
                                              child:
                                              (loader == false) ? Container(
                                                  width: 110.0,
                                                  height: 110.0,
                                                  decoration:  BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image:  DecorationImage(
                                                          fit: BoxFit.fitHeight,
                                                          image: NetworkImage("https://aqsapi.aspiromtech.com/ProfilePic/${value.responseString.profilePicture}")))) : Container(
                                                width: 110.0,
                                                height: 110.0,
                                                child: const Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                              ),
                                          ),
                                          if(value.responseString.profilePicture == null)Positioned(
                                            top: 10,
                                            left: 0,
                                            right: 0,
                                            child:
                                            Container(
                                                width: 110.0,
                                                height: 110.0,
                                                decoration:  BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: headcolor)
                                                    ),
                                            child: Icon(Icons.person,size: 40,),
                                            )
                                          ),

                                      Positioned(
                                        top: 85,
                                        right: 0,
                                        left: 80,
                                        child:
                                        GestureDetector(
                                          onTap: () async{

                                            PickedFile pickedFile = await ImagePicker().getImage(
                                                source: ImageSource.gallery);
                                            print("profile pic is"+pickedFile.toString());
                                            if (pickedFile != null) {
                                              _image = File(pickedFile.path);
                                              print(_image.toString());
                                              String fileName = _image.path.split('/').last;
                                              final bytes = File(pickedFile.path).readAsBytesSync();
                                              String img64 = "data:image/png;base64,"+base64Encode(bytes);
                                              print("64"+img64);
                                              loader = true;
                                              print("file path -> "+fileName);
                                              updateProfilePicFunction(img64);
                                            } else {
                                              print('No image selected');
                                            }
                                            // setState(() {
                                            //
                                            // });

                                          },
                                          child: Container(
                                            child:
                                            CircleAvatar(
                                                radius: 15,
                                                backgroundColor:headcolor,
                                                child: Padding(
                                                  padding: EdgeInsets.all(1), // Border radius
                                                  child: ClipOval(
                                                    child: Icon(Icons.add_a_photo_rounded),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                      ],
                                ),
                                ),

                                SizedBox(
                                  height: 30,
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  height: 700,
                                  decoration: const BoxDecoration(
                                      color: whitecolor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(35),
                                          topRight: Radius.circular(35))),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, right: 50,top: 30),
                                    padding:EdgeInsets.only(left: 20,right: 20),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration:  const InputDecoration(
                                            icon: Icon(Icons.drive_file_rename_outline,color: headcolor,),
                                            labelText: 'First Name'
                                          ),
                                          controller: _firstName,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Enter First Name";
                                            } else {
                                              return null;
                                            }
                                          },

                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration:  const InputDecoration(
                                              icon: Icon(Icons.drive_file_rename_outline,color: whitecolor,),
                                              labelText: 'Last Name'
                                          ),
                                          controller: _lastName,
                                          //controller: _geolocation,
                                          //   onChanged: (newvalue){
                                          //     _geolocation.text = newvalue;
                                          //   },
                                          //   onSaved: (value){
                                          //     _geolocation.text = value;
                                          //   },
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration:  InputDecoration(
                                              icon: const Icon(Icons.mail_outline,color: headcolor,),
                                              hintText: value.responseString.contactDto.emailAddress,
                                              labelText: 'Email cant be changed'
                                          ),
                                          keyboardType: TextInputType.emailAddress,
                                          controller: _emailAddress,
                                          readOnly: true,

                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Email Field cant be Empty";
                                            } else {
                                              return null;
                                            }
                                          },


                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration:  const InputDecoration(
                                              icon: Icon(Icons.phone,color: headcolor,),
                                              labelText: 'Mobile Number'
                                          ),
                                          controller: _mobileNumber,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Mobile Number required";
                                            } else {
                                              return null;
                                            }
                                          },


                                        ),


                                    const SizedBox(height: 30,),

                                    RaisedButton(
                                      color: headcolor,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(13)),
                                      onPressed: () async{
                                        SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                        int contactId = preferences.getInt("contactId");
                                        print("contact Id is $contactId");
                                        int customerId = preferences.getInt("customerId");
                                        print("customer Id is $customerId");

                                        setState(() {
                                         if (_form.currentState.validate()){
                                           _form.currentState.save();

                                           ContactDto contactdto = ContactDto(
                                             mobileNumber: _mobileNumber.text,
                                             emailAddress: _emailAddress.text,
                                             contactId: contactId,
                                           );

                                           item = ProfileEditFn(ProfileEditModelone(firstName:_firstName.text,lastName: _lastName.text,customerId: customerId,
                                             contactDto: contactdto

                                           ));
                                         }
                                       });
                                      },
                                      child: const Text("Update",
                                        style: TextStyle(color: Colors.white),),
                                    ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                ),
              );
            },
          ),
        )

    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => ProfileScreen()));
    return true;
  }
}
