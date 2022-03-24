
import '../../models/service_models/service_model.dart';

class TaskModel {
  dynamic jsonCopy;
  dynamic json;
  dynamic dataJson;
  dynamic page;
  dynamic pageId;
  dynamic recordId;
  dynamic portalName;
  String? templateCode;
  String? templateDisplayName;
  int? taskCount;
  bool? setUdfValue;
  String? taskEventId;
  dynamic taskIndexPageTemplateDetails;
  dynamic notificationTemplate;
  dynamic udfTableMetadata;
  dynamic noteUdfTemplate;
  dynamic templateViewModel;
  dynamic taskTemplateVM;
  dynamic taskTable;
  List<ColumnList>? columnList;
  String? activeUserId;
  String? taskNo;
  String? taskId;
  dynamic taskTableId;
  dynamic taskNoteTableId;
  String? startDate;
  String? dueDate;
  String? taskSLA;
  double? taskSLASeconds;
  dynamic slaSeconds;
  String? actualSLA;
  dynamic reminderDate;
  dynamic planDate;
  String? taskStatusBgCss;
  String? taskStatusFontCss;
  String? taskStatusId;
  dynamic tableMetadataId;
  String? udfTableMetadataId;
  String? udfNoteId;
  String? udfNoteTableId;
  String? taskStatusCode;
  String? taskStatusName;
  dynamic taskActionId;
  dynamic taskActionCode;
  dynamic taskActionName;
  String? taskPriorityId;
  String? taskPriorityCode;
  String? taskPriorityName;
  String? submittedDate;
  dynamic completedDate;
  dynamic rejectedDate;
  dynamic canceledDate;
  dynamic returnedDate;
  dynamic reopenedDate;
  dynamic closedDate;
  dynamic closeComment;
  dynamic rejectionReason;
  dynamic returnReason;
  dynamic reopenReason;
  dynamic cancelReason;
  dynamic completeReason;
  dynamic delegateReason;
  String? requestedByUserId;
  String? requestedByUserName;
  String? requestedByUserEmail;
  dynamic requestedByUserPhotoId;
  String? ownerUserId;
  String? ownerUserName;
  String? ownerUserEmail;
  dynamic ownerUserPhotoId;
  dynamic taskOwnerTypeId;
  int? activeUserType;
  String? assignedToTypeId;
  String? assignedToTypeCode;
  String? assignedToTypeName;
  String? assignedToUserId;
  dynamic sharedByUserId;
  dynamic sharedWithUserId;
  String? assignedToUserName;
  String? sharedListText;
  dynamic sharedList;
  String? assignedToUserEmail;
  dynamic assignedToTeamId;
  dynamic assignedToTeamName;
  dynamic assignedToTeamUserId;
  dynamic assignedToTeamUserName;
  dynamic assignedToHierarchyMasterId;
  dynamic assignedToHierarchyMasterName;
  dynamic assignedToHierarchyMasterLevelId;
  dynamic assignedToHierarchyMasterLevelName;
  bool? isStepTaskAutoCompleteIfSameAssignee;
  dynamic lockStatusId;
  dynamic lockStatus;
  dynamic parentTaskId;
  String? parentServiceId;
  dynamic parentService;
  bool? includeReadonlyData;
  bool? isDraftButtonVisible;
  bool? isAcceptButtonVisible;
  bool? isSubmitButtonVisible;
  bool? isInEditMode;
  bool? isVersioningButtonVisible;
  bool? isReplyButtonVisible;
  bool? isAddCommentEnabled;
  bool? isAddAttachmentEnabled;
  bool? isSharingEnabled;
  bool? isCompleteButtonVisible;
  bool? isTimeEntryButtonVisible;
  bool? isRejectButtonVisible;
  bool? isCloseButtonVisible;
  bool? isSaveChangesVisible;
  bool? isLockVisible;
  bool? isReleaseVisible;
  bool? isTaskTeamOwner;
  dynamic teamMembers;
  int? sharedCount;
  int? attachmentCount;
  int? notificationCount;
  int? commentCount;
  dynamic prms;
  dynamic udfs;
  dynamic readoOnlyUdfs;
  bool? canChangeOwner;
  dynamic taskSequenceOrder;
  String? taskDescription;
  String? taskSubject;
  bool? includeSharedList;
  dynamic customUrl;
  dynamic returnUrl;
  dynamic layoutMode;
  dynamic popupCallbackMethod;
  dynamic stepTasksList;
  bool? hideStepTaskDetails;
  bool? isVersioning;
  dynamic stepTaskComponentId;
  dynamic chartItems;
  dynamic referenceId;
  int? referenceType;
  dynamic logId;
  bool? isLogRecord;
  dynamic postComment;
  dynamic viewType;
  dynamic viewMode;
  dynamic servicePlusId;
  dynamic notePlusId;
  dynamic taskPlusId;
  dynamic parentNoteId;
  bool? enableChangingNextTaskAssignee;
  dynamic changingNextTaskAssigneeTitle;
  bool? enableReturnTask;
  dynamic returnTaskTitle;
  dynamic returnTaskButtonText;
  dynamic nextTaskAttachmentId;
  bool? enableNextTaskAttachment;
  bool? disableNextTaskTeamChange;
  dynamic nextTaskAssignedToTypeId;
  dynamic nextTaskAssignedToTypeCode;
  dynamic nextTaskAssignedToUserId;
  dynamic nextTaskAssignedToTeamId;
  dynamic nextTaskAssignedToTeamUserId;
  dynamic nextTaskAssignedToHierarchyMasterId;
  dynamic nextTaskAssignedToHierarchyMasterLevelId;
  bool? isReturned;
  bool? isReopened;
  bool? enableDynamicStepTaskSelection;
  dynamic nextStepTaskComponentId;
  dynamic subject;
  dynamic notificationSubject;
  dynamic description;
  bool? enableIndexPage;
  bool? enableTaskNumberManual;
  bool? enableSaveAsDraft;
  dynamic saveAsDraftText;
  dynamic saveAsDraftCss;
  dynamic submitButtonText;
  dynamic submitButtonCss;
  dynamic sla;
  bool? allowSLAChange;
  dynamic completeButtonText;
  bool? isCompleteReasonRequired;
  dynamic completeButtonCss;
  dynamic priorityId;
  dynamic priority;
  bool? enableRejectButton;
  bool? isRejectReasonRequired;
  dynamic rejectButtonText;
  dynamic rejectButtonCss;
  bool? enableBackButton;
  dynamic backButtonText;
  dynamic backButtonCss;
  bool? enableAttachment;
  bool? enableComment;
  String? templateId;
  dynamic template;
  String? udfTemplateId;
  dynamic udfTemplate;
  String? taskIndexPageTemplateId;
  dynamic taskIndexPageTemplate;
  int? createReturnType;
  int? editReturnType;
  dynamic preScript;
  dynamic postScript;
  dynamic iconFileId;
  dynamic templateColor;
  dynamic bannerFileId;
  dynamic backgroundFileId;
  dynamic subjectText;
  dynamic ownerUserText;
  dynamic requestedByUserText;
  dynamic assignedToUserText;
  bool? enableCancelButton;
  bool? isCancelReasonRequired;
  dynamic cancelButtonText;
  dynamic cancelButtonCss;
  bool? enableTimeEntry;
  int? taskTemplateType;
  dynamic taskNoText;
  dynamic descriptionText;
  bool? hideHeader;
  bool? hideSubject;
  bool? hideDescription;
  bool? hideStartDate;
  bool? hideDueDate;
  bool? hideSLA;
  bool? hidePriority;
  bool? isSubjectMandatory;
  bool? isSubjectUnique;
  bool? isDescriptionMandatory;
  bool? hideToolbar;
  bool? hideBanner;
  bool? hideOwner;
  bool? allowPastStartDate;
  bool? enablePrintButton;
  dynamic printButtonText;
  bool? enableEmail;
  bool? enableDataPermission;
  dynamic dataPermissionColumnId;
  int? numberGenerationType;
  bool? isNumberNotMandatory;
  bool? enableLegalEntityFilter;
  bool? enablePermission;
  bool? enableInlineComment;
  dynamic emailCopyTemplateCode;
  int? formType;
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
  dynamic portalId;

