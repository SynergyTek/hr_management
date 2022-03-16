import 'dart:convert';

List<RequestTypeModel> requestTypeModelFromJson(String str) =>
    List<RequestTypeModel>.from(
        json.decode(str).map((x) => RequestTypeModel.fromJson(x)));

String requestTypeModelToJson(List<RequestTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestTypeModel {
  RequestTypeModel({
    this.templateCategoryName,
    this.importFileId,
    this.taskType,
    this.categoryCode,
    this.moduleCodes,
    this.iconFileId,
    this.templateColor,
    this.userId,
    this.type,
    this.prms,
    this.callBackMethodName,
    this.templateIds,
    this.categoryIds,
    this.templateCategoryType,
    this.actionName,
    this.controllerName,
    this.areaName,
    this.parameter,
    this.select,
    this.allBooks,
    this.portalNames,
    this.customIcon,
    this.name,
    this.displayName,
    this.code,
    this.description,
    this.templateCategoryId,
    this.templateCategory,
    this.templateStatus,
    this.templateType,
    this.tableMetadataId,
    this.tableMetadata,
    this.tableSelectionType,
    this.udfTemplateId,
    this.udfTemplate,
    this.udfTableMetadataId,
    this.udfTableMetadata,
    this.json,
    this.printJson,
    this.moduleId,
    this.module,
    this.domainId,
    this.domain,
    this.subDomainId,
    this.subDomain,
    this.allowedTagCategories,
    this.templateStageId,
    this.templateStage,
    this.templateStepId,
    this.templateStep,
    this.workFlowTemplateId,
    this.workflowTemplate,
    this.viewType,
    this.ntsType,
    this.otherAttachmentId,
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

  dynamic templateCategoryName;
  dynamic importFileId;
  int? taskType;
  dynamic categoryCode;
  dynamic moduleCodes;
  dynamic iconFileId;
  dynamic templateColor;
  dynamic userId;
  dynamic type;
  dynamic prms;
  dynamic callBackMethodName;
  dynamic templateIds;
  dynamic categoryIds;
  int? templateCategoryType;
  dynamic actionName;
  dynamic controllerName;
  dynamic areaName;
  dynamic parameter;
  bool? select;
  bool? allBooks;
  dynamic portalNames;
  dynamic customIcon;
  String? name;
  String? displayName;
  String? code;
  String? description;
  String? templateCategoryId;
  dynamic templateCategory;
  int? templateStatus;
  int? templateType;
  dynamic tableMetadataId;
  dynamic tableMetadata;
  int? tableSelectionType;
  String? udfTemplateId;
  dynamic udfTemplate;
  String? udfTableMetadataId;
  dynamic udfTableMetadata;
  String? json;
  dynamic printJson;
  String? moduleId;
  dynamic module;
  dynamic domainId;
  dynamic domain;
  dynamic subDomainId;
  dynamic subDomain;
  List<dynamic>? allowedTagCategories;
  dynamic templateStageId;
  dynamic templateStage;
  dynamic templateStepId;
  dynamic templateStep;
  dynamic workFlowTemplateId;
  dynamic workflowTemplate;
  int? viewType;
  int? ntsType;
  dynamic otherAttachmentId;
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  int? sequenceOrder;
  String? companyId;
  LegalEntityId? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  factory RequestTypeModel.fromJson(Map<String, dynamic> json) =>
      RequestTypeModel(
        templateCategoryName: json["TemplateCategoryName"],
        importFileId: json["ImportFileId"],
        taskType: json["TaskType"],
        categoryCode: json["CategoryCode"],
        moduleCodes: json["ModuleCodes"],
        iconFileId: json["IconFileId"],
        templateColor: json["TemplateColor"],
        userId: json["UserId"],
        type: json["Type"],
        prms: json["Prms"],
        callBackMethodName: json["CallBackMethodName"],
        templateIds: json["TemplateIds"],
        categoryIds: json["CategoryIds"],
        templateCategoryType: json["TemplateCategoryType"],
        actionName: json["ActionName"],
        controllerName: json["ControllerName"],
        areaName: json["AreaName"],
        parameter: json["Parameter"],
        select: json["Select"],
        allBooks: json["AllBooks"],
        portalNames: json["PortalNames"],
        customIcon: json["CustomIcon"],
        name: json["Name"],
        displayName: json["DisplayName"],
        code: json["Code"],
        description: json["Description"],
        templateCategoryId: json["TemplateCategoryId"],
        templateCategory: json["TemplateCategory"],
        templateStatus: json["TemplateStatus"],
        templateType: json["TemplateType"],
        tableMetadataId: json["TableMetadataId"],
        tableMetadata: json["TableMetadata"],
        tableSelectionType: json["TableSelectionType"],
        udfTemplateId: json["UdfTemplateId"],
        udfTemplate: json["UdfTemplate"],
        udfTableMetadataId: json["UdfTableMetadataId"],
        udfTableMetadata: json["UdfTableMetadata"],
        json: json["Json"],
        printJson: json["PrintJson"],
        moduleId: json["ModuleId"],
        module: json["Module"],
        domainId: json["DomainId"],
        domain: json["Domain"],
        subDomainId: json["SubDomainId"],
        subDomain: json["SubDomain"],
        allowedTagCategories: json["AllowedTagCategories"] == null
            ? null
            : List<dynamic>.from(json["AllowedTagCategories"].map((x) => x)),
        templateStageId: json["TemplateStageId"],
        templateStage: json["TemplateStage"],
        templateStepId: json["TemplateStepId"],
        templateStep: json["TemplateStep"],
        workFlowTemplateId: json["WorkFlowTemplateId"],
        workflowTemplate: json["WorkflowTemplate"],
        viewType: json["ViewType"],
        ntsType: json["NtsType"],
        otherAttachmentId: json["OtherAttachmentId"],
        id: json["Id"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: json["LastUpdatedDate"] == null
            ? null
            : DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        legalEntityId: json["LegalEntityId"] == null
            ? null
            : legalEntityIdValues.map?[json["LegalEntityId"]],
        dataAction: json["DataAction"],
        status: json["Status"],
        versionNo: json["VersionNo"],
        portalId: json["PortalId"],
      );

  Map<String, dynamic> toJson() => {
        "TemplateCategoryName": templateCategoryName,
        "ImportFileId": importFileId,
        "TaskType": taskType,
        "CategoryCode": categoryCode,
        "ModuleCodes": moduleCodes,
        "IconFileId": iconFileId,
        "TemplateColor": templateColor,
        "UserId": userId,
        "Type": type,
        "Prms": prms,
        "CallBackMethodName": callBackMethodName,
        "TemplateIds": templateIds,
        "CategoryIds": categoryIds,
        "TemplateCategoryType": templateCategoryType,
        "ActionName": actionName,
        "ControllerName": controllerName,
        "AreaName": areaName,
        "Parameter": parameter,
        "Select": select,
        "AllBooks": allBooks,
        "PortalNames": portalNames,
        "CustomIcon": customIcon,
        "Name": name,
        "DisplayName": displayName,
        "Code": code,
        "Description": description,
        "TemplateCategoryId": templateCategoryId,
        "TemplateCategory": templateCategory,
        "TemplateStatus": templateStatus,
        "TemplateType": templateType,
        "TableMetadataId": tableMetadataId,
        "TableMetadata": tableMetadata,
        "TableSelectionType": tableSelectionType,
        "UdfTemplateId": udfTemplateId,
        "UdfTemplate": udfTemplate,
        "UdfTableMetadataId": udfTableMetadataId,
        "UdfTableMetadata": udfTableMetadata,
        "Json": json,
        "PrintJson": printJson,
        "ModuleId": moduleId,
        "Module": module,
        "DomainId": domainId,
        "Domain": domain,
        "SubDomainId": subDomainId,
        "SubDomain": subDomain,
        "AllowedTagCategories": allowedTagCategories == null
            ? null
            : List<dynamic>.from(allowedTagCategories!.map((x) => x)),
        "TemplateStageId": templateStageId,
        "TemplateStage": templateStage,
        "TemplateStepId": templateStepId,
        "TemplateStep": templateStep,
        "WorkFlowTemplateId": workFlowTemplateId,
        "WorkflowTemplate": workflowTemplate,
        "ViewType": viewType,
        "NtsType": ntsType,
        "OtherAttachmentId": otherAttachmentId,
        "Id": id,
        "CreatedDate": createdDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId == null
            ? null
            : legalEntityIdValues.reverse[legalEntityId],
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId,
      };
}

enum LegalEntityId { THE_60_D2_DF036755_E8_DE168_D8_DB7 }

final legalEntityIdValues = RequestTypeEnumValues({
  "60d2df036755e8de168d8db7": LegalEntityId.THE_60_D2_DF036755_E8_DE168_D8_DB7
});

class RequestTypeEnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  RequestTypeEnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
