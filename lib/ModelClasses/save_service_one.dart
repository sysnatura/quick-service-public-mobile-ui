// To parse this JSON data, do
//
//     final saveServiceOne = saveServiceOneFromJson(jsonString);

import 'dart:convert';

SaveServiceOne saveServiceOneFromJson(String str) => SaveServiceOne.fromJson(json.decode(str));

String saveServiceOneToJson(SaveServiceOne data) => json.encode(data.toJson());

class SaveServiceOne {
  SaveServiceOne({
    this.customerId,
    this.serviceDate,
    this.alternativeServiceDate,
    this.serviceOrderAddressDto,
    this.serviceOrderItemDto,
  });

  String customerId;
  DateTime serviceDate;
  DateTime alternativeServiceDate;
  ServiceOrderAddressDto serviceOrderAddressDto;
  List<ServiceOrderItemDto> serviceOrderItemDto;

  factory SaveServiceOne.fromJson(Map<String, dynamic> json) => SaveServiceOne(
    customerId: json["customerId"],
    serviceDate: DateTime.parse(json["serviceDate"]),
    alternativeServiceDate: DateTime.parse(json["alternativeServiceDate"]),
    serviceOrderAddressDto: ServiceOrderAddressDto.fromJson(json["serviceOrderAddressDto"]),
    serviceOrderItemDto: List<ServiceOrderItemDto>.from(json["serviceOrderItemDto"].map((x) => ServiceOrderItemDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "serviceDate": serviceDate.toIso8601String(),
    "alternativeServiceDate": alternativeServiceDate.toIso8601String(),
    "serviceOrderAddressDto": serviceOrderAddressDto.toJson(),
    "serviceOrderItemDto": List<dynamic>.from(serviceOrderItemDto.map((x) => x.toJson())),
  };
}

class ServiceOrderAddressDto {
  ServiceOrderAddressDto({
    this.houseNo,
    this.location,
    this.cityId,
    this.stateId,
    this.countryId,
    this.latitude,
    this.longitude,
    this.geoLocation,
    this.customerAddressId,
  });

  String houseNo;
  String location;
  int cityId;
  int stateId;
  int countryId;
  String latitude;
  String longitude;
  String geoLocation;
  int customerAddressId;

  factory ServiceOrderAddressDto.fromJson(Map<String, dynamic> json) => ServiceOrderAddressDto(
    houseNo: json["houseNo"],
    location: json["location"],
    cityId: json["cityId"],
    stateId: json["stateId"],
    countryId: json["countryId"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    geoLocation: json["geoLocation"],
    customerAddressId: json["customerAddressId"],
  );

  Map<String, dynamic> toJson() => {
    "houseNo": houseNo,
    "location": location,
    "cityId": cityId,
    "stateId": stateId,
    "countryId": countryId,
    "latitude": latitude,
    "longitude": longitude,
    "geoLocation": geoLocation,
    "customerAddressId": customerAddressId,
  };
}

class ServiceOrderItemDto {
  ServiceOrderItemDto({
    this.isUrgent,
    this.description,
    this.attributeId,
    this.attributeDto,
  });

  int isUrgent;
  String description;
  int attributeId;
  AttributeDto attributeDto;

  factory ServiceOrderItemDto.fromJson(Map<String, dynamic> json) => ServiceOrderItemDto(
    isUrgent: json["isUrgent"],
    description: json["description"],
    attributeId: json["attributeId"],
    attributeDto: AttributeDto.fromJson(json["attributeDto"]),
  );

  Map<String, dynamic> toJson() => {
    "isUrgent": isUrgent,
    "description": description,
    "attributeId": attributeId,
    "attributeDto": attributeDto.toJson(),
  };
}

class AttributeDto {
  AttributeDto({
    this.attributeQuestionDtoList,
  });

  List<AttributeQuestionDtoList> attributeQuestionDtoList;

  factory AttributeDto.fromJson(Map<String, dynamic> json) => AttributeDto(
    attributeQuestionDtoList: List<AttributeQuestionDtoList>.from(json["attributeQuestionDtoList"].map((x) => AttributeQuestionDtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attributeQuestionDtoList": List<dynamic>.from(attributeQuestionDtoList.map((x) => x.toJson())),
  };
}

class AttributeQuestionDtoList {
  AttributeQuestionDtoList({
    this.serviceOrderItemAnswerDto,
  });

  ServiceOrderItemAnswerDto serviceOrderItemAnswerDto;

  factory AttributeQuestionDtoList.fromJson(Map<String, dynamic> json) => AttributeQuestionDtoList(
    serviceOrderItemAnswerDto: ServiceOrderItemAnswerDto.fromJson(json["serviceOrderItemAnswerDto"]),
  );

  Map<String, dynamic> toJson() => {
    "serviceOrderItemAnswerDto": serviceOrderItemAnswerDto.toJson(),
  };
}

class ServiceOrderItemAnswerDto {
  ServiceOrderItemAnswerDto({
    this.answer,
    this.attributeoptionvalue,
    this.attributeQuestionsId,
    this.attributeOptionValue,
  });

  String answer;
  String attributeoptionvalue;
  int attributeQuestionsId;
  String attributeOptionValue;

  factory ServiceOrderItemAnswerDto.fromJson(Map<String, dynamic> json) => ServiceOrderItemAnswerDto(
    answer: json["answer"],
    attributeoptionvalue: json["attributeoptionvalue"] == null ? null : json["attributeoptionvalue"],
    attributeQuestionsId: json["attributeQuestionsId"],
    attributeOptionValue: json["attributeOptionValue"] == null ? null : json["attributeOptionValue"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "attributeoptionvalue": attributeoptionvalue == null ? null : attributeoptionvalue,
    "attributeQuestionsId": attributeQuestionsId,
    "attributeOptionValue": attributeOptionValue == null ? null : attributeOptionValue,
  };
}