  TaskModel({
    this.jsonCopy,
    this.json,
    this.dataJson,
    this.page,
    this.pageId,
    this.recordId,
    this.portalName,
    this.templateCode,
    this.templateDisplayName,
    this.taskCount,
    this.setUdfValue,
    this.taskEventId,
    this.taskIndexPageTemplateDetails,
    this.notificationTemplate,
    this.udfTableMetadata,
    this.noteUdfTemplate,
    this.templateViewModel,
    this.taskTemplateVM,
    this.taskTable,
    this.columnList,
    this.activeUserId,
    this.taskNo,
    this.taskId,
    this.taskTableId,
    this.taskNoteTableId,
    this.startDate,
    this.dueDate,
    this.taskSLA,
    this.taskSLASeconds,
    this.slaSeconds,
    this.actualSLA,
    this.reminderDate,
    this.planDate,
    this.taskStatusBgCss,
    this.taskStatusFontCss,
    this.taskStatusId,
    this.tableMetadataId,
    this.udfTableMetadataId,
    this.udfNoteId,
    this.udfNoteTableId,
    this.taskStatusCode,
    this.taskStatusName,
    this.taskActionId,
    this.taskActionCode,
    this.taskActionName,
    this.taskPriorityId,
    this.taskPriorityCode,
    this.taskPriorityName,
    this.submittedDate,
    this.completedDate,
    this.rejectedDate,
    this.canceledDate,
    this.returnedDate,
    this.reopenedDate,
    this.closedDate,
    this.closeComment,
    this.rejectionReason,
    this.returnReason,
    this.reopenReason,
    this.cancelReason,
    this.completeReason,
    this.delegateReason,
    this.requestedByUserId,
    this.requestedByUserName,
    this.requestedByUserEmail,
    this.requestedByUserPhotoId,
    this.ownerUserId,
    this.ownerUserName,
    this.ownerUserEmail,
    this.ownerUserPhotoId,
    this.taskOwnerTypeId,
    this.activeUserType,
    this.assignedToTypeId,
    this.assignedToTypeCode,
    this.assignedToTypeName,
    this.assignedToUserId,
    this.sharedByUserId,
    this.sharedWithUserId,
    this.assignedToUserName,
    this.sharedListText,
    this.sharedList,
    this.assignedToUserEmail,
    this.assignedToTeamId,
    this.assignedToTeamName,
    this.assignedToTeamUserId,
    this.assignedToTeamUserName,
    this.assignedToHierarchyMasterId,
    this.assignedToHierarchyMasterName,
    this.assignedToHierarchyMasterLevelId,
    this.assignedToHierarchyMasterLevelName,
    this.isStepTaskAutoCompleteIfSameAssignee,
    this.lockStatusId,
    this.lockStatus,
    this.parentTaskId,
    this.parentServiceId,
    this.parentService,
    this.includeReadonlyData,
    this.isDraftButtonVisible,
    this.isAcceptButtonVisible,
    this.isSubmitButtonVisible,
    this.isInEditMode,
    this.isVersioningButtonVisible,
    this.isReplyButtonVisible,
    this.isAddCommentEnabled,
    this.isAddAttachmentEnabled,
    this.isSharingEnabled,
    this.isCompleteButtonVisible,
    this.isTimeEntryButtonVisible,
    this.isRejectButtonVisible,
    this.isCloseButtonVisible,
    this.isSaveChangesVisible,
    this.isLockVisible,
    this.isReleaseVisible,
    this.isTaskTeamOwner,
    this.teamMembers,
    this.sharedCount,
    this.attachmentCount,
    this.notificationCount,
    this.commentCount,
    this.prms,
    this.udfs,
    this.readoOnlyUdfs,
    this.canChangeOwner,
    this.taskSequenceOrder,
    this.taskDescription,
    this.taskSubject,
    this.includeSharedList,
    this.customUrl,
    this.returnUrl,
    this.layoutMode,
    this.popupCallbackMethod,
    this.stepTasksList,
    this.hideStepTaskDetails,
    this.isVersioning,
    this.stepTaskComponentId,
    this.chartItems,
    this.referenceId,
    this.referenceType,
    this.logId,
    this.isLogRecord,
    this.postComment,
    this.viewType,
    this.viewMode,
    this.servicePlusId,
    this.notePlusId,
    this.taskPlusId,
    this.parentNoteId,
    this.enableChangingNextTaskAssignee,
    this.changingNextTaskAssigneeTitle,
    this.enableReturnTask,
    this.returnTaskTitle,
    this.returnTaskButtonText,
    this.nextTaskAttachmentId,
    this.enableNextTaskAttachment,
    this.disableNextTaskTeamChange,
    this.nextTaskAssignedToTypeId,
    this.nextTaskAssignedToTypeCode,
    this.nextTaskAssignedToUserId,
    this.nextTaskAssignedToTeamId,
    this.nextTaskAssignedToTeamUserId,
    this.nextTaskAssignedToHierarchyMasterId,
    this.nextTaskAssignedToHierarchyMasterLevelId,
    this.isReturned,
    this.isReopened,
    this.enableDynamicStepTaskSelection,
    this.nextStepTaskComponentId,
    this.subject,
    this.notificationSubject,
    this.description,
    this.enableIndexPage,
    this.enableTaskNumberManual,
    this.enableSaveAsDraft,
    this.saveAsDraftText,
    this.saveAsDraftCss,
    this.submitButtonText,
    this.submitButtonCss,
    this.sla,
    this.allowSLAChange,
    this.completeButtonText,
    this.isCompleteReasonRequired,
    this.completeButtonCss,
    this.priorityId,
    this.priority,
    this.enableRejectButton,
    this.isRejectReasonRequired,
    this.rejectButtonText,
    this.rejectButtonCss,
    this.enableBackButton,
    this.backButtonText,
    this.backButtonCss,
    this.enableAttachment,
    this.enableComment,
    this.templateId,
    this.template,
    this.udfTemplateId,
    this.udfTemplate,
    this.taskIndexPageTemplateId,
    this.taskIndexPageTemplate,
    this.createReturnType,
    this.editReturnType,
    this.preScript,
    this.postScript,
    this.iconFileId,
    this.templateColor,
    this.bannerFileId,
    this.backgroundFileId,
    this.subjectText,
    this.ownerUserText,
    this.requestedByUserText,
    this.assignedToUserText,
    this.enableCancelButton,
    this.isCancelReasonRequired,
    this.cancelButtonText,
    this.cancelButtonCss,
    this.enableTimeEntry,
    this.taskTemplateType,
    this.taskNoText,
    this.descriptionText,
    this.hideHeader,
    this.hideSubject,
    this.hideDescription,
    this.hideStartDate,
    this.hideDueDate,
    this.hideSLA,
    this.hidePriority,
    this.isSubjectMandatory,
    this.isSubjectUnique,
    this.isDescriptionMandatory,
    this.hideToolbar,
    this.hideBanner,
    this.hideOwner,
    this.allowPastStartDate,
    this.enablePrintButton,
    this.printButtonText,
    this.enableEmail,
    this.enableDataPermission,
    this.dataPermissionColumnId,
    this.numberGenerationType,
    this.isNumberNotMandatory,
    this.enableLegalEntityFilter,
    this.enablePermission,
    this.enableInlineComment,
    this.emailCopyTemplateCode,
    this.formType,
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

  TaskModel.fromJson(Map<String, dynamic> jsonResponse) {
    jsonCopy = jsonResponse['JsonCopy'];
    json = jsonResponse['Json'];
    dataJson = jsonResponse['DataJson'];
    page = jsonResponse['Page'];
    pageId = jsonResponse['PageId'];
    recordId = jsonResponse['RecordId'];
    portalName = jsonResponse['PortalName'];
    templateCode = jsonResponse['TemplateCode'];
    templateDisplayName = jsonResponse['TemplateDisplayName'];
    taskCount = jsonResponse['TaskCount'];
    setUdfValue = jsonResponse['SetUdfValue'];
    taskEventId = jsonResponse['TaskEventId'];
    taskIndexPageTemplateDetails = jsonResponse['TaskIndexPageTemplateDetails'];
    notificationTemplate = jsonResponse['NotificationTemplate'];
    udfTableMetadata = jsonResponse['UdfTableMetadata'];
    noteUdfTemplate = jsonResponse['NoteUdfTemplate'];
    templateViewModel = jsonResponse['TemplateViewModel'];
    taskTemplateVM = jsonResponse['TaskTemplateVM'];
    taskTable = jsonResponse['TaskTable'];
    columnList = List.from(jsonResponse['ColumnList'] ?? [])
        .map((e) => ColumnList.fromJson(e))
        .toList();
    activeUserId = jsonResponse['ActiveUserId'];
    taskNo = jsonResponse['TaskNo'];
    taskId = jsonResponse['TaskId'];
    taskTableId = jsonResponse['TaskTableId'];
    taskNoteTableId = jsonResponse['TaskNoteTableId'];
    startDate = jsonResponse['StartDate'];
    dueDate = jsonResponse['DueDate'];
    taskSLA = jsonResponse['TaskSLA'];
    taskSLASeconds = jsonResponse['TaskSLASeconds'];
    slaSeconds = jsonResponse['SLASeconds'];
    actualSLA = jsonResponse['ActualSLA'];
    reminderDate = jsonResponse['ReminderDate'];
    planDate = jsonResponse['PlanDate'];
    taskStatusBgCss = jsonResponse['TaskStatusBgCss'];
    taskStatusFontCss = jsonResponse['TaskStatusFontCss'];
    taskStatusId = jsonResponse['TaskStatusId'];
    tableMetadataId = jsonResponse['TableMetadataId'];
    udfTableMetadataId = jsonResponse['UdfTableMetadataId'];
    udfNoteId = jsonResponse['UdfNoteId'];
    udfNoteTableId = jsonResponse['UdfNoteTableId'];
    taskStatusCode = jsonResponse['TaskStatusCode'];
    taskStatusName = jsonResponse['TaskStatusName'];
    taskActionId = jsonResponse['TaskActionId'];
    taskActionCode = jsonResponse['TaskActionCode'];
    taskActionName = jsonResponse['TaskActionName'];
    taskPriorityId = jsonResponse['TaskPriorityId'];
    taskPriorityCode = jsonResponse['TaskPriorityCode'];
    taskPriorityName = jsonResponse['TaskPriorityName'];
    submittedDate = jsonResponse['SubmittedDate'];
    completedDate = jsonResponse['CompletedDate'];
    rejectedDate = jsonResponse['RejectedDate'];
    canceledDate = jsonResponse['CanceledDate'];
    returnedDate = jsonResponse['ReturnedDate'];
    reopenedDate = jsonResponse['ReopenedDate'];
    closedDate = jsonResponse['ClosedDate'];
    closeComment = jsonResponse['CloseComment'];
    rejectionReason = jsonResponse['RejectionReason'];
    returnReason = jsonResponse['ReturnReason'];
    reopenReason = jsonResponse['ReopenReason'];
    cancelReason = jsonResponse['CancelReason'];
    completeReason = jsonResponse['CompleteReason'];
    delegateReason = jsonResponse['DelegateReason'];
    requestedByUserId = jsonResponse['RequestedByUserId'];
    requestedByUserName = jsonResponse['RequestedByUserName'];
    requestedByUserEmail = jsonResponse['RequestedByUserEmail'];
    requestedByUserPhotoId = jsonResponse['RequestedByUserPhotoId'];
    ownerUserId = jsonResponse['OwnerUserId'];
    ownerUserName = jsonResponse['OwnerUserName'];
    ownerUserEmail = jsonResponse['OwnerUserEmail'];
    ownerUserPhotoId = jsonResponse['OwnerUserPhotoId'];
    taskOwnerTypeId = jsonResponse['TaskOwnerTypeId'];
    activeUserType = jsonResponse['ActiveUserType'];
    assignedToTypeId = jsonResponse['AssignedToTypeId'];
    assignedToTypeCode = jsonResponse['AssignedToTypeCode'];
    assignedToTypeName = jsonResponse['AssignedToTypeName'];
    assignedToUserId = jsonResponse['AssignedToUserId'];
    sharedByUserId = jsonResponse['SharedByUserId'];
    sharedWithUserId = jsonResponse['SharedWithUserId'];
    assignedToUserName = jsonResponse['AssignedToUserName'];
    sharedListText = jsonResponse['SharedListText'];
    sharedList = jsonResponse['SharedList'];
    assignedToUserEmail = jsonResponse['AssignedToUserEmail'];
    assignedToTeamId = jsonResponse['AssignedToTeamId'];
    assignedToTeamName = jsonResponse['AssignedToTeamName'];
    assignedToTeamUserId = jsonResponse['AssignedToTeamUserId'];
    assignedToTeamUserName = jsonResponse['AssignedToTeamUserName'];
    assignedToHierarchyMasterId = jsonResponse['AssignedToHierarchyMasterId'];
    assignedToHierarchyMasterName =
        jsonResponse['AssignedToHierarchyMasterName'];
    assignedToHierarchyMasterLevelId =
        jsonResponse['AssignedToHierarchyMasterLevelId'];
    assignedToHierarchyMasterLevelName =
        jsonResponse['AssignedToHierarchyMasterLevelName'];
    isStepTaskAutoCompleteIfSameAssignee =
        jsonResponse['IsStepTaskAutoCompleteIfSameAssignee'];
    lockStatusId = jsonResponse['LockStatusId'];
    lockStatus = jsonResponse['LockStatus'];
    parentTaskId = jsonResponse['ParentTaskId'];
    parentServiceId = jsonResponse['ParentServiceId'];
    parentService = jsonResponse['ParentService'];
    includeReadonlyData = jsonResponse['IncludeReadonlyData'];
    isDraftButtonVisible = jsonResponse['IsDraftButtonVisible'];
    isAcceptButtonVisible = jsonResponse['IsAcceptButtonVisible'];
    isSubmitButtonVisible = jsonResponse['IsSubmitButtonVisible'];
    isInEditMode = jsonResponse['IsInEditMode'];
    isVersioningButtonVisible = jsonResponse['IsVersioningButtonVisible'];
    isReplyButtonVisible = jsonResponse['IsReplyButtonVisible'];
    isAddCommentEnabled = jsonResponse['IsAddCommentEnabled'];
    isAddAttachmentEnabled = jsonResponse['IsAddAttachmentEnabled'];
    isSharingEnabled = jsonResponse['IsSharingEnabled'];
    isCompleteButtonVisible = jsonResponse['IsCompleteButtonVisible'];
    isTimeEntryButtonVisible = jsonResponse['IsTimeEntryButtonVisible'];
    isRejectButtonVisible = jsonResponse['IsRejectButtonVisible'];
    isCloseButtonVisible = jsonResponse['IsCloseButtonVisible'];
    isSaveChangesVisible = jsonResponse['IsSaveChangesVisible'];
    isLockVisible = jsonResponse['IsLockVisible'];
    isReleaseVisible = jsonResponse['IsReleaseVisible'];
    isTaskTeamOwner = jsonResponse['IsTaskTeamOwner'];
    teamMembers = jsonResponse['TeamMembers'];
    sharedCount = jsonResponse['SharedCount'];
    attachmentCount = jsonResponse['AttachmentCount'];
    notificationCount = jsonResponse['NotificationCount'];
    commentCount = jsonResponse['CommentCount'];
    prms = jsonResponse['Prms'];
    udfs = jsonResponse['Udfs'];
    readoOnlyUdfs = jsonResponse['ReadoOnlyUdfs'];
    canChangeOwner = jsonResponse['CanChangeOwner'];
    taskSequenceOrder = jsonResponse['TaskSequenceOrder'];
    taskDescription = jsonResponse['TaskDescription'];
    taskSubject = jsonResponse['TaskSubject'];
    includeSharedList = jsonResponse['IncludeSharedList'];
    customUrl = jsonResponse['CustomUrl'];
    returnUrl = jsonResponse['ReturnUrl'];
    layoutMode = jsonResponse['LayoutMode'];
    popupCallbackMethod = jsonResponse['PopupCallbackMethod'];
    stepTasksList = jsonResponse['StepTasksList'];
    hideStepTaskDetails = jsonResponse['HideStepTaskDetails'];
    isVersioning = jsonResponse['IsVersioning'];
    stepTaskComponentId = jsonResponse['StepTaskComponentId'];
    chartItems = jsonResponse['ChartItems'];
    referenceId = jsonResponse['ReferenceId'];
    referenceType = jsonResponse['ReferenceType'];
    logId = jsonResponse['LogId'];
    isLogRecord = jsonResponse['IsLogRecord'];
    postComment = jsonResponse['PostComment'];
    viewType = jsonResponse['ViewType'];
    viewMode = jsonResponse['ViewMode'];
    servicePlusId = jsonResponse['ServicePlusId'];
    notePlusId = jsonResponse['NotePlusId'];
    taskPlusId = jsonResponse['TaskPlusId'];
    parentNoteId = jsonResponse['ParentNoteId'];
    enableChangingNextTaskAssignee =
        jsonResponse['EnableChangingNextTaskAssignee'];
    changingNextTaskAssigneeTitle =
        jsonResponse['ChangingNextTaskAssigneeTitle'];
    enableReturnTask = jsonResponse['EnableReturnTask'];
    returnTaskTitle = jsonResponse['ReturnTaskTitle'];
    returnTaskButtonText = jsonResponse['ReturnTaskButtonText'];
    nextTaskAttachmentId = jsonResponse['NextTaskAttachmentId'];
    enableNextTaskAttachment = jsonResponse['EnableNextTaskAttachment'];
    disableNextTaskTeamChange = jsonResponse['DisableNextTaskTeamChange'];
    nextTaskAssignedToTypeId = jsonResponse['NextTaskAssignedToTypeId'];
    nextTaskAssignedToTypeCode = jsonResponse['NextTaskAssignedToTypeCode'];
    nextTaskAssignedToUserId = jsonResponse['NextTaskAssignedToUserId'];
    nextTaskAssignedToTeamId = jsonResponse['NextTaskAssignedToTeamId'];
    nextTaskAssignedToTeamUserId = jsonResponse['NextTaskAssignedToTeamUserId'];
    nextTaskAssignedToHierarchyMasterId =
        jsonResponse['NextTaskAssignedToHierarchyMasterId'];
    nextTaskAssignedToHierarchyMasterLevelId =
        jsonResponse['NextTaskAssignedToHierarchyMasterLevelId'];
    isReturned = jsonResponse['IsReturned'];
    isReopened = jsonResponse['IsReopened'];
    enableDynamicStepTaskSelection =
        jsonResponse['EnableDynamicStepTaskSelection'];
    nextStepTaskComponentId = jsonResponse['NextStepTaskComponentId'];
    subject = jsonResponse['Subject'];
    notificationSubject = jsonResponse['NotificationSubject'];
    description = jsonResponse['Description'];
    enableIndexPage = jsonResponse['EnableIndexPage'];
    enableTaskNumberManual = jsonResponse['EnableTaskNumberManual'];
    enableSaveAsDraft = jsonResponse['EnableSaveAsDraft'];
    saveAsDraftText = jsonResponse['SaveAsDraftText'];
    saveAsDraftCss = jsonResponse['SaveAsDraftCss'];
    submitButtonText = jsonResponse['SubmitButtonText'];
    submitButtonCss = jsonResponse['SubmitButtonCss'];
    sla = jsonResponse['SLA'];
    allowSLAChange = jsonResponse['AllowSLAChange'];
    completeButtonText = jsonResponse['CompleteButtonText'];
    isCompleteReasonRequired = jsonResponse['IsCompleteReasonRequired'];
    completeButtonCss = jsonResponse['CompleteButtonCss'];
    priorityId = jsonResponse['PriorityId'];
    priority = jsonResponse['Priority'];
    enableRejectButton = jsonResponse['EnableRejectButton'];
    isRejectReasonRequired = jsonResponse['IsRejectReasonRequired'];
    rejectButtonText = jsonResponse['RejectButtonText'];
    rejectButtonCss = jsonResponse['RejectButtonCss'];
    enableBackButton = jsonResponse['EnableBackButton'];
    backButtonText = jsonResponse['BackButtonText'];
    backButtonCss = jsonResponse['BackButtonCss'];
    enableAttachment = jsonResponse['EnableAttachment'];
    enableComment = jsonResponse['EnableComment'];
    templateId = jsonResponse['TemplateId'];
    template = jsonResponse['Template'];
    udfTemplateId = jsonResponse['UdfTemplateId'];
    udfTemplate = jsonResponse['UdfTemplate'];
    taskIndexPageTemplateId = jsonResponse['TaskIndexPageTemplateId'];
    taskIndexPageTemplate = jsonResponse['TaskIndexPageTemplate'];
    createReturnType = jsonResponse['CreateReturnType'];
    editReturnType = jsonResponse['EditReturnType'];
    preScript = jsonResponse['PreScript'];
    postScript = jsonResponse['PostScript'];
    iconFileId = jsonResponse['IconFileId'];
    templateColor = jsonResponse['TemplateColor'];
    bannerFileId = jsonResponse['BannerFileId'];
    backgroundFileId = jsonResponse['BackgroundFileId'];
    subjectText = jsonResponse['SubjectText'];
    ownerUserText = jsonResponse['OwnerUserText'];
    requestedByUserText = jsonResponse['RequestedByUserText'];
    assignedToUserText = jsonResponse['AssignedToUserText'];
    enableCancelButton = jsonResponse['EnableCancelButton'];
    isCancelReasonRequired = jsonResponse['IsCancelReasonRequired'];
    cancelButtonText = jsonResponse['CancelButtonText'];
    cancelButtonCss = jsonResponse['CancelButtonCss'];
    enableTimeEntry = jsonResponse['EnableTimeEntry'];
    taskTemplateType = jsonResponse['TaskTemplateType'];
    taskNoText = jsonResponse['TaskNoText'];
    descriptionText = jsonResponse['DescriptionText'];
    hideHeader = jsonResponse['HideHeader'];
    hideSubject = jsonResponse['HideSubject'];
    hideDescription = jsonResponse['HideDescription'];
    hideStartDate = jsonResponse['HideStartDate'];
    hideDueDate = jsonResponse['HideDueDate'];
    hideSLA = jsonResponse['HideSLA'];
    hidePriority = jsonResponse['HidePriority'];
    isSubjectMandatory = jsonResponse['IsSubjectMandatory'];
    isSubjectUnique = jsonResponse['IsSubjectUnique'];
    isDescriptionMandatory = jsonResponse['IsDescriptionMandatory'];
    hideToolbar = jsonResponse['HideToolbar'];
    hideBanner = jsonResponse['HideBanner'];
    hideOwner = jsonResponse['HideOwner'];
    allowPastStartDate = jsonResponse['AllowPastStartDate'];
    enablePrintButton = jsonResponse['EnablePrintButton'];
    printButtonText = jsonResponse['PrintButtonText'];
    enableEmail = jsonResponse['EnableEmail'];
    enableDataPermission = jsonResponse['EnableDataPermission'];
    dataPermissionColumnId = jsonResponse['DataPermissionColumnId'];
    numberGenerationType = jsonResponse['NumberGenerationType'];
    isNumberNotMandatory = jsonResponse['IsNumberNotMandatory'];
    enableLegalEntityFilter = jsonResponse['EnableLegalEntityFilter'];
    enablePermission = jsonResponse['EnablePermission'];
    enableInlineComment = jsonResponse['EnableInlineComment'];
    emailCopyTemplateCode = jsonResponse['EmailCopyTemplateCode'];
    formType = jsonResponse['FormType'];
    id = jsonResponse['Id'];
    createdDate = jsonResponse['CreatedDate'];
    createdBy = jsonResponse['CreatedBy'];
    lastUpdatedDate = jsonResponse['LastUpdatedDate'];
    lastUpdatedBy = jsonResponse['LastUpdatedBy'];
    isDeleted = jsonResponse['IsDeleted'];
    sequenceOrder = jsonResponse['SequenceOrder'];
    companyId = jsonResponse['CompanyId'];
    legalEntityId = jsonResponse['LegalEntityId'];
    dataAction = jsonResponse['DataAction'];
    status = jsonResponse['Status'];
    versionNo = jsonResponse['VersionNo'];
    portalId = jsonResponse['PortalId'];
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
    _data['TaskCount'] = taskCount;
    _data['SetUdfValue'] = setUdfValue;
    _data['TaskEventId'] = taskEventId;
    _data['TaskIndexPageTemplateDetails'] = taskIndexPageTemplateDetails;
    _data['NotificationTemplate'] = notificationTemplate;
    _data['UdfTableMetadata'] = udfTableMetadata;
    _data['NoteUdfTemplate'] = noteUdfTemplate;
    _data['TemplateViewModel'] = templateViewModel;
    _data['TaskTemplateVM'] = taskTemplateVM;
    _data['TaskTable'] = taskTable;
    _data['ColumnList'] = columnList!.map((e) => e.toJson()).toList();
    _data['ActiveUserId'] = activeUserId;
    _data['TaskNo'] = taskNo;
    _data['TaskId'] = taskId;
    _data['TaskTableId'] = taskTableId;
    _data['TaskNoteTableId'] = taskNoteTableId;
    _data['StartDate'] = startDate;
    _data['DueDate'] = dueDate;
    _data['TaskSLA'] = taskSLA;
    _data['TaskSLASeconds'] = taskSLASeconds;
    _data['SLASeconds'] = slaSeconds;
    _data['ActualSLA'] = actualSLA;
    _data['ReminderDate'] = reminderDate;
    _data['PlanDate'] = planDate;
    _data['TaskStatusBgCss'] = taskStatusBgCss;
    _data['TaskStatusFontCss'] = taskStatusFontCss;
    _data['TaskStatusId'] = taskStatusId;
    _data['TableMetadataId'] = tableMetadataId;
    _data['UdfTableMetadataId'] = udfTableMetadataId;
    _data['UdfNoteId'] = udfNoteId;
    _data['UdfNoteTableId'] = udfNoteTableId;
    _data['TaskStatusCode'] = taskStatusCode;
    _data['TaskStatusName'] = taskStatusName;
    _data['TaskActionId'] = taskActionId;
    _data['TaskActionCode'] = taskActionCode;
    _data['TaskActionName'] = taskActionName;
    _data['TaskPriorityId'] = taskPriorityId;
    _data['TaskPriorityCode'] = taskPriorityCode;
    _data['TaskPriorityName'] = taskPriorityName;
    _data['SubmittedDate'] = submittedDate;
    _data['CompletedDate'] = completedDate;
    _data['RejectedDate'] = rejectedDate;
    _data['CanceledDate'] = canceledDate;
    _data['ReturnedDate'] = returnedDate;
    _data['ReopenedDate'] = reopenedDate;
    _data['ClosedDate'] = closedDate;
    _data['CloseComment'] = closeComment;
    _data['RejectionReason'] = rejectionReason;
    _data['ReturnReason'] = returnReason;
    _data['ReopenReason'] = reopenReason;
    _data['CancelReason'] = cancelReason;
    _data['CompleteReason'] = completeReason;
    _data['DelegateReason'] = delegateReason;
    _data['RequestedByUserId'] = requestedByUserId;
    _data['RequestedByUserName'] = requestedByUserName;
    _data['RequestedByUserEmail'] = requestedByUserEmail;
    _data['RequestedByUserPhotoId'] = requestedByUserPhotoId;
    _data['OwnerUserId'] = ownerUserId;
    _data['OwnerUserName'] = ownerUserName;
    _data['OwnerUserEmail'] = ownerUserEmail;
    _data['OwnerUserPhotoId'] = ownerUserPhotoId;
    _data['TaskOwnerTypeId'] = taskOwnerTypeId;
    _data['ActiveUserType'] = activeUserType;
    _data['AssignedToTypeId'] = assignedToTypeId;
    _data['AssignedToTypeCode'] = assignedToTypeCode;
    _data['AssignedToTypeName'] = assignedToTypeName;
    _data['AssignedToUserId'] = assignedToUserId;
    _data['SharedByUserId'] = sharedByUserId;
    _data['SharedWithUserId'] = sharedWithUserId;
    _data['AssignedToUserName'] = assignedToUserName;
    _data['SharedListText'] = sharedListText;
    _data['SharedList'] = sharedList;
    _data['AssignedToUserEmail'] = assignedToUserEmail;
    _data['AssignedToTeamId'] = assignedToTeamId;
    _data['AssignedToTeamName'] = assignedToTeamName;
    _data['AssignedToTeamUserId'] = assignedToTeamUserId;
    _data['AssignedToTeamUserName'] = assignedToTeamUserName;
    _data['AssignedToHierarchyMasterId'] = assignedToHierarchyMasterId;
    _data['AssignedToHierarchyMasterName'] = assignedToHierarchyMasterName;
    _data['AssignedToHierarchyMasterLevelId'] =
        assignedToHierarchyMasterLevelId;
    _data['AssignedToHierarchyMasterLevelName'] =
        assignedToHierarchyMasterLevelName;
    _data['IsStepTaskAutoCompleteIfSameAssignee'] =
        isStepTaskAutoCompleteIfSameAssignee;
    _data['LockStatusId'] = lockStatusId;
    _data['LockStatus'] = lockStatus;
    _data['ParentTaskId'] = parentTaskId;
    _data['ParentServiceId'] = parentServiceId;
    _data['ParentService'] = parentService;
    _data['IncludeReadonlyData'] = includeReadonlyData;
    _data['IsDraftButtonVisible'] = isDraftButtonVisible;
    _data['IsAcceptButtonVisible'] = isAcceptButtonVisible;
    _data['IsSubmitButtonVisible'] = isSubmitButtonVisible;
    _data['IsInEditMode'] = isInEditMode;
    _data['IsVersioningButtonVisible'] = isVersioningButtonVisible;
    _data['IsReplyButtonVisible'] = isReplyButtonVisible;
    _data['IsAddCommentEnabled'] = isAddCommentEnabled;
    _data['IsAddAttachmentEnabled'] = isAddAttachmentEnabled;
    _data['IsSharingEnabled'] = isSharingEnabled;
    _data['IsCompleteButtonVisible'] = isCompleteButtonVisible;
    _data['IsTimeEntryButtonVisible'] = isTimeEntryButtonVisible;
    _data['IsRejectButtonVisible'] = isRejectButtonVisible;
    _data['IsCloseButtonVisible'] = isCloseButtonVisible;
    _data['IsSaveChangesVisible'] = isSaveChangesVisible;
    _data['IsLockVisible'] = isLockVisible;
    _data['IsReleaseVisible'] = isReleaseVisible;
    _data['IsTaskTeamOwner'] = isTaskTeamOwner;
    _data['TeamMembers'] = teamMembers;
    _data['SharedCount'] = sharedCount;
    _data['AttachmentCount'] = attachmentCount;
    _data['NotificationCount'] = notificationCount;
    _data['CommentCount'] = commentCount;
    _data['Prms'] = prms;
    _data['Udfs'] = udfs;
    _data['ReadoOnlyUdfs'] = readoOnlyUdfs;
    _data['CanChangeOwner'] = canChangeOwner;
    _data['TaskSequenceOrder'] = taskSequenceOrder;
    _data['TaskDescription'] = taskDescription;
    _data['TaskSubject'] = taskSubject;
    _data['IncludeSharedList'] = includeSharedList;
    _data['CustomUrl'] = customUrl;
    _data['ReturnUrl'] = returnUrl;
    _data['LayoutMode'] = layoutMode;
    _data['PopupCallbackMethod'] = popupCallbackMethod;
    _data['StepTasksList'] = stepTasksList;
    _data['HideStepTaskDetails'] = hideStepTaskDetails;
    _data['IsVersioning'] = isVersioning;
    _data['StepTaskComponentId'] = stepTaskComponentId;
    _data['ChartItems'] = chartItems;
    _data['ReferenceId'] = referenceId;
    _data['ReferenceType'] = referenceType;
    _data['LogId'] = logId;
    _data['IsLogRecord'] = isLogRecord;
    _data['PostComment'] = postComment;
    _data['ViewType'] = viewType;
    _data['ViewMode'] = viewMode;
    _data['ServicePlusId'] = servicePlusId;
    _data['NotePlusId'] = notePlusId;
    _data['TaskPlusId'] = taskPlusId;
    _data['ParentNoteId'] = parentNoteId;
    _data['EnableChangingNextTaskAssignee'] = enableChangingNextTaskAssignee;
    _data['ChangingNextTaskAssigneeTitle'] = changingNextTaskAssigneeTitle;
    _data['EnableReturnTask'] = enableReturnTask;
    _data['ReturnTaskTitle'] = returnTaskTitle;
    _data['ReturnTaskButtonText'] = returnTaskButtonText;
    _data['NextTaskAttachmentId'] = nextTaskAttachmentId;
    _data['EnableNextTaskAttachment'] = enableNextTaskAttachment;
    _data['DisableNextTaskTeamChange'] = disableNextTaskTeamChange;
    _data['NextTaskAssignedToTypeId'] = nextTaskAssignedToTypeId;
    _data['NextTaskAssignedToTypeCode'] = nextTaskAssignedToTypeCode;
    _data['NextTaskAssignedToUserId'] = nextTaskAssignedToUserId;
    _data['NextTaskAssignedToTeamId'] = nextTaskAssignedToTeamId;
    _data['NextTaskAssignedToTeamUserId'] = nextTaskAssignedToTeamUserId;
    _data['NextTaskAssignedToHierarchyMasterId'] =
        nextTaskAssignedToHierarchyMasterId;
    _data['NextTaskAssignedToHierarchyMasterLevelId'] =
        nextTaskAssignedToHierarchyMasterLevelId;
    _data['IsReturned'] = isReturned;
    _data['IsReopened'] = isReopened;
    _data['EnableDynamicStepTaskSelection'] = enableDynamicStepTaskSelection;
    _data['NextStepTaskComponentId'] = nextStepTaskComponentId;
    _data['Subject'] = subject;
    _data['NotificationSubject'] = notificationSubject;
    _data['Description'] = description;
    _data['EnableIndexPage'] = enableIndexPage;
    _data['EnableTaskNumberManual'] = enableTaskNumberManual;
    _data['EnableSaveAsDraft'] = enableSaveAsDraft;
    _data['SaveAsDraftText'] = saveAsDraftText;
    _data['SaveAsDraftCss'] = saveAsDraftCss;
    _data['SubmitButtonText'] = submitButtonText;
    _data['SubmitButtonCss'] = submitButtonCss;
    _data['SLA'] = sla;
    _data['AllowSLAChange'] = allowSLAChange;
    _data['CompleteButtonText'] = completeButtonText;
    _data['IsCompleteReasonRequired'] = isCompleteReasonRequired;
    _data['CompleteButtonCss'] = completeButtonCss;
    _data['PriorityId'] = priorityId;
    _data['Priority'] = priority;
    _data['EnableRejectButton'] = enableRejectButton;
    _data['IsRejectReasonRequired'] = isRejectReasonRequired;
    _data['RejectButtonText'] = rejectButtonText;
    _data['RejectButtonCss'] = rejectButtonCss;
    _data['EnableBackButton'] = enableBackButton;
    _data['BackButtonText'] = backButtonText;
    _data['BackButtonCss'] = backButtonCss;
    _data['EnableAttachment'] = enableAttachment;
    _data['EnableComment'] = enableComment;
    _data['TemplateId'] = templateId;
    _data['Template'] = template;
    _data['UdfTemplateId'] = udfTemplateId;
    _data['UdfTemplate'] = udfTemplate;
    _data['TaskIndexPageTemplateId'] = taskIndexPageTemplateId;
    _data['TaskIndexPageTemplate'] = taskIndexPageTemplate;
    _data['CreateReturnType'] = createReturnType;
    _data['EditReturnType'] = editReturnType;
    _data['PreScript'] = preScript;
    _data['PostScript'] = postScript;
    _data['IconFileId'] = iconFileId;
    _data['TemplateColor'] = templateColor;
    _data['BannerFileId'] = bannerFileId;
    _data['BackgroundFileId'] = backgroundFileId;
    _data['SubjectText'] = subjectText;
    _data['OwnerUserText'] = ownerUserText;
    _data['RequestedByUserText'] = requestedByUserText;
    _data['AssignedToUserText'] = assignedToUserText;
    _data['EnableCancelButton'] = enableCancelButton;
    _data['IsCancelReasonRequired'] = isCancelReasonRequired;
    _data['CancelButtonText'] = cancelButtonText;
    _data['CancelButtonCss'] = cancelButtonCss;
    _data['EnableTimeEntry'] = enableTimeEntry;
    _data['TaskTemplateType'] = taskTemplateType;
    _data['TaskNoText'] = taskNoText;
    _data['DescriptionText'] = descriptionText;
    _data['HideHeader'] = hideHeader;
    _data['HideSubject'] = hideSubject;
    _data['HideDescription'] = hideDescription;
    _data['HideStartDate'] = hideStartDate;
    _data['HideDueDate'] = hideDueDate;
    _data['HideSLA'] = hideSLA;
    _data['HidePriority'] = hidePriority;
    _data['IsSubjectMandatory'] = isSubjectMandatory;
    _data['IsSubjectUnique'] = isSubjectUnique;
    _data['IsDescriptionMandatory'] = isDescriptionMandatory;
    _data['HideToolbar'] = hideToolbar;
    _data['HideBanner'] = hideBanner;
    _data['HideOwner'] = hideOwner;
    _data['AllowPastStartDate'] = allowPastStartDate;
    _data['EnablePrintButton'] = enablePrintButton;
    _data['PrintButtonText'] = printButtonText;
    _data['EnableEmail'] = enableEmail;
    _data['EnableDataPermission'] = enableDataPermission;
    _data['DataPermissionColumnId'] = dataPermissionColumnId;
    _data['NumberGenerationType'] = numberGenerationType;
    _data['IsNumberNotMandatory'] = isNumberNotMandatory;
    _data['EnableLegalEntityFilter'] = enableLegalEntityFilter;
    _data['EnablePermission'] = enablePermission;
    _data['EnableInlineComment'] = enableInlineComment;
    _data['EmailCopyTemplateCode'] = emailCopyTemplateCode;
    _data['FormType'] = formType;
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
