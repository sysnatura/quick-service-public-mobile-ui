/// moduleId : 1
/// name : "Air Conditioner"
/// imagePath : "Image@08.24.31.157690.png"
/// base64Image : null
/// descriptionTitle : ""
/// description : ""
/// displayPosition : 2
/// haveReadMore : false
/// createdOn : "2017-09-12T12:59:30.627"
/// recordStatus : 0
/// currentCount : 0
/// percentage : 0.0
/// usageOrderCount : 42
/// attributeDtoList : null
/// moduleDescriptionDtoList : null
/// isChecked : false
/// isUrgentCapable : false


class ServiceCategoryModel {
  ServiceCategoryModel({
      int moduleId,
      String name,
      String imagePath,
      dynamic base64Image,
      String descriptionTitle,
      String description,
      int displayPosition,
      bool haveReadMore,
      String createdOn,
      int recordStatus,
      int currentCount,
      double percentage,
      int usageOrderCount,
      dynamic attributeDtoList,
      dynamic moduleDescriptionDtoList,
      bool isChecked,
      bool isUrgentCapable,}){
    _moduleId = moduleId;
    _name = name;
    _imagePath = imagePath;
    _base64Image = base64Image;
    _descriptionTitle = descriptionTitle;
    _description = description;
    _displayPosition = displayPosition;
    _haveReadMore = haveReadMore;
    _createdOn = createdOn;
    _recordStatus = recordStatus;
    _currentCount = currentCount;
    _percentage = percentage;
    _usageOrderCount = usageOrderCount;
    _attributeDtoList = attributeDtoList;
    _moduleDescriptionDtoList = moduleDescriptionDtoList;
    _isChecked = isChecked;
    _isUrgentCapable = isUrgentCapable;
}

  ServiceCategoryModel.fromJson(dynamic json) {
    _moduleId = json['moduleId'];
    _name = json['name'];
    _imagePath = json['imagePath'];
    _base64Image = json['base64Image'];
    _descriptionTitle = json['descriptionTitle'];
    _description = json['description'];
    _displayPosition = json['displayPosition'];
    _haveReadMore = json['haveReadMore'];
    _createdOn = json['createdOn'];
    _recordStatus = json['recordStatus'];
    _currentCount = json['currentCount'];
    _percentage = json['percentage'];
    _usageOrderCount = json['usageOrderCount'];
    _attributeDtoList = json['attributeDtoList'];
    _moduleDescriptionDtoList = json['moduleDescriptionDtoList'];
    _isChecked = json['isChecked'];
    _isUrgentCapable = json['isUrgentCapable'];
  }
  int _moduleId;
  String _name;
  String _imagePath;
  dynamic _base64Image;
  String _descriptionTitle;
  String _description;
  int _displayPosition;
  bool _haveReadMore;
  String _createdOn;
  int _recordStatus;
  int _currentCount;
  double _percentage;
  int _usageOrderCount;
  dynamic _attributeDtoList;
  dynamic _moduleDescriptionDtoList;
  bool _isChecked;
  bool _isUrgentCapable;

  int get moduleId => _moduleId;
  String get name => _name;
  String get imagePath => _imagePath;
  dynamic get base64Image => _base64Image;
  String get descriptionTitle => _descriptionTitle;
  String get description => _description;
  int get displayPosition => _displayPosition;
  bool get haveReadMore => _haveReadMore;
  String get createdOn => _createdOn;
  int get recordStatus => _recordStatus;
  int get currentCount => _currentCount;
  double get percentage => _percentage;
  int get usageOrderCount => _usageOrderCount;
  dynamic get attributeDtoList => _attributeDtoList;
  dynamic get moduleDescriptionDtoList => _moduleDescriptionDtoList;
  bool get isChecked => _isChecked;
  bool get isUrgentCapable => _isUrgentCapable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['moduleId'] = _moduleId;
    map['name'] = _name;
    map['imagePath'] = _imagePath;
    map['base64Image'] = _base64Image;
    map['descriptionTitle'] = _descriptionTitle;
    map['description'] = _description;
    map['displayPosition'] = _displayPosition;
    map['haveReadMore'] = _haveReadMore;
    map['createdOn'] = _createdOn;
    map['recordStatus'] = _recordStatus;
    map['currentCount'] = _currentCount;
    map['percentage'] = _percentage;
    map['usageOrderCount'] = _usageOrderCount;
    map['attributeDtoList'] = _attributeDtoList;
    map['moduleDescriptionDtoList'] = _moduleDescriptionDtoList;
    map['isChecked'] = _isChecked;
    map['isUrgentCapable'] = _isUrgentCapable;
    return map;
  }

}
