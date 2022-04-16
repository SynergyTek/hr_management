// To parse this JSON data, do
//
//     final misconductModel = misconductModelFromJson(jsonString);

import 'dart:convert';

List<MisconductModel> misconductModelFromJson(String str) =>
    List<MisconductModel>.from(
        json.decode(str).map((x) => MisconductModel.fromJson(x)));

String misconductModelToJson(List<MisconductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MisconductModel {
  MisconductModel({
    this.id,
    this.serviceNo,
    this.misconductTypeName,
    this.disciplinaryActionTakenName,
    this.misconductDate,
    this.serviceId,
    this.userId,
    this.status,
  });

  final String? id;
  final String? serviceNo;
  final String? misconductTypeName;
  final String? disciplinaryActionTakenName;
  final DateTime? misconductDate;
  final String? serviceId;
  final dynamic userId;
  final String? status;

  factory MisconductModel.fromJson(Map<String, dynamic> json) =>
      MisconductModel(
        id: json["Id"] == null ? null : json["Id"],
        serviceNo: json["ServiceNo"] == null ? null : json["ServiceNo"],
        misconductTypeName: json["MisconductTypeName"] == null
            ? null
            : json["MisconductTypeName"],
        disciplinaryActionTakenName: json["DisciplinaryActionTakenName"] == null
            ? null
            : json["DisciplinaryActionTakenName"],
        misconductDate: json["MisconductDate"] == null
            ? null
            : DateTime.parse(json["MisconductDate"]),
        serviceId: json["ServiceId"] == null ? null : json["ServiceId"],
        userId: json["UserId"],
        status: json["Status"] == null ? null : json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "ServiceNo": serviceNo == null ? null : serviceNo,
        "MisconductTypeName":
            misconductTypeName == null ? null : misconductTypeName,
        "DisciplinaryActionTakenName": disciplinaryActionTakenName == null
            ? null
            : disciplinaryActionTakenName,
        "MisconductDate":
            misconductDate == null ? null : misconductDate?.toIso8601String(),
        "ServiceId": serviceId == null ? null : serviceId,
        "UserId": userId,
        "Status": status == null ? null : status,
      };
}
