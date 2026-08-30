// To parse this JSON data, do
//
//     final addressFirst = addressFirstFromJson(jsonString);

import 'dart:convert';

AddressFirst addressFirstFromJson(String str) => AddressFirst.fromJson(json.decode(str));

String addressFirstToJson(AddressFirst data) => json.encode(data.toJson());

class AddressFirst {
  AddressFirst({
    this.isResidential,
    this.isRealEstate,
    this.realEstateId,
    this.address,
    this.customerId,
  });

  int isResidential;
  bool isRealEstate;
  int realEstateId;
  Address address;
  int customerId;

  factory AddressFirst.fromJson(Map<String, dynamic> json) => AddressFirst(
    isResidential: json["isResidential"],
    isRealEstate: json["isRealEstate"],
      realEstateId: json["realEstateId"],
    address: Address.fromJson(json["Address"]),
    customerId: json["customerId"],
  );

  Map<String, dynamic> toJson() => {
    "isResidential": isResidential,
    "isRealEstate": isRealEstate,
    "realEstateId" : realEstateId,
    "Address": address.toJson(),
    "customerId": customerId,
  };
}

class Address {
  Address({
    this.countryId,
    this.location,
    this.geoLocation,
    this.latitude,
    this.longitude,
    this.stateId,
    this.houseNo,
    this.cityId,
  });

  String countryId;
  String location;
  String geoLocation;
  String latitude;
  String longitude;
  String stateId;
  String houseNo;
  String cityId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    countryId: json["countryId"],
    location: json["location"],
    geoLocation: json["geoLocation"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    stateId: json["stateId"],
    houseNo: json["houseNo"],
    cityId: json["cityId"],
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "location": location,
    "geoLocation": geoLocation,
    "latitude": latitude,
    "longitude": longitude,
    "stateId": stateId,
    "houseNo": houseNo,
    "cityId": cityId,
  };
}
