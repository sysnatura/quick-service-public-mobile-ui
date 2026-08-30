// To parse this JSON data, do
//
//     final forgotOtptwo = forgotOtptwoFromJson(jsonString);

import 'dart:convert';

ForgotOtptwo forgotOtptwoFromJson(String str) => ForgotOtptwo.fromJson(json.decode(str));

String forgotOtptwoToJson(ForgotOtptwo data) => json.encode(data.toJson());

class ForgotOtptwo {
  ForgotOtptwo({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  String statusDescription;

  factory ForgotOtptwo.fromJson(Map<String, dynamic> json) => ForgotOtptwo(
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
