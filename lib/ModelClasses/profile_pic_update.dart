// To parse this JSON data, do
//
//     final profilePicUpdate = profilePicUpdateFromJson(jsonString);

import 'dart:convert';

ProfilePicUpdate profilePicUpdateFromJson(String str) => ProfilePicUpdate.fromJson(json.decode(str));

String profilePicUpdateToJson(ProfilePicUpdate data) => json.encode(data.toJson());

class ProfilePicUpdate {
  ProfilePicUpdate({
    this.id,
    this.statusCode,
    this.statusDescription,
    this.data,
  });

  String id;
  int statusCode;
  String statusDescription;
  Data data;

  factory ProfilePicUpdate.fromJson(Map<String, dynamic> json) => ProfilePicUpdate(
    id: json["\u0024id"],
    statusCode: json["statusCode"],
    statusDescription: json["statusDescription"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "statusCode": statusCode,
    "statusDescription": statusDescription,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.customerId,
    this.firstName,
    this.lastName,
    this.contactId,
    this.language,
    this.gender,
    this.dateOfBirth,
    this.reference,
    this.createdOn,
    this.accountId,
    this.emailVerified,
    this.mobileVerified,
    this.status,
    this.recordStatus,
    this.registeredFrom,
    this.registeredBy,
    this.profilePicture,
    this.base64,
    this.customerName,
    this.encryptedCustomerId,
    this.serviceOrderDto,
    this.accountDto,
    this.contactDto,
    this.userDto,
    this.customerAddressDtoList,
  });

  String id;
  int customerId;
  dynamic firstName;
  dynamic lastName;
  int contactId;
  dynamic language;
  dynamic gender;
  dynamic dateOfBirth;
  dynamic reference;
  DateTime createdOn;
  int accountId;
  bool emailVerified;
  bool mobileVerified;
  int status;
  int recordStatus;
  int registeredFrom;
  dynamic registeredBy;
  String profilePicture;
  String base64;
  String customerName;
  dynamic encryptedCustomerId;
  dynamic serviceOrderDto;
  dynamic accountDto;
  dynamic contactDto;
  dynamic userDto;
  dynamic customerAddressDtoList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["\u0024id"],
    customerId: json["customerId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    contactId: json["contactId"],
    language: json["language"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    reference: json["reference"],
    createdOn: DateTime.parse(json["createdOn"]),
    accountId: json["accountId"],
    emailVerified: json["emailVerified"],
    mobileVerified: json["mobileVerified"],
    status: json["status"],
    recordStatus: json["recordStatus"],
    registeredFrom: json["registeredFrom"],
    registeredBy: json["registeredBy"],
    profilePicture: json["profilePicture"],
    base64: json["base64"],
    customerName: json["customerName"],
    encryptedCustomerId: json["encryptedCustomerId"],
    serviceOrderDto: json["serviceOrderDto"],
    accountDto: json["accountDto"],
    contactDto: json["contactDto"],
    userDto: json["userDto"],
    customerAddressDtoList: json["customerAddressDtoList"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "customerId": customerId,
    "firstName": firstName,
    "lastName": lastName,
    "contactId": contactId,
    "language": language,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "reference": reference,
    "createdOn": createdOn.toIso8601String(),
    "accountId": accountId,
    "emailVerified": emailVerified,
    "mobileVerified": mobileVerified,
    "status": status,
    "recordStatus": recordStatus,
    "registeredFrom": registeredFrom,
    "registeredBy": registeredBy,
    "profilePicture": profilePicture,
    "base64": base64,
    "customerName": customerName,
    "encryptedCustomerId": encryptedCustomerId,
    "serviceOrderDto": serviceOrderDto,
    "accountDto": accountDto,
    "contactDto": contactDto,
    "userDto": userDto,
    "customerAddressDtoList": customerAddressDtoList,
  };
}
