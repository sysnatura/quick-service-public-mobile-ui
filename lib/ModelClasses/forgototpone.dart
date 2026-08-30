// To parse this JSON data, do
//
//     final forgotOtpone = forgotOtponeFromJson(jsonString);

import 'dart:convert';

ForgotOtpone forgotOtponeFromJson(String str) => ForgotOtpone.fromJson(json.decode(str));

String forgotOtponeToJson(ForgotOtpone data) => json.encode(data.toJson());

class ForgotOtpone {
  ForgotOtpone({
    this.email,
    this.otp,
    this.otpType,
  });

  String email;
  String otp;
  int otpType;

  factory ForgotOtpone.fromJson(Map<String, dynamic> json) => ForgotOtpone(
    email: json["Email"],
    otp: json["Otp"],
    otpType: json["OtpType"],
  );

  Map<String, dynamic> toJson() => {
    "Email": email,
    "Otp": otp,
    "OtpType": otpType,
  };
}
