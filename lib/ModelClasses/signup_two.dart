// To parse this JSON data, do
//
//     final signUpTwo = signUpTwoFromJson(jsonString);

import 'dart:convert';

SignUpTwo signUpTwoFromJson(String str) => SignUpTwo.fromJson(json.decode(str));

String signUpTwoToJson(SignUpTwo data) => json.encode(data.toJson());

class SignUpTwo {
  SignUpTwo({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  String statusDescription;

  factory SignUpTwo.fromJson(Map<String, dynamic> json) => SignUpTwo(
    id: json["\u0024id"],
    statusCode: json["statusCode"],
    statusDescription: json["statusDescription"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "statusCode": statusCode,
    "statusDescription": statusDescription,
  };
}
