/// $id : "1"
/// customerId : 7
/// email : "hareez@aspiromtechnologies.com"
/// tokenValue : "f6a95496-b483-41f7-b3d5-64f8e6515017"
/// expiry : "2021-11-22T15:33:04.371647+05:30"
/// jsonResultHelper : null
/// customerDto : {"$id":"2","customerId":7,"firstName":"Hareez","lastName":"Rahim","contactId":16,"language":null,"gender":1,"dateOfBirth":null,"reference":null,"createdOn":"2021-05-19T02:59:18.223","accountId":14,"emailVerified":true,"mobileVerified":false,"status":0,"recordStatus":0,"registeredFrom":0,"registeredBy":null,"profilePicture":null,"base64":null,"customerName":"Hareez Rahim","encryptedCustomerId":null,"serviceOrderDto":null,"accountDto":{"$id":"3","accountId":14,"passwordHash":null,"passwordSalt":null,"authCode":null,"currentPassword":null},"contactDto":{"$id":"4","contactId":16,"mobileNumber":"0496828099","mobileNumber1":null,"mobileNumber2":null,"emailAddress":"hareez@aspiromtechnologies.com","landLineNumber":null,"landLineNumber1":null,"landLineNumber2":null,"website":null,"customerDto":null},"userDto":null,"customerAddressDtoList":[{"$id":"5","customerAddressId":6,"customerId":7,"addressId":10,"isPrimary":1,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"6","addressId":10,"cityId":7,"stateId":10,"countryId":2,"houseNo":"1st Floor","location":"Infoventures Villa, Doha, Qatar","geoLocation":"Qatar","latitude":"25.354826","longitude":"51.183884","cityDto":{"$id":"7","cityId":7,"name":"Al Bidda","stateId":10,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"8","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"9","stateId":10,"name":"Doha","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"10","customerAddressId":22,"customerId":7,"addressId":28,"isPrimary":0,"isRealEstate":true,"realEstateId":1,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":true,"realEstateDto":{"$id":"11","realEstateId":1,"name":"Real Estate1","isApproved":true,"recordStatus":0},"address":{"$id":"12","addressId":28,"cityId":18,"stateId":12,"countryId":2,"houseNo":null,"location":"Hiuse number 10","geoLocation":"Salwa Road, Doha, Qatar","latitude":"25.2402784","longitude":"51.4563447","cityDto":{"$id":"13","cityId":18,"name":"Ain Khaled","stateId":12,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"14","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"15","stateId":12,"name":"Al Rayyan","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"16","customerAddressId":26,"customerId":7,"addressId":32,"isPrimary":0,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"17","addressId":32,"cityId":20,"stateId":15,"countryId":2,"houseNo":null,"location":"Building No 5, Al Wakra complex","geoLocation":"Al Wakrah, Qatar","latitude":"25.1659314","longitude":"51.5975524","cityDto":{"$id":"18","cityId":20,"name":"Al Wakrah","stateId":15,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"19","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"20","stateId":15,"name":"Al Wakrah","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"21","customerAddressId":32,"customerId":7,"addressId":44,"isPrimary":0,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"22","addressId":44,"cityId":12,"stateId":13,"countryId":2,"houseNo":"teStAddress","location":"testAddrees","geoLocation":"Doha, Qatar","latitude":"25.2854473","longitude":"51.53103979999999","cityDto":{"$id":"23","cityId":12,"name":"Al Jeryan","stateId":13,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"24","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"25","stateId":13,"name":"Al Khor","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"26","customerAddressId":33,"customerId":7,"addressId":45,"isPrimary":0,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"27","addressId":45,"cityId":12,"stateId":13,"countryId":2,"houseNo":"teStAddress","location":"testAddrees","geoLocation":"Doha, Qatar","latitude":"25.2854473","longitude":"51.53103979999999","cityDto":{"$id":"28","cityId":12,"name":"Al Jeryan","stateId":13,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"29","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"30","stateId":13,"name":"Al Khor","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null}]}

class LogInModel {
  LogInModel({
      int customerId,
      String email,
      String tokenValue,
      String expiry,
      dynamic jsonResultHelper, 
      CustomerDto customerDto,}){
    _customerId = customerId;
    _email = email;
    _tokenValue = tokenValue;
    _expiry = expiry;
    _jsonResultHelper = jsonResultHelper;
    _customerDto = customerDto;
}

