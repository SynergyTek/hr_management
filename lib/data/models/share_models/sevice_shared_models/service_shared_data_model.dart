// To parse this JSON data, do
//
//     final serviceSharedDataModel = serviceSharedDataModelFromJson(jsonString);

import 'dart:convert';

List<ServiceSharedDataModel> serviceSharedDataModelFromJson(String str) => List<ServiceSharedDataModel>.from(json.decode(str).map((x) => ServiceSharedDataModel.fromJson(x)));

String serviceSharedDataModelToJson(List<ServiceSharedDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceSharedDataModel {
    ServiceSharedDataModel({
        this.name,
        this.photoId,
        this.type,
        this.isSharingEnabled,
        this.serviceSharedWithTypeId,
        this.serviceSharedWithType,
        this.sharedWithUserId,
        this.sharedWithUser,
        this.sharedWithTeamId,
        this.sharedWithTeam,
        this.sharedByUserId,
        this.sharedBy,
        this.ntsServiceId,
        this.ntsService,
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

    String name;
    dynamic photoId;
    String type;
    bool isSharingEnabled;
    dynamic serviceSharedWithTypeId;
    dynamic serviceSharedWithType;
    dynamic sharedWithUserId;
    dynamic sharedWithUser;
    dynamic sharedWithTeamId;
    dynamic sharedWithTeam;
    dynamic sharedByUserId;
    dynamic sharedBy;
    dynamic ntsServiceId;
    dynamic ntsService;
    DateTime sharedDate;
    String id;
    DateTime createdDate;
    dynamic createdBy;
    DateTime lastUpdatedDate;
    dynamic lastUpdatedBy;
    bool isDeleted;
    dynamic sequenceOrder;
    dynamic companyId;
    dynamic legalEntityId;
    int dataAction;
    int status;
    int versionNo;
    dynamic portalId;

    factory ServiceSharedDataModel.fromJson(Map<String, dynamic> json) => ServiceSharedDataModel(
        name: json["Name"],
        photoId: json["PhotoId"],
        type: json["Type"],
        isSharingEnabled: json["IsSharingEnabled"],
        serviceSharedWithTypeId: json["ServiceSharedWithTypeId"],
        serviceSharedWithType: json["ServiceSharedWithType"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedWithUser: json["SharedWithUser"],
        sharedWithTeamId: json["SharedWithTeamId"],
        sharedWithTeam: json["SharedWithTeam"],
        sharedByUserId: json["SharedByUserId"],
        sharedBy: json["SharedBy"],
        ntsServiceId: json["NtsServiceId"],
        ntsService: json["NtsService"],
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
        "ServiceSharedWithTypeId": serviceSharedWithTypeId,
        "ServiceSharedWithType": serviceSharedWithType,
        "SharedWithUserId": sharedWithUserId,
        "SharedWithUser": sharedWithUser,
        "SharedWithTeamId": sharedWithTeamId,
        "SharedWithTeam": sharedWithTeam,
        "SharedByUserId": sharedByUserId,
        "SharedBy": sharedBy,
        "NtsServiceId": ntsServiceId,
        "NtsService": ntsService,
        "SharedDate": sharedDate.toIso8601String(),
        "Id": id,
        "CreatedDate": createdDate.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate.toIso8601String(),
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
