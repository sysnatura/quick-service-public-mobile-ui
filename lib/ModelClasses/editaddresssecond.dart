// To parse this JSON data, do
//
//     final editAddressSecond = editAddressSecondFromJson(jsonString);

import 'dart:convert';

EditAddressSecond editAddressSecondFromJson(String str) => EditAddressSecond.fromJson(json.decode(str));

String editAddressSecondToJson(EditAddressSecond data) => json.encode(data.toJson());

class EditAddressSecond {
  EditAddressSecond({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory EditAddressSecond.fromJson(Map<String, dynamic> json) => EditAddressSecond(
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
