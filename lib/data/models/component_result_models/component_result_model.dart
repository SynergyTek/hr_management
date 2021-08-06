class ComponentResultModel {
  String componentStatusName;
  String assignee;
  String assigneeId;
  String assigneePhotoId;
  String email;
  String componentStatusCode;
  String stageId;
  String stageName;
  int componentType;
  String processDesignResultId;
  String processDesignResult;
  String processDesignId;
  String processDesign;
  String componentId;
  String component;
  String ntsServiceId;
  String ntsService;
  String ntsTaskId;
  String ntsTask;
  String componentStatusId;
  String componentStatus;
  String startDate;
  String endDate;
  String error;
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

  ComponentResultModel(
      {this.componentStatusName,
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
      this.portalId});

  ComponentResultModel.fromJson(Map<String, dynamic> json) {
    componentStatusName = json['ComponentStatusName'];
    assignee = json['Assignee'];
    assigneeId = json['AssigneeId'];
    assigneePhotoId = json['AssigneePhotoId'];
    email = json['Email'];
    componentStatusCode = json['ComponentStatusCode'];
    stageId = json['StageId'];
    stageName = json['StageName'];
    componentType = json['ComponentType'];
    processDesignResultId = json['ProcessDesignResultId'];
    processDesignResult = json['ProcessDesignResult'];
    processDesignId = json['ProcessDesignId'];
    processDesign = json['ProcessDesign'];
    componentId = json['ComponentId'];
    component = json['Component'];
    ntsServiceId = json['NtsServiceId'];
    ntsService = json['NtsService'];
    ntsTaskId = json['NtsTaskId'];
    ntsTask = json['NtsTask'];
    componentStatusId = json['ComponentStatusId'];
    componentStatus = json['ComponentStatus'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    error = json['Error'];
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
    data['ComponentStatusName'] = this.componentStatusName;
    data['Assignee'] = this.assignee;
    data['AssigneeId'] = this.assigneeId;
    data['AssigneePhotoId'] = this.assigneePhotoId;
    data['Email'] = this.email;
    data['ComponentStatusCode'] = this.componentStatusCode;
    data['StageId'] = this.stageId;
    data['StageName'] = this.stageName;
    data['ComponentType'] = this.componentType;
    data['ProcessDesignResultId'] = this.processDesignResultId;
    data['ProcessDesignResult'] = this.processDesignResult;
    data['ProcessDesignId'] = this.processDesignId;
    data['ProcessDesign'] = this.processDesign;
    data['ComponentId'] = this.componentId;
    data['Component'] = this.component;
    data['NtsServiceId'] = this.ntsServiceId;
    data['NtsService'] = this.ntsService;
    data['NtsTaskId'] = this.ntsTaskId;
    data['NtsTask'] = this.ntsTask;
    data['ComponentStatusId'] = this.componentStatusId;
    data['ComponentStatus'] = this.componentStatus;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Error'] = this.error;
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
