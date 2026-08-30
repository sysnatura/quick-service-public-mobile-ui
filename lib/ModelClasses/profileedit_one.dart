// To parse this JSON data, do
//
//     final profileEditModel = profileEditModelFromJson(jsonString);

import 'dart:convert';

ProfileEditModelone profileEditModelFromJson(String str) => ProfileEditModelone.fromJson(json.decode(str));

String profileEditModelToJson(ProfileEditModelone data) => json.encode(data.toJson());

class ProfileEditModelone {
  ProfileEditModelone({
    this.customerId,
    this.firstName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.base64,
    this.contactDto,
  });

  int customerId;
  String firstName;
  String lastName;
  int gender;
  String dateOfBirth;
  dynamic base64;
  ContactDto contactDto;

  factory ProfileEditModelone.fromJson(Map<String, dynamic> json) => ProfileEditModelone(
    customerId: json["customerId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    base64: json["base64"],
    contactDto: ContactDto.fromJson(json["contactDto"]),
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "base64": base64,
    "contactDto": contactDto.toJson(),
  };
}

class ContactDto {
  ContactDto({
    this.contactId,
    this.mobileNumber,
    this.emailAddress,
    this.landLineNumber,
  });

  int contactId;
  String mobileNumber;
  String emailAddress;
  String landLineNumber;

  factory ContactDto.fromJson(Map<String, dynamic> json) => ContactDto(
    contactId: json["contactId"],
    mobileNumber: json["mobileNumber"],
    emailAddress: json["emailAddress"],
    landLineNumber: json["landLineNumber"],
  );

  Map<String, dynamic> toJson() => {
    "contactId": contactId,
    "mobileNumber": mobileNumber,
    "emailAddress": emailAddress,
    "landLineNumber": landLineNumber,
  };
}
