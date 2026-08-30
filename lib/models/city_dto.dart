class CityDto {
  CityDto({
      this.cityId, 
      this.name, 
      this.stateId, 
      this.recordStatus, 
      this.stateDto,});

  CityDto.fromJson(dynamic json) {
    cityId = json['cityId'];
    name = json['name'];
    stateId = json['stateId'];
    recordStatus = json['recordStatus'];
    stateDto = json['stateDto'];
  }
  int cityId;
  String name;
  int stateId;
  int recordStatus;
  dynamic stateDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cityId'] = cityId;
    map['name'] = name;
    map['stateId'] = stateId;
    map['recordStatus'] = recordStatus;
    map['stateDto'] = stateDto;
    return map;
  }

}