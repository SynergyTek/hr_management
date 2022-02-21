// To parse this JSON data, do
//
//     final readTeamDataModel = readTeamDataModelFromJson(jsonString);

import 'dart:convert';

List<ReadTeamDataModel> readTeamDataModelFromJson(String str) =>
    List<ReadTeamDataModel>.from(
        json.decode(str).map((x) => ReadTeamDataModel.fromJson(x)));

String readTeamDataModelToJson(List<ReadTeamDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadTeamDataModel {
  ReadTeamDataModel({
    this.dataAction,
    this.userIds,
    this.teamOwnerId,
    this.isTeamOwner,
    this.userName,
    this.name,
    this.description,
    this.code,
    this.logoId,
    this.groupCode,
    this.teamWorkAssignmentType,
    this.teamType,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastUpdatedDate,
    this.lastUpdatedBy,
    this.isDeleted,
    this.sequenceOrder,
    this.companyId,
    this.legalEntityId,
    this.status,
    this.versionNo,
    this.portalId,
  });

  int? dataAction;
  dynamic userIds;
  dynamic teamOwnerId;
  bool? isTeamOwner;
  dynamic userName;
  String? name;
  String? description;
  String? code;
  dynamic logoId;
  dynamic groupCode;
  int? teamWorkAssignmentType;
  int? teamType;
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  dynamic sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? status;
  int? versionNo;
  String? portalId;

  factory ReadTeamDataModel.fromJson(Map<String, dynamic> json) =>
      ReadTeamDataModel(
        dataAction: json["DataAction"],
        userIds: json["UserIds"],
        teamOwnerId: json["TeamOwnerId"],
        isTeamOwner: json["IsTeamOwner"],
        userName: json["UserName"],
        name: json["Name"],
        description: json["Description"] == null ? null : json["Description"],
        code: json["Code"] == null ? null : json["Code"],
        logoId: json["LogoId"],
        groupCode: json["GroupCode"],
        teamWorkAssignmentType: json["TeamWorkAssignmentType"],
        teamType: json["TeamType"],
        id: json["Id"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        legalEntityId:
            json["LegalEntityId"] == null ? null : json["LegalEntityId"],
        status: json["Status"],
        versionNo: json["VersionNo"],
        portalId: json["PortalId"] == null ? null : json["PortalId"],
      );

  Map<String, dynamic> toJson() => {
        "DataAction": dataAction,
        "UserIds": userIds,
        "TeamOwnerId": teamOwnerId,
        "IsTeamOwner": isTeamOwner,
        "UserName": userName,
        "Name": name,
        "Description": description == null ? null : description,
        "Code": code == null ? null : code,
        "LogoId": logoId,
        "GroupCode": groupCode,
        "TeamWorkAssignmentType": teamWorkAssignmentType,
        "TeamType": teamType,
        "Id": id,
        "CreatedDate": createdDate!.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate!.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId == null ? null : legalEntityId,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId == null ? null : portalId,
      };
}