  LogInModel.fromJson(dynamic json) {
    _customerId = json['customerId'];
    _email = json['email'];
    _tokenValue = json['tokenValue'];
    _expiry = json['expiry'];
    _jsonResultHelper = json['jsonResultHelper'];
    _customerDto = json['customerDto'] != null ? CustomerDto.fromJson(json['customerDto']) : null;
  }
  int _customerId;
  String _email;
  String _tokenValue;
  String _expiry;
  dynamic _jsonResultHelper;
  CustomerDto _customerDto;

  int get customerId => _customerId;
  String get email => _email;
  String get tokenValue => _tokenValue;
  String get expiry => _expiry;
  dynamic get jsonResultHelper => _jsonResultHelper;
  CustomerDto get customerDto => _customerDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = _customerId;
    map['email'] = _email;
    map['tokenValue'] = _tokenValue;
    map['expiry'] = _expiry;
    map['jsonResultHelper'] = _jsonResultHelper;
    if (_customerDto != null) {
      map['customerDto'] = _customerDto?.toJson();
    }
    return map;
  }

}

/// $id : "2"
/// customerId : 7
/// firstName : "Hareez"
/// lastName : "Rahim"
/// contactId : 16
/// language : null
/// gender : 1
/// dateOfBirth : null
/// reference : null
/// createdOn : "2021-05-19T02:59:18.223"
/// accountId : 14
/// emailVerified : true
/// mobileVerified : false
/// status : 0
/// recordStatus : 0
/// registeredFrom : 0
/// registeredBy : null
/// profilePicture : null
/// base64 : null
/// customerName : "Hareez Rahim"
/// encryptedCustomerId : null
/// serviceOrderDto : null
/// accountDto : {"$id":"3","accountId":14,"passwordHash":null,"passwordSalt":null,"authCode":null,"currentPassword":null}
/// contactDto : {"$id":"4","contactId":16,"mobileNumber":"0496828099","mobileNumber1":null,"mobileNumber2":null,"emailAddress":"hareez@aspiromtechnologies.com","landLineNumber":null,"landLineNumber1":null,"landLineNumber2":null,"website":null,"customerDto":null}
/// userDto : null
/// customerAddressDtoList : [{"$id":"5","customerAddressId":6,"customerId":7,"addressId":10,"isPrimary":1,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"6","addressId":10,"cityId":7,"stateId":10,"countryId":2,"houseNo":"1st Floor","location":"Infoventures Villa, Doha, Qatar","geoLocation":"Qatar","latitude":"25.354826","longitude":"51.183884","cityDto":{"$id":"7","cityId":7,"name":"Al Bidda","stateId":10,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"8","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"9","stateId":10,"name":"Doha","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"10","customerAddressId":22,"customerId":7,"addressId":28,"isPrimary":0,"isRealEstate":true,"realEstateId":1,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":true,"realEstateDto":{"$id":"11","realEstateId":1,"name":"Real Estate1","isApproved":true,"recordStatus":0},"address":{"$id":"12","addressId":28,"cityId":18,"stateId":12,"countryId":2,"houseNo":null,"location":"Hiuse number 10","geoLocation":"Salwa Road, Doha, Qatar","latitude":"25.2402784","longitude":"51.4563447","cityDto":{"$id":"13","cityId":18,"name":"Ain Khaled","stateId":12,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"14","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"15","stateId":12,"name":"Al Rayyan","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"16","customerAddressId":26,"customerId":7,"addressId":32,"isPrimary":0,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"17","addressId":32,"cityId":20,"stateId":15,"countryId":2,"houseNo":null,"location":"Building No 5, Al Wakra complex","geoLocation":"Al Wakrah, Qatar","latitude":"25.1659314","longitude":"51.5975524","cityDto":{"$id":"18","cityId":20,"name":"Al Wakrah","stateId":15,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"19","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"20","stateId":15,"name":"Al Wakrah","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"21","customerAddressId":32,"customerId":7,"addressId":44,"isPrimary":0,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"22","addressId":44,"cityId":12,"stateId":13,"countryId":2,"houseNo":"teStAddress","location":"testAddrees","geoLocation":"Doha, Qatar","latitude":"25.2854473","longitude":"51.53103979999999","cityDto":{"$id":"23","cityId":12,"name":"Al Jeryan","stateId":13,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"24","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"25","stateId":13,"name":"Al Khor","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null},{"$id":"26","customerAddressId":33,"customerId":7,"addressId":45,"isPrimary":0,"isRealEstate":false,"realEstateId":null,"recordStatus":0,"isApprovedByRealEstate":false,"isResidential":false,"realEstateDto":null,"address":{"$id":"27","addressId":45,"cityId":12,"stateId":13,"countryId":2,"houseNo":"teStAddress","location":"testAddrees","geoLocation":"Doha, Qatar","latitude":"25.2854473","longitude":"51.53103979999999","cityDto":{"$id":"28","cityId":12,"name":"Al Jeryan","stateId":13,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"29","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"30","stateId":13,"name":"Al Khor","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}},"customer":null}]

