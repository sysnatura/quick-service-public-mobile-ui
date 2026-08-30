// To parse this JSON data, do
//
//     final orderHistoryPlaced = orderHistoryPlacedFromJson(jsonString);

import 'dart:convert';

OrderHistoryPlaced orderHistoryPlacedFromJson(String str) => OrderHistoryPlaced.fromJson(json.decode(str));

String orderHistoryPlacedToJson(OrderHistoryPlaced data) => json.encode(data.toJson());

class OrderHistoryPlaced {
  OrderHistoryPlaced({
    this.id,
    this.statusCode,
    this.statusDescription,
    this.data,
  });

  String id;
  int statusCode;
  String statusDescription;
  List<Datum> data;

  factory OrderHistoryPlaced.fromJson(Map<String, dynamic> json) => OrderHistoryPlaced(
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
  dynamic actualRate;
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
  OrderTypeEnumValue orderTypeEnumValue;
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
  List<dynamic> serviceOrderAssignDto;
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
    actualRate: json["actualRate"],
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
    orderTypeEnumValue: orderTypeEnumValueValues.map[json["orderTypeEnumValue"]],
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
    serviceOrderAssignDto: json["serviceOrderAssignDto"] == null ? null : List<dynamic>.from(json["serviceOrderAssignDto"].map((x) => x)),
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
    "actualRate": actualRate,
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
    "orderTypeEnumValue": orderTypeEnumValueValues.reverse[orderTypeEnumValue],
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
    "serviceOrderAssignDto": serviceOrderAssignDto == null ? null : List<dynamic>.from(serviceOrderAssignDto.map((x) => x)),
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
  CustomerName location;
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
    location: customerNameValues.map[json["location"]],
    geoLocation: geoLocationValues.map[json["geoLocation"]],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
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
    "location": customerNameValues.reverse[location],
    "geoLocation": geoLocationValues.reverse[geoLocation],
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
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

enum CityDtoName { RAS_LAFAN, BANI_HAJER, AL_BIDDA, AL_WAKRAH, AIN_KHALED, AL_JERYAN, AL_HILAL, AL_KHOR }

final cityDtoNameValues = EnumValues({
  "Ain Khaled": CityDtoName.AIN_KHALED,
  "Al Bidda": CityDtoName.AL_BIDDA,
  "Al Hilal": CityDtoName.AL_HILAL,
  "Al Jeryan": CityDtoName.AL_JERYAN,
  "Al Khor": CityDtoName.AL_KHOR,
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
  CountryDtoName name;
  int recordStatus;
  int currencyId;
  CurrencyDto currencyDto;

  factory CountryDto.fromJson(Map<String, dynamic> json) => CountryDto(
    id: json["\u0024id"],
    countryId: json["countryId"],
    name: countryDtoNameValues.map[json["name"]],
    recordStatus: json["recordStatus"],
    currencyId: json["currencyId"],
    currencyDto: CurrencyDto.fromJson(json["currencyDto"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "countryId": countryId,
    "name": countryDtoNameValues.reverse[name],
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

enum Code { QAR, INR }

final codeValues = EnumValues({
  "INR": Code.INR,
  "QAR": Code.QAR
});

enum CurrencyDtoName { QATARI_RIYAL, INDIAN_RUPEE }

final currencyDtoNameValues = EnumValues({
  "Indian rupee": CurrencyDtoName.INDIAN_RUPEE,
  "Qatari Riyal": CurrencyDtoName.QATARI_RIYAL
});

enum CountryDtoName { QATAR, INDIA }

final countryDtoNameValues = EnumValues({
  "India": CountryDtoName.INDIA,
  "Qatar": CountryDtoName.QATAR
});

enum GeoLocation { US, ANTHIKAD, NEW, INFOVENTURES_VILLA_DOHA_QATAR, AL_WAKRAH_QATAR, QATAR, SALWA_ROAD_DOHA_QATAR, ASP_TECHNOLOGIES, SOUTH_WEST_UKRAIN, DOHA_HARYANA_INDIA, QATAR_2, UK }

final geoLocationValues = EnumValues({
  "Al Wakrah, Qatar": GeoLocation.AL_WAKRAH_QATAR,
  "anthikad": GeoLocation.ANTHIKAD,
  "ASP technologies": GeoLocation.ASP_TECHNOLOGIES,
  "Doha, Haryana, India": GeoLocation.DOHA_HARYANA_INDIA,
  "Infoventures Villa, Doha, Qatar": GeoLocation.INFOVENTURES_VILLA_DOHA_QATAR,
  "New": GeoLocation.NEW,
  "Qatar": GeoLocation.QATAR,
  "Qatar 2": GeoLocation.QATAR_2,
  "Salwa Road, Doha, Qatar": GeoLocation.SALWA_ROAD_DOHA_QATAR,
  "South West Ukrain": GeoLocation.SOUTH_WEST_UKRAIN,
  "UK": GeoLocation.UK,
  "US": GeoLocation.US
});

enum HouseNo { THE_1_ST_FLOOR, THE_2_ND_FLOOR, DDDD }

final houseNoValues = EnumValues({
  "dddd": HouseNo.DDDD,
  "1st Floor": HouseNo.THE_1_ST_FLOOR,
  "2nd Floor": HouseNo.THE_2_ND_FLOOR
});

enum CustomerName { DON_BILAR, MY_HOME, NEW_ADDRESS, INFOVENTURES_VILLA_DOHA_QATAR, BUILDING_NO_5_AL_WAKRA_COMPLEX, HIUSE_NUMBER_10, INFOVENTURES_VILLA_DOHA_QATARS, ARUN_MOHAN_KUMAR, AL_ALKOS_OMNA, HAREEZ_RAHIM, BUILDING, BUILDING_1, BOSCO_11 }

final customerNameValues = EnumValues({
  "Al Alkos omna": CustomerName.AL_ALKOS_OMNA,
  "Arun mohan Kumar": CustomerName.ARUN_MOHAN_KUMAR,
  "Bosco 11": CustomerName.BOSCO_11,
  "Building": CustomerName.BUILDING,
  "Building 1": CustomerName.BUILDING_1,
  "Building No 5, Al Wakra complex": CustomerName.BUILDING_NO_5_AL_WAKRA_COMPLEX,
  "Don Bilar ": CustomerName.DON_BILAR,
  "Hareez Rahim": CustomerName.HAREEZ_RAHIM,
  "Hiuse number 10": CustomerName.HIUSE_NUMBER_10,
  "Infoventures Villa, Doha, Qatar": CustomerName.INFOVENTURES_VILLA_DOHA_QATAR,
  "Infoventures Villa, Doha, Qatars": CustomerName.INFOVENTURES_VILLA_DOHA_QATARS,
  "my home": CustomerName.MY_HOME,
  "new Address": CustomerName.NEW_ADDRESS
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

enum StateDtoName { AL_KHOR, AL_RAYYAN, DOHA, AL_WAKRAH, OMAN }

final stateDtoNameValues = EnumValues({
  "Al Khor": StateDtoName.AL_KHOR,
  "Al Rayyan": StateDtoName.AL_RAYYAN,
  "Al Wakrah": StateDtoName.AL_WAKRAH,
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

enum LockedByUser { DEVELOPER_ASPIROM_DEVELOPER, EMPTY, JINU_JINU }

final lockedByUserValues = EnumValues({
  "Developer Aspirom(developer)": LockedByUser.DEVELOPER_ASPIROM_DEVELOPER,
  "": LockedByUser.EMPTY,
  "Jinu (jinu)": LockedByUser.JINU_JINU
});

enum OrderStatusEnumValue { PLACED }

final orderStatusEnumValueValues = EnumValues({
  "Placed": OrderStatusEnumValue.PLACED
});

enum OrderTypeEnumValue { NORMAL }

final orderTypeEnumValueValues = EnumValues({
  "NORMAL": OrderTypeEnumValue.NORMAL
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
    serviceOrderItemAnswersDtoList: json["serviceOrderItemAnswersDtoList"] == null ? null : List<ServiceOrderItemAnswersDtoList>.from(json["serviceOrderItemAnswersDtoList"].map((x) => ServiceOrderItemAnswersDtoList.fromJson(x))),
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
    "serviceOrderItemAnswersDtoList": serviceOrderItemAnswersDtoList == null ? null : List<dynamic>.from(serviceOrderItemAnswersDtoList.map((x) => x.toJson())),
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

enum DescriptionTitle { EMPTY, AUTOMOBILE_SERVICE }

final descriptionTitleValues = EnumValues({
  "Automobile Service": DescriptionTitle.AUTOMOBILE_SERVICE,
  "": DescriptionTitle.EMPTY
});

enum ImagePath { IMAGE_082431157690_PNG, IMAGE_113902702125_PNG, IMAGE_082548375734_PNG, IMAGE_022955992278_PNG, IMAGE_082514906669_PNG, IMAGE_082710945658_PNG }

final imagePathValues = EnumValues({
  "Image@02.29.55.992278.png": ImagePath.IMAGE_022955992278_PNG,
  "Image@08.24.31.157690.png": ImagePath.IMAGE_082431157690_PNG,
  "Image@08.25.14.906669.png": ImagePath.IMAGE_082514906669_PNG,
  "Image@08.25.48.375734.png": ImagePath.IMAGE_082548375734_PNG,
  "Image@08.27.10.945658.png": ImagePath.IMAGE_082710945658_PNG,
  "Image@11.39.02.702125.png": ImagePath.IMAGE_113902702125_PNG
});

enum ModuleDtoName { AIR_CONDITIONER, AUTOMOBILE, PAINTING, ELECTRICAL, PLUMBING, HOME_ASSISTANCE_SERVICE }

final moduleDtoNameValues = EnumValues({
  "Air Conditioner": ModuleDtoName.AIR_CONDITIONER,
  "Automobile": ModuleDtoName.AUTOMOBILE,
  "Electrical": ModuleDtoName.ELECTRICAL,
  "Home Assistance Service": ModuleDtoName.HOME_ASSISTANCE_SERVICE,
  "Painting": ModuleDtoName.PAINTING,
  "Plumbing": ModuleDtoName.PLUMBING
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
  String answer;
  String attributeOptionValue;
  int recordStatus;
  AttributeQuestionDto attributeQuestionDto;
  dynamic serviceOrderItemDto;

  factory ServiceOrderItemAnswersDtoList.fromJson(Map<String, dynamic> json) => ServiceOrderItemAnswersDtoList(
    id: json["\u0024id"],
    serviceOrderItemAnswersId: json["serviceOrderItemAnswersId"],
    serviceOrderItemId: json["serviceOrderItemId"],
    attributeQuestionsId: json["attributeQuestionsId"],
    answer: json["answer"],
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
    "answer": answer,
    "attributeOptionValue": attributeOptionValue,
    "recordStatus": recordStatus,
    "attributeQuestionDto": attributeQuestionDto.toJson(),
    "serviceOrderItemDto": serviceOrderItemDto,
  };
}

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
