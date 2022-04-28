import 'dart:convert';

List<ResignationTerminationModel> resignationTerminationModelFromJson(
        String str) =>
    List<ResignationTerminationModel>.from(
        json.decode(str).map((x) => ResignationTerminationModel.fromJson(x)));

String resignationTerminationModelToJson(
        List<ResignationTerminationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResignationTerminationModel {
  ResignationTerminationModel({
    this.id,
    this.serviceNo,
    this.subject,
    this.resignationTerminationDate,
    this.lastWorkingDate,
    this.serviceStatus,
    this.clearanceForm,
    this.endOfService,
    this.displayName,
    this.reason,
    this.comment,
    this.userId,
  });

  final String? id;
  final String? serviceNo;
  final String? subject;
  final DateTime? resignationTerminationDate;
  final DateTime? lastWorkingDate;
  final String? serviceStatus;
  final dynamic clearanceForm;
  final DateTime? endOfService;
  final String? displayName;
  final dynamic reason;
  final dynamic comment;
  final dynamic userId;

  factory ResignationTerminationModel.fromJson(Map<String, dynamic> json) =>
      ResignationTerminationModel(
        id: json["Id"] == null ? null : json["Id"],
        serviceNo: json["ServiceNo"] == null ? null : json["ServiceNo"],
        subject: json["Subject"] == null ? null : json["Subject"],
        resignationTerminationDate: json["ResignationTerminationDate"] == null
            ? null
            : DateTime.parse(json["ResignationTerminationDate"]),
        lastWorkingDate: json["LastWorkingDate"] == null
            ? null
            : DateTime.parse(json["LastWorkingDate"]),
        serviceStatus:
            json["ServiceStatus"] == null ? null : json["ServiceStatus"],
        clearanceForm: json["ClearanceForm"],
        endOfService: json["EndOfService"] == null
            ? null
            : DateTime.parse(json["EndOfService"]),
        displayName: json["DisplayName"] == null ? null : json["DisplayName"],
        reason: json["Reason"],
        comment: json["Comment"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "ServiceNo": serviceNo == null ? null : serviceNo,
        "Subject": subject == null ? null : subject,
        "ResignationTerminationDate": resignationTerminationDate == null
            ? null
            : resignationTerminationDate?.toIso8601String(),
        "LastWorkingDate":
            lastWorkingDate == null ? null : lastWorkingDate?.toIso8601String(),
        "ServiceStatus": serviceStatus == null ? null : serviceStatus,
        "ClearanceForm": clearanceForm,
        "EndOfService":
            endOfService == null ? null : endOfService?.toIso8601String(),
        "DisplayName": displayName == null ? null : displayName,
        "Reason": reason,
        "Comment": comment,
        "UserId": userId,
      };
}
