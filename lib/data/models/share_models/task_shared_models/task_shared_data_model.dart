// To parse this JSON data, do
//
//     final taskSharedDataModel = taskSharedDataModelFromJson(jsonString);

import 'dart:convert';

List<TaskSharedDataModel> taskSharedDataModelFromJson(String str) => List<TaskSharedDataModel>.from(json.decode(str).map((x) => TaskSharedDataModel.fromJson(x)));

String taskSharedDataModelToJson(List<TaskSharedDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskSharedDataModel {
    TaskSharedDataModel({
        this.name,
        this.photoId,
        this.type,
        this.isSharingEnabled,
        this.taskSharedWithTypeId,
        this.taskSharedWithType,
        this.sharedWithUserId,
        this.sharedWithUser,
        this.sharedWithTeamId,
        this.sharedWithTeam,
        this.sharedByUserId,
        this.sharedBy,
        this.ntsTaskId,
        this.sharedDate,
        this.id,
        this.createdDate,
        this.createdBy,
        this.lastUpdatedDate,
        this.lastUpdatedBy,
        this.isDeleted,
        this.sequenceOrder,
        this.companyId,
        this.legalEntityId,
        this.dataAction,
        this.status,
        this.versionNo,
        this.portalId,
    });

    String? name;
    dynamic photoId;
    String? type;
    bool? isSharingEnabled;
    dynamic taskSharedWithTypeId;
    dynamic taskSharedWithType;
    dynamic sharedWithUserId;
    dynamic sharedWithUser;
    dynamic sharedWithTeamId;
    dynamic sharedWithTeam;
    dynamic sharedByUserId;
    dynamic sharedBy;
    dynamic ntsTaskId;
    DateTime? sharedDate;
    String? id;
    DateTime? createdDate;
    dynamic createdBy;
    DateTime? lastUpdatedDate;
    dynamic lastUpdatedBy;
    bool? isDeleted;
    dynamic sequenceOrder;
    dynamic companyId;
    dynamic legalEntityId;
    int? dataAction;
    int? status;
    int? versionNo;
    dynamic portalId;

    factory TaskSharedDataModel.fromJson(Map<String, dynamic> json) => TaskSharedDataModel(
        name: json["Name"],
        photoId: json["PhotoId"],
        type: json["Type"],
        isSharingEnabled: json["IsSharingEnabled"],
        taskSharedWithTypeId: json["TaskSharedWithTypeId"],
        taskSharedWithType: json["TaskSharedWithType"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedWithUser: json["SharedWithUser"],
        sharedWithTeamId: json["SharedWithTeamId"],
        sharedWithTeam: json["SharedWithTeam"],
        sharedByUserId: json["SharedByUserId"],
        sharedBy: json["SharedBy"],
        ntsTaskId: json["NtsTaskId"],
        sharedDate: DateTime.parse(json["SharedDate"]),
        id: json["Id"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        legalEntityId: json["LegalEntityId"],
        dataAction: json["DataAction"],
        status: json["Status"],
        versionNo: json["VersionNo"],
        portalId: json["PortalId"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "PhotoId": photoId,
        "Type": type,
        "IsSharingEnabled": isSharingEnabled,
        "TaskSharedWithTypeId": taskSharedWithTypeId,
        "TaskSharedWithType": taskSharedWithType,
        "SharedWithUserId": sharedWithUserId,
        "SharedWithUser": sharedWithUser,
        "SharedWithTeamId": sharedWithTeamId,
        "SharedWithTeam": sharedWithTeam,
        "SharedByUserId": sharedByUserId,
        "SharedBy": sharedBy,
        "NtsTaskId": ntsTaskId,
        "SharedDate": sharedDate!.toIso8601String(),
        "Id": id,
        "CreatedDate": createdDate!.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate!.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId,
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId,
    };
}
