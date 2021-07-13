class NTSTemplateModel {
  String templateCategoryName;
  String importFileId;
  int taskType;
  String categoryCode;
  String iconFileId;
  String templateColor;
  String userId;
  String type;
  String name;
  String displayName;
  String code;
  String description;
  String templateCategoryId;
  String templateCategory;
  int templateStatus;
  int templateType;
  String tableMetadataId;
  String tableMetadata;
  int tableSelectionType;
  String udfTemplateId;
  String udfTemplate;
  String udfTableMetadataId;
  String udfTableMetadata;
  String jsonString;
  String printJson;
  String moduleId;
  String module;
  String domainId;
  String domain;
  String subDomainId;
  String subDomain;
  String allowedTagCategories;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  String sequenceOrder;
  String companyId;
  String legalEntityId;
  int dataAction;
  int status;
  int versionNo;
  String portalId;

  NTSTemplateModel({
    this.templateCategoryName,
    this.importFileId,
    this.taskType,
    this.categoryCode,
    this.iconFileId,
    this.templateColor,
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
    this.jsonString,
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
    this.portalId,
  });

  NTSTemplateModel.fromJson(Map<String, dynamic> json) {
    print(json);
    templateCategoryName = json['TemplateCategoryName'];
    importFileId = json['ImportFileId'];
    taskType = json['TaskType'];
    categoryCode = json['CategoryCode'];
    iconFileId = json['IconFileId'];
    templateColor = json['TemplateColor'];
    userId = json['UserId'];
    type = json['Type'];
    name = json['Name'];
    displayName = json['DisplayName'];
    code = json['Code'];
    description = json['Description'];
    templateCategoryId = json['TemplateCategoryId'];
    templateCategory = json['TemplateCategory'];
    templateStatus = json['TemplateStatus'];
    templateType = json['TemplateType'];
    tableMetadataId = json['TableMetadataId'];
    tableMetadata = json['TableMetadata'];
    tableSelectionType = json['TableSelectionType'];
    udfTemplateId = json['UdfTemplateId'];
    udfTemplate = json['UdfTemplate'];
    udfTableMetadataId = json['UdfTableMetadataId'];
    udfTableMetadata = json['UdfTableMetadata'];
    jsonString = json['Json'];
    printJson = json['PrintJson'];
    moduleId = json['ModuleId'];
    module = json['Module'];
    domainId = json['DomainId'];
    domain = json['Domain'];
    subDomainId = json['SubDomainId'];
    subDomain = json['SubDomain'];
    allowedTagCategories = json['AllowedTagCategories'];
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    legalEntityId = json['LegalEntityId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
    portalId = json['PortalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TemplateCategoryName'] = this.templateCategoryName;
    data['ImportFileId'] = this.importFileId;
    data['TaskType'] = this.taskType;
    data['CategoryCode'] = this.categoryCode;
    data['IconFileId'] = this.iconFileId;
    data['TemplateColor'] = this.templateColor;
    data['UserId'] = this.userId;
    data['Type'] = this.type;
    data['Name'] = this.name;
    data['DisplayName'] = this.displayName;
    data['Code'] = this.code;
    data['Description'] = this.description;
    data['TemplateCategoryId'] = this.templateCategoryId;
    data['TemplateCategory'] = this.templateCategory;
    data['TemplateStatus'] = this.templateStatus;
    data['TemplateType'] = this.templateType;
    data['TableMetadataId'] = this.tableMetadataId;
    data['TableMetadata'] = this.tableMetadata;
    data['TableSelectionType'] = this.tableSelectionType;
    data['UdfTemplateId'] = this.udfTemplateId;
    data['UdfTemplate'] = this.udfTemplate;
    data['UdfTableMetadataId'] = this.udfTableMetadataId;
    data['UdfTableMetadata'] = this.udfTableMetadata;
    data['Json'] = this.jsonString;
    data['PrintJson'] = this.printJson;
    data['ModuleId'] = this.moduleId;
    data['Module'] = this.module;
    data['DomainId'] = this.domainId;
    data['Domain'] = this.domain;
    data['SubDomainId'] = this.subDomainId;
    data['SubDomain'] = this.subDomain;
    data['AllowedTagCategories'] = this.allowedTagCategories;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SequenceOrder'] = this.sequenceOrder;
    data['CompanyId'] = this.companyId;
    data['LegalEntityId'] = this.legalEntityId;
    data['DataAction'] = this.dataAction;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    data['PortalId'] = this.portalId;
    return data;
  }
}