class CustomerDto {
  CustomerDto({
      int customerId,
      String firstName,
      String lastName,
      int contactId,
      dynamic language, 
      int gender,
      dynamic dateOfBirth, 
      dynamic reference, 
      String createdOn,
      int accountId,
      bool emailVerified,
      bool mobileVerified,
      int status,
      int recordStatus,
      int registeredFrom,
      dynamic registeredBy, 
      dynamic profilePicture, 
      dynamic base64, 
      String customerName,
      dynamic encryptedCustomerId, 
      dynamic serviceOrderDto, 
      AccountDto accountDto,
      ContactDto contactDto,
      dynamic userDto, 
      List<CustomerAddressDtoList> customerAddressDtoList,}){
    _customerId = customerId;
    _firstName = firstName;
    _lastName = lastName;
    _contactId = contactId;
    _language = language;
    _gender = gender;
    _dateOfBirth = dateOfBirth;
    _reference = reference;
    _createdOn = createdOn;
    _accountId = accountId;
    _emailVerified = emailVerified;
    _mobileVerified = mobileVerified;
    _status = status;
    _recordStatus = recordStatus;
    _registeredFrom = registeredFrom;
    _registeredBy = registeredBy;
    _profilePicture = profilePicture;
    _base64 = base64;
    _customerName = customerName;
    _encryptedCustomerId = encryptedCustomerId;
    _serviceOrderDto = serviceOrderDto;
    _accountDto = accountDto;
    _contactDto = contactDto;
    _userDto = userDto;
    _customerAddressDtoList = customerAddressDtoList;
}

