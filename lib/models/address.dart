import 'city_dto.dart';
import 'country_dto.dart';
import 'state_dto.dart';

class Address {
  Address({
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
      this.stateDto,});

  Address.fromJson(dynamic json) {
    addressId = json['addressId'];
    cityId = json['cityId'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    houseNo = json['houseNo'];
    location = json['location'];
    geoLocation = json['geoLocation'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cityDto = json['cityDto'] != null ? CityDto.fromJson(json['cityDto']) : null;
    countryDto = json['countryDto'] != null ? CountryDto.fromJson(json['countryDto']) : null;
    stateDto = json['stateDto'] != null ? StateDto.fromJson(json['stateDto']) : null;
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressId'] = addressId;
    map['cityId'] = cityId;
    map['stateId'] = stateId;
    map['countryId'] = countryId;
    map['houseNo'] = houseNo;
    map['location'] = location;
    map['geoLocation'] = geoLocation;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    if (cityDto != null) {
      map['cityDto'] = cityDto?.toJson();
    }
    if (countryDto != null) {
      map['countryDto'] = countryDto?.toJson();
    }
    if (stateDto != null) {
      map['stateDto'] = stateDto?.toJson();
    }
    return map;
  }

}