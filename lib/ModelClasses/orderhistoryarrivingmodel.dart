// To parse this JSON data, do
//
//     final orderHistoryArriving = orderHistoryArrivingFromJson(jsonString);

import 'dart:convert';

OrderHistoryArriving orderHistoryArrivingFromJson(String str) => OrderHistoryArriving.fromJson(json.decode(str));

String orderHistoryArrivingToJson(OrderHistoryArriving data) => json.encode(data.toJson());

class OrderHistoryArriving {
  OrderHistoryArriving({
    this.id,
    this.statusCode,
    this.statusDescription,
    this.data,
  });

  String id;
  int statusCode;
  String statusDescription;
  List<Datum> data;

  factory OrderHistoryArriving.fromJson(Map<String, dynamic> json) => OrderHistoryArriving(
    id: json["\u0024id"],
    statusCode: json["statusCode"],
    statusDescription: json["statusDescription"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "statusCode": statusCode,
    "statusDescription": statusDescription,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.serviceOrderId,
    this.orderNo,
    this.orderType,
    this.orderStatus,
    this.serviceDate,
    this.modifiedServiceDate,
    this.alternativeServiceDate,
    this.customerId,
    this.serviceOrderAddressId,
    this.estimatedMinValue,
    this.estimatedMaxValue,
    this.createdOn,
    this.actualRate,
    this.recordStatus,
    this.statusDescription,
    this.serviceOrderRefferenceNo,
    this.isAttended,
    this.createdBy,
    this.isRealEstate,
    this.realEstateId,
    this.isLocked,
    this.lockedBy,
    this.lockedByUser,
    this.lastCalledTime,
    this.lastCalledBy,
    this.orderStatusEnumValue,
    this.orderTypeEnumValue,
    this.userDto,
    this.lockedUserDto,
    this.realEstateDto,
    this.customerDto,
    this.serviceOrderDto2,
    this.callLogDto,
    this.serviceOrderAddressDto,
    this.serviceOrderDtoList,
    this.attributeQuestionsDto,
    this.customerOrderFeedbackDto,
    this.serviceOrderAssignDto,
    this.serviceOrderItemDto,
    this.serviceOrderLogDto,
  });

  String id;
  int serviceOrderId;
  String orderNo;
  int orderType;
  int orderStatus;
  DateTime serviceDate;
  DateTime modifiedServiceDate;
  DateTime alternativeServiceDate;
  int customerId;
  int serviceOrderAddressId;
  double estimatedMinValue;
  double estimatedMaxValue;
  DateTime createdOn;
  double actualRate;
  int recordStatus;
  dynamic statusDescription;
  int serviceOrderRefferenceNo;
  bool isAttended;
  dynamic createdBy;
  bool isRealEstate;
  dynamic realEstateId;
  bool isLocked;
  int lockedBy;
  LockedByUser lockedByUser;
  DateTime lastCalledTime;
  LastCalledBy lastCalledBy;
  OrderStatusEnumValue orderStatusEnumValue;
  String orderTypeEnumValue;
  UserDto userDto;
  dynamic lockedUserDto;
  dynamic realEstateDto;
  CustomerDto customerDto;
  dynamic serviceOrderDto2;
  dynamic callLogDto;
  ServiceOrderAddressDto serviceOrderAddressDto;
  List<Datum> serviceOrderDtoList;
  dynamic attributeQuestionsDto;
  dynamic customerOrderFeedbackDto;
  List<ServiceOrderAssignDto> serviceOrderAssignDto;
  List<ServiceOrderItemDto> serviceOrderItemDto;
  dynamic serviceOrderLogDto;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["\u0024id"],
    serviceOrderId: json["serviceOrderId"],
    orderNo: json["orderNo"],
    orderType: json["orderType"],
    orderStatus: json["orderStatus"],
    serviceDate: DateTime.parse(json["serviceDate"]),
    modifiedServiceDate: json["modifiedServiceDate"] == null ? null : DateTime.parse(json["modifiedServiceDate"]),
    alternativeServiceDate: DateTime.parse(json["alternativeServiceDate"]),
    customerId: json["customerId"],
    serviceOrderAddressId: json["serviceOrderAddressId"],
    estimatedMinValue: json["estimatedMinValue"],
    estimatedMaxValue: json["estimatedMaxValue"],
    createdOn: DateTime.parse(json["createdOn"]),
    actualRate: json["actualRate"] == null ? null : json["actualRate"],
    recordStatus: json["recordStatus"],
    statusDescription: json["statusDescription"],
    serviceOrderRefferenceNo: json["serviceOrderRefferenceNo"] == null ? null : json["serviceOrderRefferenceNo"],
    isAttended: json["isAttended"],
    createdBy: json["createdBy"],
    isRealEstate: json["isRealEstate"],
    realEstateId: json["realEstateId"],
    isLocked: json["isLocked"],
    lockedBy: json["lockedBy"] == null ? null : json["lockedBy"],
    lockedByUser: json["lockedByUser"] == null ? null : lockedByUserValues.map[json["lockedByUser"]],
    lastCalledTime: DateTime.parse(json["lastCalledTime"]),
    lastCalledBy: json["lastCalledBy"] == null ? null : lastCalledByValues.map[json["lastCalledBy"]],
    orderStatusEnumValue: orderStatusEnumValueValues.map[json["orderStatusEnumValue"]],
    orderTypeEnumValue: json["orderTypeEnumValue"],
    userDto: json["userDto"] == null ? null : UserDto.fromJson(json["userDto"]),
    lockedUserDto: json["lockedUserDto"],
    realEstateDto: json["realEstateDto"],
    customerDto: CustomerDto.fromJson(json["customerDto"]),
    serviceOrderDto2: json["serviceOrderDto2"],
    callLogDto: json["callLogDto"],
    serviceOrderAddressDto: ServiceOrderAddressDto.fromJson(json["serviceOrderAddressDto"]),
    serviceOrderDtoList: json["serviceOrderDtoList"] == null ? null : List<Datum>.from(json["serviceOrderDtoList"].map((x) => Datum.fromJson(x))),
    attributeQuestionsDto: json["attributeQuestionsDto"],
    customerOrderFeedbackDto: json["customerOrderFeedbackDto"],
    serviceOrderAssignDto: List<ServiceOrderAssignDto>.from(json["serviceOrderAssignDto"].map((x) => ServiceOrderAssignDto.fromJson(x))),
    serviceOrderItemDto: List<ServiceOrderItemDto>.from(json["serviceOrderItemDto"].map((x) => ServiceOrderItemDto.fromJson(x))),
    serviceOrderLogDto: json["serviceOrderLogDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "serviceOrderId": serviceOrderId,
    "orderNo": orderNo,
    "orderType": orderType,
    "orderStatus": orderStatus,
    "serviceDate": serviceDate.toIso8601String(),
    "modifiedServiceDate": modifiedServiceDate == null ? null : modifiedServiceDate.toIso8601String(),
    "alternativeServiceDate": alternativeServiceDate.toIso8601String(),
    "customerId": customerId,
    "serviceOrderAddressId": serviceOrderAddressId,
    "estimatedMinValue": estimatedMinValue,
    "estimatedMaxValue": estimatedMaxValue,
    "createdOn": createdOn.toIso8601String(),
    "actualRate": actualRate == null ? null : actualRate,
    "recordStatus": recordStatus,
    "statusDescription": statusDescription,
    "serviceOrderRefferenceNo": serviceOrderRefferenceNo == null ? null : serviceOrderRefferenceNo,
    "isAttended": isAttended,
    "createdBy": createdBy,
    "isRealEstate": isRealEstate,
    "realEstateId": realEstateId,
    "isLocked": isLocked,
    "lockedBy": lockedBy == null ? null : lockedBy,
    "lockedByUser": lockedByUser == null ? null : lockedByUserValues.reverse[lockedByUser],
    "lastCalledTime": lastCalledTime.toIso8601String(),
    "lastCalledBy": lastCalledBy == null ? null : lastCalledByValues.reverse[lastCalledBy],
    "orderStatusEnumValue": orderStatusEnumValueValues.reverse[orderStatusEnumValue],
    "orderTypeEnumValue": orderTypeEnumValue,
    "userDto": userDto == null ? null : userDto.toJson(),
    "lockedUserDto": lockedUserDto,
    "realEstateDto": realEstateDto,
    "customerDto": customerDto.toJson(),
    "serviceOrderDto2": serviceOrderDto2,
    "callLogDto": callLogDto,
    "serviceOrderAddressDto": serviceOrderAddressDto.toJson(),
    "serviceOrderDtoList": serviceOrderDtoList == null ? null : List<dynamic>.from(serviceOrderDtoList.map((x) => x.toJson())),
    "attributeQuestionsDto": attributeQuestionsDto,
    "customerOrderFeedbackDto": customerOrderFeedbackDto,
    "serviceOrderAssignDto": List<dynamic>.from(serviceOrderAssignDto.map((x) => x.toJson())),
    "serviceOrderItemDto": List<dynamic>.from(serviceOrderItemDto.map((x) => x.toJson())),
    "serviceOrderLogDto": serviceOrderLogDto,
  };
}

