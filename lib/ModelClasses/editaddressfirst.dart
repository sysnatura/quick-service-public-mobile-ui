// To parse this JSON data, do
//
//     final editAddressOne = editAddressOneFromJson(jsonString);

import 'dart:convert';

EditAddressOne editAddressOneFromJson(String str) => EditAddressOne.fromJson(json.decode(str));

String editAddressOneToJson(EditAddressOne data) => json.encode(data.toJson());

class EditAddressOne {
  EditAddressOne({
    this.customerAddressId,
    this.customerId,
    this.addressId,
    this.isPrimary,
    this.isRealEstate,
    this.realEstateId,
    this.recordStatus,
    this.isApprovedByRealEstate,
    this.isResidential,
    this.realEstateDto,
    this.address,
  });

  int customerAddressId;
  int customerId;
  int addressId;
  int isPrimary;
  bool isRealEstate;
  int realEstateId;
  int recordStatus;
  bool isApprovedByRealEstate;
  int isResidential;
  dynamic realEstateDto;
  Addressone address;

  factory EditAddressOne.fromJson(Map<String, dynamic> json) => EditAddressOne(
    customerAddressId: json["customerAddressId"],
    customerId: json["customerId"],
    addressId: json["addressId"],
    isPrimary: json["isPrimary"],
    isRealEstate: json["isRealEstate"],
    realEstateId: json["realEstateId"],
    recordStatus: json["recordStatus"],
    isApprovedByRealEstate: json["isApprovedByRealEstate"],
    isResidential: json["isResidential"],
    realEstateDto: json["realEstateDto"],
    address: Addressone.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "customerAddressId": customerAddressId,
    "customerId": customerId,
    "addressId": addressId,
    "isPrimary": isPrimary,
    "isRealEstate": isRealEstate,
    "realEstateId": realEstateId,
    "recordStatus": recordStatus,
    "isApprovedByRealEstate": isApprovedByRealEstate,
    "isResidential": isResidential,
    "realEstateDto": realEstateDto,
    "address": address.toJson(),
  };
}

class Addressone {
  Addressone({
    this.addressId,
    this.cityId,
    this.stateId,
    this.countryId,
    this.houseNo,
    this.location,
    this.geoLocation,
    this.latitude,
    this.longitude,
  });

  int addressId;
  String cityId;
  String stateId;
  String countryId;
  String houseNo;
  String location;
  String geoLocation;
  double latitude;
  double longitude;

  factory Addressone.fromJson(Map<String, dynamic> json) => Addressone(
    addressId: json["addressId"],
    cityId: json["cityId"],
    stateId: json["stateId"],
    countryId: json["countryId"],
    houseNo: json["houseNo"],
    location: json["location"],
    geoLocation: json["geoLocation"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "addressId": addressId,
    "cityId": cityId,
    "stateId": stateId,
    "countryId": countryId,
    "houseNo": houseNo,
    "location": location,
    "geoLocation": geoLocation,
    "latitude": latitude,
    "longitude": longitude,
  };
}
