import 'package:aqscustomer/utils/Colors.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecorationWithIcon(String hintText, IconData icon) {
  return InputDecoration(
    hintText: hintText,
    border: OutlineInputBorder(),
    suffixIcon: Icon(icon,color: headcolor),
    fillColor: secondaryPrimaryColor,
    filled: true,
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.transparent),
    ),
  );


}
TextStyle textwithrobotoregular(){
  return TextStyle(
        color: headcolor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: 'Roboto Regular'
  );
}
TextStyle textwithrobotobold(){
  return TextStyle(
      color: headcolor,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: 'Roboto Bold'
  );
}
TextStyle textwithrobotolight() {
  return TextStyle(
      color: headcolor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: 'Roboto Light'
  );
}
TextStyle textwithblackrobotolight() {
  return TextStyle(
      color: blackcolor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: 'Roboto Light'
  );
}
TextStyle textwithblackrobotoregular() {
  return TextStyle(
      color: blackcolor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: 'Roboto Regular'
  );
}
TextStyle textwithblackrobotobold() {
  return TextStyle(
      color: blackcolor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: 'Roboto Bold'
  );
}

RoundedRectangleBorder bordershape(){
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14)
  );
}
TextStyle textwithheadcolorrobotoregular() {
  return TextStyle(
      color: headcolor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: 'Roboto Regular'
  );
}