  CustomerDto.fromJson(dynamic json) {
    _customerId = json['customerId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _contactId = json['contactId'];
    _language = json['language'];
    _gender = json['gender'];
    _dateOfBirth = json['dateOfBirth'];
    _reference = json['reference'];
    _createdOn = json['createdOn'];
    _accountId = json['accountId'];
    _emailVerified = json['emailVerified'];
    _mobileVerified = json['mobileVerified'];
    _status = json['status'];
    _recordStatus = json['recordStatus'];
    _registeredFrom = json['registeredFrom'];
    _registeredBy = json['registeredBy'];
    _profilePicture = json['profilePicture'];
    _base64 = json['base64'];
    _customerName = json['customerName'];
    _encryptedCustomerId = json['encryptedCustomerId'];
    _serviceOrderDto = json['serviceOrderDto'];
    _accountDto = json['accountDto'] != null ? AccountDto.fromJson(json['accountDto']) : null;
    _contactDto = json['contactDto'] != null ? ContactDto.fromJson(json['contactDto']) : null;
    _userDto = json['userDto'];
    if (json['customerAddressDtoList'] != null) {
      _customerAddressDtoList = [];
      json['customerAddressDtoList'].forEach((v) {
        _customerAddressDtoList?.add(CustomerAddressDtoList.fromJson(v));
      });
    }
  }
  int _customerId;
  String _firstName;
  String _lastName;
  int _contactId;
  dynamic _language;
  int _gender;
  dynamic _dateOfBirth;
  dynamic _reference;
  String _createdOn;
  int _accountId;
  bool _emailVerified;
  bool _mobileVerified;
  int _status;
  int _recordStatus;
  int _registeredFrom;
  dynamic _registeredBy;
  dynamic _profilePicture;
  dynamic _base64;
  String _customerName;
  dynamic _encryptedCustomerId;
  dynamic _serviceOrderDto;
  AccountDto _accountDto;
  ContactDto _contactDto;
  dynamic _userDto;
  List<CustomerAddressDtoList> _customerAddressDtoList;

  int get customerId => _customerId;
  String get firstName => _firstName;
  String get lastName => _lastName;
  int get contactId => _contactId;
  dynamic get language => _language;
  int get gender => _gender;
  dynamic get dateOfBirth => _dateOfBirth;
  dynamic get reference => _reference;
  String get createdOn => _createdOn;
  int get accountId => _accountId;
  bool get emailVerified => _emailVerified;
  bool get mobileVerified => _mobileVerified;
  int get status => _status;
  int get recordStatus => _recordStatus;
  int get registeredFrom => _registeredFrom;
  dynamic get registeredBy => _registeredBy;
  dynamic get profilePicture => _profilePicture;
  dynamic get base64 => _base64;
  String get customerName => _customerName;
  dynamic get encryptedCustomerId => _encryptedCustomerId;
  dynamic get serviceOrderDto => _serviceOrderDto;
  AccountDto get accountDto => _accountDto;
  ContactDto get contactDto => _contactDto;
  dynamic get userDto => _userDto;
  List<CustomerAddressDtoList> get customerAddressDtoList => _customerAddressDtoList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = _customerId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['contactId'] = _contactId;
    map['language'] = _language;
    map['gender'] = _gender;
    map['dateOfBirth'] = _dateOfBirth;
    map['reference'] = _reference;
    map['createdOn'] = _createdOn;
    map['accountId'] = _accountId;
    map['emailVerified'] = _emailVerified;
    map['mobileVerified'] = _mobileVerified;
    map['status'] = _status;
    map['recordStatus'] = _recordStatus;
    map['registeredFrom'] = _registeredFrom;
    map['registeredBy'] = _registeredBy;
    map['profilePicture'] = _profilePicture;
    map['base64'] = _base64;
    map['customerName'] = _customerName;
    map['encryptedCustomerId'] = _encryptedCustomerId;
    map['serviceOrderDto'] = _serviceOrderDto;
    if (_accountDto != null) {
      map['accountDto'] = _accountDto?.toJson();
    }
    if (_contactDto != null) {
      map['contactDto'] = _contactDto?.toJson();
    }
    map['userDto'] = _userDto;
    if (_customerAddressDtoList != null) {
      map['customerAddressDtoList'] = _customerAddressDtoList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// $id : "5"
/// customerAddressId : 6
/// customerId : 7
/// addressId : 10
/// isPrimary : 1
/// isRealEstate : false
/// realEstateId : null
/// recordStatus : 0
/// isApprovedByRealEstate : false
/// isResidential : false
/// realEstateDto : null
/// address : {"$id":"6","addressId":10,"cityId":7,"stateId":10,"countryId":2,"houseNo":"1st Floor","location":"Infoventures Villa, Doha, Qatar","geoLocation":"Qatar","latitude":"25.354826","longitude":"51.183884","cityDto":{"$id":"7","cityId":7,"name":"Al Bidda","stateId":10,"recordStatus":0,"stateDto":null},"countryDto":{"$id":"8","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null},"stateDto":{"$id":"9","stateId":10,"name":"Doha","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}}
/// customer : null

class CustomerAddressDtoList {
  CustomerAddressDtoList({
      int customerAddressId,
      int customerId,
      int addressId,
      int isPrimary,
      bool isRealEstate,
      dynamic realEstateId, 
      int recordStatus,
      bool isApprovedByRealEstate,
      bool isResidential,
      dynamic realEstateDto, 
      Address address,
      dynamic customer,}){
    _customerAddressId = customerAddressId;
    _customerId = customerId;
    _addressId = addressId;
    _isPrimary = isPrimary;
    _isRealEstate = isRealEstate;
    _realEstateId = realEstateId;
    _recordStatus = recordStatus;
    _isApprovedByRealEstate = isApprovedByRealEstate;
    _isResidential = isResidential;
    _realEstateDto = realEstateDto;
    _address = address;
    _customer = customer;
}

  CustomerAddressDtoList.fromJson(dynamic json) {
    _customerAddressId = json['customerAddressId'];
    _customerId = json['customerId'];
    _addressId = json['addressId'];
    _isPrimary = json['isPrimary'];
    _isRealEstate = json['isRealEstate'];
    _realEstateId = json['realEstateId'];
    _recordStatus = json['recordStatus'];
    _isApprovedByRealEstate = json['isApprovedByRealEstate'];
    _isResidential = json['isResidential'];
    _realEstateDto = json['realEstateDto'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _customer = json['customer'];
  }
  int _customerAddressId;
  int _customerId;
  int _addressId;
  int _isPrimary;
  bool _isRealEstate;
  dynamic _realEstateId;
  int _recordStatus;
  bool _isApprovedByRealEstate;
  bool _isResidential;
  dynamic _realEstateDto;
  Address _address;
  dynamic _customer;

  int get customerAddressId => _customerAddressId;
  int get customerId => _customerId;
  int get addressId => _addressId;
  int get isPrimary => _isPrimary;
  bool get isRealEstate => _isRealEstate;
  dynamic get realEstateId => _realEstateId;
  int get recordStatus => _recordStatus;
  bool get isApprovedByRealEstate => _isApprovedByRealEstate;
  bool get isResidential => _isResidential;
  dynamic get realEstateDto => _realEstateDto;
  Address get address => _address;
  dynamic get customer => _customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerAddressId'] = _customerAddressId;
    map['customerId'] = _customerId;
    map['addressId'] = _addressId;
    map['isPrimary'] = _isPrimary;
    map['isRealEstate'] = _isRealEstate;
    map['realEstateId'] = _realEstateId;
    map['recordStatus'] = _recordStatus;
    map['isApprovedByRealEstate'] = _isApprovedByRealEstate;
    map['isResidential'] = _isResidential;
    map['realEstateDto'] = _realEstateDto;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['customer'] = _customer;
    return map;
  }

}

/// $id : "6"
/// addressId : 10
/// cityId : 7
/// stateId : 10
/// countryId : 2
/// houseNo : "1st Floor"
/// location : "Infoventures Villa, Doha, Qatar"
/// geoLocation : "Qatar"
/// latitude : "25.354826"
/// longitude : "51.183884"
/// cityDto : {"$id":"7","cityId":7,"name":"Al Bidda","stateId":10,"recordStatus":0,"stateDto":null}
/// countryDto : {"$id":"8","countryId":2,"name":"Qatar","recordStatus":0,"currencyId":0,"currencyDto":null}
/// stateDto : {"$id":"9","stateId":10,"name":"Doha","countryId":2,"recordStatus":0,"countryDto":null,"cityDto":null,"nearByStatesDto":null}

class Address {
  Address({
      int addressId,
      int cityId,
      int stateId,
      int countryId,
      String houseNo,
      String location,
      String geoLocation,
      String latitude,
      String longitude,
      CityDto cityDto,
      CountryDto countryDto,
      StateDto stateDto,}){
    _addressId = addressId;
    _cityId = cityId;
    _stateId = stateId;
    _countryId = countryId;
    _houseNo = houseNo;
    _location = location;
    _geoLocation = geoLocation;
    _latitude = latitude;
    _longitude = longitude;
    _cityDto = cityDto;
    _countryDto = countryDto;
    _stateDto = stateDto;
}

  Address.fromJson(dynamic json) {
    _addressId = json['addressId'];
    _cityId = json['cityId'];
    _stateId = json['stateId'];
    _countryId = json['countryId'];
    _houseNo = json['houseNo'];
    _location = json['location'];
    _geoLocation = json['geoLocation'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _cityDto = json['cityDto'] != null ? CityDto.fromJson(json['cityDto']) : null;
    _countryDto = json['countryDto'] != null ? CountryDto.fromJson(json['countryDto']) : null;
    _stateDto = json['stateDto'] != null ? StateDto.fromJson(json['stateDto']) : null;
  }
  int _addressId;
  int _cityId;
  int _stateId;
  int _countryId;
  String _houseNo;
  String _location;
  String _geoLocation;
  String _latitude;
  String _longitude;
  CityDto _cityDto;
  CountryDto _countryDto;
  StateDto _stateDto;

  int get addressId => _addressId;
  int get cityId => _cityId;
  int get stateId => _stateId;
  int get countryId => _countryId;
  String get houseNo => _houseNo;
  String get location => _location;
  String get geoLocation => _geoLocation;
  String get latitude => _latitude;
  String get longitude => _longitude;
  CityDto get cityDto => _cityDto;
  CountryDto get countryDto => _countryDto;
  StateDto get stateDto => _stateDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressId'] = _addressId;
    map['cityId'] = _cityId;
    map['stateId'] = _stateId;
    map['countryId'] = _countryId;
    map['houseNo'] = _houseNo;
    map['location'] = _location;
    map['geoLocation'] = _geoLocation;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    if (_cityDto != null) {
      map['cityDto'] = _cityDto?.toJson();
    }
    if (_countryDto != null) {
      map['countryDto'] = _countryDto?.toJson();
    }
    if (_stateDto != null) {
      map['stateDto'] = _stateDto?.toJson();
    }
    return map;
  }

}

/// $id : "9"
/// stateId : 10
/// name : "Doha"
/// countryId : 2
/// recordStatus : 0
/// countryDto : null
/// cityDto : null
/// nearByStatesDto : null

class StateDto {
  StateDto({
      int stateId,
      String name,
      int countryId,
      int recordStatus,
      dynamic countryDto, 
      dynamic cityDto, 
      dynamic nearByStatesDto,}){
    _stateId = stateId;
    _name = name;
    _countryId = countryId;
    _recordStatus = recordStatus;
    _countryDto = countryDto;
    _cityDto = cityDto;
    _nearByStatesDto = nearByStatesDto;
}

  StateDto.fromJson(dynamic json) {
    _stateId = json['stateId'];
    _name = json['name'];
    _countryId = json['countryId'];
    _recordStatus = json['recordStatus'];
    _countryDto = json['countryDto'];
    _cityDto = json['cityDto'];
    _nearByStatesDto = json['nearByStatesDto'];
  }
  int _stateId;
  String _name;
  int _countryId;
  int _recordStatus;
  dynamic _countryDto;
  dynamic _cityDto;
  dynamic _nearByStatesDto;

  int get stateId => _stateId;
  String get name => _name;
  int get countryId => _countryId;
  int get recordStatus => _recordStatus;
  dynamic get countryDto => _countryDto;
  dynamic get cityDto => _cityDto;
  dynamic get nearByStatesDto => _nearByStatesDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stateId'] = _stateId;
    map['name'] = _name;
    map['countryId'] = _countryId;
    map['recordStatus'] = _recordStatus;
    map['countryDto'] = _countryDto;
    map['cityDto'] = _cityDto;
    map['nearByStatesDto'] = _nearByStatesDto;
    return map;
  }

}

/// $id : "8"
/// countryId : 2
/// name : "Qatar"
/// recordStatus : 0
/// currencyId : 0
/// currencyDto : null

class CountryDto {
  CountryDto({
      int countryId,
      String name,
      int recordStatus,
      int currencyId,
      dynamic currencyDto,}){
    _countryId = countryId;
    _name = name;
    _recordStatus = recordStatus;
    _currencyId = currencyId;
    _currencyDto = currencyDto;
}

  CountryDto.fromJson(dynamic json) {
    _countryId = json['countryId'];
    _name = json['name'];
    _recordStatus = json['recordStatus'];
    _currencyId = json['currencyId'];
    _currencyDto = json['currencyDto'];
  }
  int _countryId;
  String _name;
  int _recordStatus;
  int _currencyId;
  dynamic _currencyDto;

  int get countryId => _countryId;
  String get name => _name;
  int get recordStatus => _recordStatus;
  int get currencyId => _currencyId;
  dynamic get currencyDto => _currencyDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countryId'] = _countryId;
    map['name'] = _name;
    map['recordStatus'] = _recordStatus;
    map['currencyId'] = _currencyId;
    map['currencyDto'] = _currencyDto;
    return map;
  }

}

/// $id : "7"
/// cityId : 7
/// name : "Al Bidda"
/// stateId : 10
/// recordStatus : 0
/// stateDto : null

class CityDto {
  CityDto({
      int cityId,
      String name,
      int stateId,
      int recordStatus,
      dynamic stateDto,}){
    _cityId = cityId;
    _name = name;
    _stateId = stateId;
    _recordStatus = recordStatus;
    _stateDto = stateDto;
}

