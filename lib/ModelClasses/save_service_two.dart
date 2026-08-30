// To parse this JSON data, do
//
//     final saveServiceTwo = saveServiceTwoFromJson(jsonString);

import 'dart:convert';

SaveServiceTwo saveServiceTwoFromJson(String str) => SaveServiceTwo.fromJson(json.decode(str));

String saveServiceTwoToJson(SaveServiceTwo data) => json.encode(data.toJson());

class SaveServiceTwo {
  SaveServiceTwo({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory SaveServiceTwo.fromJson(Map<String, dynamic> json) => SaveServiceTwo(
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
