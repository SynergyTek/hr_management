class DocumentModel {
  String? personId;
  String? userId;
  String? userRole;
  String? positionId;
  String? personNo;
  String? title;
  String? gender;
  String? nationalityName;
  String? maritalStatus;
  String? religion;
  String? birthTown;
  String? birthCountryName;
  String? dateOfBirth;
  String? personalEmail;
  String? personFullName;
  String? locationName;
  String? gradeName;
  String? organizationName;
  String? jobName;
  String? positionName;
  String? assignmentTypeName;
  String? dateOfJoin;
  String? personTypeName;
  String? photoName;
  String? base64Img;
  String? assignmentStatusName;
  String? page;
  String? dependentId;
  String? mobile;
  String? presentUnitNumber;
  String? presentBuildingNumber;
  String? presentStreetName;
  String? presentCity;
  String? presentPostalCode;
  String? presentAdditionalNumber;
  String? presentConutryId;
  String? presentCountryName;
  String? homeUnitNumber;
  String? homeBuildingNumber;
  String? homeStreetName;
  String? homeCity;
  String? homePostalCode;
  String? homeAdditionalNumber;
  String? homeConutryId;
  String? homeCountryName;
  String? emergencyContactName1;
  String? emergencyContactNo1;
  String? relationship1;
  String? otherRelation1;
  String? emergencyContactName2;
  String? emergencyContactNo2;
  String? relationship2;
  String? otherRelation2;
  String? contactConutryId;
  String? contactCountryName;
  String? contactCountryCode;
  String? contactCountryDialCode;
  String? emergencyContactConutryId1;
  String? emergencyContactCountryName1;
  String? emergencyContactConutryCode1;
  String? emergencyContactCountryDialCode1;
  String? emergencyContactConutryId2;
  String? emergencyContactCountryName2;
  String? emergencyContactConutryCode2;
  String? emergencyContactCountryDialCode2;
  List<NoteTableRows>? noteTableRows;
  String? templateId;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  String? sequenceOrder;
  String? companyId;
  int? dataAction;
  int? status;
  int? versionNo;

  DocumentModel({
    this.personId,
    this.userId,
    this.userRole,
    this.positionId,
    this.personNo,
    this.title,
    this.gender,
    this.nationalityName,
    this.maritalStatus,
    this.religion,
    this.birthTown,
    this.birthCountryName,
    this.dateOfBirth,
    this.personalEmail,
    this.personFullName,
    this.locationName,
    this.gradeName,
    this.organizationName,
    this.jobName,
    this.positionName,
    this.assignmentTypeName,
    this.dateOfJoin,
    this.personTypeName,
    this.photoName,
    this.base64Img,
    this.assignmentStatusName,
    this.page,
    this.dependentId,
    this.mobile,
    this.presentUnitNumber,
    this.presentBuildingNumber,
    this.presentStreetName,
    this.presentCity,
    this.presentPostalCode,
    this.presentAdditionalNumber,
    this.presentConutryId,
    this.presentCountryName,
    this.homeUnitNumber,
    this.homeBuildingNumber,
    this.homeStreetName,
    this.homeCity,
    this.homePostalCode,
    this.homeAdditionalNumber,
    this.homeConutryId,
    this.homeCountryName,
    this.emergencyContactName1,
    this.emergencyContactNo1,
    this.relationship1,
    this.otherRelation1,
    this.emergencyContactName2,
    this.emergencyContactNo2,
    this.relationship2,
    this.otherRelation2,
    this.contactConutryId,
    this.contactCountryName,
    this.contactCountryCode,
    this.contactCountryDialCode,
    this.emergencyContactConutryId1,
    this.emergencyContactCountryName1,
    this.emergencyContactConutryCode1,
    this.emergencyContactCountryDialCode1,
    this.emergencyContactConutryId2,
    this.emergencyContactCountryName2,
    this.emergencyContactConutryCode2,
    this.emergencyContactCountryDialCode2,
    this.noteTableRows,
    this.templateId,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastUpdatedDate,
    this.lastUpdatedBy,
    this.isDeleted,
    this.sequenceOrder,
    this.companyId,
    this.dataAction,
    this.status,
    this.versionNo,
  });

  DocumentModel.fromJson(Map<String, dynamic> json) {
    personId = json['PersonId'];
    userId = json['UserId'];
    userRole = json['UserRole'];
    positionId = json['PositionId'];
    personNo = json['PersonNo'];
    title = json['Title'];
    gender = json['Gender'];
    nationalityName = json['NationalityName'];
    maritalStatus = json['MaritalStatus'];
    religion = json['Religion'];
    birthTown = json['BirthTown'];
    birthCountryName = json['BirthCountryName'];
    dateOfBirth = json['DateOfBirth'];
    personalEmail = json['PersonalEmail'];
    personFullName = json['PersonFullName'];
    locationName = json['LocationName'];
    gradeName = json['GradeName'];
    organizationName = json['OrganizationName'];
    jobName = json['JobName'];
    positionName = json['PositionName'];
    assignmentTypeName = json['AssignmentTypeName'];
    dateOfJoin = json['DateOfJoin'];
    personTypeName = json['PersonTypeName'];
    photoName = json['PhotoName'];
    base64Img = json['base64Img'];
    assignmentStatusName = json['AssignmentStatusName'];
    page = json['Page'];
    dependentId = json['DependentId'];
    mobile = json['Mobile'];
    presentUnitNumber = json['PresentUnitNumber'];
    presentBuildingNumber = json['PresentBuildingNumber'];
    presentStreetName = json['PresentStreetName'];
    presentCity = json['PresentCity'];
    presentPostalCode = json['PresentPostalCode'];
    presentAdditionalNumber = json['PresentAdditionalNumber'];
    presentConutryId = json['PresentConutryId'];
    presentCountryName = json['PresentCountryName'];
    homeUnitNumber = json['HomeUnitNumber'];
    homeBuildingNumber = json['HomeBuildingNumber'];
    homeStreetName = json['HomeStreetName'];
    homeCity = json['HomeCity'];
    homePostalCode = json['HomePostalCode'];
    homeAdditionalNumber = json['HomeAdditionalNumber'];
    homeConutryId = json['HomeConutryId'];
    homeCountryName = json['HomeCountryName'];
    emergencyContactName1 = json['EmergencyContactName1'];
    emergencyContactNo1 = json['EmergencyContactNo1'];
    relationship1 = json['Relationship1'];
    otherRelation1 = json['OtherRelation1'];
    emergencyContactName2 = json['EmergencyContactName2'];
    emergencyContactNo2 = json['EmergencyContactNo2'];
    relationship2 = json['Relationship2'];
    otherRelation2 = json['OtherRelation2'];
    contactConutryId = json['ContactConutryId'];
    contactCountryName = json['ContactCountryName'];
    contactCountryCode = json['ContactCountryCode'];
    contactCountryDialCode = json['ContactCountryDialCode'];
    emergencyContactConutryId1 = json['EmergencyContactConutryId1'];
    emergencyContactCountryName1 = json['EmergencyContactCountryName1'];
    emergencyContactConutryCode1 = json['EmergencyContactConutryCode1'];
    emergencyContactCountryDialCode1 = json['EmergencyContactCountryDialCode1'];
    emergencyContactConutryId2 = json['EmergencyContactConutryId2'];
    emergencyContactCountryName2 = json['EmergencyContactCountryName2'];
    emergencyContactConutryCode2 = json['EmergencyContactConutryCode2'];
    emergencyContactCountryDialCode2 = json['EmergencyContactCountryDialCode2'];
    if (json['NoteTableRows'] != null) {
      noteTableRows = [];
      json['NoteTableRows'].forEach((v) {
        noteTableRows!.add(new NoteTableRows.fromJson(v));
      });
    }
    templateId = json['TemplateId'];
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PersonId'] = this.personId;
    data['UserId'] = this.userId;
    data['UserRole'] = this.userRole;
    data['PositionId'] = this.positionId;
    data['PersonNo'] = this.personNo;
    data['Title'] = this.title;
    data['Gender'] = this.gender;
    data['NationalityName'] = this.nationalityName;
    data['MaritalStatus'] = this.maritalStatus;
    data['Religion'] = this.religion;
    data['BirthTown'] = this.birthTown;
    data['BirthCountryName'] = this.birthCountryName;
    data['DateOfBirth'] = this.dateOfBirth;
    data['PersonalEmail'] = this.personalEmail;
    data['PersonFullName'] = this.personFullName;
    data['LocationName'] = this.locationName;
    data['GradeName'] = this.gradeName;
    data['OrganizationName'] = this.organizationName;
    data['JobName'] = this.jobName;
    data['PositionName'] = this.positionName;
    data['AssignmentTypeName'] = this.assignmentTypeName;
    data['DateOfJoin'] = this.dateOfJoin;
    data['PersonTypeName'] = this.personTypeName;
    data['PhotoName'] = this.photoName;
    data['base64Img'] = this.base64Img;
    data['AssignmentStatusName'] = this.assignmentStatusName;
    data['Page'] = this.page;
    data['DependentId'] = this.dependentId;
    data['Mobile'] = this.mobile;
    data['PresentUnitNumber'] = this.presentUnitNumber;
    data['PresentBuildingNumber'] = this.presentBuildingNumber;
    data['PresentStreetName'] = this.presentStreetName;
    data['PresentCity'] = this.presentCity;
    data['PresentPostalCode'] = this.presentPostalCode;
    data['PresentAdditionalNumber'] = this.presentAdditionalNumber;
    data['PresentConutryId'] = this.presentConutryId;
    data['PresentCountryName'] = this.presentCountryName;
    data['HomeUnitNumber'] = this.homeUnitNumber;
    data['HomeBuildingNumber'] = this.homeBuildingNumber;
    data['HomeStreetName'] = this.homeStreetName;
    data['HomeCity'] = this.homeCity;
    data['HomePostalCode'] = this.homePostalCode;
    data['HomeAdditionalNumber'] = this.homeAdditionalNumber;
    data['HomeConutryId'] = this.homeConutryId;
    data['HomeCountryName'] = this.homeCountryName;
    data['EmergencyContactName1'] = this.emergencyContactName1;
    data['EmergencyContactNo1'] = this.emergencyContactNo1;
    data['Relationship1'] = this.relationship1;
    data['OtherRelation1'] = this.otherRelation1;
    data['EmergencyContactName2'] = this.emergencyContactName2;
    data['EmergencyContactNo2'] = this.emergencyContactNo2;
    data['Relationship2'] = this.relationship2;
    data['OtherRelation2'] = this.otherRelation2;
    data['ContactConutryId'] = this.contactConutryId;
    data['ContactCountryName'] = this.contactCountryName;
    data['ContactCountryCode'] = this.contactCountryCode;
    data['ContactCountryDialCode'] = this.contactCountryDialCode;
    data['EmergencyContactConutryId1'] = this.emergencyContactConutryId1;
    data['EmergencyContactCountryName1'] = this.emergencyContactCountryName1;
    data['EmergencyContactConutryCode1'] = this.emergencyContactConutryCode1;
    data['EmergencyContactCountryDialCode1'] =
        this.emergencyContactCountryDialCode1;
    data['EmergencyContactConutryId2'] = this.emergencyContactConutryId2;
    data['EmergencyContactCountryName2'] = this.emergencyContactCountryName2;
    data['EmergencyContactConutryCode2'] = this.emergencyContactConutryCode2;
    data['EmergencyContactCountryDialCode2'] =
        this.emergencyContactCountryDialCode2;
    if (this.noteTableRows != null) {
      data['NoteTableRows'] =
          this.noteTableRows!.map((v) => v.toJson()).toList();
    }
    data['TemplateId'] = this.templateId;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SequenceOrder'] = this.sequenceOrder;
    data['CompanyId'] = this.companyId;
    data['DataAction'] = this.dataAction;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    return data;
  }
}