  CityDto.fromJson(dynamic json) {
    _cityId = json['cityId'];
    _name = json['name'];
    _stateId = json['stateId'];
    _recordStatus = json['recordStatus'];
    _stateDto = json['stateDto'];
  }
  int _cityId;
  String _name;
  int _stateId;
  int _recordStatus;
  dynamic _stateDto;

  int get cityId => _cityId;
  String get name => _name;
  int get stateId => _stateId;
  int get recordStatus => _recordStatus;
  dynamic get stateDto => _stateDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cityId'] = _cityId;
    map['name'] = _name;
    map['stateId'] = _stateId;
    map['recordStatus'] = _recordStatus;
    map['stateDto'] = _stateDto;
    return map;
  }

}

/// $id : "4"
/// contactId : 16
/// mobileNumber : "0496828099"
/// mobileNumber1 : null
/// mobileNumber2 : null
/// emailAddress : "hareez@aspiromtechnologies.com"
/// landLineNumber : null
/// landLineNumber1 : null
/// landLineNumber2 : null
/// website : null
/// customerDto : null

class ContactDto {
  ContactDto({
      int contactId,
      String mobileNumber,
      dynamic mobileNumber1, 
      dynamic mobileNumber2, 
      String emailAddress,
      dynamic landLineNumber, 
      dynamic landLineNumber1, 
      dynamic landLineNumber2, 
      dynamic website, 
      dynamic customerDto,}){
    _contactId = contactId;
    _mobileNumber = mobileNumber;
    _mobileNumber1 = mobileNumber1;
    _mobileNumber2 = mobileNumber2;
    _emailAddress = emailAddress;
    _landLineNumber = landLineNumber;
    _landLineNumber1 = landLineNumber1;
    _landLineNumber2 = landLineNumber2;
    _website = website;
    _customerDto = customerDto;
}

