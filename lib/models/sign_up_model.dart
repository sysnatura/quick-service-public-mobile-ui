/// firstName : "test"
/// lastName : "user"
/// contactDto : {"mobileNumber":"0741741768","emailAddress":"testing@gmail.com"}
/// password : "Passt@123"
/// customerAddressDtoList : null
/// accountDto : {"passwordHash":"Pass@123"}

class SignUpModel {
  SignUpModel({
      String firstName,
      String lastName,
      ContactDto contactDto,
      String password,
      dynamic customerAddressDtoList, 
      AccountDto accountDto,}){
    _firstName = firstName;
    _lastName = lastName;
    _contactDto = contactDto;
    _password = password;
    _customerAddressDtoList = customerAddressDtoList;
    _accountDto = accountDto;
}

  SignUpModel.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _contactDto = json['contactDto'] != null ? ContactDto.fromJson(json['contactDto']) : null;
    _password = json['password'];
    _customerAddressDtoList = json['customerAddressDtoList'];
    _accountDto = json['accountDto'] != null ? AccountDto.fromJson(json['accountDto']) : null;
  }
  String _firstName;
  String _lastName;
  ContactDto _contactDto;
  String _password;
  dynamic _customerAddressDtoList;
  AccountDto _accountDto;

  String get firstName => _firstName;
  String get lastName => _lastName;
  ContactDto get contactDto => _contactDto;
  String get password => _password;
  dynamic get customerAddressDtoList => _customerAddressDtoList;
  AccountDto get accountDto => _accountDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    if (_contactDto != null) {
      map['contactDto'] = _contactDto?.toJson();
    }
    map['password'] = _password;
    map['customerAddressDtoList'] = _customerAddressDtoList;
    if (_accountDto != null) {
      map['accountDto'] = _accountDto?.toJson();
    }
    return map;
  }

}

/// passwordHash : "Pass@123"

class AccountDto {
  AccountDto({
      String passwordHash,}){
    _passwordHash = passwordHash;
}

  AccountDto.fromJson(dynamic json) {
    _passwordHash = json['passwordHash'];
  }
  String _passwordHash;

  String get passwordHash => _passwordHash;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['passwordHash'] = _passwordHash;
    return map;
  }

}

/// mobileNumber : "0741741768"
/// emailAddress : "testing@gmail.com"

class ContactDto {
  ContactDto({
      String mobileNumber,
      String emailAddress,}){
    _mobileNumber = mobileNumber;
    _emailAddress = emailAddress;
}

  ContactDto.fromJson(dynamic json) {
    _mobileNumber = json['mobileNumber'];
    _emailAddress = json['emailAddress'];
  }
  String _mobileNumber;
  String _emailAddress;

  String get mobileNumber => _mobileNumber;
  String get emailAddress => _emailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobileNumber'] = _mobileNumber;
    map['emailAddress'] = _emailAddress;
    return map;
  }

}