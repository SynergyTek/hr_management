import 'dart:convert';

List<NoteSharedDataModel> noteSharedDataModelFromJson(String str) => List<NoteSharedDataModel>.from(json.decode(str).map((x) => NoteSharedDataModel.fromJson(x)));

String noteSharedDataModelToJson(List<NoteSharedDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoteSharedDataModel {
    NoteSharedDataModel({
        this.name,
        this.photoId,
        this.type,
        this.isSharingEnabled,
        this.noteSharedWithTypeId,
        this.noteSharedWithType,
        this.sharedWithUserId,
        this.sharedWithUser,
        this.sharedWithTeamId,
        this.sharedWithTeam,
        this.sharedByUserId,
        this.sharedBy,
        this.ntsNoteId,
        this.ntsNote,
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
    dynamic noteSharedWithTypeId;
    dynamic noteSharedWithType;
    dynamic sharedWithUserId;
    dynamic sharedWithUser;
    dynamic sharedWithTeamId;
    dynamic sharedWithTeam;
    dynamic sharedByUserId;
    dynamic sharedBy;
    dynamic ntsNoteId;
    dynamic ntsNote;
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

    factory NoteSharedDataModel.fromJson(Map<String, dynamic> json) => NoteSharedDataModel(
        name: json["Name"],
        photoId: json["PhotoId"],
        type: json["Type"],
        isSharingEnabled: json["IsSharingEnabled"],
        noteSharedWithTypeId: json["NoteSharedWithTypeId"],
        noteSharedWithType: json["NoteSharedWithType"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedWithUser: json["SharedWithUser"],
        sharedWithTeamId: json["SharedWithTeamId"],
        sharedWithTeam: json["SharedWithTeam"],
        sharedByUserId: json["SharedByUserId"],
        sharedBy: json["SharedBy"],
        ntsNoteId: json["NtsNoteId"],
        ntsNote: json["NtsNote"],
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
        "NoteSharedWithTypeId": noteSharedWithTypeId,
        "NoteSharedWithType": noteSharedWithType,
        "SharedWithUserId": sharedWithUserId,
        "SharedWithUser": sharedWithUser,
        "SharedWithTeamId": sharedWithTeamId,
        "SharedWithTeam": sharedWithTeam,
        "SharedByUserId": sharedByUserId,
        "SharedBy": sharedBy,
        "NtsNoteId": ntsNoteId,
        "NtsNote": ntsNote,
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
