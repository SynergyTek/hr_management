class Service {
  Service({
    this.jsonCopy,
    this.json,
    this.dataJson,
    this.page,
    this.pageId,
    this.recordId,
    this.portalName,
    this.templateCode,
    this.templateDisplayName,
    this.serviceEventId,
    this.templateViewModel,
    this.serviceTable,
    this.columnList,
    this.tableMetadataId,
    this.udfTableMetadataId,
    this.udfNoteId,
    this.udfNoteTableId,
    this.serviceNo,
    this.serviceSubject,
    this.serviceDescription,
    this.moduleId,
    this.slaSeconds,
    this.startDate,
    this.dueDate,
    this.serviceSLA,
    this.serviceSlaMinutes,
    this.actualSla,
    this.reminderDate,
    this.serviceStatusBgCss,
    this.serviceStatusFontCss,
    this.serviceStatusId,
    this.serviceStatusCode,
    this.serviceTableId,
    this.serviceStatusName,
    this.serviceActionId,
    this.serviceActionCode,
    this.serviceActionName,
    this.servicePriorityId,
    this.servicePriorityCode,
    this.servicePriorityName,
    this.submittedDate,
    this.completedDate,
    this.rejectedDate,
    this.canceledDate,
    this.returnedDate,
    this.reopenedDate,
    this.closedDate,
    this.userRating,
    this.rejectionReason,
    this.returnReason,
    this.reopenReason,
    this.cancelReason,
    this.closeComment,
    this.completeReason,
    this.delegateReason,
    this.requestedByUserId,
    this.requestedByUserName,
    this.requestedByUserEmail,
    this.requestedByUserPhotoId,
    this.requestedByUser,
    this.ownerUserId,
    this.ownerUser,
    this.ownerUserName,
    this.ownerUserEmail,
    this.ownerUserPhotoId,
    this.serviceOwnerTypeId,
    this.activeUserType,
    this.assignedToHierarchyMasterId,
    this.assignedToHierarchyMasterName,
    this.assignedToHierarchyMasterLevelId,
    this.assignedToHierarchyMasterLevelName,
    this.isStepTaskAutoCompleteIfSameAssignee,
    this.setUdfValue,
    this.includeReadonlyData,
    this.parentServiceId,
    this.prms,
    this.udfs,
    this.readoOnlyUdfs,
    this.activeUserId,
    this.serviceId,
    this.isDraftButtonVisible,
    this.isSubmitButtonVisible,
    this.isInEditMode,
    this.isVersioningButtonVisible,
    this.isEditButtonVisible,
    this.isCancelButtonVisible,
    this.isReplyButtonVisible,
    this.isCompleteButtonVisible,
    this.isRejectButtonVisible,
    this.isCloseButtonVisible,
    this.sharedCount,
    this.attachmentCount,
    this.notificationCount,
    this.commentCount,
    this.serviceTemplateId,
    this.isAddCommentEnabled,
    this.isAddAttachmentEnabled,
    this.isSharingEnabled,
    this.includeSharedList,
    this.sharedListText,
    this.sharedList,
    this.sharedByUserId,
    this.sharedWithUserId,
    this.serviceCount,
    this.customUrl,
    this.returnUrl,
    this.layoutMode,
    this.popupCallbackMethod,
    this.viewType,
    this.viewMode,
    this.serviceIndexPageTemplateDetails,
    this.notificationTemplate,
    this.processDesign,
    this.udfTableMetadata,
    this.noteUdfTemplate,
    this.serviceNoTextWithDefault,
    this.hideStepTaskDetails,
    this.stepTasksList,
    this.isVersioning,
    this.adhocTaskTemplateId,
    this.chartItems,
    this.serviceTemplateVm,
    this.personId,
    this.stageName,
    this.stageId,
    this.workflowStepName,
    this.workflowStepId,
    this.referenceId,
    this.referenceType,
    this.logId,
    this.isLogRecord,
    this.postComment,
    this.bookItems,
    this.servicePlusId,
    this.notePlusId,
    this.taskPlusId,
    this.parentNoteId,
    this.parentTaskId,
    this.tableName,
    this.allReadOnly,
    this.isReopened,
    this.subject,
    this.notificationSubject,
    this.description,
    this.enableIndexPage,
    this.enableServiceNumberManual,
    this.enableSaveAsDraft,
    this.saveAsDraftText,
    this.saveAsDraftCss,
    this.submitButtonText,
    this.submitButtonCss,
    this.enableCompleteButton,
    this.completeButtonText,
    this.completeButtonCss,
    this.enableBackButton,
    this.backButtonText,
    this.backButtonCss,
    this.enableAttachment,
    this.enableComment,
    this.templateId,
    this.template,
    this.udfTemplateId,
    this.udfTemplate,
    this.serviceIndexPageTemplateId,
    this.serviceIndexPageTemplate,
    this.createReturnType,
    this.editReturnType,
    this.preScript,
    this.postScript,
    this.sla,
    this.allowSlaChange,
    this.priorityId,
    this.priority,
    this.iconFileId,
    this.templateColor,
    this.bannerFileId,
    this.backgroundFileId,
    this.subjectText,
    this.ownerUserText,
    this.requestedByUserText,
    this.enableCancelButton,
    this.cancelButtonText,
    this.cancelButtonCss,
    this.isCancelReasonRequired,
    this.serviceNoText,
    this.descriptionText,
    this.hideHeader,
    this.hideSubject,
    this.hideDescription,
    this.hideServiceOwner,
    this.hideStartDate,
    this.hideExpiryDate,
    this.hideSLA,
    this.hidePriority,
    this.isSubjectMandatory,
    this.isSubjectUnique,
    this.isDescriptionMandatory,
    this.hideToolbar,
    this.hideBanner,
    this.allowPastStartDate,
    this.adhocTaskTemplateIds,
    this.enablePrintButton,
    this.printButtonText,
    this.enableDataPermission,
    this.dataPermissionColumnId,
    this.numberGenerationType,
    this.isNumberNotMandatory,
    this.enableLegalEntityFilter,
    this.defaultServiceOwnerTypeId,
    this.defaultServiceOwnerType,
    this.defaultOwnerUserId,
    this.defaultOwnerUser,
    this.defaultOwnerTeamId,
    this.defaultOwnerTeam,
    this.defaultServiceRequesterTypeId,
    this.defaultServiceRequesterType,
    this.defaultRequesterUserId,
    this.defaultRequesterUser,
    this.defaultRequesterTeamId,
    this.defaultRequesterTeam,
    this.hideOwner,
    this.enablePermission,
    this.enableInlineComment,
    this.enableAdhocTask,
    this.adhocServiceTemplateIds,
    this.adhocNoteTemplateIds,
    this.serviceTemplateType,
    this.emailCopyTemplateCode,
    this.formType,
    this.enableDynamicStepTaskSelection,
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
    this.ownerUserUserName,
    this.dueDateDisplay,
  });
  dynamic jsonCopy;
  dynamic dataJson;
  dynamic page;
  dynamic pageId;
  dynamic recordId;
  dynamic serviceTable;
  List<ColumnList>? columnList;
  dynamic tableMetadataId;
  dynamic templateViewModel;
  String? json;
  String? portalName;
  String? templateCode;
  String? templateDisplayName;
  String? serviceEventId;
  String? udfTableMetadataId;
  String? udfNoteId;
  String? udfNoteTableId;
  String? serviceNo;
  String? serviceSubject;
  String? serviceDescription;
  String? moduleId;
  String? slaSeconds;
  String? serviceSLA;
  String? actualSla;
  double? serviceSlaMinutes;
  String? startDate;
  String? dueDate;
  String? reminderDate;
  String? serviceStatusBgCss;
  String? serviceStatusFontCss;
  String? serviceStatusId;
  String? serviceStatusCode;
  dynamic serviceTableId;
  String? serviceStatusName;
  dynamic serviceActionId;
  dynamic serviceActionCode;
  dynamic serviceActionName;
  String? servicePriorityId;
  String? servicePriorityCode;
  String? servicePriorityName;
  String? submittedDate;
  String? completedDate;
  String? rejectedDate;
  String? canceledDate;
  String? returnedDate;
  String? reopenedDate;
  String? closedDate;
  dynamic userRating;
  String? rejectionReason;
  String? returnReason;
  String? reopenReason;
  String? cancelReason;
  String? closeComment;
  String? completeReason;
  String? delegateReason;
  String? requestedByUserId;
  String? requestedByUserName;
  String? requestedByUserEmail;
  dynamic requestedByUserPhotoId;
  dynamic requestedByUser;
  String? ownerUserId;
  dynamic ownerUser;
  String? ownerUserName;
  String? ownerUserEmail;
  dynamic ownerUserPhotoId;
  dynamic serviceOwnerTypeId;
  int? activeUserType;
  dynamic assignedToHierarchyMasterId;
  String? assignedToHierarchyMasterName;
  dynamic assignedToHierarchyMasterLevelId;
  String? assignedToHierarchyMasterLevelName;
  bool? isStepTaskAutoCompleteIfSameAssignee;
  bool? setUdfValue;
  bool? includeReadonlyData;
  dynamic parentServiceId;
  dynamic prms;
  dynamic udfs;
  dynamic readoOnlyUdfs;
  String? activeUserId;
  String? serviceId;
  bool? isDraftButtonVisible;
  bool? isSubmitButtonVisible;
  bool? isInEditMode;
  bool? isVersioningButtonVisible;
  bool? isEditButtonVisible;
  bool? isCancelButtonVisible;
  bool? isReplyButtonVisible;
  bool? isCompleteButtonVisible;
  bool? isRejectButtonVisible;
  bool? isCloseButtonVisible;
  int? sharedCount;
  int? attachmentCount;
  int? notificationCount;
  int? commentCount;
  String? serviceTemplateId;
  bool? isAddCommentEnabled;
  bool? isAddAttachmentEnabled;
  bool? isSharingEnabled;
  bool? includeSharedList;
  String? sharedListText;
  dynamic sharedList;
  dynamic sharedByUserId;
  dynamic sharedWithUserId;
  int? serviceCount;
  String? customUrl;
  String? returnUrl;
  dynamic layoutMode;
  dynamic popupCallbackMethod;
  String? viewType;
  dynamic viewMode;
  dynamic serviceIndexPageTemplateDetails;
  dynamic notificationTemplate;
  dynamic processDesign;
  dynamic udfTableMetadata;
  dynamic noteUdfTemplate;
  String? serviceNoTextWithDefault;
  bool? hideStepTaskDetails;
  List<StepTasksList>? stepTasksList;
  bool? isVersioning;
  dynamic adhocTaskTemplateId;
  dynamic chartItems;
  dynamic serviceTemplateVm;
  dynamic personId;
  String? stageName;
  dynamic stageId;
  String? workflowStepName;
  dynamic workflowStepId;
  dynamic referenceId;
  int? referenceType;
  dynamic logId;
  bool? isLogRecord;
  String? postComment;
  dynamic bookItems;
  dynamic servicePlusId;
  dynamic notePlusId;
  dynamic taskPlusId;
  dynamic parentNoteId;
  dynamic parentTaskId;
  String? tableName;
  bool? allReadOnly;
  bool? isReopened;
  String? subject;
  String? notificationSubject;
  String? description;
  bool? enableIndexPage;
  bool? enableServiceNumberManual;
  bool? enableSaveAsDraft;
  String? saveAsDraftText;
  dynamic saveAsDraftCss;
  String? submitButtonText;
  dynamic submitButtonCss;
  bool? enableCompleteButton;
  String? completeButtonText;
  dynamic completeButtonCss;
  bool? enableBackButton;
  String? backButtonText;
  dynamic backButtonCss;
  bool? enableAttachment;
  bool? enableComment;
  String? templateId;
  dynamic template;
  String? udfTemplateId;
  dynamic udfTemplate;
  String? serviceIndexPageTemplateId;
  dynamic serviceIndexPageTemplate;
  int? createReturnType;
  int? editReturnType;
  dynamic preScript;
  dynamic postScript;
  dynamic sla;
  bool? allowSlaChange;
  String? priorityId;
  dynamic priority;
  dynamic iconFileId;
  dynamic templateColor;
  dynamic bannerFileId;
  dynamic backgroundFileId;
  String? subjectText;
  String? ownerUserText;
  String? requestedByUserText;
  bool? enableCancelButton;
  String? cancelButtonText;
  String? cancelButtonCss;
  bool? isCancelReasonRequired;
  String? serviceNoText;
  String? descriptionText;
  bool? hideHeader;
  bool? hideSubject;
  bool? hideDescription;
  bool? hideServiceOwner;
  bool? hideStartDate;
  bool? hideExpiryDate;
  bool? hideSLA;
  bool? hidePriority;
  bool? isSubjectMandatory;
  bool? isSubjectUnique;
  bool? isDescriptionMandatory;
  bool? hideToolbar;
  bool? hideBanner;
  bool? allowPastStartDate;
  List<String>? adhocTaskTemplateIds;
  bool? enablePrintButton;
  String? printButtonText;
  bool? enableDataPermission;
  dynamic dataPermissionColumnId;
  int? numberGenerationType;
  bool? isNumberNotMandatory;
  bool? enableLegalEntityFilter;
  dynamic defaultServiceOwnerTypeId;
  dynamic defaultServiceOwnerType;
  dynamic defaultOwnerUserId;
  dynamic defaultOwnerUser;
  dynamic defaultOwnerTeamId;
  dynamic defaultOwnerTeam;
  dynamic defaultServiceRequesterTypeId;
  dynamic defaultServiceRequesterType;
  dynamic defaultRequesterUserId;
  dynamic defaultRequesterUser;
  dynamic defaultRequesterTeamId;
  dynamic defaultRequesterTeam;
  bool? hideOwner;
  bool? enablePermission;
  bool? enableInlineComment;
  bool? enableAdhocTask;
  List<String>? adhocServiceTemplateIds;
  List<String>? adhocNoteTemplateIds;
  dynamic serviceTemplateType;
  dynamic emailCopyTemplateCode;
  int? formType;
  bool? enableDynamicStepTaskSelection;
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
  String? ownerUserUserName;
  dynamic portalId;
  String? dueDateDisplay;

  Service.fromJson(Map<String, dynamic> jsonValue) {
    jsonCopy = jsonValue["JsonCopy"];
    dataJson = jsonValue["DataJson"];
    page = jsonValue["Page"];
    pageId = jsonValue["PageId"];
    recordId = jsonValue["RecordId"];
    portalName = jsonValue["PortalName"];
    json = jsonValue["Json"];
    templateCode = jsonValue['TemplateCode'];
    templateDisplayName = jsonValue['TemplateDisplayName'];
    serviceEventId = jsonValue['ServiceEventId'];
    templateViewModel = jsonValue['TemplateViewModel'];
    serviceTable = jsonValue['ServiceTable'];
    tableMetadataId = jsonValue['TableMetadataId'];
    udfTableMetadataId = jsonValue['UdfTableMetadataId'];
    udfNoteId = jsonValue['UdfNoteId'];
    udfNoteTableId = jsonValue['UdfNoteTableId'];
    serviceDescription = jsonValue['ServiceDescription'];
    moduleId = jsonValue['ModuleId'];
    slaSeconds = jsonValue['SLASeconds'];
    if (jsonValue['ColumnList'] != null) {
      columnList = List.from(jsonValue['ColumnList'])
          .map((e) => ColumnList.fromJson(e))
          .toList();
    }
    serviceNo = jsonValue['ServiceNo'];
    serviceSubject = jsonValue['ServiceSubject'];
    startDate = jsonValue["StartDate"].toString();
    dueDate = jsonValue["DueDate"].toString();
    serviceSLA = jsonValue['ServiceSLA'];
    serviceSlaMinutes = jsonValue['ServiceSLAMinutes'];
    actualSla = jsonValue['ActualSLA'];
    if (jsonValue["ReminderDate"] != null) {
      reminderDate = jsonValue["ReminderDate"].toString();
    }
    serviceStatusBgCss = jsonValue['ServiceStatusBgCss'];
    serviceStatusFontCss = jsonValue['ServiceStatusFontCss'];
    serviceStatusId = jsonValue['ServiceStatusId'];
    serviceStatusCode = jsonValue['ServiceStatusCode'];
    serviceTableId = jsonValue['ServiceTableId'];
    serviceStatusName = jsonValue['ServiceStatusName'];
    serviceActionId = jsonValue['ServiceActionId'];
    serviceActionCode = jsonValue['ServiceActionCode'];
    serviceActionName = jsonValue['ServiceActionName'];
    servicePriorityId = jsonValue['ServicePriorityId'];
    servicePriorityCode = jsonValue['ServicePriorityCode'];
    servicePriorityName = jsonValue['ServicePriorityName'];
    if (jsonValue["SubmittedDate"] != null) {
      submittedDate = jsonValue["SubmittedDate"];
    }
    if (jsonValue["CompletedDate"] != null) {
      completedDate = jsonValue["CompletedDate"];
    }
    if (jsonValue["RejectedDate"] != null) {
      rejectedDate = jsonValue["RejectedDate"];
    }
    if (jsonValue["CanceledDate"] != null) {
      canceledDate = jsonValue["CanceledDate"];
    }
    if (jsonValue["ReturnedDate"] != null) {
      returnedDate = jsonValue["ReturnedDate"];
    }
    if (jsonValue["ReopenedDate"] != null) {
      reopenedDate = jsonValue["ReopenedDate"];
    }
    if (jsonValue["ClosedDate"] != null) {
      closedDate = jsonValue["ClosedDate"];
    }
    rejectionReason = jsonValue['RejectionReason'];
    returnReason = jsonValue['ReturnReason'];
    reopenReason = jsonValue['ReopenReason'];
    cancelReason = jsonValue['CancelReason'];
    completeReason = jsonValue['CompleteReason'];
    delegateReason = jsonValue['DelegateReason'];
    closeComment = jsonValue['CloseComment'];
    userRating = jsonValue['UserRating'];
    requestedByUserId = jsonValue['RequestedByUserId'];
    requestedByUserName = jsonValue['RequestedByUserName'];
    requestedByUserEmail = jsonValue['RequestedByUserEmail'];
    requestedByUserPhotoId = jsonValue['RequestedByUserPhotoId'];
    requestedByUser = jsonValue['RequestedByUser'];
    ownerUserId = jsonValue['OwnerUserId'];
    ownerUser = jsonValue['OwnerUser'];
    ownerUserName = jsonValue['OwnerUserName'];
    ownerUserEmail = jsonValue['OwnerUserEmail'];
    ownerUserPhotoId = jsonValue['OwnerUserPhotoId'];
    serviceOwnerTypeId = jsonValue['ServiceOwnerTypeId'];
    activeUserType = jsonValue['ActiveUserType'];
    assignedToHierarchyMasterId = jsonValue['AssignedToHierarchyMasterId'];
    assignedToHierarchyMasterName = jsonValue['AssignedToHierarchyMasterName'];
    assignedToHierarchyMasterLevelId =
        jsonValue['AssignedToHierarchyMasterLevelId'];
    assignedToHierarchyMasterLevelName =
        jsonValue['AssignedToHierarchyMasterLevelName'];
    isStepTaskAutoCompleteIfSameAssignee =
        jsonValue['IsStepTaskAutoCompleteIfSameAssignee'];
    setUdfValue = jsonValue['SetUdfValue'];
    includeReadonlyData = jsonValue['IncludeReadonlyData'];
    parentServiceId = jsonValue['ParentServiceId'];
    prms = jsonValue['Prms'];
    udfs = jsonValue['Udfs'];
    readoOnlyUdfs = jsonValue['ReadoOnlyUdfs'];
    activeUserId = jsonValue['ActiveUserId'];
    serviceId = jsonValue['ServiceId'];
    isDraftButtonVisible = jsonValue['IsDraftButtonVisible'];
    isSubmitButtonVisible = jsonValue['IsSubmitButtonVisible'];
    isInEditMode = jsonValue['IsInEditMode'];
    isVersioningButtonVisible = jsonValue['IsVersioningButtonVisible'];
    isEditButtonVisible = jsonValue['IsEditButtonVisible'];
    isCancelButtonVisible = jsonValue['IsCancelButtonVisible'];
    isReplyButtonVisible = jsonValue['IsReplyButtonVisible'];
    isCompleteButtonVisible = jsonValue['IsCompleteButtonVisible'];
    isRejectButtonVisible = jsonValue['IsRejectButtonVisible'];
    isCloseButtonVisible = jsonValue['IsCloseButtonVisible'];
    sharedCount = jsonValue['SharedCount'];
    attachmentCount = jsonValue['AttachmentCount'];
    notificationCount = jsonValue['NotificationCount'];
    commentCount = jsonValue['CommentCount'];
    serviceTemplateId = jsonValue['ServiceTemplateId'];
    isAddCommentEnabled = jsonValue['IsAddCommentEnabled'];
    isAddAttachmentEnabled = jsonValue['IsAddAttachmentEnabled'];
    isSharingEnabled = jsonValue['IsSharingEnabled'];
    includeSharedList = jsonValue['IncludeSharedList'];
    sharedListText = jsonValue['SharedListText'];
    sharedList = jsonValue['SharedList'];
    sharedByUserId = jsonValue['SharedByUserId'];
    sharedWithUserId = jsonValue['SharedWithUserId'];
    serviceCount = jsonValue['ServiceCount'];
    customUrl = jsonValue['CustomUrl'];
    returnUrl = jsonValue['ReturnUrl'];
    layoutMode = jsonValue['LayoutMode'];
    popupCallbackMethod = jsonValue['PopupCallbackMethod'];
    viewType = jsonValue['ViewType'];
    viewMode = jsonValue['ViewMode'];
    serviceIndexPageTemplateDetails =
        jsonValue['ServiceIndexPageTemplateDetails'];
    notificationTemplate = jsonValue['NotificationTemplate'];
    processDesign = jsonValue['ProcessDesign'];
    udfTableMetadata = jsonValue['UdfTableMetadata'];
    noteUdfTemplate = jsonValue['NoteUdfTemplate'];
    serviceNoTextWithDefault = jsonValue['ServiceNoTextWithDefault'];
    hideStepTaskDetails = jsonValue['HideStepTaskDetails'];
    if (jsonValue['StepTasksList'] != null) {
      stepTasksList = List.from(jsonValue['StepTasksList'])
          .map((e) => StepTasksList.fromJson(e))
          .toList();
    }
    isVersioning = jsonValue['IsVersioning'];
    adhocTaskTemplateId = jsonValue['AdhocTaskTemplateId'];
    chartItems = jsonValue['ChartItems'];
    serviceTemplateVm = jsonValue['ServiceTemplateVM'];
    personId = jsonValue['PersonId'];
    stageName = jsonValue['StageName'];
    stageId = jsonValue['StageId'];
    workflowStepName = jsonValue['WorkflowStepName'];
    workflowStepId = jsonValue['WorkflowStepId'];
    referenceId = jsonValue['ReferenceId'];
    referenceType = jsonValue['ReferenceType'];
    logId = jsonValue['LogId'];
    isLogRecord = jsonValue['IsLogRecord'];
    postComment = jsonValue['PostComment'];
    bookItems = jsonValue['BookItems'];
    servicePlusId = jsonValue['ServicePlusId'];
    notePlusId = jsonValue['NotePlusId'];
    taskPlusId = jsonValue['TaskPlusId'];
    parentNoteId = jsonValue['ParentNoteId'];
    parentTaskId = jsonValue['ParentTaskId'];
    tableName = jsonValue['TableName'];
    allReadOnly = jsonValue['AllReadOnly'];
    isReopened = jsonValue['IsReopened'];
    subject = jsonValue['Subject'];
    notificationSubject = jsonValue['NotificationSubject'];
    description = jsonValue['Description'];
    enableIndexPage = jsonValue['EnableIndexPage'];
    enableServiceNumberManual = jsonValue['EnableServiceNumberManual'];
    enableSaveAsDraft = jsonValue['EnableSaveAsDraft'];
    saveAsDraftText = jsonValue['SaveAsDraftText'];
    saveAsDraftCss = jsonValue['SaveAsDraftCss'];
    submitButtonText = jsonValue['SubmitButtonText'];
    submitButtonCss = jsonValue['SubmitButtonCss'];
    enableCompleteButton = jsonValue['EnableCompleteButton'];
    completeButtonText = jsonValue['CompleteButtonText'];
    completeButtonCss = jsonValue['CompleteButtonCss'];
    enableBackButton = jsonValue['EnableBackButton'];
    backButtonText = jsonValue['BackButtonText'];
    backButtonCss = jsonValue['BackButtonCss'];
    enableAttachment = jsonValue['EnableAttachment'];
    enableComment = jsonValue['EnableComment'];
    templateId = jsonValue['TemplateId'];
    template = jsonValue['Template'];
    udfTemplateId = jsonValue['UdfTemplateId'];
    udfTemplate = jsonValue['UdfTemplate'];
    serviceIndexPageTemplateId = jsonValue['ServiceIndexPageTemplateId'];
    serviceIndexPageTemplate = jsonValue['ServiceIndexPageTemplate'];
    createReturnType = jsonValue['CreateReturnType'];
    editReturnType = jsonValue['EditReturnType'];
    preScript = jsonValue['PreScript'];
    postScript = jsonValue['PostScript'];
    sla = jsonValue['SLA'];
    allowSlaChange = jsonValue['AllowSLAChange'];
    priorityId = jsonValue['PriorityId'];
    priority = jsonValue['Priority'];
    iconFileId = jsonValue['IconFileId'];
    templateColor = jsonValue['TemplateColor'];
    bannerFileId = jsonValue['BannerFileId'];
    backgroundFileId = jsonValue['BackgroundFileId'];
    subjectText = jsonValue['SubjectText'];
    ownerUserText = jsonValue['OwnerUserText'];
    requestedByUserText = jsonValue['RequestedByUserText'];
    enableCancelButton = jsonValue['EnableCancelButton'];
    cancelButtonText = jsonValue['CancelButtonText'];
    cancelButtonCss = jsonValue['CancelButtonCss'];
    isCancelReasonRequired = jsonValue['IsCancelReasonRequired'];
    serviceNoText = jsonValue['ServiceNoText'];
    descriptionText = jsonValue['DescriptionText'];
    hideHeader = jsonValue['HideHeader'];
    hideSubject = jsonValue['HideSubject'];
    hideDescription = jsonValue['HideDescription'];
    hideServiceOwner = jsonValue['HideServiceOwner'];
    hideStartDate = jsonValue['HideStartDate'];
    hideExpiryDate = jsonValue['HideExpiryDate'];
    hideSLA = jsonValue['HideSLA'];
    hidePriority = jsonValue['HidePriority'];
    isSubjectMandatory = jsonValue['IsSubjectMandatory'];
    isSubjectUnique = jsonValue['IsSubjectUnique'];
    isDescriptionMandatory = jsonValue['IsDescriptionMandatory'];
    hideToolbar = jsonValue['HideToolbar'];
    hideBanner = jsonValue['HideBanner'];
    allowPastStartDate = jsonValue['AllowPastStartDate'];
    if (jsonValue['AdhocTaskTemplateIds'] != null) {
      adhocTaskTemplateIds =
          List.castFrom<dynamic, String>(jsonValue['AdhocTaskTemplateIds']);
    }
    enablePrintButton = jsonValue['EnablePrintButton'];
    printButtonText = jsonValue['PrintButtonText'];
    enableDataPermission = jsonValue['EnableDataPermission'];
    dataPermissionColumnId = jsonValue['DataPermissionColumnId'];
    numberGenerationType = jsonValue['NumberGenerationType'];
    isNumberNotMandatory = jsonValue['IsNumberNotMandatory'];
    enableLegalEntityFilter = jsonValue['EnableLegalEntityFilter'];
    defaultServiceOwnerTypeId = jsonValue['DefaultServiceOwnerTypeId'];
    defaultServiceOwnerType = jsonValue['DefaultServiceOwnerType'];
    defaultOwnerUserId = jsonValue['DefaultOwnerUserId'];
    defaultOwnerUser = jsonValue['DefaultOwnerUser'];
    defaultOwnerTeamId = jsonValue['DefaultOwnerTeamId'];
    defaultOwnerTeam = jsonValue['DefaultOwnerTeam'];
    defaultServiceRequesterTypeId = jsonValue['DefaultServiceRequesterTypeId'];
    defaultServiceRequesterType = jsonValue['DefaultServiceRequesterType'];
    defaultRequesterUserId = jsonValue['DefaultRequesterUserId'];
    defaultRequesterUser = jsonValue['DefaultRequesterUser'];
    defaultRequesterTeamId = jsonValue['DefaultRequesterTeamId'];
    defaultRequesterTeam = jsonValue['DefaultRequesterTeam'];
    hideOwner = jsonValue['HideOwner'];
    enablePermission = jsonValue['EnablePermission'];
    enableInlineComment = jsonValue['EnableInlineComment'];
    enableAdhocTask = jsonValue['EnableAdhocTask'];
    if (jsonValue['AdhocServiceTemplateIds'] != null) {
      adhocServiceTemplateIds =
          List.castFrom<dynamic, String>(jsonValue['AdhocServiceTemplateIds']);
    }
    if (jsonValue['AdhocNoteTemplateIds'] != null) {
      adhocNoteTemplateIds =
          List.castFrom<dynamic, String>(jsonValue['AdhocNoteTemplateIds']);
    }
    serviceTemplateType = jsonValue['ServiceTemplateType'];
    emailCopyTemplateCode = jsonValue['EmailCopyTemplateCode'];
    formType = jsonValue['FormType'];
    enableDynamicStepTaskSelection =
        jsonValue['EnableDynamicStepTaskSelection'];
    id = jsonValue['Id'];
    createdBy = jsonValue['CreatedBy'];
    createdDate = jsonValue["CreatedDate"].toString();
    lastUpdatedDate = jsonValue["LastUpdatedDate"].toString();
    lastUpdatedBy = jsonValue['LastUpdatedBy'];
    isDeleted = jsonValue['IsDeleted'];
    sequenceOrder = jsonValue['SequenceOrder'];
    companyId = jsonValue['CompanyId'];
    legalEntityId = jsonValue['LegalEntityId'];
    dataAction = jsonValue['DataAction'];
    status = jsonValue['Status'];
    versionNo = jsonValue['VersionNo'];
    portalId = jsonValue['PortalId'];
    ownerUserUserName = jsonValue['OwnerUserUserName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['JsonCopy'] = jsonCopy;
    _data['Json'] = json;
    _data['DataJson'] = dataJson;
    _data['Page'] = page;
    _data['PageId'] = pageId;
    _data['RecordId'] = recordId;
    _data['PortalName'] = portalName;
    _data['TemplateCode'] = templateCode;
    _data['TemplateDisplayName'] = templateDisplayName;
    _data['ServiceEventId'] = serviceEventId;
    _data['TemplateViewModel'] = templateViewModel;
    _data['ServiceTable'] = serviceTable;
    _data['ColumnList'] =
        List<dynamic>.from(columnList!.map((x) => x.toJson()));
    // _data['ColumnList'] = ColumnList.map((e)=>e.toJson()).toListcolumnList;
    _data['TableMetadataId'] = tableMetadataId;
    _data['UdfTableMetadataId'] = udfTableMetadataId;
    _data['UdfNoteId'] = udfNoteId;
    _data['UdfNoteTableId'] = udfNoteTableId;
    _data['ServiceNo'] = serviceNo;
    _data['ServiceSubject'] = serviceSubject;
    _data['ServiceDescription'] = serviceDescription;
    _data['ModuleId'] = moduleId;
    _data['SLASeconds'] = slaSeconds;
    _data['StartDate'] = startDate;
    _data['DueDate'] = dueDate;
    _data['ServiceSLA'] = serviceSLA;
    _data['ServiceSLAMinutes'] = serviceSlaMinutes;
    _data['ActualSLA'] = actualSla;
    _data['ReminderDate'] = reminderDate;
    _data['ServiceStatusBgCss'] = serviceStatusBgCss;
    _data['ServiceStatusFontCss'] = serviceStatusFontCss;
    _data['ServiceStatusId'] = serviceStatusId;
    _data['ServiceStatusCode'] = serviceStatusCode;
    _data['ServiceTableId'] = serviceTableId;
    _data['ServiceStatusName'] = serviceStatusName;
    _data['ServiceActionId'] = serviceActionId;
    _data['ServiceActionCode'] = serviceActionCode;
    _data['ServiceActionName'] = serviceActionName;
    _data['ServicePriorityId'] = servicePriorityId;
    _data['ServicePriorityCode'] = servicePriorityCode;
    _data['ServicePriorityName'] = servicePriorityName;
    _data['SubmittedDate'] = submittedDate;
    _data['CompletedDate'] = completedDate;
    _data['RejectedDate'] = rejectedDate;
    _data['CanceledDate'] = canceledDate;
    _data['ReturnedDate'] = returnedDate;
    _data['ReopenedDate'] = reopenedDate;
    _data['ClosedDate'] = closedDate;
    _data['RejectionReason'] = rejectionReason;
    _data['ReturnReason'] = returnReason;
    _data['ReopenReason'] = reopenReason;
    _data['CancelReason'] = cancelReason;
    _data['CloseComment'] = closeComment;
    _data['UserRating'] = userRating;
    _data['CompleteReason'] = completeReason;
    _data['DelegateReason'] = delegateReason;
    _data['RequestedByUserId'] = requestedByUserId;
    _data['RequestedByUserName'] = requestedByUserName;
    _data['RequestedByUserEmail'] = requestedByUserEmail;
    _data['RequestedByUserPhotoId'] = requestedByUserPhotoId;
    _data['RequestedByUser'] = requestedByUser;
    _data['OwnerUserId'] = ownerUserId;
    _data['OwnerUser'] = ownerUser;
    _data['OwnerUserName'] = ownerUserName;
    _data['OwnerUserEmail'] = ownerUserEmail;
    _data['OwnerUserPhotoId'] = ownerUserPhotoId;
    _data['ServiceOwnerTypeId'] = serviceOwnerTypeId;
    _data['ActiveUserType'] = activeUserType;
    _data['AssignedToHierarchyMasterId'] = assignedToHierarchyMasterId;
    _data['AssignedToHierarchyMasterName'] = assignedToHierarchyMasterName;
    _data['AssignedToHierarchyMasterLevelId'] =
        assignedToHierarchyMasterLevelId;
    _data['AssignedToHierarchyMasterLevelName'] =
        assignedToHierarchyMasterLevelName;
    _data['IsStepTaskAutoCompleteIfSameAssignee'] =
        isStepTaskAutoCompleteIfSameAssignee;
    _data['SetUdfValue'] = setUdfValue;
    _data['IncludeReadonlyData'] = includeReadonlyData;
    _data['ParentServiceId'] = parentServiceId;
    _data['Prms'] = prms;
    _data['Udfs'] = udfs;
    _data['ReadoOnlyUdfs'] = readoOnlyUdfs;
    _data['ActiveUserId'] = activeUserId;
    _data['ServiceId'] = serviceId;
    _data['IsDraftButtonVisible'] = isDraftButtonVisible;
    _data['IsSubmitButtonVisible'] = isSubmitButtonVisible;
    _data['IsInEditMode'] = isInEditMode;
    _data['IsVersioningButtonVisible'] = isVersioningButtonVisible;
    _data['IsEditButtonVisible'] = isEditButtonVisible;
    _data['IsCancelButtonVisible'] = isCancelButtonVisible;
    _data['IsReplyButtonVisible'] = isReplyButtonVisible;
    _data['IsCompleteButtonVisible'] = isCompleteButtonVisible;
    _data['IsRejectButtonVisible'] = isRejectButtonVisible;
    _data['IsCloseButtonVisible'] = isCloseButtonVisible;
    _data['SharedCount'] = sharedCount;
    _data['AttachmentCount'] = attachmentCount;
    _data['NotificationCount'] = notificationCount;
    _data['CommentCount'] = commentCount;
    _data['ServiceTemplateId'] = serviceTemplateId;
    _data['IsAddCommentEnabled'] = isAddCommentEnabled;
    _data['IsAddAttachmentEnabled'] = isAddAttachmentEnabled;
    _data['IsSharingEnabled'] = isSharingEnabled;
    _data['IncludeSharedList'] = includeSharedList;
    _data['SharedListText'] = sharedListText;
    _data['SharedList'] = sharedList;
    _data['SharedByUserId'] = sharedByUserId;
    _data['SharedWithUserId'] = sharedWithUserId;
    _data['ServiceCount'] = serviceCount;
    _data['CustomUrl'] = customUrl;
    _data['ReturnUrl'] = returnUrl;
    _data['LayoutMode'] = layoutMode;
    _data['PopupCallbackMethod'] = popupCallbackMethod;
    _data['ViewType'] = viewType;
    _data['ViewMode'] = viewMode;
    _data['ServiceIndexPageTemplateDetails'] = serviceIndexPageTemplateDetails;
    _data['NotificationTemplate'] = notificationTemplate;
    _data['ProcessDesign'] = processDesign;
    _data['UdfTableMetadata'] = udfTableMetadata;
    _data['NoteUdfTemplate'] = noteUdfTemplate;
    _data['ServiceNoTextWithDefault'] = serviceNoTextWithDefault;
    _data['HideStepTaskDetails'] = hideStepTaskDetails;
    // _data['StepTasksList'] =
    //     List<dynamic>.from(stepTasksList!.map((x) => x.toJson()));
    // StepTasksList.map((e) => e.toJson()).toListstepTasksList;
    _data['IsVersioning'] = isVersioning;
    _data['AdhocTaskTemplateId'] = adhocTaskTemplateId;
    _data['ChartItems'] = chartItems;
    _data['ServiceTemplateVM'] = serviceTemplateVm;
    _data['PersonId'] = personId;
    _data['StageName'] = stageName;
    _data['StageId'] = stageId;
    _data['WorkflowStepName'] = workflowStepName;
    _data['WorkflowStepId'] = workflowStepId;
    _data['ReferenceId'] = referenceId;
    _data['ReferenceType'] = referenceType;
    _data['LogId'] = logId;
    _data['IsLogRecord'] = isLogRecord;
    _data['PostComment'] = postComment;
    _data['BookItems'] = bookItems;
    _data['ServicePlusId'] = servicePlusId;
    _data['NotePlusId'] = notePlusId;
    _data['TaskPlusId'] = taskPlusId;
    _data['ParentNoteId'] = parentNoteId;
    _data['ParentTaskId'] = parentTaskId;
    _data['TableName'] = tableName;
    _data['AllReadOnly'] = allReadOnly;
    _data['IsReopened'] = isReopened;
    _data['Subject'] = subject;
    _data['NotificationSubject'] = notificationSubject;
    _data['Description'] = description;
    _data['EnableIndexPage'] = enableIndexPage;
    _data['EnableServiceNumberManual'] = enableServiceNumberManual;
    _data['EnableSaveAsDraft'] = enableSaveAsDraft;
    _data['SaveAsDraftText'] = saveAsDraftText;
    _data['SaveAsDraftCss'] = saveAsDraftCss;
    _data['SubmitButtonText'] = submitButtonText;
    _data['SubmitButtonCss'] = submitButtonCss;
    _data['EnableCompleteButton'] = enableCompleteButton;
    _data['CompleteButtonText'] = completeButtonText;
    _data['CompleteButtonCss'] = completeButtonCss;
    _data['EnableBackButton'] = enableBackButton;
    _data['BackButtonText'] = backButtonText;
    _data['BackButtonCss'] = backButtonCss;
    _data['EnableAttachment'] = enableAttachment;
    _data['EnableComment'] = enableComment;
    _data['TemplateId'] = templateId;
    _data['Template'] = template;
    _data['UdfTemplateId'] = udfTemplateId;
    _data['UdfTemplate'] = udfTemplate;
    _data['ServiceIndexPageTemplateId'] = serviceIndexPageTemplateId;
    _data['ServiceIndexPageTemplate'] = serviceIndexPageTemplate;
    _data['CreateReturnType'] = createReturnType;
    _data['EditReturnType'] = editReturnType;
    _data['PreScript'] = preScript;
    _data['PostScript'] = postScript;
    _data['SLA'] = sla;
    _data['AllowSLAChange'] = allowSlaChange;
    _data['PriorityId'] = priorityId;
    _data['Priority'] = priority;
    _data['IconFileId'] = iconFileId;
    _data['TemplateColor'] = templateColor;
    _data['BannerFileId'] = bannerFileId;
    _data['BackgroundFileId'] = backgroundFileId;
    _data['SubjectText'] = subjectText;
    _data['OwnerUserText'] = ownerUserText;
    _data['RequestedByUserText'] = requestedByUserText;
    _data['EnableCancelButton'] = enableCancelButton;
    _data['CancelButtonText'] = cancelButtonText;
    _data['CancelButtonCss'] = cancelButtonCss;
    _data['IsCancelReasonRequired'] = isCancelReasonRequired;
    _data['ServiceNoText'] = serviceNoText;
    _data['DescriptionText'] = descriptionText;
    _data['HideHeader'] = hideHeader;
    _data['HideSubject'] = hideSubject;
    _data['HideDescription'] = hideDescription;
    _data['HideServiceOwner'] = hideServiceOwner;
    _data['HideStartDate'] = hideStartDate;
    _data['HideExpiryDate'] = hideExpiryDate;
    _data['HideSLA'] = hideSLA;
    _data['HidePriority'] = hidePriority;
    _data['IsSubjectMandatory'] = isSubjectMandatory;
    _data['IsSubjectUnique'] = isSubjectUnique;
    _data['IsDescriptionMandatory'] = isDescriptionMandatory;
    _data['HideToolbar'] = hideToolbar;
    _data['HideBanner'] = hideBanner;
    _data['AllowPastStartDate'] = allowPastStartDate;
    _data['AdhocTaskTemplateIds'] = adhocTaskTemplateIds;
    _data['EnablePrintButton'] = enablePrintButton;
    _data['PrintButtonText'] = printButtonText;
    _data['EnableDataPermission'] = enableDataPermission;
    _data['DataPermissionColumnId'] = dataPermissionColumnId;
    _data['NumberGenerationType'] = numberGenerationType;
    _data['IsNumberNotMandatory'] = isNumberNotMandatory;
    _data['EnableLegalEntityFilter'] = enableLegalEntityFilter;
    _data['DefaultServiceOwnerTypeId'] = defaultServiceOwnerTypeId;
    _data['DefaultServiceOwnerType'] = defaultServiceOwnerType;
    _data['DefaultOwnerUserId'] = defaultOwnerUserId;
    _data['DefaultOwnerUser'] = defaultOwnerUser;
    _data['DefaultOwnerTeamId'] = defaultOwnerTeamId;
    _data['DefaultOwnerTeam'] = defaultOwnerTeam;
    _data['DefaultServiceRequesterTypeId'] = defaultServiceRequesterTypeId;
    _data['DefaultServiceRequesterType'] = defaultServiceRequesterType;
    _data['DefaultRequesterUserId'] = defaultRequesterUserId;
    _data['DefaultRequesterUser'] = defaultRequesterUser;
    _data['DefaultRequesterTeamId'] = defaultRequesterTeamId;
    _data['DefaultRequesterTeam'] = defaultRequesterTeam;
    _data['HideOwner'] = hideOwner;
    _data['EnablePermission'] = enablePermission;
    _data['EnableInlineComment'] = enableInlineComment;
    _data['EnableAdhocTask'] = enableAdhocTask;
    _data['AdhocServiceTemplateIds'] = adhocServiceTemplateIds;
    _data['AdhocNoteTemplateIds'] = adhocNoteTemplateIds;
    _data['ServiceTemplateType'] = serviceTemplateType;
    _data['EmailCopyTemplateCode'] = emailCopyTemplateCode;
    _data['FormType'] = formType;
    _data['EnableDynamicStepTaskSelection'] = enableDynamicStepTaskSelection;
    _data['Id'] = id;
    _data['CreatedDate'] = createdDate;
    _data['CreatedBy'] = createdBy;
    _data['LastUpdatedDate'] = lastUpdatedDate;
    _data['LastUpdatedBy'] = lastUpdatedBy;
    _data['IsDeleted'] = isDeleted;
    _data['SequenceOrder'] = sequenceOrder;
    _data['CompanyId'] = companyId;
    _data['LegalEntityId'] = legalEntityId;
    _data['DataAction'] = dataAction;
    _data['Status'] = status;
    _data['VersionNo'] = versionNo;
    _data['PortalId'] = portalId;
    _data['OwnerUserUserName'] = ownerUserUserName;
    return _data;
  }
}

class ColumnList {
  ColumnList({
    this.foreignKeyTableId,
    this.foreignKeyTableName,
    this.foreignKeyColumnId,
    this.foreignKeyColumnName,
    this.foreignKeyDisplayColumnId,
    this.foreignKeyDisplayColumnName,
    this.dataTypestr,
    this.value,
    this.isForeignKeyTableColumn,
    this.tableName,
    this.templateType,
    this.tableSchemaName,
    this.tableAliasName,
    this.tableMetadataName,
    this.isVisible,
    this.isEditable,
    this.activeUserType,
    this.ntsStatusCode,
    this.isChecked,
    this.ignorePermission,
    this.templateId,
    this.name,
    this.isDefaultDisplayColumn,
    this.labelName,
    this.alias,
    this.isNullable,
    this.dataType,
    this.udfUiType,
    this.isForeignKey,
    this.isVirtualColumn,
    this.isVirtualForeignKey,
    this.isPrimaryKey,
    this.isSystemColumn,
    this.isUniqueColumn,
    this.isLogColumn,
    this.isUdfColumn,
    this.isHiddenColumn,
    this.hideForeignKeyTableColumns,
    this.isReferenceColumn,
    this.referenceTableName,
    this.referenceTableSchemaName,
    this.foreignKeyTable,
    this.foreignKeyTableAliasName,
    this.foreignKeyTableSchemaName,
    this.foreignKeyDisplayColumnReferenceId,
    this.foreignKeyColumn,
    this.foreignKeyDisplayColumn,
    this.foreignKeyDisplayColumnLabelName,
    this.foreignKeyDisplayColumnAlias,
    this.foreignKeyDisplayColumnDataType,
    this.foreignKeyConstraintName,
    this.tableMetadataId,
    this.tableMetadata,
    this.editableBy,
    this.viewableBy,
    this.editableContext,
    this.viewableContext,
    this.showInForeignKeyReference,
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
  String? foreignKeyTableId;
  String? foreignKeyTableName;
  String? foreignKeyColumnId;
  String? foreignKeyColumnName;
  dynamic foreignKeyDisplayColumnId;
  String? foreignKeyDisplayColumnName;
  dynamic dataTypestr;
  dynamic value;
  bool? isForeignKeyTableColumn;
  dynamic tableName;
  int? templateType;
  String? tableSchemaName;
  String? tableAliasName;
  String? tableMetadataName;
  bool? isVisible;
  bool? isEditable;
  int? activeUserType;
  String? ntsStatusCode;
  bool? isChecked;
  bool? ignorePermission;
  dynamic templateId;
  String? name;
  bool? isDefaultDisplayColumn;
  String? labelName;
  String? alias;
  bool? isNullable;
  int? dataType;
  int? udfUiType;
  bool? isForeignKey;
  bool? isVirtualColumn;
  bool? isVirtualForeignKey;
  bool? isPrimaryKey;
  bool? isSystemColumn;
  bool? isUniqueColumn;
  bool? isLogColumn;
  bool? isUdfColumn;
  bool? isHiddenColumn;
  bool? hideForeignKeyTableColumns;
  bool? isReferenceColumn;
  String? referenceTableName;
  String? referenceTableSchemaName;
  dynamic foreignKeyTable;
  String? foreignKeyTableAliasName;
  String? foreignKeyTableSchemaName;
  dynamic foreignKeyDisplayColumnReferenceId;
  dynamic foreignKeyColumn;
  dynamic foreignKeyDisplayColumn;
  String? foreignKeyDisplayColumnLabelName;
  String? foreignKeyDisplayColumnAlias;
  int? foreignKeyDisplayColumnDataType;
  String? foreignKeyConstraintName;
  String? tableMetadataId;
  dynamic tableMetadata;
  List<dynamic>? editableBy;
  List<dynamic>? viewableBy;
  List<dynamic>? editableContext;
  List<dynamic>? viewableContext;
  bool? showInForeignKeyReference;
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

  ColumnList.fromJson(Map<String, dynamic> json) {
    foreignKeyTableId = json["ForeignKeyTableId"];
    foreignKeyTableName = json["ForeignKeyTableName"];
    foreignKeyColumnId = json["ForeignKeyColumnId"];
    foreignKeyColumnName = json["ForeignKeyColumnName"];
    foreignKeyDisplayColumnId = json["ForeignKeyDisplayColumnId"];
    foreignKeyDisplayColumnName = json["ForeignKeyDisplayColumnName"];
    dataTypestr = json["DataTypestr"];
    value = json["Value"];
    isForeignKeyTableColumn = json["IsForeignKeyTableColumn"];
    tableName = json["TableName"];
    templateType = json["TemplateType"];
    tableSchemaName = json["TableSchemaName"];
    tableAliasName = json["TableAliasName"];
    tableMetadataName = json["TableMetadataName"];
    isVisible = json["IsVisible"];
    isEditable = json["IsEditable"];
    activeUserType = json["ActiveUserType"];
    ntsStatusCode = json["NtsStatusCode"];
    isChecked = json['IsChecked'];
    ignorePermission = json['IgnorePermission'];
    templateId = json['TemplateId'];
    name = json['Name'];
    isDefaultDisplayColumn = json['IsDefaultDisplayColumn'];
    labelName = json['LabelName'];
    alias = json['Alias'];
    isNullable = json['IsNullable'];
    dataType = json['DataType'];
    udfUiType = json['UdfUIType'];
    isForeignKey = json['IsForeignKey'];
    isVirtualColumn = json['IsVirtualColumn'];
    isVirtualForeignKey = json['IsVirtualForeignKey'];
    isPrimaryKey = json['IsPrimaryKey'];
    isSystemColumn = json['IsSystemColumn'];
    isUniqueColumn = json['IsUniqueColumn'];
    isLogColumn = json['IsLogColumn'];
    isUdfColumn = json['IsUdfColumn'];
    isHiddenColumn = json['IsHiddenColumn'];
    hideForeignKeyTableColumns = json['HideForeignKeyTableColumns'];
    isReferenceColumn = json['IsReferenceColumn'];
    referenceTableName = json['ReferenceTableName'];
    referenceTableSchemaName = json['ReferenceTableSchemaName'];
    foreignKeyTable = json['ForeignKeyTable'];
    foreignKeyTableAliasName = json["ForeignKeyTableAliasName"];
    foreignKeyTableSchemaName = json["ForeignKeyTableSchemaName"];
    foreignKeyDisplayColumnReferenceId =
        json["ForeignKeyDisplayColumnReferenceId"];
    foreignKeyColumn = json["ForeignKeyColumn"];
    foreignKeyDisplayColumn = json["ForeignKeyDisplayColumn"];
    foreignKeyDisplayColumnLabelName = json["ForeignKeyDisplayColumnLabelName"];
    foreignKeyDisplayColumnAlias = json["ForeignKeyDisplayColumnAlias"];
    foreignKeyDisplayColumnDataType = json["ForeignKeyDisplayColumnDataType"];
    foreignKeyConstraintName = json["ForeignKeyConstraintName"];
    tableMetadataId = json["TableMetadataId"];
    tableMetadata = json["TableMetadata"];
    editableBy = List<dynamic>.from(json["EditableBy"].map((x) => x));
    viewableBy = List<dynamic>.from(json["ViewableBy"].map((x) => x));
    editableContext = List<dynamic>.from(json["EditableContext"].map((x) => x));
    viewableContext = List<dynamic>.from(json["ViewableContext"].map((x) => x));
    showInForeignKeyReference = json["ShowInForeignKeyReference"];
    id = json["Id"];
    // createdDate =  json["CreatedDate"];
    createdDate = json["CreatedDate"].toString();
    // createdDate = DateTime.parse(json["CreatedDate"].toString());
    createdBy = json["CreatedBy"];
    lastUpdatedDate = json["LastUpdatedDate"].toString();
    lastUpdatedBy = json["LastUpdatedBy"];
    isDeleted = json["IsDeleted"];
    sequenceOrder = json["SequenceOrder"];
    companyId = json["CompanyId"];
    legalEntityId = json["LegalEntityId"];
    dataAction = json["DataAction"];
    status = json["Status"];
    versionNo = json["VersionNo"];
    portalId = json["PortalId"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ForeignKeyTableId'] = foreignKeyTableId;
    _data['ForeignKeyTableName'] = foreignKeyTableName;
    _data['ForeignKeyColumnId'] = foreignKeyColumnId;
    _data['ForeignKeyColumnName'] = foreignKeyColumnName;
    _data['ForeignKeyDisplayColumnId'] = foreignKeyDisplayColumnId;
    _data['ForeignKeyDisplayColumnName'] = foreignKeyDisplayColumnName;
    _data['DataTypestr'] = dataTypestr;
    _data['Value'] = value;
    _data['IsForeignKeyTableColumn'] = isForeignKeyTableColumn;
    _data['TableName'] = tableName;
    _data['TemplateType'] = templateType;
    _data['TableSchemaName'] = tableSchemaName;
    _data['TableAliasName'] = tableAliasName;
    _data['TableMetadataName'] = tableMetadataName;
    _data['IsVisible'] = isVisible;
    _data['IsEditable'] = isEditable;
    _data['ActiveUserType'] = activeUserType;
    _data['NtsStatusCode'] = ntsStatusCode;
    _data['IsChecked'] = isChecked;
    _data['IgnorePermission'] = ignorePermission;
    _data['TemplateId'] = templateId;
    _data['Name'] = name;
    _data['IsDefaultDisplayColumn'] = isDefaultDisplayColumn;
    _data['LabelName'] = labelName;
    _data['Alias'] = alias;
    _data['IsNullable'] = isNullable;
    _data['DataType'] = dataType;
    _data['UdfUIType'] = udfUiType;
    _data['IsForeignKey'] = isForeignKey;
    _data['IsVirtualColumn'] = isVirtualColumn;
    _data['IsVirtualForeignKey'] = isVirtualForeignKey;
    _data['IsPrimaryKey'] = isPrimaryKey;
    _data['IsSystemColumn'] = isSystemColumn;
    _data['IsUniqueColumn'] = isUniqueColumn;
    _data['IsLogColumn'] = isLogColumn;
    _data['IsUdfColumn'] = isUdfColumn;
    _data['IsHiddenColumn'] = isHiddenColumn;
    _data['HideForeignKeyTableColumns'] = hideForeignKeyTableColumns;
    _data['IsReferenceColumn'] = isReferenceColumn;
    _data['ReferenceTableName'] = referenceTableName;
    _data['ReferenceTableSchemaName'] = referenceTableSchemaName;
    _data['ForeignKeyTable'] = foreignKeyTable;
    _data['ForeignKeyTableAliasName'] = foreignKeyTableAliasName;
    _data['ForeignKeyTableSchemaName'] = foreignKeyTableSchemaName;
    _data['ForeignKeyDisplayColumnReferenceId'] =
        foreignKeyDisplayColumnReferenceId;
    _data['ForeignKeyColumn'] = foreignKeyColumn;
    _data['ForeignKeyDisplayColumn'] = foreignKeyDisplayColumn;
    _data['ForeignKeyDisplayColumnLabelName'] =
        foreignKeyDisplayColumnLabelName;
    _data['ForeignKeyDisplayColumnAlias'] = foreignKeyDisplayColumnAlias;
    _data['ForeignKeyDisplayColumnDataType'] = foreignKeyDisplayColumnDataType;
    _data['ForeignKeyConstraintName'] = foreignKeyConstraintName;
    _data['TableMetadataId'] = tableMetadataId;
    _data['TableMetadata'] = tableMetadata;
    _data['EditableBy'] = editableBy;
    _data['ViewableBy'] = viewableBy;
    _data['EditableContext'] = editableContext;
    _data['ViewableContext'] = viewableContext;
    _data['ShowInForeignKeyReference'] = showInForeignKeyReference;
    _data['Id'] = id;
    _data['CreatedDate'] = createdDate;
    _data['CreatedBy'] = createdBy;
    _data['LastUpdatedDate'] = lastUpdatedDate;
    _data['LastUpdatedBy'] = lastUpdatedBy;
    _data['IsDeleted'] = isDeleted;
    _data['SequenceOrder'] = sequenceOrder;
    _data['CompanyId'] = companyId;
    _data['LegalEntityId'] = legalEntityId;
    _data['DataAction'] = dataAction;
    _data['Status'] = status;
    _data['VersionNo'] = versionNo;
    _data['PortalId'] = portalId;
    return _data;
  }
}

class StepTasksList {
  StepTasksList({
    this.pageName,
    this.pageId,
    this.subjectLabelName,
    this.isSubjectRequired,
    this.isSubjectEditable,
    this.descriptionLabelName,
    this.isDescriptionRequired,
    this.isDescriptionEditable,
    this.hideDateAndSla,
    this.templateName,
    this.textBoxDisplay1,
    this.textBoxLink1,
    this.textBoxDisplayType1,
    this.isRequiredTextBoxDisplay1,
    this.isAssigneeAvailableTextBoxDisplay1,
    this.isDropdownDisplay1,
    this.dropdownValueMethod1,
    this.isRequiredDropdownDisplay1,
    this.isAssigneeAvailableDropdownDisplay1,
    this.textBoxDisplay2,
    this.textBoxDisplayType2,
    this.isRequiredTextBoxDisplay2,
    this.isAssigneeAvailableTextBoxDisplay2,
    this.isDropdownDisplay2,
    this.dropdownValueMethod2,
    this.isRequiredDropdownDisplay2,
    this.isAssigneeAvailableDropdownDisplay2,
    this.textBoxDisplay3,
    this.textBoxDisplayType3,
    this.isRequiredTextBoxDisplay3,
    this.isAssigneeAvailableTextBoxDisplay3,
    this.isDropdownDisplay3,
    this.dropdownValueMethod3,
    this.isRequiredDropdownDisplay3,
    this.isAssigneeAvailableDropdownDisplay3,
    this.textBoxDisplay4,
    this.textBoxDisplayType4,
    this.isRequiredTextBoxDisplay4,
    this.isAssigneeAvailableTextBoxDisplay4,
    this.isDropdownDisplay4,
    this.dropdownValueMethod4,
    this.isRequiredDropdownDisplay4,
    this.isAssigneeAvailableDropdownDisplay4,
    this.textBoxDisplay5,
    this.textBoxDisplayType5,
    this.isRequiredTextBoxDisplay5,
    this.isAssigneeAvailableTextBoxDisplay5,
    this.isDropdownDisplay5,
    this.dropdownValueMethod5,
    this.isRequiredDropdownDisplay5,
    this.isAssigneeAvailableDropdownDisplay5,
    this.textBoxDisplay6,
    this.textBoxDisplayType6,
    this.isRequiredTextBoxDisplay6,
    this.isAssigneeAvailableTextBoxDisplay6,
    this.isDropdownDisplay6,
    this.dropdownValueMethod6,
    this.isRequiredDropdownDisplay6,
    this.isAssigneeAvailableDropdownDisplay6,
    this.textBoxDisplay7,
    this.textBoxDisplayType7,
    this.isRequiredTextBoxDisplay7,
    this.isAssigneeAvailableTextBoxDisplay7,
    this.isDropdownDisplay7,
    this.dropdownValueMethod7,
    this.isRequiredDropdownDisplay7,
    this.isAssigneeAvailableDropdownDisplay7,
    this.textBoxDisplay8,
    this.textBoxDisplayType8,
    this.isRequiredTextBoxDisplay8,
    this.isAssigneeAvailableTextBoxDisplay8,
    this.isDropdownDisplay8,
    this.dropdownValueMethod8,
    this.isRequiredDropdownDisplay8,
    this.isAssigneeAvailableDropdownDisplay8,
    this.textBoxDisplay9,
    this.textBoxDisplayType9,
    this.isRequiredTextBoxDisplay9,
    this.isAssigneeAvailableTextBoxDisplay9,
    this.isDropdownDisplay9,
    this.dropdownValueMethod9,
    this.isRequiredDropdownDisplay9,
    this.isAssigneeAvailableDropdownDisplay9,
    this.textBoxDisplay10,
    this.textBoxDisplayType10,
    this.isRequiredTextBoxDisplay10,
    this.isAssigneeAvailableTextBoxDisplay10,
    this.isDropdownDisplay10,
    this.dropdownValueMethod10,
    this.isRequiredDropdownDisplay10,
    this.isAssigneeAvailableDropdownDisplay10,
    this.draftButtonText,
    this.saveButtonText,
    this.completeButtonText,
    this.rejectButtonText,
    this.returnButtonText,
    this.reopenButtonText,
    this.delegateButtonText,
    this.cancelButtonText,
    this.backButtonText,
    this.createNewVersionButtonText,
    this.saveChangesButtonText,
    this.saveNewVersionButtonText,
    this.draftButton,
    this.createNewVersionButton,
    this.saveNewVersionButton,
    this.module,
    this.saveButton,
    this.canViewVersions,
    this.displayActionButtonBelow,
    this.saveChangesButton,
    this.completeButton,
    this.isCompleteReasonRequired,
    this.rejectButton,
    this.notApplicableButton,
    this.isLockVisible,
    this.isReleaseVisible,
    this.isTaskTeamOwner,
    this.isRejectionReasonRequired,
    this.returnButton,
    this.reopenButton,
    this.isReopenReasonRequired,
    this.isReturnReasonRequired,
    this.delegateButton,
    this.isDelegateReasonRequired,
    this.cancelButton,
    this.isCancelReasonRequired,
    this.backButton,
    this.closeButton,
    this.closeButtonText,
    this.templateAction,
    this.activeUserId,
    this.displayMode,
    this.templateUserType,
    this.canEditHeader,
    this.cancelEditButtonText,
    this.teamMembers,
    this.assigneeDisplayName,
    this.ownerUserName,
    this.assigneeUserName,
    this.statusClass,
    this.stepTemplateIds,
    this.displayDueDate,
    this.serviceDetailsHeight,
    this.templateCategoryCode,
    this.templateCategoryName,
    this.requestedByUserName,
    this.createdByUserName,
    this.lastUpdatedByUserName,
    this.taskStatusName,
    this.taskStatusCode,
    this.serviceOwner,
    this.moduleId,
    this.moduleName,
    this.moduleCode,
    this.templateMasterCode,
    this.dueDateDisplay,
    this.taskOwnerFirstLetter,
    this.getTaskOwner,
    this.serviceNo,
    this.serviceName,
    this.displayStartDate,
    this.stageName,
    this.stageId,
    this.workflowStepName,
    this.workflowStepId,
    this.stepTaskSequenceOrder,
    this.noteSubject,
    this.noteNo,
    this.bookTemplateCode,
    this.bookId,
    this.bookType,
    this.taskNo,
    this.taskSubject,
    this.taskDescription,
    this.templateCode,
    this.taskType,
    this.startDate,
    this.dueDate,
    this.taskSla,
    this.actualSla,
    this.reminderDate,
    this.planDate,
    this.taskStatusId,
    this.taskStatus,
    this.taskActionId,
    this.taskAction,
    this.taskPriorityId,
    this.taskPriority,
    this.submittedDate,
    this.completedDate,
    this.rejectedDate,
    this.canceledDate,
    this.returnedDate,
    this.reopenedDate,
    this.closedDate,
    this.rejectionReason,
    this.returnReason,
    this.reopenReason,
    this.cancelReason,
    this.completeReason,
    this.delegateReason,
    this.closeComment,
    this.userRating,
    this.templateId,
    this.template,
    this.udfTemplateId,
    this.udfTemplate,
    this.udfNoteId,
    this.udfNote,
    this.udfNoteTableId,
    this.taskTemplateId,
    this.taskTemplate,
    this.requestedByUserId,
    this.requestedByUser,
    this.ownerUserId,
    this.ownerUser,
    this.taskOwnerTypeId,
    this.taskOwnerType,
    this.assignedToTypeId,
    this.assignedToType,
    this.assignedToUserId,
    this.assignedToUser,
    this.assignedToTeamId,
    this.assignedToTeam,
    this.isStepTaskAutoCompleteIfSameAssignee,
    this.lockStatusId,
    this.lockStatus,
    this.parentNoteId,
    this.parentTaskId,
    this.parentServiceId,
    this.assignedToHierarchyMasterId,
    this.assignedToHierarchyMasterLevelId,
    this.isVersioning,
    this.stepTaskComponentId,
    this.referenceId,
    this.referenceType,
    this.isArchived,
    this.taskEventId,
    this.taskEvent,
    this.servicePlusId,
    this.notePlusId,
    this.taskPlusId,
    this.nextTaskAssignedToTypeId,
    this.nextTaskAssignedToType,
    this.nextTaskAssignedToUserId,
    this.nextTaskAssignedToUser,
    this.nextTaskAssignedToTeamId,
    this.nextTaskAssignedToTeam,
    this.nextTaskAssignedToHierarchyMasterId,
    this.nextTaskAssignedToHierarchyMasterLevelId,
    this.isReturned,
    this.isReopened,
    this.nextTaskAttachmentId,
    this.nextStepTaskComponentId,
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
  String? pageName;
  String? pageId;
  String? subjectLabelName;
  bool? isSubjectRequired;
  bool? isSubjectEditable;
  String? descriptionLabelName;
  bool? isDescriptionRequired;
  bool? isDescriptionEditable;
  dynamic hideDateAndSla;
  String? templateName;
  dynamic textBoxDisplay1;
  dynamic textBoxLink1;
  dynamic textBoxDisplayType1;
  bool? isRequiredTextBoxDisplay1;
  bool? isAssigneeAvailableTextBoxDisplay1;
  dynamic isDropdownDisplay1;
  dynamic dropdownValueMethod1;
  bool? isRequiredDropdownDisplay1;
  bool? isAssigneeAvailableDropdownDisplay1;
  dynamic textBoxDisplay2;
  dynamic textBoxDisplayType2;
  bool? isRequiredTextBoxDisplay2;
  bool? isAssigneeAvailableTextBoxDisplay2;
  dynamic isDropdownDisplay2;
  dynamic dropdownValueMethod2;
  bool? isRequiredDropdownDisplay2;
  bool? isAssigneeAvailableDropdownDisplay2;
  dynamic textBoxDisplay3;
  dynamic textBoxDisplayType3;
  bool? isRequiredTextBoxDisplay3;
  bool? isAssigneeAvailableTextBoxDisplay3;
  dynamic isDropdownDisplay3;
  dynamic dropdownValueMethod3;
  bool? isRequiredDropdownDisplay3;
  bool? isAssigneeAvailableDropdownDisplay3;
  dynamic textBoxDisplay4;
  dynamic textBoxDisplayType4;
  bool? isRequiredTextBoxDisplay4;
  bool? isAssigneeAvailableTextBoxDisplay4;
  dynamic isDropdownDisplay4;
  dynamic dropdownValueMethod4;
  bool? isRequiredDropdownDisplay4;
  bool? isAssigneeAvailableDropdownDisplay4;
  dynamic textBoxDisplay5;
  dynamic textBoxDisplayType5;
  bool? isRequiredTextBoxDisplay5;
  bool? isAssigneeAvailableTextBoxDisplay5;
  dynamic isDropdownDisplay5;
  dynamic dropdownValueMethod5;
  bool? isRequiredDropdownDisplay5;
  bool? isAssigneeAvailableDropdownDisplay5;
  dynamic textBoxDisplay6;
  dynamic textBoxDisplayType6;
  bool? isRequiredTextBoxDisplay6;
  bool? isAssigneeAvailableTextBoxDisplay6;
  dynamic isDropdownDisplay6;
  dynamic dropdownValueMethod6;
  bool? isRequiredDropdownDisplay6;
  bool? isAssigneeAvailableDropdownDisplay6;
  dynamic textBoxDisplay7;
  dynamic textBoxDisplayType7;
  bool? isRequiredTextBoxDisplay7;
  bool? isAssigneeAvailableTextBoxDisplay7;
  dynamic isDropdownDisplay7;
  dynamic dropdownValueMethod7;
  bool? isRequiredDropdownDisplay7;
  bool? isAssigneeAvailableDropdownDisplay7;
  dynamic textBoxDisplay8;
  dynamic textBoxDisplayType8;
  bool? isRequiredTextBoxDisplay8;
  bool? isAssigneeAvailableTextBoxDisplay8;
  dynamic isDropdownDisplay8;
  dynamic dropdownValueMethod8;
  bool? isRequiredDropdownDisplay8;
  bool? isAssigneeAvailableDropdownDisplay8;
  dynamic textBoxDisplay9;
  dynamic textBoxDisplayType9;
  bool? isRequiredTextBoxDisplay9;
  bool? isAssigneeAvailableTextBoxDisplay9;
  dynamic isDropdownDisplay9;
  dynamic dropdownValueMethod9;
  bool? isRequiredDropdownDisplay9;
  bool? isAssigneeAvailableDropdownDisplay9;
  dynamic textBoxDisplay10;
  dynamic textBoxDisplayType10;
  bool? isRequiredTextBoxDisplay10;
  bool? isAssigneeAvailableTextBoxDisplay10;
  dynamic isDropdownDisplay10;
  dynamic dropdownValueMethod10;
  bool? isRequiredDropdownDisplay10;
  bool? isAssigneeAvailableDropdownDisplay10;
  String? draftButtonText;
  String? saveButtonText;
  String? completeButtonText;
  String? rejectButtonText;
  String? returnButtonText;
  String? reopenButtonText;
  String? delegateButtonText;
  String? cancelButtonText;
  String? backButtonText;
  String? createNewVersionButtonText;
  String? saveChangesButtonText;
  String? saveNewVersionButtonText;
  bool? draftButton;
  bool? createNewVersionButton;
  bool? saveNewVersionButton;
  dynamic module;
  bool? saveButton;
  bool? canViewVersions;
  dynamic displayActionButtonBelow;
  bool? saveChangesButton;
  bool? completeButton;
  bool? isCompleteReasonRequired;
  bool? rejectButton;
  bool? notApplicableButton;
  bool? isLockVisible;
  bool? isReleaseVisible;
  bool? isTaskTeamOwner;
  bool? isRejectionReasonRequired;
  bool? returnButton;
  dynamic reopenButton;
  dynamic isReopenReasonRequired;
  bool? isReturnReasonRequired;
  bool? delegateButton;
  bool? isDelegateReasonRequired;
  bool? cancelButton;
  bool? isCancelReasonRequired;
  bool? backButton;
  bool? closeButton;
  String? closeButtonText;
  dynamic templateAction;
  dynamic activeUserId;
  dynamic displayMode;
  dynamic templateUserType;
  bool? canEditHeader;
  String? cancelEditButtonText;
  dynamic teamMembers;
  String? assigneeDisplayName;
  String? ownerUserName;
  String? assigneeUserName;
  String? statusClass;
  dynamic stepTemplateIds;
  String? displayDueDate;
  dynamic serviceDetailsHeight;
  dynamic templateCategoryCode;
  dynamic templateCategoryName;
  String? requestedByUserName;
  String? createdByUserName;
  String? lastUpdatedByUserName;
  String? taskStatusName;
  String? taskStatusCode;
  dynamic serviceOwner;
  dynamic moduleId;
  String? moduleName;
  dynamic moduleCode;
  String? templateMasterCode;
  String? dueDateDisplay;
  String? taskOwnerFirstLetter;
  String? getTaskOwner;
  String? serviceNo;
  String? serviceName;
  String? displayStartDate;
  String? stageName;
  dynamic stageId;
  String? workflowStepName;
  dynamic workflowStepId;
  dynamic stepTaskSequenceOrder;
  String? noteSubject;
  String? noteNo;
  dynamic bookTemplateCode;
  dynamic bookId;
  dynamic bookType;
  String? taskNo;
  String? taskSubject;
  String? taskDescription;
  String? templateCode;
  int? taskType;
  String? startDate;
  String? dueDate;
  String? taskSla;
  String? actualSla;
  String? reminderDate;
  String? planDate;
  String? taskStatusId;
  dynamic taskStatus;
  String? taskActionId;
  dynamic taskAction;
  String? taskPriorityId;
  dynamic taskPriority;
  String? submittedDate;
  String? completedDate;
  String? rejectedDate;
  String? canceledDate;
  String? returnedDate;
  String? reopenedDate;
  String? closedDate;
  String? rejectionReason;
  String? returnReason;
  String? reopenReason;
  String? cancelReason;
  String? completeReason;
  String? delegateReason;
  String? closeComment;
  dynamic userRating;
  String? templateId;
  dynamic template;
  String? udfTemplateId;
  dynamic udfTemplate;
  String? udfNoteId;
  dynamic udfNote;
  String? udfNoteTableId;
  String? taskTemplateId;
  dynamic taskTemplate;
  String? requestedByUserId;
  dynamic requestedByUser;
  String? ownerUserId;
  dynamic ownerUser;
  dynamic taskOwnerTypeId;
  dynamic taskOwnerType;
  String? assignedToTypeId;
  dynamic assignedToType;
  String? assignedToUserId;
  dynamic assignedToUser;
  dynamic assignedToTeamId;
  dynamic assignedToTeam;
  bool? isStepTaskAutoCompleteIfSameAssignee;
  dynamic lockStatusId;
  dynamic lockStatus;
  dynamic parentNoteId;
  dynamic parentTaskId;
  String? parentServiceId;
  dynamic assignedToHierarchyMasterId;
  dynamic assignedToHierarchyMasterLevelId;
  bool? isVersioning;
  String? stepTaskComponentId;
  dynamic referenceId;
  int? referenceType;
  bool? isArchived;
  String? taskEventId;
  dynamic taskEvent;
  dynamic servicePlusId;
  dynamic notePlusId;
  dynamic taskPlusId;
  dynamic nextTaskAssignedToTypeId;
  dynamic nextTaskAssignedToType;
  dynamic nextTaskAssignedToUserId;
  dynamic nextTaskAssignedToUser;
  dynamic nextTaskAssignedToTeamId;
  dynamic nextTaskAssignedToTeam;
  dynamic nextTaskAssignedToHierarchyMasterId;
  dynamic nextTaskAssignedToHierarchyMasterLevelId;
  bool? isReturned;
  bool? isReopened;
  dynamic nextTaskAttachmentId;
  dynamic nextStepTaskComponentId;
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
  String? workflowStatus;

  StepTasksList.fromJson(Map<String, dynamic> json) {
    pageName = json['PageName'];
    pageId = json['PageId'];
    subjectLabelName = json['SubjectLabelName'];
    isSubjectRequired = json['IsSubjectRequired'];
    isSubjectEditable = json['IsSubjectEditable'];
    descriptionLabelName = json['DescriptionLabelName'];
    isDescriptionRequired = json['IsDescriptionRequired'];
    isDescriptionEditable = json['IsDescriptionEditable'];
    hideDateAndSla = json['HideDateAndSla'];
    templateName = json['TemplateName'];
    textBoxDisplay1 = json['TextBoxDisplay1'];
    textBoxLink1 = json['TextBoxLink1'];
    textBoxDisplayType1 = json['TextBoxDisplayType1'];
    isRequiredTextBoxDisplay1 = json['IsRequiredTextBoxDisplay1'];
    isAssigneeAvailableTextBoxDisplay1 =
        json['IsAssigneeAvailableTextBoxDisplay1'];
    isDropdownDisplay1 = json['IsDropdownDisplay1'];
    dropdownValueMethod1 = json['DropdownValueMethod1'];
    isRequiredDropdownDisplay1 = json['IsRequiredDropdownDisplay1'];
    isAssigneeAvailableDropdownDisplay1 =
        json['IsAssigneeAvailableDropdownDisplay1'];
    textBoxDisplay2 = json['TextBoxDisplay2'];
    textBoxDisplayType2 = json['TextBoxDisplayType2'];
    isRequiredTextBoxDisplay2 = json['IsRequiredTextBoxDisplay2'];
    isAssigneeAvailableTextBoxDisplay2 =
        json['IsAssigneeAvailableTextBoxDisplay2'];
    isDropdownDisplay2 = json['IsDropdownDisplay2'];
    dropdownValueMethod2 = json['DropdownValueMethod2'];
    isRequiredDropdownDisplay2 = json['IsRequiredDropdownDisplay2'];
    isAssigneeAvailableDropdownDisplay2 =
        json['IsAssigneeAvailableDropdownDisplay2'];
    textBoxDisplay3 = json['TextBoxDisplay3'];
    textBoxDisplayType3 = json['TextBoxDisplayType3'];
    isRequiredTextBoxDisplay3 = json['IsRequiredTextBoxDisplay3'];
    isAssigneeAvailableTextBoxDisplay3 =
        json['IsAssigneeAvailableTextBoxDisplay3'];
    isDropdownDisplay3 = json['IsDropdownDisplay3'];
    dropdownValueMethod3 = json['DropdownValueMethod3'];
    isRequiredDropdownDisplay3 = json['IsRequiredDropdownDisplay3'];
    isAssigneeAvailableDropdownDisplay3 =
        json['IsAssigneeAvailableDropdownDisplay3'];
    textBoxDisplay4 = json['TextBoxDisplay3'];
    textBoxDisplayType4 = json['TextBoxDisplayType3'];
    isRequiredTextBoxDisplay4 = json['IsRequiredTextBoxDisplay4'];
    isAssigneeAvailableTextBoxDisplay4 =
        json['IsAssigneeAvailableTextBoxDisplay4'];
    isDropdownDisplay4 = json['IsDropdownDisplay4'];
    dropdownValueMethod4 = json['DropdownValueMethod4'];
    isRequiredDropdownDisplay4 = json['IsRequiredDropdownDisplay4'];
    isAssigneeAvailableDropdownDisplay4 =
        json['IsAssigneeAvailableDropdownDisplay4'];
    textBoxDisplay5 = json['TextBoxDisplay5'];
    textBoxDisplayType5 = json['TextBoxDisplayType5'];
    isRequiredTextBoxDisplay5 = json['IsRequiredTextBoxDisplay5'];
    isAssigneeAvailableTextBoxDisplay5 =
        json['IsAssigneeAvailableTextBoxDisplay5'];
    isDropdownDisplay5 = json['IsDropdownDisplay5'];
    dropdownValueMethod5 = json['DropdownValueMethod5'];
    isRequiredDropdownDisplay5 = json['IsRequiredDropdownDisplay5'];
    isAssigneeAvailableDropdownDisplay5 =
        json['IsAssigneeAvailableDropdownDisplay5'];
    textBoxDisplay6 = json['TextBoxDisplay6'];
    textBoxDisplayType6 = json['TextBoxDisplayType6'];
    isRequiredTextBoxDisplay6 = json['IsRequiredTextBoxDisplay6'];
    isAssigneeAvailableTextBoxDisplay6 =
        json['IsAssigneeAvailableTextBoxDisplay6'];
    isDropdownDisplay6 = json['IsDropdownDisplay6'];
    dropdownValueMethod6 = json['DropdownValueMethod6'];
    isRequiredDropdownDisplay6 = json['IsRequiredDropdownDisplay6'];
    isAssigneeAvailableDropdownDisplay6 =
        json['IsAssigneeAvailableDropdownDisplay6'];
    textBoxDisplay7 = json['TextBoxDisplay7'];
    textBoxDisplayType7 = json['TextBoxDisplayType7'];
    isRequiredTextBoxDisplay7 = json['IsRequiredTextBoxDisplay7'];
    isAssigneeAvailableTextBoxDisplay7 =
        json['IsAssigneeAvailableTextBoxDisplay7'];
    isDropdownDisplay7 = json['IsDropdownDisplay7'];
    dropdownValueMethod7 = json['DropdownValueMethod7'];
    isRequiredDropdownDisplay7 = json['IsRequiredDropdownDisplay7'];
    isAssigneeAvailableDropdownDisplay7 =
        json['IsAssigneeAvailableDropdownDisplay7'];
    textBoxDisplay8 = json['TextBoxDisplay7'];
    textBoxDisplayType8 = json['TextBoxDisplayType7'];
    isRequiredTextBoxDisplay8 = json['IsRequiredTextBoxDisplay8'];
    isAssigneeAvailableTextBoxDisplay8 =
        json['IsAssigneeAvailableTextBoxDisplay8'];
    isDropdownDisplay8 = json['IsDropdownDisplay8'];
    dropdownValueMethod8 = json['DropdownValueMethod8'];
    isRequiredDropdownDisplay8 = json['IsRequiredDropdownDisplay8'];
    isAssigneeAvailableDropdownDisplay8 =
        json['IsAssigneeAvailableDropdownDisplay8'];
    textBoxDisplay9 = json['TextBoxDisplay9'];
    textBoxDisplayType9 = json['TextBoxDisplayType9'];
    isRequiredTextBoxDisplay9 = json['IsRequiredTextBoxDisplay9'];
    isAssigneeAvailableTextBoxDisplay9 =
        json['IsAssigneeAvailableTextBoxDisplay9'];
    isDropdownDisplay9 = json['IsDropdownDisplay9'];
    dropdownValueMethod9 = json['DropdownValueMethod9'];
    isRequiredDropdownDisplay9 = json['IsRequiredDropdownDisplay9'];
    isAssigneeAvailableDropdownDisplay9 =
        json['IsAssigneeAvailableDropdownDisplay9'];
    textBoxDisplay10 = json['TextBoxDisplay10'];
    textBoxDisplayType10 = json['TextBoxDisplayType10'];
    isRequiredTextBoxDisplay10 = json['IsRequiredTextBoxDisplay10'];
    isAssigneeAvailableTextBoxDisplay10 =
        json['IsAssigneeAvailableTextBoxDisplay10'];
    isDropdownDisplay10 = json['IsDropdownDisplay10'];
    dropdownValueMethod10 = json['DropdownValueMethod10'];
    isRequiredDropdownDisplay10 = json['IsRequiredDropdownDisplay10'];
    isAssigneeAvailableDropdownDisplay10 =
        json['IsAssigneeAvailableDropdownDisplay10'];
    draftButtonText = json['DraftButtonText'];
    saveButtonText = json['SaveButtonText'];
    completeButtonText = json['CompleteButtonText'];
    rejectButtonText = json['RejectButtonText'];
    returnButtonText = json['ReturnButtonText'];
    reopenButtonText = json['ReopenButtonText'];
    delegateButtonText = json['DelegateButtonText'];
    cancelButtonText = json['CancelButtonText'];
    backButtonText = json['BackButtonText'];
    createNewVersionButtonText = json['CreateNewVersionButtonText'];
    saveChangesButtonText = json['SaveChangesButtonText'];
    saveNewVersionButtonText = json['SaveNewVersionButtonText'];
    draftButton = json['DraftButton'];
    createNewVersionButton = json['CreateNewVersionButton'];
    saveNewVersionButton = json['SaveNewVersionButton'];
    module = json['Module'];
    saveButton = json['SaveButton'];
    canViewVersions = json['CanViewVersions'];
    displayActionButtonBelow = json["DisplayActionButtonBelow"];
    saveChangesButton = json['SaveChangesButton'];
    completeButton = json['CompleteButton'];
    isCompleteReasonRequired = json['IsCompleteReasonRequired'];
    rejectButton = json['RejectButton'];
    notApplicableButton = json['NotApplicableButton'];
    isLockVisible = json['IsLockVisible'];
    isReleaseVisible = json['IsReleaseVisible'];
    isTaskTeamOwner = json['IsTaskTeamOwner'];
    isRejectionReasonRequired = json['IsRejectionReasonRequired'];
    returnButton = json['ReturnButton'];
    reopenButton = json['ReopenButton'];
    isReopenReasonRequired = json['IsReopenReasonRequired'];
    isReturnReasonRequired = json['IsReturnReasonRequired'];
    delegateButton = json['DelegateButton'];
    isDelegateReasonRequired = json['IsDelegateReasonRequired'];
    cancelButton = json['CancelButton'];
    isCancelReasonRequired = json['IsCancelReasonRequired'];
    backButton = json['BackButton'];
    closeButton = json['CloseButton'];
    closeButtonText = json['CloseButtonText'];
    templateAction = json['TemplateAction'];
    activeUserId = json['ActiveUserId'];
    displayMode = json['DisplayMode'];
    templateUserType = json['TemplateUserType'];
    canEditHeader = json['CanEditHeader'];
    cancelEditButtonText = json['CancelEditButtonText'];
    assigneeDisplayName = json['AssigneeDisplayName'];
    ownerUserName = json['OwnerUserName'];
    assigneeUserName = json['AssigneeUserName'];
    statusClass = json['StatusClass'];
    stepTemplateIds = json['StepTemplateIds'];
    displayDueDate = json["DisplayDueDate"];
    // displayDueDate = String.parse(json["DisplayDueDate"]);
    serviceDetailsHeight = json['ServiceDetailsHeight'];
    templateCategoryCode = json['TemplateCategoryCode'];
    templateCategoryName = json['TemplateCategoryName'];
    requestedByUserName = json['RequestedByUserName'];
    createdByUserName = json['CreatedByUserName'];
    lastUpdatedByUserName = json['LastUpdatedByUserName'];
    taskStatusName = json['TaskStatusName'];
    taskStatusCode = json['TaskStatusCode'];
    serviceOwner = json['ServiceOwner'];
    moduleId = json['ModuleId'];
    moduleName = json['ModuleName'];
    moduleCode = json['ModuleCode'];
    templateMasterCode = json['TemplateMasterCode'];
    dueDateDisplay = json['DueDateDisplay'];
    taskOwnerFirstLetter = json['TaskOwnerFirstLetter'];
    getTaskOwner = json['GetTaskOwner'];
    serviceNo = json['ServiceNo'];
    serviceName = json['ServiceName'];
    displayStartDate = json["DisplayStartDate"];
    stageName = json['StageName'];
    stageId = json['StageId'];
    workflowStepName = json['WorkflowStepName'];
    workflowStepId = json['WorkflowStepId'];
    stepTaskSequenceOrder = json['StepTaskSequenceOrder'];
    noteSubject = json['NoteSubject'];
    noteNo = json['NoteNo'];
    bookTemplateCode = json['BookTemplateCode'];
    bookId = json['BookId'];
    bookType = json['BookType'];
    taskNo = json['TaskNo'];
    taskSubject = json['TaskSubject'];
    taskDescription = json['TaskDescription'];
    templateCode = json['TemplateCode'];
    taskType = json['TaskType'];
    startDate = json["StartDate"];
    dueDate = json["DueDate"];
    planDate = json["PlanDate"];
    reminderDate = json["ReminderDate"];
    taskStatusId = json['TaskStatusIdTaskStatusId'];
    taskSla = json['TaskSLA'];
    actualSla = json['ActualSLA'];
    taskStatus = json['TaskStatus'];
    taskActionId = json['TaskActionIdTaskActionId'];
    taskAction = json['TaskAction'];
    taskPriorityId = json['TaskPriorityIdTaskPriorityId'];
    taskPriority = json['TaskPriority'];
    submittedDate = json["SubmittedDate"];
    completedDate = json["CompletedDate"];
    rejectedDate = json["RejectedDate"];
    canceledDate = json["CanceledDate"];
    returnedDate = json["ReturnedDate"];
    reopenedDate = json["ReopenedDate"];
    closedDate = json["ClosedDate"];
    rejectionReason = json['RejectionReason'];
    returnReason = json['ReturnReason'];
    reopenReason = json['ReopenReason'];
    cancelReason = json['CancelReason'];
    completeReason = json['CompleteReason'];
    delegateReason = json['DelegateReason'];
    closeComment = json['CloseComment'];
    userRating = json['UserRating'];
    templateId = json['TemplateId'];
    template = json['Template'];
    udfTemplateId = json['UdfTemplateId'];
    udfTemplate = json['UdfTemplate'];
    udfNoteId = json['UdfNoteId'];
    udfNote = json['UdfNote'];
    udfNoteTableId = json['UdfNoteTableId'];
    taskTemplateId = json['TaskTemplateId'];
    taskTemplate = json['TaskTemplate'];
    requestedByUserId = json['RequestedByUserId'];
    requestedByUser = json['RequestedByUser'];
    ownerUserId = json['OwnerUserId'];
    ownerUser = json['OwnerUser'];
    taskOwnerTypeId = json['TaskOwnerTypeId'];
    taskOwnerType = json['TaskOwnerType'];
    assignedToTypeId = json['AssignedToTypeId'];
    assignedToType = json[''];
    assignedToUserId = json['AssignedToUserId'];
    assignedToUser = json['AssignedToUser'];
    assignedToTeamId = json['AssignedToTeamId'];
    assignedToTeam = json['AssignedToTeam'];
    isStepTaskAutoCompleteIfSameAssignee =
        json['IsStepTaskAutoCompleteIfSameAssignee'];
    lockStatusId = json['LockStatusId'];
    lockStatus = json['LockStatus'];
    parentNoteId = json['ParentNoteId'];
    parentTaskId = json['ParentTaskId'];
    parentServiceId = json['ParentServiceId'];
    assignedToHierarchyMasterId = json['AssignedToHierarchyMasterId'];
    assignedToHierarchyMasterLevelId = json['AssignedToHierarchyMasterLevelId'];
    isVersioning = json['IsVersioning'];
    stepTaskComponentId = json['StepTaskComponentId'];
    referenceId = json['ReferenceId'];
    referenceType = json['ReferenceType'];
    isArchived = json['IsArchived'];
    taskEventId = json['TaskEventId'];
    taskEvent = json['TaskEvent'];
    servicePlusId = json['ServicePlusId'];
    notePlusId = json['NotePlusId'];
    taskPlusId = json['TaskPlusId'];
    nextTaskAssignedToTypeId = json['NextTaskAssignedToTypeId'];
    nextTaskAssignedToType = json['NextTaskAssignedToType'];
    nextTaskAssignedToUserId = json['NextTaskAssignedToUserId'];
    nextTaskAssignedToUser = json['NextTaskAssignedToUser'];
    nextTaskAssignedToTeamId = json['NextTaskAssignedToTeamId'];
    nextTaskAssignedToTeam = json['NextTaskAssignedToTeam'];
    nextTaskAssignedToHierarchyMasterId =
        json['NextTaskAssignedToHierarchyMasterId'];
    nextTaskAssignedToHierarchyMasterLevelId =
        json['NextTaskAssignedToHierarchyMasterLevelId'];
    isReturned = json['IsReturned'];
    isReopened = json['IsReopened'];
    nextTaskAttachmentId = json['NextTaskAttachmentId'];
    nextStepTaskComponentId = json['NextStepTaskComponentId'];
    id = json['Id'];
    createdBy = json['CreatedBy'];
    createdDate = json["CreatedDate"];
    lastUpdatedDate = json["LastUpdatedDate"];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    legalEntityId = json['LegalEntityId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
    portalId = json['PortalId'];
    workflowStatus = json['WorkflowStatus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['PageName'] = pageName;
    _data['PageId'] = pageId;
    _data['SubjectLabelName'] = subjectLabelName;
    _data['IsSubjectRequired'] = isSubjectRequired;
    _data['IsSubjectEditable'] = isSubjectEditable;
    _data['DescriptionLabelName'] = descriptionLabelName;
    _data['IsDescriptionRequired'] = isDescriptionRequired;
    _data['IsDescriptionEditable'] = isDescriptionEditable;
    _data['HideDateAndSLA'] = hideDateAndSla;
    _data['TemplateName'] = templateName;
    _data['TextBoxDisplay1'] = textBoxDisplay1;
    _data['TextBoxLink1'] = textBoxLink1;
    _data['TextBoxDisplayType1'] = textBoxDisplayType1;
    _data['IsRequiredTextBoxDisplay1'] = isRequiredTextBoxDisplay1;
    _data['IsAssigneeAvailableTextBoxDisplay1'] =
        isAssigneeAvailableTextBoxDisplay1;
    _data['IsDropdownDisplay1'] = isDropdownDisplay1;
    _data['DropdownValueMethod1'] = dropdownValueMethod1;
    _data['IsRequiredDropdownDisplay1'] = isRequiredDropdownDisplay1;
    _data['IsAssigneeAvailableDropdownDisplay1'] =
        isAssigneeAvailableDropdownDisplay1;
    _data['TextBoxDisplay2'] = textBoxDisplay2;
    _data['TextBoxDisplayType2'] = textBoxDisplayType2;
    _data['IsRequiredTextBoxDisplay2'] = isRequiredTextBoxDisplay2;
    _data['IsAssigneeAvailableTextBoxDisplay2'] =
        isAssigneeAvailableTextBoxDisplay2;
    _data['IsDropdownDisplay2'] = isDropdownDisplay2;
    _data['DropdownValueMethod2'] = dropdownValueMethod2;
    _data['IsRequiredDropdownDisplay2'] = isRequiredDropdownDisplay2;
    _data['IsAssigneeAvailableDropdownDisplay2'] =
        isAssigneeAvailableDropdownDisplay2;
    _data['TextBoxDisplay3'] = textBoxDisplay3;
    _data['TextBoxDisplayType3'] = textBoxDisplayType3;
    _data['IsRequiredTextBoxDisplay3'] = isRequiredTextBoxDisplay3;
    _data['IsAssigneeAvailableTextBoxDisplay3'] =
        isAssigneeAvailableTextBoxDisplay3;
    _data['IsDropdownDisplay3'] = isDropdownDisplay3;
    _data['DropdownValueMethod3'] = dropdownValueMethod3;
    _data['IsRequiredDropdownDisplay3'] = isRequiredDropdownDisplay3;
    _data['IsAssigneeAvailableDropdownDisplay3'] =
        isAssigneeAvailableDropdownDisplay3;
    _data['TextBoxDisplay4'] = textBoxDisplay4;
    _data['TextBoxDisplayType4'] = textBoxDisplayType4;
    _data['IsRequiredTextBoxDisplay4'] = isRequiredTextBoxDisplay4;
    _data['IsAssigneeAvailableTextBoxDisplay4'] =
        isAssigneeAvailableTextBoxDisplay4;
    _data['IsDropdownDisplay4'] = isDropdownDisplay4;
    _data['DropdownValueMethod4'] = dropdownValueMethod4;
    _data['IsRequiredDropdownDisplay4'] = isRequiredDropdownDisplay4;
    _data['IsAssigneeAvailableDropdownDisplay4'] =
        isAssigneeAvailableDropdownDisplay4;
    _data['TextBoxDisplay5'] = textBoxDisplay5;
    _data['TextBoxDisplayType5'] = textBoxDisplayType5;
    _data['IsRequiredTextBoxDisplay5'] = isRequiredTextBoxDisplay5;
    _data['IsAssigneeAvailableTextBoxDisplay5'] =
        isAssigneeAvailableTextBoxDisplay5;
    _data['IsDropdownDisplay5'] = isDropdownDisplay5;
    _data['DropdownValueMethod5'] = dropdownValueMethod5;
    _data['IsRequiredDropdownDisplay5'] = isRequiredDropdownDisplay5;
    _data['IsAssigneeAvailableDropdownDisplay5'] =
        isAssigneeAvailableDropdownDisplay5;
    _data['TextBoxDisplay6'] = textBoxDisplay6;
    _data['TextBoxDisplayType6'] = textBoxDisplayType6;
    _data['IsRequiredTextBoxDisplay6'] = isRequiredTextBoxDisplay6;
    _data['IsAssigneeAvailableTextBoxDisplay6'] =
        isAssigneeAvailableTextBoxDisplay6;
    _data['IsDropdownDisplay6'] = isDropdownDisplay6;
    _data['DropdownValueMethod6'] = dropdownValueMethod6;
    _data['IsRequiredDropdownDisplay6'] = isRequiredDropdownDisplay6;
    _data['IsAssigneeAvailableDropdownDisplay6'] =
        isAssigneeAvailableDropdownDisplay6;
    _data['TextBoxDisplay7'] = textBoxDisplay7;
    _data['TextBoxDisplayType7'] = textBoxDisplayType7;
    _data['IsRequiredTextBoxDisplay7'] = isRequiredTextBoxDisplay7;
    _data['IsAssigneeAvailableTextBoxDisplay7'] =
        isAssigneeAvailableTextBoxDisplay7;
    _data['IsDropdownDisplay7'] = isDropdownDisplay7;
    _data['DropdownValueMethod7'] = dropdownValueMethod7;
    _data['IsRequiredDropdownDisplay7'] = isRequiredDropdownDisplay7;
    _data['IsAssigneeAvailableDropdownDisplay7'] =
        isAssigneeAvailableDropdownDisplay7;
    _data['TextBoxDisplay8'] = textBoxDisplay8;
    _data['TextBoxDisplayType8'] = textBoxDisplayType8;
    _data['IsRequiredTextBoxDisplay8'] = isRequiredTextBoxDisplay8;
    _data['IsAssigneeAvailableTextBoxDisplay8'] =
        isAssigneeAvailableTextBoxDisplay8;
    _data['IsDropdownDisplay8'] = isDropdownDisplay8;
    _data['DropdownValueMethod8'] = dropdownValueMethod8;
    _data['IsRequiredDropdownDisplay8'] = isRequiredDropdownDisplay8;
    _data['IsAssigneeAvailableDropdownDisplay8'] =
        isAssigneeAvailableDropdownDisplay8;
    _data['TextBoxDisplay9'] = textBoxDisplay9;
    _data['TextBoxDisplayType9'] = textBoxDisplayType9;
    _data['IsRequiredTextBoxDisplay9'] = isRequiredTextBoxDisplay9;
    _data['IsAssigneeAvailableTextBoxDisplay9'] =
        isAssigneeAvailableTextBoxDisplay9;
    _data['IsDropdownDisplay9'] = isDropdownDisplay9;
    _data['DropdownValueMethod9'] = dropdownValueMethod9;
    _data['IsRequiredDropdownDisplay9'] = isRequiredDropdownDisplay9;
    _data['IsAssigneeAvailableDropdownDisplay9'] =
        isAssigneeAvailableDropdownDisplay9;
    _data['TextBoxDisplay10'] = textBoxDisplay10;
    _data['TextBoxDisplayType10'] = textBoxDisplayType10;
    _data['IsRequiredTextBoxDisplay10'] = isRequiredTextBoxDisplay10;
    _data['IsAssigneeAvailableTextBoxDisplay10'] =
        isAssigneeAvailableTextBoxDisplay10;
    _data['IsDropdownDisplay10'] = isDropdownDisplay10;
    _data['DropdownValueMethod10'] = dropdownValueMethod10;
    _data['IsRequiredDropdownDisplay10'] = isRequiredDropdownDisplay10;
    _data['IsAssigneeAvailableDropdownDisplay10'] =
        isAssigneeAvailableDropdownDisplay10;
    _data['DraftButtonText'] = draftButtonText;
    _data['SaveButtonText'] = saveButtonText;
    _data['CompleteButtonText'] = completeButtonText;
    _data['RejectButtonText'] = rejectButtonText;
    _data['ReturnButtonText'] = returnButtonText;
    _data['ReopenButtonText'] = reopenButtonText;
    _data['DelegateButtonText'] = delegateButtonText;
    _data['CancelButtonText'] = cancelButtonText;
    _data['BackButtonText'] = backButtonText;
    _data['CreateNewVersionButtonText'] = createNewVersionButtonText;
    _data['SaveChangesButtonText'] = saveChangesButtonText;
    _data['SaveNewVersionButtonText'] = saveNewVersionButtonText;
    _data['DraftButton'] = draftButton;
    _data['CreateNewVersionButton'] = createNewVersionButton;
    _data['SaveNewVersionButton'] = saveNewVersionButton;
    _data['Module'] = module;
    _data['SaveButton'] = saveButton;
    _data['CanViewVersions'] = canViewVersions;
    _data['DisplayActionButtonBelow'] = displayActionButtonBelow;
    _data['SaveChangesButton'] = saveChangesButton;
    _data['CompleteButton'] = completeButton;
    _data['IsCompleteReasonRequired'] = isCompleteReasonRequired;
    _data['RejectButton'] = rejectButton;
    _data['NotApplicableButton'] = notApplicableButton;
    _data['IsLockVisible'] = isLockVisible;
    _data['IsReleaseVisible'] = isReleaseVisible;
    _data['IsTaskTeamOwner'] = isTaskTeamOwner;
    _data['IsRejectionReasonRequired'] = isRejectionReasonRequired;
    _data['ReturnButton'] = returnButton;
    _data['ReopenButton'] = reopenButton;
    _data['IsReopenReasonRequired'] = isReopenReasonRequired;
    _data['IsReturnReasonRequired'] = isReturnReasonRequired;
    _data['DelegateButton'] = delegateButton;
    _data['IsDelegateReasonRequired'] = isDelegateReasonRequired;
    _data['CancelButton'] = cancelButton;
    _data['IsCancelReasonRequired'] = isCancelReasonRequired;
    _data['BackButton'] = backButton;
    _data['CloseButton'] = closeButton;
    _data['CloseButtonText'] = closeButtonText;
    _data['TemplateAction'] = templateAction;
    _data['ActiveUserId'] = activeUserId;
    _data['DisplayMode'] = displayMode;
    _data['TemplateUserType'] = templateUserType;
    _data['CanEditHeader'] = canEditHeader;
    _data['CancelEditButtonText'] = cancelEditButtonText;
    _data['TeamMembers'] = teamMembers;
    _data['AssigneeDisplayName'] = assigneeDisplayName;
    _data['OwnerUserName'] = ownerUserName;
    _data['AssigneeUserName'] = assigneeUserName;
    _data['StatusClass'] = statusClass;
    _data['StepTemplateIds'] = stepTemplateIds;
    _data['DisplayDueDate'] = displayDueDate;
    _data['ServiceDetailsHeight'] = serviceDetailsHeight;
    _data['TemplateCategoryCode'] = templateCategoryCode;
    _data['TemplateCategoryName'] = templateCategoryName;
    _data['RequestedByUserName'] = requestedByUserName;
    _data['CreatedByUserName'] = createdByUserName;
    _data['LastUpdatedByUserName'] = lastUpdatedByUserName;
    _data['TaskStatusName'] = taskStatusName;
    _data['TaskStatusCode'] = taskStatusCode;
    _data['ServiceOwner'] = serviceOwner;
    _data['ModuleId'] = moduleId;
    _data['ModuleName'] = moduleName;
    _data['ModuleCode'] = moduleCode;
    _data['TemplateMasterCode'] = templateMasterCode;
    _data['DueDateDisplay'] = dueDateDisplay;
    _data['TaskOwnerFirstLetter'] = taskOwnerFirstLetter;
    _data['GetTaskOwner'] = getTaskOwner;
    _data['ServiceNo'] = serviceNo;
    _data['ServiceName'] = serviceName;
    _data['DisplayStartDate'] = displayStartDate;
    _data['StageName'] = stageName;
    _data['StageId'] = stageId;
    _data['WorkflowStepName'] = workflowStepName;
    _data['WorkflowStepId'] = workflowStepId;
    _data['StepTaskSequenceOrder'] = stepTaskSequenceOrder;
    _data['NoteSubject'] = noteSubject;
    _data['NoteNo'] = noteNo;
    _data['BookTemplateCode'] = bookTemplateCode;
    _data['BookId'] = bookId;
    _data['BookType'] = bookType;
    _data['TaskNo'] = taskNo;
    _data['TaskSubject'] = taskSubject;
    _data['TaskDescription'] = taskDescription;
    _data['TemplateCode'] = templateCode;
    _data['TaskType'] = taskType;
    _data['StartDate'] = startDate;
    _data['DueDate'] = dueDate;
    _data['TaskSLA'] = taskSla;
    _data['ActualSLA'] = actualSla;
    _data['ReminderDate'] = reminderDate;
    _data['PlanDate'] = planDate;
    _data['TaskStatusId'] = taskStatusId;
    _data['TaskStatus'] = taskStatus;
    _data['TaskActionId'] = taskActionId;
    _data['TaskAction'] = taskAction;
    _data['TaskPriorityId'] = taskPriorityId;
    _data['TaskPriority'] = taskPriority;
    _data['SubmittedDate'] = submittedDate;
    _data['CompletedDate'] = completedDate;
    _data['RejectedDate'] = rejectedDate;
    _data['CanceledDate'] = canceledDate;
    _data['ReturnedDate'] = returnedDate;
    _data['ReopenedDate'] = reopenedDate;
    _data['ClosedDate'] = closedDate;
    _data['RejectionReason'] = rejectionReason;
    _data['ReturnReason'] = returnReason;
    _data['ReopenReason'] = reopenReason;
    _data['CancelReason'] = cancelReason;
    _data['CompleteReason'] = completeReason;
    _data['DelegateReason'] = delegateReason;
    _data['CloseComment'] = closeComment;
    _data['UserRating'] = userRating;
    _data['TemplateId'] = templateId;
    _data['Template'] = template;
    _data['UdfTemplateId'] = udfTemplateId;
    _data['UdfTemplate'] = udfTemplate;
    _data['UdfNoteId'] = udfNoteId;
    _data['UdfNote'] = udfNote;
    _data['UdfNoteTableId'] = udfNoteTableId;
    _data['TaskTemplateId'] = taskTemplateId;
    _data['TaskTemplate'] = taskTemplate;
    _data['RequestedByUserId'] = requestedByUserId;
    _data['RequestedByUser'] = requestedByUser;
    _data['OwnerUserId'] = ownerUserId;
    _data['OwnerUser'] = ownerUser;
    _data['TaskOwnerTypeId'] = taskOwnerTypeId;
    _data['TaskOwnerType'] = taskOwnerType;
    _data['AssignedToTypeId'] = assignedToTypeId;
    _data['AssignedToType'] = assignedToType;
    _data['AssignedToUserId'] = assignedToUserId;
    _data['AssignedToUser'] = assignedToUser;
    _data['AssignedToTeamId'] = assignedToTeamId;
    _data['AssignedToTeam'] = assignedToTeam;
    _data['IsStepTaskAutoCompleteIfSameAssignee'] =
        isStepTaskAutoCompleteIfSameAssignee;
    _data['LockStatusId'] = lockStatusId;
    _data['LockStatus'] = lockStatus;
    _data['ParentNoteId'] = parentNoteId;
    _data['ParentTaskId'] = parentTaskId;
    _data['ParentServiceId'] = parentServiceId;
    _data['AssignedToHierarchyMasterId'] = assignedToHierarchyMasterId;
    _data['AssignedToHierarchyMasterLevelId'] =
        assignedToHierarchyMasterLevelId;
    _data['IsVersioning'] = isVersioning;
    _data['StepTaskComponentId'] = stepTaskComponentId;
    _data['ReferenceId'] = referenceId;
    _data['ReferenceType'] = referenceType;
    _data['IsArchived'] = isArchived;
    _data['TaskEventId'] = taskEventId;
    _data['TaskEvent'] = taskEvent;
    _data['ServicePlusId'] = servicePlusId;
    _data['NotePlusId'] = notePlusId;
    _data['TaskPlusId'] = taskPlusId;
    _data['NextTaskAssignedToTypeId'] = nextTaskAssignedToTypeId;
    _data['NextTaskAssignedToType'] = nextTaskAssignedToType;
    _data['NextTaskAssignedToUserId'] = nextTaskAssignedToUserId;
    _data['NextTaskAssignedToUser'] = nextTaskAssignedToUser;
    _data['NextTaskAssignedToTeamId'] = nextTaskAssignedToTeamId;
    _data['NextTaskAssignedToTeam'] = nextTaskAssignedToTeam;
    _data['NextTaskAssignedToHierarchyMasterId'] =
        nextTaskAssignedToHierarchyMasterId;
    _data['NextTaskAssignedToHierarchyMasterLevelId'] =
        nextTaskAssignedToHierarchyMasterLevelId;
    _data['IsReturned'] = isReturned;
    _data['IsReopened'] = isReopened;
    _data['NextTaskAttachmentId'] = nextTaskAttachmentId;
    _data['NextStepTaskComponentId'] = nextStepTaskComponentId;
    _data['Id'] = id;
    _data['CreatedDate'] = createdDate;
    _data['CreatedBy'] = createdBy;
    _data['LastUpdatedDate'] = lastUpdatedDate;
    _data['LastUpdatedBy'] = lastUpdatedBy;
    _data['IsDeleted'] = isDeleted;
    _data['SequenceOrder'] = sequenceOrder;
    _data['CompanyId'] = companyId;
    _data['LegalEntityId'] = legalEntityId;
    _data['DataAction'] = dataAction;
    _data['Status'] = status;
    _data['VersionNo'] = versionNo;
    _data['PortalId'] = portalId;
    _data['WorkflowStatus'] = workflowStatus;

    return _data;
  }
}
