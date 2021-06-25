// To parse this JSON data, do
//
//     final leaveTemplateModel = leaveTemplateModelFromJson(jsonString);

import 'dart:convert';

LeaveTemplateModel leaveTemplateModelFromJson(String str) =>
    LeaveTemplateModel.fromJson(json.decode(str));

String leaveTemplateModelToJson(LeaveTemplateModel data) =>
    json.encode(data.toJson());

class LeaveTemplateModel {
  LeaveTemplateModel({
    this.templateCategoryName,
    this.importFileId,
    this.taskType,
    this.categoryCode,
    this.iconFileId,
    this.userId,
    this.type,
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
  });

  dynamic templateCategoryName;
  dynamic importFileId;
  int taskType;
  String categoryCode;
  String iconFileId;
  dynamic userId;
  dynamic type;
  dynamic name;
  String displayName;
  String code;
  String description;
  dynamic templateCategoryId;
  dynamic templateCategory;
  int templateStatus;
  int templateType;
  dynamic tableMetadataId;
  dynamic tableMetadata;
  int tableSelectionType;
  dynamic udfTemplateId;
  dynamic udfTemplate;
  dynamic udfTableMetadataId;
  dynamic udfTableMetadata;
  dynamic json;
  dynamic printJson;
  dynamic moduleId;
  dynamic module;
  dynamic domainId;
  dynamic domain;
  dynamic subDomainId;
  dynamic subDomain;
  dynamic allowedTagCategories;
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

  factory LeaveTemplateModel.fromJson(Map<String, dynamic> json) =>
      LeaveTemplateModel(
        templateCategoryName: json["TemplateCategoryName"],
        importFileId: json["ImportFileId"],
        taskType: json["TaskType"],
        categoryCode: json["CategoryCode"],
        iconFileId: json["IconFileId"],
        userId: json["UserId"],
        type: json["Type"],
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
        allowedTagCategories: json["AllowedTagCategories"],
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
      );

  Map<String, dynamic> toJson() => {
        "TemplateCategoryName": templateCategoryName,
        "ImportFileId": importFileId,
        "TaskType": taskType,
        "CategoryCode": categoryCode,
        "IconFileId": iconFileId,
        "UserId": userId,
        "Type": type,
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
        "AllowedTagCategories": allowedTagCategories,
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
      };
}