class NoteTableRows {
  String? rowData;
  List<SelectedTableRows>? selectedTableRows;
  String? page;
  String? pageId;
  String? tableMetadataId;
  int? createdByMeDraftCount;
  int? createdByMeCompleteCount;
  int? createdByMeExpireCount;
  int? requestedByMeDraftCount;
  int? requestedByMeCompleteCount;
  int? requestedByMeExpireCount;
  int? sharedWithMeDraftCount;
  int? sharedWithMeCompleteCount;
  int? sharedWithMeExpireCount;
  int? sharedByMeDraftCount;
  int? sharedByMeCompleteCount;
  int? sharedByMeExpireCount;
  int? createdOrRequestedByMeDraftCount;
  int? createdOrRequestedByMeInProgreessOverDueCount;
  int? createdOrRequestedByMeCompleteCount;
  int? createdOrRequestedByMeExpiredCancelCloseCount;
  int? sharedWithMeInProgressOverDueCount;
  int? sharedWithMeExpiredCancelCloseCount;
  int? sharedByMeInProgreessOverDueCount;
  int? sharedByMeExpiredCancelCloseCount;
  bool? isVersioningButtonVisible;
  bool? isViewButtonVisible;
  bool? isDeleteButtonVisible;
  String? templateName;
  int? indexRenderingType;
  int? indexPageTemplateType;
  String? parentReferenceId;
  bool? enableCreateButton;
  String? createButtonText;
  String? requestButtonText;
  String? createButtonCss;
  int? createPopupType;
  bool? enableEditButton;
  String? editButtonText;
  String? editButtonCss;
  bool? enableDeleteButton;
  String? deleteButtonText;
  String? deleteButtonCss;
  bool? enableDeleteConfirmation;
  String? deleteConfirmationMessage;
  bool? enableMyNoteTab;
  bool? enableMyNoteSummary;
  bool? enableRequestedByMeTab;
  bool? enableRequestedByMeSummary;
  bool? enableSharedWithMeTab;
  bool? enableSharedWithMeSummary;
  bool? enableSharedByMeTab;
  bool? enableSharedByMeSummary;
  bool? enableExportToExcel;
  bool? enableExportToPdf;
  String? templateId;
  String? template;
  String? orderByColumnId;
  String? orderByColumn;
  int? orderBy;
  bool? hideIndexHeader;
  bool? hideSummaryTabs;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  String? sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  NoteTableRows({
    this.rowData,
    this.selectedTableRows,
    this.page,
    this.pageId,
    this.tableMetadataId,
    this.createdByMeDraftCount,
    this.createdByMeCompleteCount,
    this.createdByMeExpireCount,
    this.requestedByMeDraftCount,
    this.requestedByMeCompleteCount,
    this.requestedByMeExpireCount,
    this.sharedWithMeDraftCount,
    this.sharedWithMeCompleteCount,
    this.sharedWithMeExpireCount,
    this.sharedByMeDraftCount,
    this.sharedByMeCompleteCount,
    this.sharedByMeExpireCount,
    this.createdOrRequestedByMeDraftCount,
    this.createdOrRequestedByMeInProgreessOverDueCount,
    this.createdOrRequestedByMeCompleteCount,
    this.createdOrRequestedByMeExpiredCancelCloseCount,
    this.sharedWithMeInProgressOverDueCount,
    this.sharedWithMeExpiredCancelCloseCount,
    this.sharedByMeInProgreessOverDueCount,
    this.sharedByMeExpiredCancelCloseCount,
    this.isVersioningButtonVisible,
    this.isViewButtonVisible,
    this.isDeleteButtonVisible,
    this.templateName,
    this.indexRenderingType,
    this.indexPageTemplateType,
    this.parentReferenceId,
    this.enableCreateButton,
    this.createButtonText,
    this.requestButtonText,
    this.createButtonCss,
    this.createPopupType,
    this.enableEditButton,
    this.editButtonText,
    this.editButtonCss,
    this.enableDeleteButton,
    this.deleteButtonText,
    this.deleteButtonCss,
    this.enableDeleteConfirmation,
    this.deleteConfirmationMessage,
    this.enableMyNoteTab,
    this.enableMyNoteSummary,
    this.enableRequestedByMeTab,
    this.enableRequestedByMeSummary,
    this.enableSharedWithMeTab,
    this.enableSharedWithMeSummary,
    this.enableSharedByMeTab,
    this.enableSharedByMeSummary,
    this.enableExportToExcel,
    this.enableExportToPdf,
    this.templateId,
    this.template,
    this.orderByColumnId,
    this.orderByColumn,
    this.orderBy,
    this.hideIndexHeader,
    this.hideSummaryTabs,
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

  NoteTableRows.fromJson(Map<String, dynamic> json) {
    rowData = json['RowData'];
    if (json['SelectedTableRows'] != null) {
      selectedTableRows = [];
      json['SelectedTableRows'].forEach((v) {
        selectedTableRows!.add(new SelectedTableRows.fromJson(v));
      });
    }
    page = json['Page'];
    pageId = json['PageId'];
    tableMetadataId = json['TableMetadataId'];
    createdByMeDraftCount = json['CreatedByMeDraftCount'];
    createdByMeCompleteCount = json['CreatedByMeCompleteCount'];
    createdByMeExpireCount = json['CreatedByMeExpireCount'];
    requestedByMeDraftCount = json['RequestedByMeDraftCount'];
    requestedByMeCompleteCount = json['RequestedByMeCompleteCount'];
    requestedByMeExpireCount = json['RequestedByMeExpireCount'];
    sharedWithMeDraftCount = json['SharedWithMeDraftCount'];
    sharedWithMeCompleteCount = json['SharedWithMeCompleteCount'];
    sharedWithMeExpireCount = json['SharedWithMeExpireCount'];
    sharedByMeDraftCount = json['SharedByMeDraftCount'];
    sharedByMeCompleteCount = json['SharedByMeCompleteCount'];
    sharedByMeExpireCount = json['SharedByMeExpireCount'];
    createdOrRequestedByMeDraftCount = json['CreatedOrRequestedByMeDraftCount'];
    createdOrRequestedByMeInProgreessOverDueCount =
        json['CreatedOrRequestedByMeInProgreessOverDueCount'];
    createdOrRequestedByMeCompleteCount =
        json['CreatedOrRequestedByMeCompleteCount'];
    createdOrRequestedByMeExpiredCancelCloseCount =
        json['CreatedOrRequestedByMeExpiredCancelCloseCount'];
    sharedWithMeInProgressOverDueCount =
        json['SharedWithMeInProgressOverDueCount'];
    sharedWithMeExpiredCancelCloseCount =
        json['SharedWithMeExpiredCancelCloseCount'];
    sharedByMeInProgreessOverDueCount =
        json['SharedByMeInProgreessOverDueCount'];
    sharedByMeExpiredCancelCloseCount =
        json['SharedByMeExpiredCancelCloseCount'];
    isVersioningButtonVisible = json['IsVersioningButtonVisible'];
    isViewButtonVisible = json['IsViewButtonVisible'];
    isDeleteButtonVisible = json['IsDeleteButtonVisible'];
    templateName = json['TemplateName'];
    indexRenderingType = json['IndexRenderingType'];
    indexPageTemplateType = json['IndexPageTemplateType'];
    parentReferenceId = json['ParentReferenceId'];
    enableCreateButton = json['EnableCreateButton'];
    createButtonText = json['CreateButtonText'];
    requestButtonText = json['RequestButtonText'];
    createButtonCss = json['CreateButtonCss'];
    createPopupType = json['CreatePopupType'];
    enableEditButton = json['EnableEditButton'];
    editButtonText = json['EditButtonText'];
    editButtonCss = json['EditButtonCss'];
    enableDeleteButton = json['EnableDeleteButton'];
    deleteButtonText = json['DeleteButtonText'];
    deleteButtonCss = json['DeleteButtonCss'];
    enableDeleteConfirmation = json['EnableDeleteConfirmation'];
    deleteConfirmationMessage = json['DeleteConfirmationMessage'];
    enableMyNoteTab = json['EnableMyNoteTab'];
    enableMyNoteSummary = json['EnableMyNoteSummary'];
    enableRequestedByMeTab = json['EnableRequestedByMeTab'];
    enableRequestedByMeSummary = json['EnableRequestedByMeSummary'];
    enableSharedWithMeTab = json['EnableSharedWithMeTab'];
    enableSharedWithMeSummary = json['EnableSharedWithMeSummary'];
    enableSharedByMeTab = json['EnableSharedByMeTab'];
    enableSharedByMeSummary = json['EnableSharedByMeSummary'];
    enableExportToExcel = json['EnableExportToExcel'];
    enableExportToPdf = json['EnableExportToPdf'];
    templateId = json['TemplateId'];
    template = json['Template'];
    orderByColumnId = json['OrderByColumnId'];
    orderByColumn = json['OrderByColumn'];
    orderBy = json['OrderBy'];
    hideIndexHeader = json['HideIndexHeader'];
    hideSummaryTabs = json['HideSummaryTabs'];
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
    data['RowData'] = this.rowData;
    if (this.selectedTableRows != null) {
      data['SelectedTableRows'] =
          this.selectedTableRows!.map((v) => v.toJson()).toList();
    }
    data['Page'] = this.page;
    data['PageId'] = this.pageId;
    data['TableMetadataId'] = this.tableMetadataId;
    data['CreatedByMeDraftCount'] = this.createdByMeDraftCount;
    data['CreatedByMeCompleteCount'] = this.createdByMeCompleteCount;
    data['CreatedByMeExpireCount'] = this.createdByMeExpireCount;
    data['RequestedByMeDraftCount'] = this.requestedByMeDraftCount;
    data['RequestedByMeCompleteCount'] = this.requestedByMeCompleteCount;
    data['RequestedByMeExpireCount'] = this.requestedByMeExpireCount;
    data['SharedWithMeDraftCount'] = this.sharedWithMeDraftCount;
    data['SharedWithMeCompleteCount'] = this.sharedWithMeCompleteCount;
    data['SharedWithMeExpireCount'] = this.sharedWithMeExpireCount;
    data['SharedByMeDraftCount'] = this.sharedByMeDraftCount;
    data['SharedByMeCompleteCount'] = this.sharedByMeCompleteCount;
    data['SharedByMeExpireCount'] = this.sharedByMeExpireCount;
    data['CreatedOrRequestedByMeDraftCount'] =
        this.createdOrRequestedByMeDraftCount;
    data['CreatedOrRequestedByMeInProgreessOverDueCount'] =
        this.createdOrRequestedByMeInProgreessOverDueCount;
    data['CreatedOrRequestedByMeCompleteCount'] =
        this.createdOrRequestedByMeCompleteCount;
    data['CreatedOrRequestedByMeExpiredCancelCloseCount'] =
        this.createdOrRequestedByMeExpiredCancelCloseCount;
    data['SharedWithMeInProgressOverDueCount'] =
        this.sharedWithMeInProgressOverDueCount;
    data['SharedWithMeExpiredCancelCloseCount'] =
        this.sharedWithMeExpiredCancelCloseCount;
    data['SharedByMeInProgreessOverDueCount'] =
        this.sharedByMeInProgreessOverDueCount;
    data['SharedByMeExpiredCancelCloseCount'] =
        this.sharedByMeExpiredCancelCloseCount;
    data['IsVersioningButtonVisible'] = this.isVersioningButtonVisible;
    data['IsViewButtonVisible'] = this.isViewButtonVisible;
    data['IsDeleteButtonVisible'] = this.isDeleteButtonVisible;
    data['TemplateName'] = this.templateName;
    data['IndexRenderingType'] = this.indexRenderingType;
    data['IndexPageTemplateType'] = this.indexPageTemplateType;
    data['ParentReferenceId'] = this.parentReferenceId;
    data['EnableCreateButton'] = this.enableCreateButton;
    data['CreateButtonText'] = this.createButtonText;
    data['RequestButtonText'] = this.requestButtonText;
    data['CreateButtonCss'] = this.createButtonCss;
    data['CreatePopupType'] = this.createPopupType;
    data['EnableEditButton'] = this.enableEditButton;
    data['EditButtonText'] = this.editButtonText;
    data['EditButtonCss'] = this.editButtonCss;
    data['EnableDeleteButton'] = this.enableDeleteButton;
    data['DeleteButtonText'] = this.deleteButtonText;
    data['DeleteButtonCss'] = this.deleteButtonCss;
    data['EnableDeleteConfirmation'] = this.enableDeleteConfirmation;
    data['DeleteConfirmationMessage'] = this.deleteConfirmationMessage;
    data['EnableMyNoteTab'] = this.enableMyNoteTab;
    data['EnableMyNoteSummary'] = this.enableMyNoteSummary;
    data['EnableRequestedByMeTab'] = this.enableRequestedByMeTab;
    data['EnableRequestedByMeSummary'] = this.enableRequestedByMeSummary;
    data['EnableSharedWithMeTab'] = this.enableSharedWithMeTab;
    data['EnableSharedWithMeSummary'] = this.enableSharedWithMeSummary;
    data['EnableSharedByMeTab'] = this.enableSharedByMeTab;
    data['EnableSharedByMeSummary'] = this.enableSharedByMeSummary;
    data['EnableExportToExcel'] = this.enableExportToExcel;
    data['EnableExportToPdf'] = this.enableExportToPdf;
    data['TemplateId'] = this.templateId;
    data['Template'] = this.template;
    data['OrderByColumnId'] = this.orderByColumnId;
    data['OrderByColumn'] = this.orderByColumn;
    data['OrderBy'] = this.orderBy;
    data['HideIndexHeader'] = this.hideIndexHeader;
    data['HideSummaryTabs'] = this.hideSummaryTabs;
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

class SelectedTableRows {
  String? columnHeaderName;
  String? advanceSetting;
  String? noteIndexPageTemplateId;
  String? noteIndexPageTemplate;
  String? columnMetadataId;
  String? columnMetadata;
  String? columnName;
  String? headerName;
  String? displayFormat;
  bool? enableSorting;
  bool? enableFiltering;
  bool? isForeignKeyTableColumn;
  String? foreignKeyTableAliasName;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  int? sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  SelectedTableRows({
    this.columnHeaderName,
    this.advanceSetting,
    this.noteIndexPageTemplateId,
    this.noteIndexPageTemplate,
    this.columnMetadataId,
    this.columnMetadata,
    this.columnName,
    this.headerName,
    this.displayFormat,
    this.enableSorting,
    this.enableFiltering,
    this.isForeignKeyTableColumn,
    this.foreignKeyTableAliasName,
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

  SelectedTableRows.fromJson(Map<String, dynamic> json) {
    columnHeaderName = json['ColumnHeaderName'];
    advanceSetting = json['AdvanceSetting'];
    noteIndexPageTemplateId = json['NoteIndexPageTemplateId'];
    noteIndexPageTemplate = json['NoteIndexPageTemplate'];
    columnMetadataId = json['ColumnMetadataId'];
    columnMetadata = json['ColumnMetadata'];
    columnName = json['ColumnName'];
    headerName = json['HeaderName'];
    displayFormat = json['DisplayFormat'];
    enableSorting = json['EnableSorting'];
    enableFiltering = json['EnableFiltering'];
    isForeignKeyTableColumn = json['IsForeignKeyTableColumn'];
    foreignKeyTableAliasName = json['ForeignKeyTableAliasName'];
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
    data['ColumnHeaderName'] = this.columnHeaderName;
    data['AdvanceSetting'] = this.advanceSetting;
    data['NoteIndexPageTemplateId'] = this.noteIndexPageTemplateId;
    data['NoteIndexPageTemplate'] = this.noteIndexPageTemplate;
    data['ColumnMetadataId'] = this.columnMetadataId;
    data['ColumnMetadata'] = this.columnMetadata;
    data['ColumnName'] = this.columnName;
    data['HeaderName'] = this.headerName;
    data['DisplayFormat'] = this.displayFormat;
    data['EnableSorting'] = this.enableSorting;
    data['EnableFiltering'] = this.enableFiltering;
    data['IsForeignKeyTableColumn'] = this.isForeignKeyTableColumn;
    data['ForeignKeyTableAliasName'] = this.foreignKeyTableAliasName;
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