  ContactDto.fromJson(dynamic json) {
    _contactId = json['contactId'];
    _mobileNumber = json['mobileNumber'];
    _mobileNumber1 = json['mobileNumber1'];
    _mobileNumber2 = json['mobileNumber2'];
    _emailAddress = json['emailAddress'];
    _landLineNumber = json['landLineNumber'];
    _landLineNumber1 = json['landLineNumber1'];
    _landLineNumber2 = json['landLineNumber2'];
    _website = json['website'];
    _customerDto = json['customerDto'];
  }
  int _contactId;
  String _mobileNumber;
  dynamic _mobileNumber1;
  dynamic _mobileNumber2;
  String _emailAddress;
  dynamic _landLineNumber;
  dynamic _landLineNumber1;
  dynamic _landLineNumber2;
  dynamic _website;
  dynamic _customerDto;

  int get contactId => _contactId;
  String get mobileNumber => _mobileNumber;
  dynamic get mobileNumber1 => _mobileNumber1;
  dynamic get mobileNumber2 => _mobileNumber2;
  String get emailAddress => _emailAddress;
  dynamic get landLineNumber => _landLineNumber;
  dynamic get landLineNumber1 => _landLineNumber1;
  dynamic get landLineNumber2 => _landLineNumber2;
  dynamic get website => _website;
  dynamic get customerDto => _customerDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactId'] = _contactId;
    map['mobileNumber'] = _mobileNumber;
    map['mobileNumber1'] = _mobileNumber1;
    map['mobileNumber2'] = _mobileNumber2;
    map['emailAddress'] = _emailAddress;
    map['landLineNumber'] = _landLineNumber;
    map['landLineNumber1'] = _landLineNumber1;
    map['landLineNumber2'] = _landLineNumber2;
    map['website'] = _website;
    map['customerDto'] = _customerDto;
    return map;
  }

}

