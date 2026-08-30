// To parse this JSON data, do
//
//     final signUpOne = signUpOneFromJson(jsonString);

import 'dart:convert';

SignUpOne signUpOneFromJson(String str) => SignUpOne.fromJson(json.decode(str));

String signUpOneToJson(SignUpOne data) => json.encode(data.toJson());

class SignUpOne {
  SignUpOne({
    this.contactDto,
    this.password,
    this.firstName,
    this.lastName,
    this.customerAddressDtoList,
    this.accountDto,
  });

  ContactDtoSignup contactDto;
  String password;
  String firstName;
  String lastName;
  dynamic customerAddressDtoList;
  AccountDtoSignup accountDto;

  factory SignUpOne.fromJson(Map<String, dynamic> json) => SignUpOne(
    contactDto: ContactDtoSignup.fromJson(json["contactDto"]),
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    customerAddressDtoList: json["customerAddressDtoList"],
    accountDto: AccountDtoSignup.fromJson(json["accountDto"]),
  );

  Map<String, dynamic> toJson() => {
    "contactDto": contactDto.toJson(),
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "customerAddressDtoList": customerAddressDtoList,
    "accountDto": accountDto.toJson(),
  };
}

class AccountDtoSignup {
  AccountDtoSignup({
    this.passwordHash,
  });

  String passwordHash;

  factory AccountDtoSignup.fromJson(Map<String, dynamic> json) => AccountDtoSignup(
    passwordHash: json["passwordHash"],
  );

  Map<String, dynamic> toJson() => {
    "passwordHash": passwordHash,
  };
}

class ContactDtoSignup {
  ContactDtoSignup({
    this.emailAddress,
    this.mobileNumber,
  });

  String emailAddress;
  String mobileNumber;

  factory ContactDtoSignup.fromJson(Map<String, dynamic> json) => ContactDtoSignup(
    emailAddress: json["emailAddress"],
    mobileNumber: json["mobileNumber"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "mobileNumber": mobileNumber,
  };
}
