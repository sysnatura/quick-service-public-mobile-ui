// To parse this JSON data, do
//
//     final forgotReset = forgotResetFromJson(jsonString);

import 'dart:convert';

ForgotReset forgotResetFromJson(String str) => ForgotReset.fromJson(json.decode(str));

String forgotResetToJson(ForgotReset data) => json.encode(data.toJson());

class ForgotReset {
  ForgotReset({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory ForgotReset.fromJson(Map<String, dynamic> json) => ForgotReset(
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
