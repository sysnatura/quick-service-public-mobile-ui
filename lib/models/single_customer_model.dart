import 'account_dto.dart';
import 'contact_dto.dart';
import 'customer_address_dto_list.dart';

class SingleCustomerModel {
  SingleCustomerModel({
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
      this.customerAddressDtoList,});

  SingleCustomerModel.fromJson(dynamic json) {
    customerId = json['customerId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    contactId = json['contactId'];
    language = json['language'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    reference = json['reference'];
    createdOn = json['createdOn'];
    accountId = json['accountId'];
    emailVerified = json['emailVerified'];
    mobileVerified = json['mobileVerified'];
    status = json['status'];
    recordStatus = json['recordStatus'];
    registeredFrom = json['registeredFrom'];
    registeredBy = json['registeredBy'];
    profilePicture = json['profilePicture'];
    base64 = json['base64'];
    customerName = json['customerName'];
    encryptedCustomerId = json['encryptedCustomerId'];
    serviceOrderDto = json['serviceOrderDto'];
    accountDto = json['accountDto'] != null ? AccountDto.fromJson(json['accountDto']) : null;
    contactDto = json['contactDto'] != null ? ContactDto.fromJson(json['contactDto']) : null;
    userDto = json['userDto'];
    if (json['customerAddressDtoList'] != null) {
      customerAddressDtoList = [];
      json['customerAddressDtoList'].forEach((v) {
        customerAddressDtoList?.add(CustomerAddressDtoList.fromJson(v));
      });
    }
  }
  int customerId;
  String firstName;
  String lastName;
  int contactId;
  dynamic language;
  int gender;
  dynamic dateOfBirth;
  dynamic reference;
  String createdOn;
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
  AccountDto accountDto;
  ContactDto contactDto;
  dynamic userDto;
  List<CustomerAddressDtoList> customerAddressDtoList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = customerId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['contactId'] = contactId;
    map['language'] = language;
    map['gender'] = gender;
    map['dateOfBirth'] = dateOfBirth;
    map['reference'] = reference;
    map['createdOn'] = createdOn;
    map['accountId'] = accountId;
    map['emailVerified'] = emailVerified;
    map['mobileVerified'] = mobileVerified;
    map['status'] = status;
    map['recordStatus'] = recordStatus;
    map['registeredFrom'] = registeredFrom;
    map['registeredBy'] = registeredBy;
    map['profilePicture'] = profilePicture;
    map['base64'] = base64;
    map['customerName'] = customerName;
    map['encryptedCustomerId'] = encryptedCustomerId;
    map['serviceOrderDto'] = serviceOrderDto;
    if (accountDto != null) {
      map['accountDto'] = accountDto?.toJson();
    }
    if (contactDto != null) {
      map['contactDto'] = contactDto?.toJson();
    }
    map['userDto'] = userDto;
    if (customerAddressDtoList != null) {
      map['customerAddressDtoList'] = customerAddressDtoList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}