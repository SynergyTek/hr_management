class DMSDocumentTypeModel {
  dynamic templateCategoryName;
  dynamic importFileId;
  int taskType;
  dynamic categoryCode;
  dynamic moduleCodes;
  dynamic iconFileId;
  dynamic templateColor;
  dynamic userId;
  dynamic type;
  String name;
  String displayName;
  String code;
  dynamic description;
  String templateCategoryId;
  dynamic templateCategory;
  int templateStatus;
  int templateType;
  String tableMetadataId;
  dynamic tableMetadata;
  int tableSelectionType;
  dynamic udfTemplateId;
  dynamic udfTemplate;
  dynamic udfTableMetadataId;
  dynamic udfTableMetadata;
  String json;
  dynamic printJson;
  dynamic moduleId;
  dynamic module;
  dynamic domainId;
  dynamic domain;
  dynamic subDomainId;
  dynamic subDomain;
  List<dynamic> allowedTagCategories;
  dynamic templateStageId;
  dynamic templateStage;
  dynamic templateStepId;
  dynamic templateStep;
  dynamic workFlowTemplateId;
  dynamic workflowTemplate;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  dynamic sequenceOrder;
  String companyId;
  String legalEntityId;
  int dataAction;
  int status;
  int versionNo;
  String portalId;

  DMSDocumentTypeModel({
    this.templateCategoryName,
    this.importFileId,
    this.taskType,
    this.categoryCode,
    this.moduleCodes,
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

  DMSDocumentTypeModel.fromJson(Map<String, dynamic> map) {
    templateCategoryName = map['TemplateCategoryName'];
    importFileId = map['ImportFileId'];
    taskType = map['TaskType'];
    categoryCode = map['CategoryCode'];
    moduleCodes = map['ModuleCodes'];
    iconFileId = map['IconFileId'];
    templateColor = map['TemplateColor'];
    userId = map['UserId'];
    type = map['Type'];
    name = map['Name'];
    displayName = map['DisplayName'];
    code = map['Code'];
    description = map['Description'];
    templateCategoryId = map['TemplateCategoryId'];
    templateCategory = map['TemplateCategory'];
    templateStatus = map['TemplateStatus'];
    templateType = map['TemplateType'];
    tableMetadataId = map['TableMetadataId'];
    tableMetadata = map['TableMetadata'];
    tableSelectionType = map['TableSelectionType'];
    udfTemplateId = map['UdfTemplateId'];
    udfTemplate = map['UdfTemplate'];
    udfTableMetadataId = map['UdfTableMetadataId'];
    udfTableMetadata = map['UdfTableMetadata'];
    json = map['Json'];
    printJson = map['PrintJson'];
    moduleId = map['ModuleId'];
    module = map['Module'];
    domainId = map['DomainId'];
    domain = map['Domain'];
    subDomainId = map['SubDomainId'];
    subDomain = map['SubDomain'];
    if (map['AllowedTagCategories'] != null) {
      allowedTagCategories = [];
      map['AllowedTagCategories'].forEach((v) {
        allowedTagCategories.add(v);
      });
    }
    templateStageId = map['TemplateStageId'];
    templateStage = map['TemplateStage'];
    templateStepId = map['TemplateStepId'];
    templateStep = map['TemplateStep'];
    workFlowTemplateId = map['WorkFlowTemplateId'];
    workflowTemplate = map['WorkflowTemplate'];
    id = map['Id'];
    createdDate = map['CreatedDate'];
    createdBy = map['CreatedBy'];
    lastUpdatedDate = map['LastUpdatedDate'];
    lastUpdatedBy = map['LastUpdatedBy'];
    isDeleted = map['IsDeleted'];
    sequenceOrder = map['SequenceOrder'];
    companyId = map['CompanyId'];
    legalEntityId = map['LegalEntityId'];
    dataAction = map['DataAction'];
    status = map['Status'];
    versionNo = map['VersionNo'];
    portalId = map['PortalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TemplateCategoryName'] = this.templateCategoryName;
    data['ImportFileId'] = this.importFileId;
    data['TaskType'] = this.taskType;
    data['CategoryCode'] = this.categoryCode;
    data['ModuleCodes'] = this.moduleCodes;
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
    data['Json'] = this.json;
    data['PrintJson'] = this.printJson;
    data['ModuleId'] = this.moduleId;
    data['Module'] = this.module;
    data['DomainId'] = this.domainId;
    data['Domain'] = this.domain;
    data['SubDomainId'] = this.subDomainId;
    data['SubDomain'] = this.subDomain;
    if (this.allowedTagCategories != null) {
      data['AllowedTagCategories'] =
          this.allowedTagCategories.map((v) => v.toJson()).toList();
    }
    data['TemplateStageId'] = this.templateStageId;
    data['TemplateStage'] = this.templateStage;
    data['TemplateStepId'] = this.templateStepId;
    data['TemplateStep'] = this.templateStep;
    data['WorkFlowTemplateId'] = this.workFlowTemplateId;
    data['WorkflowTemplate'] = this.workflowTemplate;
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