/// $id : "3"
/// accountId : 14
/// passwordHash : null
/// passwordSalt : null
/// authCode : null
/// currentPassword : null

class AccountDto {
  AccountDto({
      int accountId,
      dynamic passwordHash, 
      dynamic passwordSalt, 
      dynamic authCode, 
      dynamic currentPassword,}){
    _accountId = accountId;
    _passwordHash = passwordHash;
    _passwordSalt = passwordSalt;
    _authCode = authCode;
    _currentPassword = currentPassword;
}

  AccountDto.fromJson(dynamic json) {
    _accountId = json['accountId'];
    _passwordHash = json['passwordHash'];
    _passwordSalt = json['passwordSalt'];
    _authCode = json['authCode'];
    _currentPassword = json['currentPassword'];
  }
  int _accountId;
  dynamic _passwordHash;
  dynamic _passwordSalt;
  dynamic _authCode;
  dynamic _currentPassword;

  int get accountId => _accountId;
  dynamic get passwordHash => _passwordHash;
  dynamic get passwordSalt => _passwordSalt;
  dynamic get authCode => _authCode;
  dynamic get currentPassword => _currentPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accountId'] = _accountId;
    map['passwordHash'] = _passwordHash;
    map['passwordSalt'] = _passwordSalt;
    map['authCode'] = _authCode;
    map['currentPassword'] = _currentPassword;
    return map;
  }

}