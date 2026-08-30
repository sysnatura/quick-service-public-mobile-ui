// To parse this JSON data, do
//
//     final forgotConfirmPasswordTwo = forgotConfirmPasswordTwoFromJson(jsonString);

import 'dart:convert';

ForgotConfirmPasswordTwo forgotConfirmPasswordTwoFromJson(String str) => ForgotConfirmPasswordTwo.fromJson(json.decode(str));

String forgotConfirmPasswordTwoToJson(ForgotConfirmPasswordTwo data) => json.encode(data.toJson());

class ForgotConfirmPasswordTwo {
  ForgotConfirmPasswordTwo({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  String statusDescription;

  factory ForgotConfirmPasswordTwo.fromJson(Map<String, dynamic> json) => ForgotConfirmPasswordTwo(
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
