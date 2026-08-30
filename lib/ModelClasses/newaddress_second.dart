// To parse this JSON data, do
//
//     final addressSecond = addressSecondFromJson(jsonString);

import 'dart:convert';

AddressSecond addressSecondFromJson(String str) => AddressSecond.fromJson(json.decode(str));

String addressSecondToJson(AddressSecond data) => json.encode(data.toJson());

class AddressSecond {
  AddressSecond({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory AddressSecond.fromJson(Map<String, dynamic> json) => AddressSecond(
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
