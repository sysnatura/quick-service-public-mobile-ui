// To parse this JSON data, do
//
//     final notificationPage = notificationPageFromJson(jsonString);

import 'dart:convert';

List<NotificationPage> notificationPageFromJson(String str) => List<NotificationPage>.from(json.decode(str).map((x) => NotificationPage.fromJson(x)));

String notificationPageToJson(List<NotificationPage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationPage {
  NotificationPage({
    this.id,
    this.notificationId,
    this.heading,
    this.details,
    this.notificationType,
    this.notificationPath,
    this.dueDate,
    this.createdDate,
    this.recordStatus,
    this.readStatus,
    this.branchId,
    this.userId,
    this.serviceCompanyId,
  });

  String id;
  int notificationId;
  String heading;
  String details;
  int notificationType;
  dynamic notificationPath;
  DateTime dueDate;
  DateTime createdDate;
  int recordStatus;
  int readStatus;
  dynamic branchId;
  int userId;
  dynamic serviceCompanyId;

  factory NotificationPage.fromJson(Map<String, dynamic> json) => NotificationPage(
    id: json["\u0024id"],
    notificationId: json["notificationId"],
    heading: json["heading"],
    details: json["details"],
    notificationType: json["notificationType"],
    notificationPath: json["notificationPath"],
    dueDate: DateTime.parse(json["dueDate"]),
    createdDate: DateTime.parse(json["createdDate"]),
    recordStatus: json["recordStatus"],
    readStatus: json["readStatus"],
    branchId: json["branchId"],
    userId: json["userId"],
    serviceCompanyId: json["serviceCompanyId"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "notificationId": notificationId,
    "heading": heading,
    "details": details,
    "notificationType": notificationType,
    "notificationPath": notificationPath,
    "dueDate": dueDate.toIso8601String(),
    "createdDate": createdDate.toIso8601String(),
    "recordStatus": recordStatus,
    "readStatus": readStatus,
    "branchId": branchId,
    "userId": userId,
    "serviceCompanyId": serviceCompanyId,
  };
}
