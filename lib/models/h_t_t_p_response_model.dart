/// $id : "1"
/// statusCode : 200
/// statusDescription : null

class HTTPResponseModel {
  HTTPResponseModel({
      int statusCode,
      dynamic statusDescription,}){
    _statusCode = statusCode;
    _statusDescription = statusDescription;
}

  HTTPResponseModel.fromJson(dynamic json) {
    // _statusCode = json['statusCode'];
    // _statusDescription = json['statusDescription'];
  }
  int _statusCode;
  dynamic _statusDescription;

  int get statusCode => _statusCode;
  dynamic get statusDescription => _statusDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['statusDescription'] = _statusDescription;
    return map;
  }

}