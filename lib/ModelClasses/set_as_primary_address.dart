// To parse this JSON data, do
//
//     final setAsPrimary = setAsPrimaryFromJson(jsonString);

import 'dart:convert';

SetAsPrimary setAsPrimaryFromJson(String str) => SetAsPrimary.fromJson(json.decode(str));

String setAsPrimaryToJson(SetAsPrimary data) => json.encode(data.toJson());

class SetAsPrimary {
  SetAsPrimary({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory SetAsPrimary.fromJson(Map<String, dynamic> json) => SetAsPrimary(
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
