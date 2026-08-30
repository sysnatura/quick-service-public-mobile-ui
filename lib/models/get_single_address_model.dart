import 'dart:convert';

List<GetSingleAddressModel> getSingleAddressModelFromJson(String str) => List<GetSingleAddressModel>.from(json.decode(str).map((x) => GetSingleAddressModel.fromJson(x)));

String getSingleAddressModelToJson(List<GetSingleAddressModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSingleAddressModel {
  GetSingleAddressModel({
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
  dynamic realEstateId;
  int recordStatus;
  bool isApprovedByRealEstate;
  bool isResidential;
  dynamic realEstateDto;
  Address address;
  Customer customer;

  factory GetSingleAddressModel.fromJson(Map<String, dynamic> json) => GetSingleAddressModel(
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
    realEstateDto: json["realEstateDto"],
    address: Address.fromJson(json["address"]),
    customer: Customer.fromJson(json["customer"]),
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
    "realEstateDto": realEstateDto,
    "address": address.toJson(),
    "customer": customer.toJson(),
  };
}

class Address {
  Address({
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
  });

  String id;
  int addressId;
  int cityId;
  int stateId;
  int countryId;
  String houseNo;
  String location;
  String geoLocation;
  String latitude;
  String longitude;
  CityDto cityDto;
  CountryDto countryDto;
  StateDto stateDto;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["\u0024id"],
    addressId: json["addressId"],
    cityId: json["cityId"],
    stateId: json["stateId"],
    countryId: json["countryId"],
    houseNo: json["houseNo"],
    location: json["location"],
    geoLocation: json["geoLocation"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    cityDto: CityDto.fromJson(json["cityDto"]),
    countryDto: CountryDto.fromJson(json["countryDto"]),
    stateDto: StateDto.fromJson(json["stateDto"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "addressId": addressId,
    "cityId": cityId,
    "stateId": stateId,
    "countryId": countryId,
    "houseNo": houseNo,
    "location": location,
    "geoLocation": geoLocation,
    "latitude": latitude,
    "longitude": longitude,
    "cityDto": cityDto.toJson(),
    "countryDto": countryDto.toJson(),
    "stateDto": stateDto.toJson(),
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
  String name;
  int stateId;
  int recordStatus;
  dynamic stateDto;

  factory CityDto.fromJson(Map<String, dynamic> json) => CityDto(
    id: json["\u0024id"],
    cityId: json["cityId"],
    name: json["name"],
    stateId: json["stateId"],
    recordStatus: json["recordStatus"],
    stateDto: json["stateDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "cityId": cityId,
    "name": name,
    "stateId": stateId,
    "recordStatus": recordStatus,
    "stateDto": stateDto,
  };
}

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
  String name;
  int recordStatus;
  int currencyId;
  dynamic currencyDto;

  factory CountryDto.fromJson(Map<String, dynamic> json) => CountryDto(
    id: json["\u0024id"],
    countryId: json["countryId"],
    name: json["name"],
    recordStatus: json["recordStatus"],
    currencyId: json["currencyId"],
    currencyDto: json["currencyDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "countryId": countryId,
    "name": name,
    "recordStatus": recordStatus,
    "currencyId": currencyId,
    "currencyDto": currencyDto,
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
  String name;
  int countryId;
  int recordStatus;
  dynamic countryDto;
  dynamic cityDto;
  dynamic nearByStatesDto;

  factory StateDto.fromJson(Map<String, dynamic> json) => StateDto(
    id: json["\u0024id"],
    stateId: json["stateId"],
    name: json["name"],
    countryId: json["countryId"],
    recordStatus: json["recordStatus"],
    countryDto: json["countryDto"],
    cityDto: json["cityDto"],
    nearByStatesDto: json["nearByStatesDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "stateId": stateId,
    "name": name,
    "countryId": countryId,
    "recordStatus": recordStatus,
    "countryDto": countryDto,
    "cityDto": cityDto,
    "nearByStatesDto": nearByStatesDto,
  };
}

class Customer {
  Customer({
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
  String firstName;
  String lastName;
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
  String customerName;
  dynamic encryptedCustomerId;
  dynamic serviceOrderDto;
  dynamic accountDto;
  ContactDto contactDto;
  dynamic userDto;
  dynamic customerAddressDtoList;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
    contactDto: ContactDto.fromJson(json["contactDto"]),
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
    "contactDto": contactDto.toJson(),
    "userDto": userDto,
    "customerAddressDtoList": customerAddressDtoList,
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
  String emailAddress;
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
    emailAddress: json["emailAddress"],
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
    "emailAddress": emailAddress,
    "landLineNumber": landLineNumber,
    "landLineNumber1": landLineNumber1,
    "landLineNumber2": landLineNumber2,
    "website": website,
    "customerDto": customerDto,
  };
}
