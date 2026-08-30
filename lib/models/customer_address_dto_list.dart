import 'address.dart';

class CustomerAddressDtoList {
  CustomerAddressDtoList({
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
      this.customer,});

  CustomerAddressDtoList.fromJson(dynamic json) {
    customerAddressId = json['customerAddressId'];
    customerId = json['customerId'];
    addressId = json['addressId'];
    isPrimary = json['isPrimary'];
    isRealEstate = json['isRealEstate'];
    realEstateId = json['realEstateId'];
    recordStatus = json['recordStatus'];
    isApprovedByRealEstate = json['isApprovedByRealEstate'];
    isResidential = json['isResidential'];
    realEstateDto = json['realEstateDto'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    customer = json['customer'];
  }
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
  dynamic customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerAddressId'] = customerAddressId;
    map['customerId'] = customerId;
    map['addressId'] = addressId;
    map['isPrimary'] = isPrimary;
    map['isRealEstate'] = isRealEstate;
    map['realEstateId'] = realEstateId;
    map['recordStatus'] = recordStatus;
    map['isApprovedByRealEstate'] = isApprovedByRealEstate;
    map['isResidential'] = isResidential;
    map['realEstateDto'] = realEstateDto;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['customer'] = customer;
    return map;
  }

}