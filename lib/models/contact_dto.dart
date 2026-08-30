class ContactDto {
  ContactDto({
      this.contactId, 
      this.mobileNumber, 
      this.mobileNumber1, 
      this.mobileNumber2, 
      this.emailAddress, 
      this.landLineNumber, 
      this.landLineNumber1, 
      this.landLineNumber2, 
      this.website, 
      this.customerDto,});

  ContactDto.fromJson(dynamic json) {
    contactId = json['contactId'];
    mobileNumber = json['mobileNumber'];
    mobileNumber1 = json['mobileNumber1'];
    mobileNumber2 = json['mobileNumber2'];
    emailAddress = json['emailAddress'];
    landLineNumber = json['landLineNumber'];
    landLineNumber1 = json['landLineNumber1'];
    landLineNumber2 = json['landLineNumber2'];
    website = json['website'];
    customerDto = json['customerDto'];
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactId'] = contactId;
    map['mobileNumber'] = mobileNumber;
    map['mobileNumber1'] = mobileNumber1;
    map['mobileNumber2'] = mobileNumber2;
    map['emailAddress'] = emailAddress;
    map['landLineNumber'] = landLineNumber;
    map['landLineNumber1'] = landLineNumber1;
    map['landLineNumber2'] = landLineNumber2;
    map['website'] = website;
    map['customerDto'] = customerDto;
    return map;
  }

}