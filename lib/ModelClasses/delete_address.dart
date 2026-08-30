// To parse this JSON data, do
//
//     final deleteAddress = deleteAddressFromJson(jsonString);

import 'dart:convert';

DeleteAddress deleteAddressFromJson(String str) => DeleteAddress.fromJson(json.decode(str));

String deleteAddressToJson(DeleteAddress data) => json.encode(data.toJson());

class DeleteAddress {
  DeleteAddress({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory DeleteAddress.fromJson(Map<String, dynamic> json) => DeleteAddress(
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
