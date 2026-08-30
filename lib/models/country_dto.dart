class CountryDto {
  CountryDto({
      this.countryId, 
      this.name, 
      this.recordStatus, 
      this.currencyId, 
      this.currencyDto,});

  CountryDto.fromJson(dynamic json) {
    countryId = json['countryId'];
    name = json['name'];
    recordStatus = json['recordStatus'];
    currencyId = json['currencyId'];
    currencyDto = json['currencyDto'];
  }
  int countryId;
  String name;
  int recordStatus;
  int currencyId;
  dynamic currencyDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countryId'] = countryId;
    map['name'] = name;
    map['recordStatus'] = recordStatus;
    map['currencyId'] = currencyId;
    map['currencyDto'] = currencyDto;
    return map;
  }

}