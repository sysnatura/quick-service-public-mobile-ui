import 'package:aqscustomer/providers/single_customer_provider.dart';
import 'package:aqscustomer/providers/update_profile_provider.dart';
import 'package:aqscustomer/utils/Colors.dart';
import 'package:aqscustomer/utils/widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  String _dob;
  String _radioVal;

  @override
  Widget build(BuildContext context) {
    context.read<SingleCustomerProvider>().GetCustomer();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: primaryColor),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: RefreshIndicator(
          onRefresh: ()async{},
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              alignment: Alignment.center,
              child: Consumer<SingleCustomerProvider>(
              builder: (context,value,child){
                int _radioSelected = value.responseString.gender;
                final TextEditingController _firstname_controller = TextEditingController(text: value.responseString.firstName);
                final TextEditingController _lastname_controller = TextEditingController(text: value.responseString.lastName);
                final TextEditingController _mobileNumber_controller = TextEditingController(text: value.responseString.contactDto?.mobileNumber);
                final TextEditingController _landNumber_controller = TextEditingController(text: value.responseString.contactDto?.landLineNumber.toString());
                return value.error ? Center(child: CircularProgressIndicator()) :
                Column(
                  children: [
                    Container(
                      child: ListTile(
                        leading: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("images/loginimage.png")))),
                        title: Text(
                          value.responseString.customerName.toString(),
                          style: textwithblackrobotobold(),
                        ),
                        subtitle: Text(
                          value.responseString.contactDto.emailAddress.toString(),
                          style: textwithblackrobotoregular(),
                        ),
                      ),
                    ),
                    Container(alignment: Alignment.topLeft,child: Text("First Name",style: textwithblackrobotolight())),
                    TextFormField(
                      controller: _firstname_controller,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecorationWithIcon("", Icons.person),
                    ),
                    SizedBox(height: 15),
                    Container(alignment: Alignment.topLeft,child: Text("Last Name",style: textwithblackrobotolight())),
                    TextFormField(
                      controller: _lastname_controller,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecorationWithIcon("", Icons.person),
                    ),
                    SizedBox(height: 15),
                    Container(alignment: Alignment.topLeft,child: Text("Mobile Number",style: textwithblackrobotolight())),
                    TextFormField(
                      controller: _mobileNumber_controller,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecorationWithIcon("", Icons.phone_android),
                    ),
                    SizedBox(height: 15),
                    Container(alignment: Alignment.topLeft,child: Text("Date of Birth",style: textwithblackrobotolight())),
                    DateTimePicker(
                      initialValue: value.responseString.dateOfBirth.toString(),
                      type: DateTimePickerType.dateTime,
                      dateLabelText: 'Date of Birth',
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                      icon: Icon(Icons.event),
                      // This will add one year from current date
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _dob = value;
                          });
                        }
                      },
                      // We can also use onSaved
                      onSaved: (value) {
                        if (value.isNotEmpty) {
                          _dob = value;
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    Container(alignment: Alignment.topLeft,child: Text("Land Number",style: textwithblackrobotolight())),
                    TextFormField(
                      controller: _landNumber_controller,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecorationWithIcon("", Icons.person),
                    ),
                    SizedBox(height: 15),
                    Container(alignment: Alignment.topLeft,child: Text("Gender",style: textwithblackrobotolight())),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _radioSelected,
                          activeColor: buttoncolor,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value as int;
                              _radioVal = 'Male';
                            });
                          },
                        ),
                        Text('Male', style: textwithrobotoregular()),
                        Radio(
                          value: 0,
                          groupValue: _radioSelected,
                          activeColor: buttoncolor,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value as int;
                              _radioVal = 'Female';
                            });
                          },
                        ),
                        Text('Female', style: textwithrobotoregular()),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      width: double.infinity,
                      child: RaisedButton(
                        color: buttoncolor,
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        shape: bordershape(),
                        onPressed: () {
                          Provider.of<UpdateProfileProvider>(context,listen: false).updateProfile(_firstname_controller.text, _landNumber_controller.text,  value.responseString.contactId, value.responseString.gender, DateTime.parse(value.responseString.createdOn.toString()), DateTime.parse(value.responseString.createdOn.toString()),
                              value.responseString.accountDto?.accountId, value.responseString.emailVerified, value.responseString.mobileVerified, value.responseString.status, value.responseString.recordStatus, value.responseString.registeredFrom, value.responseString.customerName, _mobileNumber_controller.text, value.responseString.contactDto.emailAddress, _landNumber_controller.text, value.responseString.contactDto.website);
                        },
                        child: Text("Update",
                          style: textwithrobotoregular(),),
                      ),
                    ),
                  ],
                );
              }

              )
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (newContext) => BottomNavigation(currentIndex: 2)));
    return true;
  }
}
