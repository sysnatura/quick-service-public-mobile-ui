// To parse this JSON data, do
//
//     final profilepasswordchangetwo = profilepasswordchangetwoFromJson(jsonString);

import 'dart:convert';

Profilepasswordchangetwo profilepasswordchangetwoFromJson(String str) => Profilepasswordchangetwo.fromJson(json.decode(str));

String profilepasswordchangetwoToJson(Profilepasswordchangetwo data) => json.encode(data.toJson());

class Profilepasswordchangetwo {
  Profilepasswordchangetwo({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory Profilepasswordchangetwo.fromJson(Map<String, dynamic> json) => Profilepasswordchangetwo(
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