class CustomerDto {
  CustomerDto({
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
  CustomerDtoFirstName firstName;
  CustomerDtoLastName lastName;
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
  dynamic profilePicture;
  dynamic base64;
  CustomerName customerName;
  dynamic encryptedCustomerId;
  dynamic serviceOrderDto;
  dynamic accountDto;
  ContactDto contactDto;
  dynamic userDto;
  List<CustomerAddressDtoList> customerAddressDtoList;

  factory CustomerDto.fromJson(Map<String, dynamic> json) => CustomerDto(
    id: json["\u0024id"],
    customerId: json["customerId"],
    firstName: customerDtoFirstNameValues.map[json["firstName"]],
    lastName: customerDtoLastNameValues.map[json["lastName"]],
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
    customerName: customerNameValues.map[json["customerName"]],
    encryptedCustomerId: json["encryptedCustomerId"],
    serviceOrderDto: json["serviceOrderDto"],
    accountDto: json["accountDto"],
    contactDto: ContactDto.fromJson(json["contactDto"]),
    userDto: json["userDto"],
    customerAddressDtoList: List<CustomerAddressDtoList>.from(json["customerAddressDtoList"].map((x) => CustomerAddressDtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "customerId": customerId,
    "firstName": customerDtoFirstNameValues.reverse[firstName],
    "lastName": customerDtoLastNameValues.reverse[lastName],
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
    "customerName": customerNameValues.reverse[customerName],
    "encryptedCustomerId": encryptedCustomerId,
    "serviceOrderDto": serviceOrderDto,
    "accountDto": accountDto,
    "contactDto": contactDto.toJson(),
    "userDto": userDto,
    "customerAddressDtoList": List<dynamic>.from(customerAddressDtoList.map((x) => x.toJson())),
  };
}

class ContactDto {
  ContactDto({
    this.id,
    this.contactId,
    this.mobileNumber,
    this.mobileNumber1,
    this.mobileNumber2,
    this.emailAddress,
    this.landLineNumber,
    this.landLineNumber1,
    this.landLineNumber2,
    this.website,
    this.customerDto,
  });

  String id;
  int contactId;
  String mobileNumber;
  dynamic mobileNumber1;
  dynamic mobileNumber2;
  EmailAddress emailAddress;
  dynamic landLineNumber;
  dynamic landLineNumber1;
  dynamic landLineNumber2;
  dynamic website;
  dynamic customerDto;

  factory ContactDto.fromJson(Map<String, dynamic> json) => ContactDto(
    id: json["\u0024id"],
    contactId: json["contactId"],
    mobileNumber: json["mobileNumber"],
    mobileNumber1: json["mobileNumber1"],
    mobileNumber2: json["mobileNumber2"],
    emailAddress: emailAddressValues.map[json["emailAddress"]],
    landLineNumber: json["landLineNumber"],
    landLineNumber1: json["landLineNumber1"],
    landLineNumber2: json["landLineNumber2"],
    website: json["website"],
    customerDto: json["customerDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "contactId": contactId,
    "mobileNumber": mobileNumber,
    "mobileNumber1": mobileNumber1,
    "mobileNumber2": mobileNumber2,
    "emailAddress": emailAddressValues.reverse[emailAddress],
    "landLineNumber": landLineNumber,
    "landLineNumber1": landLineNumber1,
    "landLineNumber2": landLineNumber2,
    "website": website,
    "customerDto": customerDto,
  };
}

enum EmailAddress { HAREEZ_ASPIROMTECHNOLOGIES_COM }

final emailAddressValues = EnumValues({
  "hareez@aspiromtechnologies.com": EmailAddress.HAREEZ_ASPIROMTECHNOLOGIES_COM
});

class CustomerAddressDtoList {
  CustomerAddressDtoList({
    this.id,
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
    this.customer,
  });

  String id;
  int customerAddressId;
  int customerId;
  int addressId;
  int isPrimary;
  bool isRealEstate;
  int realEstateId;
  int recordStatus;
  bool isApprovedByRealEstate;
  bool isResidential;
  RealEstateDto realEstateDto;
  ServiceOrderAddressDto address;
  dynamic customer;

  factory CustomerAddressDtoList.fromJson(Map<String, dynamic> json) => CustomerAddressDtoList(
    id: json["\u0024id"],
    customerAddressId: json["customerAddressId"],
    customerId: json["customerId"],
    addressId: json["addressId"],
    isPrimary: json["isPrimary"],
    isRealEstate: json["isRealEstate"],
    realEstateId: json["realEstateId"],
    recordStatus: json["recordStatus"],
    isApprovedByRealEstate: json["isApprovedByRealEstate"],
    isResidential: json["isResidential"],
    realEstateDto: RealEstateDto.fromJson(json["realEstateDto"]),
    address: ServiceOrderAddressDto.fromJson(json["address"]),
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "customerAddressId": customerAddressId,
    "customerId": customerId,
    "addressId": addressId,
    "isPrimary": isPrimary,
    "isRealEstate": isRealEstate,
    "realEstateId": realEstateId,
    "recordStatus": recordStatus,
    "isApprovedByRealEstate": isApprovedByRealEstate,
    "isResidential": isResidential,
    "realEstateDto": realEstateDto.toJson(),
    "address": address.toJson(),
    "customer": customer,
  };
}

class ServiceOrderAddressDto {
  ServiceOrderAddressDto({
    this.id,
    this.addressId,
    this.cityId,
    this.stateId,
    this.countryId,
    this.houseNo,
    this.location,
    this.geoLocation,
    this.latitude,
    this.longitude,
    this.cityDto,
    this.countryDto,
    this.stateDto,
    this.serviceOrderAddressId,
    this.customerAddressId,
    this.recordStatus,
    this.serviceOrderDto,
  });

  String id;
  int addressId;
  int cityId;
  int stateId;
  int countryId;
  HouseNo houseNo;
  Location location;
  GeoLocation geoLocation;
  String latitude;
  String longitude;
  CityDto cityDto;
  CountryDto countryDto;
  StateDto stateDto;
  int serviceOrderAddressId;
  int customerAddressId;
  int recordStatus;
  dynamic serviceOrderDto;

  factory ServiceOrderAddressDto.fromJson(Map<String, dynamic> json) => ServiceOrderAddressDto(
    id: json["\u0024id"],
    addressId: json["addressId"] == null ? null : json["addressId"],
    cityId: json["cityId"],
    stateId: json["stateId"],
    countryId: json["countryId"],
    houseNo: json["houseNo"] == null ? null : houseNoValues.map[json["houseNo"]],
    location: locationValues.map[json["location"]],
    geoLocation: geoLocationValues.map[json["geoLocation"]],
    latitude: json["latitude"],
    longitude: json["longitude"],
    cityDto: CityDto.fromJson(json["cityDto"]),
    countryDto: CountryDto.fromJson(json["countryDto"]),
    stateDto: StateDto.fromJson(json["stateDto"]),
    serviceOrderAddressId: json["serviceOrderAddressId"] == null ? null : json["serviceOrderAddressId"],
    customerAddressId: json["customerAddressId"] == null ? null : json["customerAddressId"],
    recordStatus: json["recordStatus"] == null ? null : json["recordStatus"],
    serviceOrderDto: json["serviceOrderDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "addressId": addressId == null ? null : addressId,
    "cityId": cityId,
    "stateId": stateId,
    "countryId": countryId,
    "houseNo": houseNo == null ? null : houseNoValues.reverse[houseNo],
    "location": locationValues.reverse[location],
    "geoLocation": geoLocationValues.reverse[geoLocation],
    "latitude": latitude,
    "longitude": longitude,
    "cityDto": cityDto.toJson(),
    "countryDto": countryDto.toJson(),
    "stateDto": stateDto.toJson(),
    "serviceOrderAddressId": serviceOrderAddressId == null ? null : serviceOrderAddressId,
    "customerAddressId": customerAddressId == null ? null : customerAddressId,
    "recordStatus": recordStatus == null ? null : recordStatus,
    "serviceOrderDto": serviceOrderDto,
  };
}

class CityDto {
  CityDto({
    this.id,
    this.cityId,
    this.name,
    this.stateId,
    this.recordStatus,
    this.stateDto,
  });

  String id;
  int cityId;
  CityDtoName name;
  int stateId;
  int recordStatus;
  dynamic stateDto;

  factory CityDto.fromJson(Map<String, dynamic> json) => CityDto(
    id: json["\u0024id"],
    cityId: json["cityId"],
    name: cityDtoNameValues.map[json["name"]],
    stateId: json["stateId"],
    recordStatus: json["recordStatus"],
    stateDto: json["stateDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "cityId": cityId,
    "name": cityDtoNameValues.reverse[name],
    "stateId": stateId,
    "recordStatus": recordStatus,
    "stateDto": stateDto,
  };
}

enum CityDtoName { RAS_LAFAN, BANI_HAJER, AL_BIDDA, AL_WAKRAH, AL_JERYAN }

final cityDtoNameValues = EnumValues({
  "Al Bidda": CityDtoName.AL_BIDDA,
  "Al Jeryan": CityDtoName.AL_JERYAN,
  "Al Wakrah": CityDtoName.AL_WAKRAH,
  "Bani Hajer": CityDtoName.BANI_HAJER,
  "Ras Lafan": CityDtoName.RAS_LAFAN
});

class CountryDto {
  CountryDto({
    this.id,
    this.countryId,
    this.name,
    this.recordStatus,
    this.currencyId,
    this.currencyDto,
  });

  String id;
  int countryId;
  GeoLocation name;
  int recordStatus;
  int currencyId;
  CurrencyDto currencyDto;

  factory CountryDto.fromJson(Map<String, dynamic> json) => CountryDto(
    id: json["\u0024id"],
    countryId: json["countryId"],
    name: geoLocationValues.map[json["name"]],
    recordStatus: json["recordStatus"],
    currencyId: json["currencyId"],
    currencyDto: CurrencyDto.fromJson(json["currencyDto"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "countryId": countryId,
    "name": geoLocationValues.reverse[name],
    "recordStatus": recordStatus,
    "currencyId": currencyId,
    "currencyDto": currencyDto.toJson(),
  };
}

class CurrencyDto {
  CurrencyDto({
    this.id,
    this.currencyId,
    this.code,
    this.name,
    this.recordStatus,
  });

  String id;
  int currencyId;
  Code code;
  CurrencyDtoName name;
  int recordStatus;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => CurrencyDto(
    id: json["\u0024id"],
    currencyId: json["currencyId"],
    code: codeValues.map[json["code"]],
    name: currencyDtoNameValues.map[json["name"]],
    recordStatus: json["recordStatus"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "currencyId": currencyId,
    "code": codeValues.reverse[code],
    "name": currencyDtoNameValues.reverse[name],
    "recordStatus": recordStatus,
  };
}

enum Code { QAR }

final codeValues = EnumValues({
  "QAR": Code.QAR
});

enum CurrencyDtoName { QATARI_RIYAL }

final currencyDtoNameValues = EnumValues({
  "Qatari Riyal": CurrencyDtoName.QATARI_RIYAL
});

enum GeoLocation { QATAR, US, ANTHIKAD, NEW, INFOVENTURES_VILLA_DOHA_QATAR, ASP_TECHNOLOGIES }

final geoLocationValues = EnumValues({
  "anthikad": GeoLocation.ANTHIKAD,
  "ASP technologies": GeoLocation.ASP_TECHNOLOGIES,
  "Infoventures Villa, Doha, Qatar": GeoLocation.INFOVENTURES_VILLA_DOHA_QATAR,
  "New": GeoLocation.NEW,
  "Qatar": GeoLocation.QATAR,
  "US": GeoLocation.US
});

enum HouseNo { THE_1_ST_FLOOR, THE_2_ND_FLOOR }

final houseNoValues = EnumValues({
  "1st Floor": HouseNo.THE_1_ST_FLOOR,
  "2nd Floor": HouseNo.THE_2_ND_FLOOR
});

enum Location { DON_BILAR, MY_HOME, NEW_ADDRESS, INFOVENTURES_VILLA_DOHA_QATAR, ARUN_MOHAN_KUMAR, BUILDING, INFOVENTURES_VILLA_DOHA_QATARS }

final locationValues = EnumValues({
  "Arun mohan Kumar": Location.ARUN_MOHAN_KUMAR,
  "Building": Location.BUILDING,
  "Don Bilar ": Location.DON_BILAR,
  "Infoventures Villa, Doha, Qatar": Location.INFOVENTURES_VILLA_DOHA_QATAR,
  "Infoventures Villa, Doha, Qatars": Location.INFOVENTURES_VILLA_DOHA_QATARS,
  "my home": Location.MY_HOME,
  "new Address": Location.NEW_ADDRESS
});

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
  StateDtoName name;
  int countryId;
  int recordStatus;
  dynamic countryDto;
  dynamic cityDto;
  dynamic nearByStatesDto;

  factory StateDto.fromJson(Map<String, dynamic> json) => StateDto(
    id: json["\u0024id"],
    stateId: json["stateId"],
    name: stateDtoNameValues.map[json["name"]],
    countryId: json["countryId"],
    recordStatus: json["recordStatus"],
    countryDto: json["countryDto"],
    cityDto: json["cityDto"],
    nearByStatesDto: json["nearByStatesDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "stateId": stateId,
    "name": stateDtoNameValues.reverse[name],
    "countryId": countryId,
    "recordStatus": recordStatus,
    "countryDto": countryDto,
    "cityDto": cityDto,
    "nearByStatesDto": nearByStatesDto,
  };
}

enum StateDtoName { AL_KHOR, AL_RAYYAN, DOHA, OMAN }

final stateDtoNameValues = EnumValues({
  "Al Khor": StateDtoName.AL_KHOR,
  "Al Rayyan": StateDtoName.AL_RAYYAN,
  "Doha": StateDtoName.DOHA,
  "Oman": StateDtoName.OMAN
});

class RealEstateDto {
  RealEstateDto({
    this.id,
    this.realEstateId,
    this.name,
    this.isApproved,
    this.recordStatus,
  });

  String id;
  int realEstateId;
  RealEstateDtoName name;
  bool isApproved;
  int recordStatus;

  factory RealEstateDto.fromJson(Map<String, dynamic> json) => RealEstateDto(
    id: json["\u0024id"],
    realEstateId: json["realEstateId"],
    name: realEstateDtoNameValues.map[json["name"]],
    isApproved: json["isApproved"],
    recordStatus: json["recordStatus"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "realEstateId": realEstateId,
    "name": realEstateDtoNameValues.reverse[name],
    "isApproved": isApproved,
    "recordStatus": recordStatus,
  };
}

enum RealEstateDtoName { REAL_ESTATE1, REAL_ESTATE2 }

final realEstateDtoNameValues = EnumValues({
  "Real Estate1": RealEstateDtoName.REAL_ESTATE1,
  "Real Estate2": RealEstateDtoName.REAL_ESTATE2
});

enum CustomerName { HAREEZ_RAHIM }

final customerNameValues = EnumValues({
  "Hareez Rahim": CustomerName.HAREEZ_RAHIM
});

enum CustomerDtoFirstName { HAREEZ }

final customerDtoFirstNameValues = EnumValues({
  "Hareez": CustomerDtoFirstName.HAREEZ
});

enum CustomerDtoLastName { RAHIM }

final customerDtoLastNameValues = EnumValues({
  "Rahim": CustomerDtoLastName.RAHIM
});

enum LastCalledBy { DEVELOPER_DEVELOPER }

final lastCalledByValues = EnumValues({
  "Developer(developer)": LastCalledBy.DEVELOPER_DEVELOPER
});

enum LockedByUser { DEVELOPER_ASPIROM_DEVELOPER, ANANDHU_S_ANANDHUS }

final lockedByUserValues = EnumValues({
  "Anandhu S(anandhus)": LockedByUser.ANANDHU_S_ANANDHUS,
  "Developer Aspirom(developer)": LockedByUser.DEVELOPER_ASPIROM_DEVELOPER
});

enum OrderStatusEnumValue { ARRIVING, PLACED }

final orderStatusEnumValueValues = EnumValues({
  "Arriving": OrderStatusEnumValue.ARRIVING,
  "Placed": OrderStatusEnumValue.PLACED
});

class ServiceOrderAssignDto {
  ServiceOrderAssignDto({
    this.id,
    this.serviceOrderAssignId,
    this.serviceOrderId,
    this.servicePersonId,
    this.branchId,
    this.orderAssignStatus,
    this.assignedOn,
    this.assignedBy,
    this.respondedOn,
    this.description,
    this.branchDescription,
    this.ratingCustomer,
    this.orderAssignStatusText,
    this.recordStatus,
    this.serviceOrderDto,
    this.servicePersonDto,
    this.userDto,
    this.branchDto,
    this.serviceCompanyScheduleDto,
    this.actualRate,
  });

  String id;
  int serviceOrderAssignId;
  int serviceOrderId;
  int servicePersonId;
  int branchId;
  int orderAssignStatus;
  DateTime assignedOn;
  int assignedBy;
  dynamic respondedOn;
  String description;
  dynamic branchDescription;
  int ratingCustomer;
  String orderAssignStatusText;
  int recordStatus;
  dynamic serviceOrderDto;
  dynamic servicePersonDto;
  dynamic userDto;
  BranchDto branchDto;
  dynamic serviceCompanyScheduleDto;
  dynamic actualRate;

  factory ServiceOrderAssignDto.fromJson(Map<String, dynamic> json) => ServiceOrderAssignDto(
    id: json["\u0024id"],
    serviceOrderAssignId: json["serviceOrderAssignId"],
    serviceOrderId: json["serviceOrderId"],
    servicePersonId: json["servicePersonId"],
    branchId: json["branchId"],
    orderAssignStatus: json["orderAssignStatus"],
    assignedOn: DateTime.parse(json["assignedOn"]),
    assignedBy: json["assignedBy"] == null ? null : json["assignedBy"],
    respondedOn: json["respondedOn"],
    description: json["description"] == null ? null : json["description"],
    branchDescription: json["branchDescription"],
    ratingCustomer: json["ratingCustomer"],
    orderAssignStatusText: json["orderAssignStatusText"],
    recordStatus: json["recordStatus"],
    serviceOrderDto: json["serviceOrderDto"],
    servicePersonDto: json["servicePersonDto"],
    userDto: json["userDto"],
    branchDto: BranchDto.fromJson(json["branchDto"]),
    serviceCompanyScheduleDto: json["serviceCompanyScheduleDto"],
    actualRate: json["actualRate"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "serviceOrderAssignId": serviceOrderAssignId,
    "serviceOrderId": serviceOrderId,
    "servicePersonId": servicePersonId,
    "branchId": branchId,
    "orderAssignStatus": orderAssignStatus,
    "assignedOn": assignedOn.toIso8601String(),
    "assignedBy": assignedBy == null ? null : assignedBy,
    "respondedOn": respondedOn,
    "description": description == null ? null : description,
    "branchDescription": branchDescription,
    "ratingCustomer": ratingCustomer,
    "orderAssignStatusText": orderAssignStatusText,
    "recordStatus": recordStatus,
    "serviceOrderDto": serviceOrderDto,
    "servicePersonDto": servicePersonDto,
    "userDto": userDto,
    "branchDto": branchDto.toJson(),
    "serviceCompanyScheduleDto": serviceCompanyScheduleDto,
    "actualRate": actualRate,
  };
}

class BranchDto {
  BranchDto({
    this.id,
    this.branchId,
    this.serviceCompanyId,
    this.name,
    this.addressId,
    this.contactId,
    this.isHeadOffice,
    this.recordStatus,
    this.distance,
    this.branchCount,
    this.addressDto,
    this.contactDto,
    this.serviceCompanyDto,
    this.branchUserDtoList,
    this.customerOrderFeedbackDtoList,
    this.serviceCompanyAttributeDtoList,
    this.callLogDtoList,
  });

  String id;
  int branchId;
  int serviceCompanyId;
  String name;
  int addressId;
  int contactId;
  bool isHeadOffice;
  int recordStatus;
  double distance;
  int branchCount;
  dynamic addressDto;
  dynamic contactDto;
  ServiceCompanyDto serviceCompanyDto;
  dynamic branchUserDtoList;
  dynamic customerOrderFeedbackDtoList;
  dynamic serviceCompanyAttributeDtoList;
  dynamic callLogDtoList;

  factory BranchDto.fromJson(Map<String, dynamic> json) => BranchDto(
    id: json["\u0024id"],
    branchId: json["branchId"],
    serviceCompanyId: json["serviceCompanyId"],
    name: json["name"],
    addressId: json["addressId"],
    contactId: json["contactId"],
    isHeadOffice: json["isHeadOffice"],
    recordStatus: json["recordStatus"],
    distance: json["distance"],
    branchCount: json["branchCount"],
    addressDto: json["addressDto"],
    contactDto: json["contactDto"],
    serviceCompanyDto: ServiceCompanyDto.fromJson(json["serviceCompanyDto"]),
    branchUserDtoList: json["branchUserDtoList"],
    customerOrderFeedbackDtoList: json["customerOrderFeedbackDtoList"],
    serviceCompanyAttributeDtoList: json["serviceCompanyAttributeDtoList"],
    callLogDtoList: json["callLogDtoList"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "branchId": branchId,
    "serviceCompanyId": serviceCompanyId,
    "name": name,
    "addressId": addressId,
    "contactId": contactId,
    "isHeadOffice": isHeadOffice,
    "recordStatus": recordStatus,
    "distance": distance,
    "branchCount": branchCount,
    "addressDto": addressDto,
    "contactDto": contactDto,
    "serviceCompanyDto": serviceCompanyDto.toJson(),
    "branchUserDtoList": branchUserDtoList,
    "customerOrderFeedbackDtoList": customerOrderFeedbackDtoList,
    "serviceCompanyAttributeDtoList": serviceCompanyAttributeDtoList,
    "callLogDtoList": callLogDtoList,
  };
}

class ServiceCompanyDto {
  ServiceCompanyDto({
    this.id,
    this.serviceCompanyId,
    this.planId,
    this.name,
    this.recordStatus,
    this.username,
    this.accountId,
    this.lastPaymentId,
    this.paymentStatus,
    this.createdOn,
    this.initalPaymentDate,
    this.companyCount,
    this.isRealEstate,
    this.realEstateId,
    this.password,
    this.planDto,
    this.lastPaymentDto,
    this.orderCount,
    this.companyRating,
    this.isExpiringSoon,
    this.paymentStatusEnumValue,
    this.branchDtoList,
    this.companyUsersDtoList,
    this.serviceCompanyModuleDtoList,
    this.paymentDto,
    this.serviceCompanyRealEstateDtos,
  });

  String id;
  int serviceCompanyId;
  int planId;
  String name;
  int recordStatus;
  dynamic username;
  int accountId;
  int lastPaymentId;
  int paymentStatus;
  DateTime createdOn;
  DateTime initalPaymentDate;
  int companyCount;
  bool isRealEstate;
  dynamic realEstateId;
  dynamic password;
  dynamic planDto;
  dynamic lastPaymentDto;
  int orderCount;
  int companyRating;
  bool isExpiringSoon;
  PaymentStatusEnumValue paymentStatusEnumValue;
  dynamic branchDtoList;
  dynamic companyUsersDtoList;
  dynamic serviceCompanyModuleDtoList;
  dynamic paymentDto;
  dynamic serviceCompanyRealEstateDtos;

  factory ServiceCompanyDto.fromJson(Map<String, dynamic> json) => ServiceCompanyDto(
    id: json["\u0024id"],
    serviceCompanyId: json["serviceCompanyId"],
    planId: json["planId"],
    name: json["name"],
    recordStatus: json["recordStatus"],
    username: json["username"],
    accountId: json["accountId"],
    lastPaymentId: json["lastPaymentId"] == null ? null : json["lastPaymentId"],
    paymentStatus: json["paymentStatus"],
    createdOn: DateTime.parse(json["createdOn"]),
    initalPaymentDate: DateTime.parse(json["initalPaymentDate"]),
    companyCount: json["companyCount"],
    isRealEstate: json["isRealEstate"],
    realEstateId: json["realEstateId"],
    password: json["password"],
    planDto: json["planDto"],
    lastPaymentDto: json["lastPaymentDto"],
    orderCount: json["orderCount"],
    companyRating: json["companyRating"],
    isExpiringSoon: json["isExpiringSoon"],
    paymentStatusEnumValue: paymentStatusEnumValueValues.map[json["paymentStatusEnumValue"]],
    branchDtoList: json["branchDtoList"],
    companyUsersDtoList: json["companyUsersDtoList"],
    serviceCompanyModuleDtoList: json["serviceCompanyModuleDtoList"],
    paymentDto: json["paymentDto"],
    serviceCompanyRealEstateDtos: json["serviceCompanyRealEstateDtos"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "serviceCompanyId": serviceCompanyId,
    "planId": planId,
    "name": name,
    "recordStatus": recordStatus,
    "username": username,
    "accountId": accountId,
    "lastPaymentId": lastPaymentId == null ? null : lastPaymentId,
    "paymentStatus": paymentStatus,
    "createdOn": createdOn.toIso8601String(),
    "initalPaymentDate": initalPaymentDate.toIso8601String(),
    "companyCount": companyCount,
    "isRealEstate": isRealEstate,
    "realEstateId": realEstateId,
    "password": password,
    "planDto": planDto,
    "lastPaymentDto": lastPaymentDto,
    "orderCount": orderCount,
    "companyRating": companyRating,
    "isExpiringSoon": isExpiringSoon,
    "paymentStatusEnumValue": paymentStatusEnumValueValues.reverse[paymentStatusEnumValue],
    "branchDtoList": branchDtoList,
    "companyUsersDtoList": companyUsersDtoList,
    "serviceCompanyModuleDtoList": serviceCompanyModuleDtoList,
    "paymentDto": paymentDto,
    "serviceCompanyRealEstateDtos": serviceCompanyRealEstateDtos,
  };
}

enum PaymentStatusEnumValue { ACTIVE, SUSPENDED }

final paymentStatusEnumValueValues = EnumValues({
  "Active": PaymentStatusEnumValue.ACTIVE,
  "Suspended": PaymentStatusEnumValue.SUSPENDED
});

class ServiceOrderItemDto {
  ServiceOrderItemDto({
    this.id,
    this.serviceOrderItemId,
    this.serviceOrderId,
    this.attributeId,
    this.description,
    this.isUrgent,
    this.value,
    this.quanity,
    this.totalMinValue,
    this.totalMaxValue,
    this.recordStatus,
    this.imagePath,
    this.attributeDto,
    this.serviceOrderDto,
    this.serviceOrderItemAnswersDtoList,
  });

  String id;
  int serviceOrderItemId;
  int serviceOrderId;
  int attributeId;
  String description;
  bool isUrgent;
  dynamic value;
  int quanity;
  dynamic totalMinValue;
  dynamic totalMaxValue;
  int recordStatus;
  dynamic imagePath;
  AttributeDto attributeDto;
  dynamic serviceOrderDto;
  List<ServiceOrderItemAnswersDtoList> serviceOrderItemAnswersDtoList;

  factory ServiceOrderItemDto.fromJson(Map<String, dynamic> json) => ServiceOrderItemDto(
    id: json["\u0024id"],
    serviceOrderItemId: json["serviceOrderItemId"],
    serviceOrderId: json["serviceOrderId"],
    attributeId: json["attributeId"],
    description: json["description"],
    isUrgent: json["isUrgent"],
    value: json["value"],
    quanity: json["quanity"],
    totalMinValue: json["totalMinValue"],
    totalMaxValue: json["totalMaxValue"],
    recordStatus: json["recordStatus"],
    imagePath: json["imagePath"],
    attributeDto: AttributeDto.fromJson(json["attributeDto"]),
    serviceOrderDto: json["serviceOrderDto"],
    serviceOrderItemAnswersDtoList: List<ServiceOrderItemAnswersDtoList>.from(json["serviceOrderItemAnswersDtoList"].map((x) => ServiceOrderItemAnswersDtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "serviceOrderItemId": serviceOrderItemId,
    "serviceOrderId": serviceOrderId,
    "attributeId": attributeId,
    "description": description,
    "isUrgent": isUrgent,
    "value": value,
    "quanity": quanity,
    "totalMinValue": totalMinValue,
    "totalMaxValue": totalMaxValue,
    "recordStatus": recordStatus,
    "imagePath": imagePath,
    "attributeDto": attributeDto.toJson(),
    "serviceOrderDto": serviceOrderDto,
    "serviceOrderItemAnswersDtoList": List<dynamic>.from(serviceOrderItemAnswersDtoList.map((x) => x.toJson())),
  };
}

class AttributeDto {
  AttributeDto({
    this.id,
    this.attributeId,
    this.moduleId,
    this.name,
    this.styleClass,
    this.description,
    this.minCostValue,
    this.maxCostValue,
    this.inputType,
    this.imagePath,
    this.base64Image,
    this.displayPosition,
    this.defaultValue,
    this.createdOn,
    this.recordStatus,
    this.usageOrderCount,
    this.moduleDto,
    this.attributeQuestionDtoList,
    this.serviceCompanyAttributeDto,
    this.serviceOrderItemAnswerDtoList,
    this.serviceCompanyId,
    this.serviceCompanyModuleId,
    this.serviceCompanyBranchId,
    this.isChecked,
    this.isNewArrivalin5Days,
  });

  String id;
  int attributeId;
  int moduleId;
  String name;
  dynamic styleClass;
  String description;
  dynamic minCostValue;
  dynamic maxCostValue;
  int inputType;
  String imagePath;
  dynamic base64Image;
  int displayPosition;
  dynamic defaultValue;
  DateTime createdOn;
  int recordStatus;
  int usageOrderCount;
  ModuleDto moduleDto;
  List<AttributeQuestionDto> attributeQuestionDtoList;
  dynamic serviceCompanyAttributeDto;
  dynamic serviceOrderItemAnswerDtoList;
  int serviceCompanyId;
  int serviceCompanyModuleId;
  int serviceCompanyBranchId;
  bool isChecked;
  bool isNewArrivalin5Days;

  factory AttributeDto.fromJson(Map<String, dynamic> json) => AttributeDto(
    id: json["\u0024id"],
    attributeId: json["attributeId"],
    moduleId: json["moduleId"],
    name: json["name"],
    styleClass: json["styleClass"],
    description: json["description"],
    minCostValue: json["minCostValue"],
    maxCostValue: json["maxCostValue"],
    inputType: json["inputType"],
    imagePath: json["imagePath"],
    base64Image: json["base64Image"],
    displayPosition: json["displayPosition"],
    defaultValue: json["defaultValue"],
    createdOn: DateTime.parse(json["createdOn"]),
    recordStatus: json["recordStatus"],
    usageOrderCount: json["usageOrderCount"],
    moduleDto: ModuleDto.fromJson(json["moduleDto"]),
    attributeQuestionDtoList: List<AttributeQuestionDto>.from(json["attributeQuestionDtoList"].map((x) => AttributeQuestionDto.fromJson(x))),
    serviceCompanyAttributeDto: json["serviceCompanyAttributeDto"],
    serviceOrderItemAnswerDtoList: json["serviceOrderItemAnswerDtoList"],
    serviceCompanyId: json["serviceCompanyId"],
    serviceCompanyModuleId: json["serviceCompanyModuleId"],
    serviceCompanyBranchId: json["serviceCompanyBranchId"],
    isChecked: json["isChecked"],
    isNewArrivalin5Days: json["isNewArrivalin5Days"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "attributeId": attributeId,
    "moduleId": moduleId,
    "name": name,
    "styleClass": styleClass,
    "description": description,
    "minCostValue": minCostValue,
    "maxCostValue": maxCostValue,
    "inputType": inputType,
    "imagePath": imagePath,
    "base64Image": base64Image,
    "displayPosition": displayPosition,
    "defaultValue": defaultValue,
    "createdOn": createdOn.toIso8601String(),
    "recordStatus": recordStatus,
    "usageOrderCount": usageOrderCount,
    "moduleDto": moduleDto.toJson(),
    "attributeQuestionDtoList": List<dynamic>.from(attributeQuestionDtoList.map((x) => x.toJson())),
    "serviceCompanyAttributeDto": serviceCompanyAttributeDto,
    "serviceOrderItemAnswerDtoList": serviceOrderItemAnswerDtoList,
    "serviceCompanyId": serviceCompanyId,
    "serviceCompanyModuleId": serviceCompanyModuleId,
    "serviceCompanyBranchId": serviceCompanyBranchId,
    "isChecked": isChecked,
    "isNewArrivalin5Days": isNewArrivalin5Days,
  };
}

class AttributeQuestionDto {
  AttributeQuestionDto({
    this.id,
    this.attributeQuestionId,
    this.attributeId,
    this.description,
    this.inputType,
    this.recordStatus,
    this.attributeDto,
    this.attributeOptionDtoList,
    this.serviceOrderItemAnswerDto,
  });

  String id;
  int attributeQuestionId;
  int attributeId;
  String description;
  int inputType;
  int recordStatus;
  dynamic attributeDto;
  List<AttributeOptionDtoList> attributeOptionDtoList;
  dynamic serviceOrderItemAnswerDto;

  factory AttributeQuestionDto.fromJson(Map<String, dynamic> json) => AttributeQuestionDto(
    id: json["\u0024id"],
    attributeQuestionId: json["attributeQuestionId"],
    attributeId: json["attributeId"],
    description: json["description"],
    inputType: json["inputType"],
    recordStatus: json["recordStatus"],
    attributeDto: json["attributeDto"],
    attributeOptionDtoList: List<AttributeOptionDtoList>.from(json["attributeOptionDtoList"].map((x) => AttributeOptionDtoList.fromJson(x))),
    serviceOrderItemAnswerDto: json["serviceOrderItemAnswerDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "attributeQuestionId": attributeQuestionId,
    "attributeId": attributeId,
    "description": description,
    "inputType": inputType,
    "recordStatus": recordStatus,
    "attributeDto": attributeDto,
    "attributeOptionDtoList": List<dynamic>.from(attributeOptionDtoList.map((x) => x.toJson())),
    "serviceOrderItemAnswerDto": serviceOrderItemAnswerDto,
  };
}

class AttributeOptionDtoList {
  AttributeOptionDtoList({
    this.id,
    this.attributeOptionId,
    this.attributeQuestionId,
    this.name,
    this.description,
    this.recordStatus,
    this.isDefault,
    this.attributeDto,
  });

  String id;
  int attributeOptionId;
  int attributeQuestionId;
  String name;
  String description;
  int recordStatus;
  bool isDefault;
  dynamic attributeDto;

  factory AttributeOptionDtoList.fromJson(Map<String, dynamic> json) => AttributeOptionDtoList(
    id: json["\u0024id"],
    attributeOptionId: json["attributeOptionId"],
    attributeQuestionId: json["attributeQuestionId"],
    name: json["name"],
    description: json["description"],
    recordStatus: json["recordStatus"],
    isDefault: json["isDefault"],
    attributeDto: json["attributeDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "attributeOptionId": attributeOptionId,
    "attributeQuestionId": attributeQuestionId,
    "name": name,
    "description": description,
    "recordStatus": recordStatus,
    "isDefault": isDefault,
    "attributeDto": attributeDto,
  };
}

class ModuleDto {
  ModuleDto({
    this.id,
    this.moduleId,
    this.name,
    this.imagePath,
    this.base64Image,
    this.descriptionTitle,
    this.description,
    this.displayPosition,
    this.haveReadMore,
    this.createdOn,
    this.recordStatus,
    this.currentCount,
    this.percentage,
    this.usageOrderCount,
    this.attributeDtoList,
    this.moduleDescriptionDtoList,
    this.isChecked,
    this.isUrgentCapable,
  });

  String id;
  int moduleId;
  ModuleDtoName name;
  ImagePath imagePath;
  dynamic base64Image;
  DescriptionTitle descriptionTitle;
  String description;
  int displayPosition;
  bool haveReadMore;
  DateTime createdOn;
  int recordStatus;
  int currentCount;
  double percentage;
  int usageOrderCount;
  dynamic attributeDtoList;
  dynamic moduleDescriptionDtoList;
  bool isChecked;
  bool isUrgentCapable;

  factory ModuleDto.fromJson(Map<String, dynamic> json) => ModuleDto(
    id: json["\u0024id"],
    moduleId: json["moduleId"],
    name: moduleDtoNameValues.map[json["name"]],
    imagePath: imagePathValues.map[json["imagePath"]],
    base64Image: json["base64Image"],
    descriptionTitle: descriptionTitleValues.map[json["descriptionTitle"]],
    description: json["description"],
    displayPosition: json["displayPosition"],
    haveReadMore: json["haveReadMore"],
    createdOn: DateTime.parse(json["createdOn"]),
    recordStatus: json["recordStatus"],
    currentCount: json["currentCount"],
    percentage: json["percentage"],
    usageOrderCount: json["usageOrderCount"],
    attributeDtoList: json["attributeDtoList"],
    moduleDescriptionDtoList: json["moduleDescriptionDtoList"],
    isChecked: json["isChecked"],
    isUrgentCapable: json["isUrgentCapable"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "moduleId": moduleId,
    "name": moduleDtoNameValues.reverse[name],
    "imagePath": imagePathValues.reverse[imagePath],
    "base64Image": base64Image,
    "descriptionTitle": descriptionTitleValues.reverse[descriptionTitle],
    "description": description,
    "displayPosition": displayPosition,
    "haveReadMore": haveReadMore,
    "createdOn": createdOn.toIso8601String(),
    "recordStatus": recordStatus,
    "currentCount": currentCount,
    "percentage": percentage,
    "usageOrderCount": usageOrderCount,
    "attributeDtoList": attributeDtoList,
    "moduleDescriptionDtoList": moduleDescriptionDtoList,
    "isChecked": isChecked,
    "isUrgentCapable": isUrgentCapable,
  };
}

enum DescriptionTitle { AUTOMOBILE_SERVICE, EMPTY }

final descriptionTitleValues = EnumValues({
  "Automobile Service": DescriptionTitle.AUTOMOBILE_SERVICE,
  "": DescriptionTitle.EMPTY
});

enum ImagePath { IMAGE_113902702125_PNG, IMAGE_082431157690_PNG }

final imagePathValues = EnumValues({
  "Image@08.24.31.157690.png": ImagePath.IMAGE_082431157690_PNG,
  "Image@11.39.02.702125.png": ImagePath.IMAGE_113902702125_PNG
});

enum ModuleDtoName { AUTOMOBILE, AIR_CONDITIONER }

final moduleDtoNameValues = EnumValues({
  "Air Conditioner": ModuleDtoName.AIR_CONDITIONER,
  "Automobile": ModuleDtoName.AUTOMOBILE
});

class ServiceOrderItemAnswersDtoList {
  ServiceOrderItemAnswersDtoList({
    this.id,
    this.serviceOrderItemAnswersId,
    this.serviceOrderItemId,
    this.attributeQuestionsId,
    this.answer,
    this.attributeOptionValue,
    this.recordStatus,
    this.attributeQuestionDto,
    this.serviceOrderItemDto,
  });

  String id;
  int serviceOrderItemAnswersId;
  int serviceOrderItemId;
  int attributeQuestionsId;
  Answer answer;
  String attributeOptionValue;
  int recordStatus;
  AttributeQuestionDto attributeQuestionDto;
  dynamic serviceOrderItemDto;

  factory ServiceOrderItemAnswersDtoList.fromJson(Map<String, dynamic> json) => ServiceOrderItemAnswersDtoList(
    id: json["\u0024id"],
    serviceOrderItemAnswersId: json["serviceOrderItemAnswersId"],
    serviceOrderItemId: json["serviceOrderItemId"],
    attributeQuestionsId: json["attributeQuestionsId"],
    answer: answerValues.map[json["answer"]],
    attributeOptionValue: json["attributeOptionValue"],
    recordStatus: json["recordStatus"],
    attributeQuestionDto: AttributeQuestionDto.fromJson(json["attributeQuestionDto"]),
    serviceOrderItemDto: json["serviceOrderItemDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "serviceOrderItemAnswersId": serviceOrderItemAnswersId,
    "serviceOrderItemId": serviceOrderItemId,
    "attributeQuestionsId": attributeQuestionsId,
    "answer": answerValues.reverse[answer],
    "attributeOptionValue": attributeOptionValue,
    "recordStatus": recordStatus,
    "attributeQuestionDto": attributeQuestionDto.toJson(),
    "serviceOrderItemDto": serviceOrderItemDto,
  };
}

enum Answer { SEDAN, EMPTY, SUV, ANSWER }

final answerValues = EnumValues({
  "": Answer.ANSWER,
  "----": Answer.EMPTY,
  "Sedan": Answer.SEDAN,
  "SUV": Answer.SUV
});

class UserDto {
  UserDto({
    this.id,
    this.userId,
    this.accountId,
    this.username,
    this.role,
    this.contactId,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.userStatus,
    this.recordStatus,
    this.createdOn,
    this.password,
    this.name,
    this.roleTypeName,
    this.serviceOrderAssignDto,
    this.contactDto,
    this.accountDto,
  });

  String id;
  int userId;
  int accountId;
  dynamic username;
  int role;
  int contactId;
  UserDtoFirstName firstName;
  UserDtoLastName lastName;
  dynamic dateOfBirth;
  int userStatus;
  int recordStatus;
  DateTime createdOn;
  dynamic password;
  UserDtoName name;
  RoleTypeName roleTypeName;
  dynamic serviceOrderAssignDto;
  dynamic contactDto;
  dynamic accountDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    id: json["\u0024id"],
    userId: json["userId"],
    accountId: json["accountId"],
    username: json["username"],
    role: json["role"],
    contactId: json["contactId"],
    firstName: userDtoFirstNameValues.map[json["firstName"]],
    lastName: userDtoLastNameValues.map[json["lastName"]],
    dateOfBirth: json["dateOfBirth"],
    userStatus: json["userStatus"],
    recordStatus: json["recordStatus"],
    createdOn: DateTime.parse(json["createdOn"]),
    password: json["password"],
    name: userDtoNameValues.map[json["name"]],
    roleTypeName: roleTypeNameValues.map[json["roleTypeName"]],
    serviceOrderAssignDto: json["serviceOrderAssignDto"],
    contactDto: json["contactDto"],
    accountDto: json["accountDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "userId": userId,
    "accountId": accountId,
    "username": username,
    "role": role,
    "contactId": contactId,
    "firstName": userDtoFirstNameValues.reverse[firstName],
    "lastName": userDtoLastNameValues.reverse[lastName],
    "dateOfBirth": dateOfBirth,
    "userStatus": userStatus,
    "recordStatus": recordStatus,
    "createdOn": createdOn.toIso8601String(),
    "password": password,
    "name": userDtoNameValues.reverse[name],
    "roleTypeName": roleTypeNameValues.reverse[roleTypeName],
    "serviceOrderAssignDto": serviceOrderAssignDto,
    "contactDto": contactDto,
    "accountDto": accountDto,
  };
}

enum UserDtoFirstName { DEVELOPER }

final userDtoFirstNameValues = EnumValues({
  "Developer": UserDtoFirstName.DEVELOPER
});

enum UserDtoLastName { ASPIROM }

final userDtoLastNameValues = EnumValues({
  "Aspirom": UserDtoLastName.ASPIROM
});

enum UserDtoName { DEVELOPER_ASPIROM }

final userDtoNameValues = EnumValues({
  "Developer Aspirom": UserDtoName.DEVELOPER_ASPIROM
});

enum RoleTypeName { ADMIN }

final roleTypeNameValues = EnumValues({
  "Admin": RoleTypeName.ADMIN
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
