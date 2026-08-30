// To parse this JSON data, do
//
//     final getAllCityModel = getAllCityModelFromJson(jsonString);

import 'dart:convert';

List<GetAllCityModel> getAllCityModelFromJson(String str) => List<GetAllCityModel>.from(json.decode(str).map((x) => GetAllCityModel.fromJson(x)));

String getAllCityModelToJson(List<GetAllCityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllCityModel {
  GetAllCityModel({
    this.id,
    this.cityId,
    this.name,
    this.stateId,
    this.recordStatus,
    this.stateDto,
  });

  String id;
  int cityId;
  String name;
  int stateId;
  int recordStatus;
  StateDto stateDto;

  factory GetAllCityModel.fromJson(Map<String, dynamic> json) => GetAllCityModel(
    id: json["\u0024id"],
    cityId: json["cityId"],
    name: json["name"],
    stateId: json["stateId"],
    recordStatus: json["recordStatus"],
    stateDto: StateDto.fromJson(json["stateDto"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "cityId": cityId,
    "name": name,
    "stateId": stateId,
    "recordStatus": recordStatus,
    "stateDto": stateDto.toJson(),
  };
}

class StateDto {
  StateDto({
    this.id,
    this.stateId,
    this.name,
    this.countryId,
    this.recordStatus,
    this.countryDto,
    this.cityDto,
    this.nearByStatesDto,
  });

  String id;
  int stateId;
  Name name;
  int countryId;
  int recordStatus;
  dynamic countryDto;
  dynamic cityDto;
  dynamic nearByStatesDto;

  factory StateDto.fromJson(Map<String, dynamic> json) => StateDto(
    id: json["\u0024id"],
    stateId: json["stateId"],
    name: nameValues.map[json["name"]],
    countryId: json["countryId"],
    recordStatus: json["recordStatus"],
    countryDto: json["countryDto"],
    cityDto: json["cityDto"],
    nearByStatesDto: json["nearByStatesDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "stateId": stateId,
    "name": nameValues.reverse[name],
    "countryId": countryId,
    "recordStatus": recordStatus,
    "countryDto": countryDto,
    "cityDto": cityDto,
    "nearByStatesDto": nearByStatesDto,
  };
}

enum Name { DOHA }

final nameValues = EnumValues({
  "Doha": Name.DOHA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
