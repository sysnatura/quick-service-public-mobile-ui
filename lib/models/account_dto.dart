class AccountDto {
  AccountDto({
      this.accountId, 
      this.passwordHash, 
      this.passwordSalt, 
      this.authCode, 
      this.currentPassword,});

  AccountDto.fromJson(dynamic json) {
    accountId = json['accountId'];
    passwordHash = json['passwordHash'];
    passwordSalt = json['passwordSalt'];
    authCode = json['authCode'];
    currentPassword = json['currentPassword'];
  }
  int accountId;
  dynamic passwordHash;
  dynamic passwordSalt;
  dynamic authCode;
  dynamic currentPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accountId'] = accountId;
    map['passwordHash'] = passwordHash;
    map['passwordSalt'] = passwordSalt;
    map['authCode'] = authCode;
    map['currentPassword'] = currentPassword;
    return map;
  }

}