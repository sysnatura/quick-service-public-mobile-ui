// To parse this JSON data, do
//
//     final profilepasswordchangeone = profilepasswordchangeoneFromJson(jsonString);

import 'dart:convert';

Profilepasswordchangeone profilepasswordchangeoneFromJson(String str) => Profilepasswordchangeone.fromJson(json.decode(str));

String profilepasswordchangeoneToJson(Profilepasswordchangeone data) => json.encode(data.toJson());

class Profilepasswordchangeone {
  Profilepasswordchangeone({
    this.accountDto,
    this.customerId,
  });

  AccountDto accountDto;
  int customerId;

  factory Profilepasswordchangeone.fromJson(Map<String, dynamic> json) => Profilepasswordchangeone(
    accountDto: AccountDto.fromJson(json["accountDto"]),
    customerId: json["customerId"],
  );

  Map<String, dynamic> toJson() => {
    "accountDto": accountDto.toJson(),
    "customerId": customerId,
  };
}

class AccountDto {
  AccountDto({
    this.passwordHash,
    this.currentPassword,
  });

  String passwordHash;
  String currentPassword;

  factory AccountDto.fromJson(Map<String, dynamic> json) => AccountDto(
    passwordHash: json["passwordHash"],
    currentPassword: json["currentPassword"],
  );

  Map<String, dynamic> toJson() => {
    "passwordHash": passwordHash,
    "currentPassword": currentPassword,
  };
}
