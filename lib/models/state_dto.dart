class StateDto {
  StateDto({
      this.stateId, 
      this.name, 
      this.countryId, 
      this.recordStatus, 
      this.countryDto, 
      this.cityDto, 
      this.nearByStatesDto,});

  StateDto.fromJson(dynamic json) {
    stateId = json['stateId'];
    name = json['name'];
    countryId = json['countryId'];
    recordStatus = json['recordStatus'];
    countryDto = json['countryDto'];
    cityDto = json['cityDto'];
    nearByStatesDto = json['nearByStatesDto'];
  }
  int stateId;
  String name;
  int countryId;
  int recordStatus;
  dynamic countryDto;
  dynamic cityDto;
  dynamic nearByStatesDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stateId'] = stateId;
    map['name'] = name;
    map['countryId'] = countryId;
    map['recordStatus'] = recordStatus;
    map['countryDto'] = countryDto;
    map['cityDto'] = cityDto;
    map['nearByStatesDto'] = nearByStatesDto;
    return map;
  }

}