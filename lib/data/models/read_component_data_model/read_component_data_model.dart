import 'dart:convert';

List<ReadComponentResultDataModel> readComponentResultDataModelFromJson(
        String str) =>
    List<ReadComponentResultDataModel>.from(
        json.decode(str).map((x) => ReadComponentResultDataModel.fromJson(x)));

String readComponentResultDataModelToJson(
        List<ReadComponentResultDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadComponentResultDataModel {
  ReadComponentResultDataModel({
    this.componentStatusName,
    this.assignee,
    this.assigneeId,
    this.assigneePhotoId,
    this.email,
    this.componentStatusCode,
    this.stageId,
    this.stageName,
    this.componentType,
    this.processDesignResultId,
    this.processDesignResult,
    this.processDesignId,
    this.processDesign,
    this.componentId,
    this.component,
    this.ntsServiceId,
    this.ntsService,
    this.ntsTaskId,
    this.ntsTask,
    this.componentStatusId,
    this.componentStatus,
    this.startDate,
    this.endDate,
    this.error,
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

  String? componentStatusName;
  String? assignee;
  String? assigneeId;
  dynamic assigneePhotoId;
  String? email;
  String? componentStatusCode;
  dynamic stageId;
  dynamic stageName;
  int? componentType;
  String? processDesignResultId;
  dynamic processDesignResult;
  String? processDesignId;
  dynamic processDesign;
  String? componentId;
  dynamic component;
  String? ntsServiceId;
  dynamic ntsService;
  String? ntsTaskId;
  dynamic ntsTask;
  String? componentStatusId;
  dynamic componentStatus;
  DateTime? startDate;
  DateTime? endDate;
  dynamic error;
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  dynamic sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  factory ReadComponentResultDataModel.fromJson(Map<String, dynamic> json) =>
      ReadComponentResultDataModel(
        componentStatusName: json["ComponentStatusName"],
        assignee: json["Assignee"] == null ? null : json["Assignee"],
        assigneeId: json["AssigneeId"] == null ? null : json["AssigneeId"],
        assigneePhotoId: json["AssigneePhotoId"],
        email: json["Email"] == null ? null : json["Email"],
        componentStatusCode: json["ComponentStatusCode"],
        stageId: json["StageId"],
        stageName: json["StageName"],
        componentType: json["ComponentType"],
        processDesignResultId: json["ProcessDesignResultId"],
        processDesignResult: json["ProcessDesignResult"],
        processDesignId: json["ProcessDesignId"],
        processDesign: json["ProcessDesign"],
        componentId: json["ComponentId"],
        component: json["Component"],
        ntsServiceId: json["NtsServiceId"],
        ntsService: json["NtsService"],
        ntsTaskId: json["NtsTaskId"] == null ? null : json["NtsTaskId"],
        ntsTask: json["NtsTask"],
        componentStatusId: json["ComponentStatusId"],
        componentStatus: json["ComponentStatus"],
        startDate: json["StartDate"] == null
            ? null
            : DateTime.parse(json["StartDate"]),
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
        error: json["Error"],
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
        "ComponentStatusName": componentStatusName,
        "Assignee": assignee == null ? null : assignee,
        "AssigneeId": assigneeId == null ? null : assigneeId,
        "AssigneePhotoId": assigneePhotoId,
        "Email": email == null ? null : email,
        "ComponentStatusCode": componentStatusCode,
        "StageId": stageId,
        "StageName": stageName,
        "ComponentType": componentType,
        "ProcessDesignResultId": processDesignResultId,
        "ProcessDesignResult": processDesignResult,
        "ProcessDesignId": processDesignId,
        "ProcessDesign": processDesign,
        "ComponentId": componentId,
        "Component": component,
        "NtsServiceId": ntsServiceId,
        "NtsService": ntsService,
        "NtsTaskId": ntsTaskId == null ? null : ntsTaskId,
        "NtsTask": ntsTask,
        "ComponentStatusId": componentStatusId,
        "ComponentStatus": componentStatus,
        "StartDate": startDate == null ? null : startDate!.toIso8601String(),
        "EndDate": endDate == null ? null : endDate!.toIso8601String(),
        "Error": error,
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
