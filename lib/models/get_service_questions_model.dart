import 'dart:convert';

List<GetServiceQuestionsModel> getServiceQuestionsModelFromJson(String str) => List<GetServiceQuestionsModel>.from(json.decode(str).map((x) => GetServiceQuestionsModel.fromJson(x)));

String getServiceQuestionsModelToJson(List<GetServiceQuestionsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetServiceQuestionsModel {
  GetServiceQuestionsModel({
    this.id,
    this.attributeId,
    this.moduleId,
    this.name,
    this.styleClass,
    this.description,
    this.minCostValue,
    this.maxCostValue,
    this.inputType,
    this.imagePath,
    this.base64Image,
    this.displayPosition,
    this.defaultValue,
    this.createdOn,
    this.recordStatus,
    this.usageOrderCount,
    this.moduleDto,
    this.attributeQuestionDtoList,
    this.serviceCompanyAttributeDto,
    this.serviceOrderItemAnswerDtoList,
    this.serviceCompanyId,
    this.serviceCompanyModuleId,
    this.serviceCompanyBranchId,
    this.isChecked,
    this.isNewArrivalin5Days,
  });

  String id;
  int attributeId;
  int moduleId;
  String name;
  dynamic styleClass;
  String description;
  dynamic minCostValue;
  dynamic maxCostValue;
  int inputType;
  String imagePath;
  dynamic base64Image;
  int displayPosition;
  dynamic defaultValue;
  DateTime createdOn;
  int recordStatus;
  int usageOrderCount;
  dynamic moduleDto;
  List<AttributeQuestionDtoList> attributeQuestionDtoList;
  dynamic serviceCompanyAttributeDto;
  dynamic serviceOrderItemAnswerDtoList;
  int serviceCompanyId;
  int serviceCompanyModuleId;
  int serviceCompanyBranchId;
  bool isChecked;
  bool isNewArrivalin5Days;

  factory GetServiceQuestionsModel.fromJson(Map<String, dynamic> json) => GetServiceQuestionsModel(
    id: json["\u0024id"],
    attributeId: json["attributeId"],
    moduleId: json["moduleId"],
    name: json["name"],
    styleClass: json["styleClass"],
    description: json["description"],
    minCostValue: json["minCostValue"],
    maxCostValue: json["maxCostValue"],
    inputType: json["inputType"],
    imagePath: json["imagePath"],
    base64Image: json["base64Image"],
    displayPosition: json["displayPosition"],
    defaultValue: json["defaultValue"],
    createdOn: DateTime.parse(json["createdOn"]),
    recordStatus: json["recordStatus"],
    usageOrderCount: json["usageOrderCount"],
    moduleDto: json["moduleDto"],
    attributeQuestionDtoList: List<AttributeQuestionDtoList>.from(json["attributeQuestionDtoList"].map((x) => AttributeQuestionDtoList.fromJson(x))),
    serviceCompanyAttributeDto: json["serviceCompanyAttributeDto"],
    serviceOrderItemAnswerDtoList: json["serviceOrderItemAnswerDtoList"],
    serviceCompanyId: json["serviceCompanyId"],
    serviceCompanyModuleId: json["serviceCompanyModuleId"],
    serviceCompanyBranchId: json["serviceCompanyBranchId"],
    isChecked: json["isChecked"],
    isNewArrivalin5Days: json["isNewArrivalin5Days"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "attributeId": attributeId,
    "moduleId": moduleId,
    "name": name,
    "styleClass": styleClass,
    "description": description,
    "minCostValue": minCostValue,
    "maxCostValue": maxCostValue,
    "inputType": inputType,
    "imagePath": imagePath,
    "base64Image": base64Image,
    "displayPosition": displayPosition,
    "defaultValue": defaultValue,
    "createdOn": createdOn.toIso8601String(),
    "recordStatus": recordStatus,
    "usageOrderCount": usageOrderCount,
    "moduleDto": moduleDto,
    "attributeQuestionDtoList": List<dynamic>.from(attributeQuestionDtoList.map((x) => x.toJson())),
    "serviceCompanyAttributeDto": serviceCompanyAttributeDto,
    "serviceOrderItemAnswerDtoList": serviceOrderItemAnswerDtoList,
    "serviceCompanyId": serviceCompanyId,
    "serviceCompanyModuleId": serviceCompanyModuleId,
    "serviceCompanyBranchId": serviceCompanyBranchId,
    "isChecked": isChecked,
    "isNewArrivalin5Days": isNewArrivalin5Days,
  };
}

class AttributeQuestionDtoList {
  AttributeQuestionDtoList({
    this.id,
    this.attributeQuestionId,
    this.attributeId,
    this.description,
    this.inputType,
    this.recordStatus,
    this.attributeDto,
    this.attributeOptionDtoList,
    this.serviceOrderItemAnswerDto,
  });

  String id;
  int attributeQuestionId;
  int attributeId;
  String description;
  int inputType;
  int recordStatus;
  dynamic attributeDto;
  List<AttributeOptionDtoList> attributeOptionDtoList;
  dynamic serviceOrderItemAnswerDto;

  factory AttributeQuestionDtoList.fromJson(Map<String, dynamic> json) => AttributeQuestionDtoList(
    id: json["\u0024id"],
    attributeQuestionId: json["attributeQuestionId"],
    attributeId: json["attributeId"],
    description: json["description"],
    inputType: json["inputType"],
    recordStatus: json["recordStatus"],
    attributeDto: json["attributeDto"],
    attributeOptionDtoList: List<AttributeOptionDtoList>.from(json["attributeOptionDtoList"].map((x) => AttributeOptionDtoList.fromJson(x))),
    serviceOrderItemAnswerDto: json["serviceOrderItemAnswerDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "attributeQuestionId": attributeQuestionId,
    "attributeId": attributeId,
    "description": description,
    "inputType": inputType,
    "recordStatus": recordStatus,
    "attributeDto": attributeDto,
    "attributeOptionDtoList": List<dynamic>.from(attributeOptionDtoList.map((x) => x.toJson())),
    "serviceOrderItemAnswerDto": serviceOrderItemAnswerDto,
  };
}

class AttributeOptionDtoList {
  AttributeOptionDtoList({
    this.id,
    this.attributeOptionId,
    this.attributeQuestionId,
    this.name,
    this.description,
    this.recordStatus,
    this.isDefault,
    this.attributeDto,
  });

  String id;
  int attributeOptionId;
  int attributeQuestionId;
  String name;
  String description;
  int recordStatus;
  bool isDefault;
  dynamic attributeDto;

  factory AttributeOptionDtoList.fromJson(Map<String, dynamic> json) => AttributeOptionDtoList(
    id: json["\u0024id"],
    attributeOptionId: json["attributeOptionId"],
    attributeQuestionId: json["attributeQuestionId"],
    name: json["name"],
    description: json["description"],
    recordStatus: json["recordStatus"],
    isDefault: json["isDefault"],
    attributeDto: json["attributeDto"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "attributeOptionId": attributeOptionId,
    "attributeQuestionId": attributeQuestionId,
    "name": name,
    "description": description,
    "recordStatus": recordStatus,
    "isDefault": isDefault,
    "attributeDto": attributeDto,
  };
}
