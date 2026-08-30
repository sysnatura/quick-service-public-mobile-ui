// To parse this JSON data, do
//
//     final forgotConfirmPasswordOne = forgotConfirmPasswordOneFromJson(jsonString);

import 'dart:convert';

ForgotConfirmPasswordOne forgotConfirmPasswordOneFromJson(String str) => ForgotConfirmPasswordOne.fromJson(json.decode(str));

String forgotConfirmPasswordOneToJson(ForgotConfirmPasswordOne data) => json.encode(data.toJson());

class ForgotConfirmPasswordOne {
  ForgotConfirmPasswordOne({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory ForgotConfirmPasswordOne.fromJson(Map<String, dynamic> json) => ForgotConfirmPasswordOne(
    email: json["email"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "Password": password,
  };
}
