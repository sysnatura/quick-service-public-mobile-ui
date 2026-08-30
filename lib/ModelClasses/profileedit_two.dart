// To parse this JSON data, do
//
//     final profileEditModeltwo = profileEditModeltwoFromJson(jsonString);

import 'dart:convert';

ProfileEditModeltwo profileEditModeltwoFromJson(String str) => ProfileEditModeltwo.fromJson(json.decode(str));

String profileEditModeltwoToJson(ProfileEditModeltwo data) => json.encode(data.toJson());

class ProfileEditModeltwo {
  ProfileEditModeltwo({
    this.id,
    this.statusCode,
    this.statusDescription,
  });

  String id;
  int statusCode;
  dynamic statusDescription;

  factory ProfileEditModeltwo.fromJson(Map<String, dynamic> json) => ProfileEditModeltwo(
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
