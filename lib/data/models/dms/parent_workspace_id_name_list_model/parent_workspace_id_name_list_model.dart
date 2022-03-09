class DMSParentWorkspaceIdNameListModel {
  String? id;
  String? name;
  bool? hasChildren;
  List<Children>? children;

  DMSParentWorkspaceIdNameListModel({
    this.id,
    this.name,
    this.hasChildren,
    this.children,
  });

  DMSParentWorkspaceIdNameListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    hasChildren = json['hasChildren'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['hasChildren'] = this.hasChildren;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int? ntsNoteOwnerType;
  dynamic noteStatusCode;
  dynamic templateMasterCode;
  dynamic moduleCode;
  bool? isDraftButtonVisible;
  bool? isSubmitButtonVisible;
  dynamic subjectLabelName;
  bool? isSubjectRequired;
  bool? isSubjectEditable;
  dynamic descriptionLabelName;
  bool? isDescriptionRequired;
  bool? isDescriptionEditable;
  dynamic hideDateAndSLA;
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
  dynamic draftButtonText;
  dynamic saveButtonText;
  dynamic completeButtonText;
  dynamic rejectButtonText;
  dynamic returnButtonText;
  dynamic reopenButtonText;
  dynamic delegateButtonText;
  dynamic cancelButtonText;
  dynamic backButtonText;
  dynamic createNewVersionButtonText;
  dynamic saveChangesButtonText;
  dynamic saveNewVersionButtonText;
  bool? draftButton;
  bool? createNewVersionButton;
  bool? saveNewVersionButton;
  dynamic moduleName;
  dynamic moduleId;
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
  bool? isNoteTeamOwner;
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
  dynamic closeButtonText;
  dynamic templateAction;
  dynamic activeUserId;
  dynamic displayMode;
  dynamic templateUserType;
  bool? canEditHeader;
  dynamic cancelEditButtonText;
  dynamic teamMembers;
  dynamic assigneeDisplayName;
  dynamic noteOwnerFirstLetter;
  dynamic ownerUserName;
  dynamic assigneeUserName;
  dynamic requestedByUserName;
  dynamic createdByUserName;
  dynamic lastUpdatedByUserName;
  dynamic noteStatusName;
  String? statusClass;
  String? expiryDateDisplay;
  dynamic stepTemplateIds;
  dynamic displayDueDate;
  dynamic serviceDetailsHeight;
  dynamic homeType;
  dynamic otherWalls;
  dynamic positionId;
  dynamic departmentId;
  dynamic departmentName;
  int? sRequestOverdue;
  int? sRequestPending;
  int? tAssignPending;
  int? tAssignOverdue;
  int? nActive;
  dynamic base64Img;
  dynamic ownerDisplayName;
  dynamic isUserGuide;
  dynamic isPrivate;
  dynamic targetName;
  dynamic sourcePost;
  dynamic action;
  dynamic likeStatus;
  int? likesUserCount;
  int? iLiked;
  int? commentsCount;
  int? shareCount;
  dynamic messageComment;
  dynamic noteId;
  dynamic sourceName;
  dynamic userPhotoId;
  bool? isOwner;
  String? formattedCreateDate;
  String? formattedStartDate;
  dynamic attachmentList;
  dynamic fileId;
  dynamic fileExtension;
  String? noteNo;
  String? noteSubject;
  String? noteDescription;
  String? templateCode;
  String? startDate;
  dynamic expiryDate;
  dynamic reminderDate;
  dynamic completedDate;
  String? noteStatusId;
  dynamic noteStatus;
  String? notePriorityId;
  dynamic notePriority;
  String? templateId;
  dynamic template;
  String? noteTemplateId;
  dynamic noteTemplate;
  dynamic noteOwnerTypeId;
  dynamic noteOwnerType;
  String? requestedByUserId;
  dynamic requestedByUser;
  String? ownerUserId;
  dynamic ownerUser;
  dynamic parentNoteId;
  dynamic parentNote;
  dynamic parentTaskId;
  dynamic parentTask;
  dynamic parentServiceId;
  dynamic parentService;
  String? noteActionId;
  dynamic noteAction;
  dynamic canceledDate;
  dynamic cancelReason;
  dynamic completeReason;
  dynamic userRating;
  dynamic closeComment;
  dynamic closedDate;
  bool? isVersioning;
  dynamic referenceId;
  int? referenceType;
  bool? isArchived;
  dynamic lockStatus;
  dynamic lastLockedDate;
  dynamic disablePermissionInheritance;
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

  Children({
    this.ntsNoteOwnerType,
    this.noteStatusCode,
    this.templateMasterCode,
    this.moduleCode,
    this.isDraftButtonVisible,
    this.isSubmitButtonVisible,
    this.subjectLabelName,
    this.isSubjectRequired,
    this.isSubjectEditable,
    this.descriptionLabelName,
    this.isDescriptionRequired,
    this.isDescriptionEditable,
    this.hideDateAndSLA,
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
    this.moduleName,
    this.moduleId,
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
    this.isNoteTeamOwner,
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
    this.noteOwnerFirstLetter,
    this.ownerUserName,
    this.assigneeUserName,
    this.requestedByUserName,
    this.createdByUserName,
    this.lastUpdatedByUserName,
    this.noteStatusName,
    this.statusClass,
    this.expiryDateDisplay,
    this.stepTemplateIds,
    this.displayDueDate,
    this.serviceDetailsHeight,
    this.homeType,
    this.otherWalls,
    this.positionId,
    this.departmentId,
    this.departmentName,
    this.sRequestOverdue,
    this.sRequestPending,
    this.tAssignPending,
    this.tAssignOverdue,
    this.nActive,
    this.base64Img,
    this.ownerDisplayName,
    this.isUserGuide,
    this.isPrivate,
    this.targetName,
    this.sourcePost,
    this.action,
    this.likeStatus,
    this.likesUserCount,
    this.iLiked,
    this.commentsCount,
    this.shareCount,
    this.messageComment,
    this.noteId,
    this.sourceName,
    this.userPhotoId,
    this.isOwner,
    this.formattedCreateDate,
    this.formattedStartDate,
    this.attachmentList,
    this.fileId,
    this.fileExtension,
    this.noteNo,
    this.noteSubject,
    this.noteDescription,
    this.templateCode,
    this.startDate,
    this.expiryDate,
    this.reminderDate,
    this.completedDate,
    this.noteStatusId,
    this.noteStatus,
    this.notePriorityId,
    this.notePriority,
    this.templateId,
    this.template,
    this.noteTemplateId,
    this.noteTemplate,
    this.noteOwnerTypeId,
    this.noteOwnerType,
    this.requestedByUserId,
    this.requestedByUser,
    this.ownerUserId,
    this.ownerUser,
    this.parentNoteId,
    this.parentNote,
    this.parentTaskId,
    this.parentTask,
    this.parentServiceId,
    this.parentService,
    this.noteActionId,
    this.noteAction,
    this.canceledDate,
    this.cancelReason,
    this.completeReason,
    this.userRating,
    this.closeComment,
    this.closedDate,
    this.isVersioning,
    this.referenceId,
    this.referenceType,
    this.isArchived,
    this.lockStatus,
    this.lastLockedDate,
    this.disablePermissionInheritance,
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

  Children.fromJson(Map<String, dynamic> json) {
    ntsNoteOwnerType = json['NtsNoteOwnerType'];
    noteStatusCode = json['NoteStatusCode'];
    templateMasterCode = json['TemplateMasterCode'];
    moduleCode = json['ModuleCode'];
    isDraftButtonVisible = json['IsDraftButtonVisible'];
    isSubmitButtonVisible = json['IsSubmitButtonVisible'];
    subjectLabelName = json['SubjectLabelName'];
    isSubjectRequired = json['IsSubjectRequired'];
    isSubjectEditable = json['IsSubjectEditable'];
    descriptionLabelName = json['DescriptionLabelName'];
    isDescriptionRequired = json['IsDescriptionRequired'];
    isDescriptionEditable = json['IsDescriptionEditable'];
    hideDateAndSLA = json['HideDateAndSLA'];
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
    textBoxDisplay4 = json['TextBoxDisplay4'];
    textBoxDisplayType4 = json['TextBoxDisplayType4'];
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
    textBoxDisplay8 = json['TextBoxDisplay8'];
    textBoxDisplayType8 = json['TextBoxDisplayType8'];
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
    moduleName = json['ModuleName'];
    moduleId = json['ModuleId'];
    module = json['Module'];
    saveButton = json['SaveButton'];
    canViewVersions = json['CanViewVersions'];
    displayActionButtonBelow = json['DisplayActionButtonBelow'];
    saveChangesButton = json['SaveChangesButton'];
    completeButton = json['CompleteButton'];
    isCompleteReasonRequired = json['IsCompleteReasonRequired'];
    rejectButton = json['RejectButton'];
    notApplicableButton = json['NotApplicableButton'];
    isLockVisible = json['IsLockVisible'];
    isReleaseVisible = json['IsReleaseVisible'];
    isNoteTeamOwner = json['IsNoteTeamOwner'];
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
    teamMembers = json['TeamMembers'];
    assigneeDisplayName = json['AssigneeDisplayName'];
    noteOwnerFirstLetter = json['NoteOwnerFirstLetter'];
    ownerUserName = json['OwnerUserName'];
    assigneeUserName = json['AssigneeUserName'];
    requestedByUserName = json['RequestedByUserName'];
    createdByUserName = json['CreatedByUserName'];
    lastUpdatedByUserName = json['LastUpdatedByUserName'];
    noteStatusName = json['NoteStatusName'];
    statusClass = json['StatusClass'];
    expiryDateDisplay = json['ExpiryDateDisplay'];
    stepTemplateIds = json['StepTemplateIds'];
    displayDueDate = json['DisplayDueDate'];
    serviceDetailsHeight = json['ServiceDetailsHeight'];
    homeType = json['HomeType'];
    otherWalls = json['OtherWalls'];
    positionId = json['PositionId'];
    departmentId = json['DepartmentId'];
    departmentName = json['DepartmentName'];
    sRequestOverdue = json['S_RequestOverdue'];
    sRequestPending = json['S_RequestPending'];
    tAssignPending = json['T_AssignPending'];
    tAssignOverdue = json['T_AssignOverdue'];
    nActive = json['N_Active'];
    base64Img = json['base64Img'];
    ownerDisplayName = json['OwnerDisplayName'];
    isUserGuide = json['IsUserGuide'];
    isPrivate = json['IsPrivate'];
    targetName = json['TargetName'];
    sourcePost = json['SourcePost'];
    action = json['Action'];
    likeStatus = json['LikeStatus'];
    likesUserCount = json['LikesUserCount'];
    iLiked = json['ILiked'];
    commentsCount = json['CommentsCount'];
    shareCount = json['ShareCount'];
    messageComment = json['MessageComment'];
    noteId = json['NoteId'];
    sourceName = json['SourceName'];
    userPhotoId = json['UserPhotoId'];
    isOwner = json['IsOwner'];
    formattedCreateDate = json['FormattedCreateDate'];
    formattedStartDate = json['FormattedStartDate'];
    attachmentList = json['AttachmentList'];
    fileId = json['FileId'];
    fileExtension = json['FileExtension'];
    noteNo = json['NoteNo'];
    noteSubject = json['NoteSubject'];
    noteDescription = json['NoteDescription'];
    templateCode = json['TemplateCode'];
    startDate = json['StartDate'];
    expiryDate = json['ExpiryDate'];
    reminderDate = json['ReminderDate'];
    completedDate = json['CompletedDate'];
    noteStatusId = json['NoteStatusId'];
    noteStatus = json['NoteStatus'];
    notePriorityId = json['NotePriorityId'];
    notePriority = json['NotePriority'];
    templateId = json['TemplateId'];
    template = json['Template'];
    noteTemplateId = json['NoteTemplateId'];
    noteTemplate = json['NoteTemplate'];
    noteOwnerTypeId = json['NoteOwnerTypeId'];
    noteOwnerType = json['NoteOwnerType'];
    requestedByUserId = json['RequestedByUserId'];
    requestedByUser = json['RequestedByUser'];
    ownerUserId = json['OwnerUserId'];
    ownerUser = json['OwnerUser'];
    parentNoteId = json['ParentNoteId'];
    parentNote = json['ParentNote'];
    parentTaskId = json['ParentTaskId'];
    parentTask = json['ParentTask'];
    parentServiceId = json['ParentServiceId'];
    parentService = json['ParentService'];
    noteActionId = json['NoteActionId'];
    noteAction = json['NoteAction'];
    canceledDate = json['CanceledDate'];
    cancelReason = json['CancelReason'];
    completeReason = json['CompleteReason'];
    userRating = json['UserRating'];
    closeComment = json['CloseComment'];
    closedDate = json['ClosedDate'];
    isVersioning = json['IsVersioning'];
    referenceId = json['ReferenceId'];
    referenceType = json['ReferenceType'];
    isArchived = json['IsArchived'];
    lockStatus = json['LockStatus'];
    lastLockedDate = json['LastLockedDate'];
    disablePermissionInheritance = json['DisablePermissionInheritance'];
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
    data['NtsNoteOwnerType'] = this.ntsNoteOwnerType;
    data['NoteStatusCode'] = this.noteStatusCode;
    data['TemplateMasterCode'] = this.templateMasterCode;
    data['ModuleCode'] = this.moduleCode;
    data['IsDraftButtonVisible'] = this.isDraftButtonVisible;
    data['IsSubmitButtonVisible'] = this.isSubmitButtonVisible;
    data['SubjectLabelName'] = this.subjectLabelName;
    data['IsSubjectRequired'] = this.isSubjectRequired;
    data['IsSubjectEditable'] = this.isSubjectEditable;
    data['DescriptionLabelName'] = this.descriptionLabelName;
    data['IsDescriptionRequired'] = this.isDescriptionRequired;
    data['IsDescriptionEditable'] = this.isDescriptionEditable;
    data['HideDateAndSLA'] = this.hideDateAndSLA;
    data['TextBoxDisplay1'] = this.textBoxDisplay1;
    data['TextBoxLink1'] = this.textBoxLink1;
    data['TextBoxDisplayType1'] = this.textBoxDisplayType1;
    data['IsRequiredTextBoxDisplay1'] = this.isRequiredTextBoxDisplay1;
    data['IsAssigneeAvailableTextBoxDisplay1'] =
        this.isAssigneeAvailableTextBoxDisplay1;
    data['IsDropdownDisplay1'] = this.isDropdownDisplay1;
    data['DropdownValueMethod1'] = this.dropdownValueMethod1;
    data['IsRequiredDropdownDisplay1'] = this.isRequiredDropdownDisplay1;
    data['IsAssigneeAvailableDropdownDisplay1'] =
        this.isAssigneeAvailableDropdownDisplay1;
    data['TextBoxDisplay2'] = this.textBoxDisplay2;
    data['TextBoxDisplayType2'] = this.textBoxDisplayType2;
    data['IsRequiredTextBoxDisplay2'] = this.isRequiredTextBoxDisplay2;
    data['IsAssigneeAvailableTextBoxDisplay2'] =
        this.isAssigneeAvailableTextBoxDisplay2;
    data['IsDropdownDisplay2'] = this.isDropdownDisplay2;
    data['DropdownValueMethod2'] = this.dropdownValueMethod2;
    data['IsRequiredDropdownDisplay2'] = this.isRequiredDropdownDisplay2;
    data['IsAssigneeAvailableDropdownDisplay2'] =
        this.isAssigneeAvailableDropdownDisplay2;
    data['TextBoxDisplay3'] = this.textBoxDisplay3;
    data['TextBoxDisplayType3'] = this.textBoxDisplayType3;
    data['IsRequiredTextBoxDisplay3'] = this.isRequiredTextBoxDisplay3;
    data['IsAssigneeAvailableTextBoxDisplay3'] =
        this.isAssigneeAvailableTextBoxDisplay3;
    data['IsDropdownDisplay3'] = this.isDropdownDisplay3;
    data['DropdownValueMethod3'] = this.dropdownValueMethod3;
    data['IsRequiredDropdownDisplay3'] = this.isRequiredDropdownDisplay3;
    data['IsAssigneeAvailableDropdownDisplay3'] =
        this.isAssigneeAvailableDropdownDisplay3;
    data['TextBoxDisplay4'] = this.textBoxDisplay4;
    data['TextBoxDisplayType4'] = this.textBoxDisplayType4;
    data['IsRequiredTextBoxDisplay4'] = this.isRequiredTextBoxDisplay4;
    data['IsAssigneeAvailableTextBoxDisplay4'] =
        this.isAssigneeAvailableTextBoxDisplay4;
    data['IsDropdownDisplay4'] = this.isDropdownDisplay4;
    data['DropdownValueMethod4'] = this.dropdownValueMethod4;
    data['IsRequiredDropdownDisplay4'] = this.isRequiredDropdownDisplay4;
    data['IsAssigneeAvailableDropdownDisplay4'] =
        this.isAssigneeAvailableDropdownDisplay4;
    data['TextBoxDisplay5'] = this.textBoxDisplay5;
    data['TextBoxDisplayType5'] = this.textBoxDisplayType5;
    data['IsRequiredTextBoxDisplay5'] = this.isRequiredTextBoxDisplay5;
    data['IsAssigneeAvailableTextBoxDisplay5'] =
        this.isAssigneeAvailableTextBoxDisplay5;
    data['IsDropdownDisplay5'] = this.isDropdownDisplay5;
    data['DropdownValueMethod5'] = this.dropdownValueMethod5;
    data['IsRequiredDropdownDisplay5'] = this.isRequiredDropdownDisplay5;
    data['IsAssigneeAvailableDropdownDisplay5'] =
        this.isAssigneeAvailableDropdownDisplay5;
    data['TextBoxDisplay6'] = this.textBoxDisplay6;
    data['TextBoxDisplayType6'] = this.textBoxDisplayType6;
    data['IsRequiredTextBoxDisplay6'] = this.isRequiredTextBoxDisplay6;
    data['IsAssigneeAvailableTextBoxDisplay6'] =
        this.isAssigneeAvailableTextBoxDisplay6;
    data['IsDropdownDisplay6'] = this.isDropdownDisplay6;
    data['DropdownValueMethod6'] = this.dropdownValueMethod6;
    data['IsRequiredDropdownDisplay6'] = this.isRequiredDropdownDisplay6;
    data['IsAssigneeAvailableDropdownDisplay6'] =
        this.isAssigneeAvailableDropdownDisplay6;
    data['TextBoxDisplay7'] = this.textBoxDisplay7;
    data['TextBoxDisplayType7'] = this.textBoxDisplayType7;
    data['IsRequiredTextBoxDisplay7'] = this.isRequiredTextBoxDisplay7;
    data['IsAssigneeAvailableTextBoxDisplay7'] =
        this.isAssigneeAvailableTextBoxDisplay7;
    data['IsDropdownDisplay7'] = this.isDropdownDisplay7;
    data['DropdownValueMethod7'] = this.dropdownValueMethod7;
    data['IsRequiredDropdownDisplay7'] = this.isRequiredDropdownDisplay7;
    data['IsAssigneeAvailableDropdownDisplay7'] =
        this.isAssigneeAvailableDropdownDisplay7;
    data['TextBoxDisplay8'] = this.textBoxDisplay8;
    data['TextBoxDisplayType8'] = this.textBoxDisplayType8;
    data['IsRequiredTextBoxDisplay8'] = this.isRequiredTextBoxDisplay8;
    data['IsAssigneeAvailableTextBoxDisplay8'] =
        this.isAssigneeAvailableTextBoxDisplay8;
    data['IsDropdownDisplay8'] = this.isDropdownDisplay8;
    data['DropdownValueMethod8'] = this.dropdownValueMethod8;
    data['IsRequiredDropdownDisplay8'] = this.isRequiredDropdownDisplay8;
    data['IsAssigneeAvailableDropdownDisplay8'] =
        this.isAssigneeAvailableDropdownDisplay8;
    data['TextBoxDisplay9'] = this.textBoxDisplay9;
    data['TextBoxDisplayType9'] = this.textBoxDisplayType9;
    data['IsRequiredTextBoxDisplay9'] = this.isRequiredTextBoxDisplay9;
    data['IsAssigneeAvailableTextBoxDisplay9'] =
        this.isAssigneeAvailableTextBoxDisplay9;
    data['IsDropdownDisplay9'] = this.isDropdownDisplay9;
    data['DropdownValueMethod9'] = this.dropdownValueMethod9;
    data['IsRequiredDropdownDisplay9'] = this.isRequiredDropdownDisplay9;
    data['IsAssigneeAvailableDropdownDisplay9'] =
        this.isAssigneeAvailableDropdownDisplay9;
    data['TextBoxDisplay10'] = this.textBoxDisplay10;
    data['TextBoxDisplayType10'] = this.textBoxDisplayType10;
    data['IsRequiredTextBoxDisplay10'] = this.isRequiredTextBoxDisplay10;
    data['IsAssigneeAvailableTextBoxDisplay10'] =
        this.isAssigneeAvailableTextBoxDisplay10;
    data['IsDropdownDisplay10'] = this.isDropdownDisplay10;
    data['DropdownValueMethod10'] = this.dropdownValueMethod10;
    data['IsRequiredDropdownDisplay10'] = this.isRequiredDropdownDisplay10;
    data['IsAssigneeAvailableDropdownDisplay10'] =
        this.isAssigneeAvailableDropdownDisplay10;
    data['DraftButtonText'] = this.draftButtonText;
    data['SaveButtonText'] = this.saveButtonText;
    data['CompleteButtonText'] = this.completeButtonText;
    data['RejectButtonText'] = this.rejectButtonText;
    data['ReturnButtonText'] = this.returnButtonText;
    data['ReopenButtonText'] = this.reopenButtonText;
    data['DelegateButtonText'] = this.delegateButtonText;
    data['CancelButtonText'] = this.cancelButtonText;
    data['BackButtonText'] = this.backButtonText;
    data['CreateNewVersionButtonText'] = this.createNewVersionButtonText;
    data['SaveChangesButtonText'] = this.saveChangesButtonText;
    data['SaveNewVersionButtonText'] = this.saveNewVersionButtonText;
    data['DraftButton'] = this.draftButton;
    data['CreateNewVersionButton'] = this.createNewVersionButton;
    data['SaveNewVersionButton'] = this.saveNewVersionButton;
    data['ModuleName'] = this.moduleName;
    data['ModuleId'] = this.moduleId;
    data['Module'] = this.module;
    data['SaveButton'] = this.saveButton;
    data['CanViewVersions'] = this.canViewVersions;
    data['DisplayActionButtonBelow'] = this.displayActionButtonBelow;
    data['SaveChangesButton'] = this.saveChangesButton;
    data['CompleteButton'] = this.completeButton;
    data['IsCompleteReasonRequired'] = this.isCompleteReasonRequired;
    data['RejectButton'] = this.rejectButton;
    data['NotApplicableButton'] = this.notApplicableButton;
    data['IsLockVisible'] = this.isLockVisible;
    data['IsReleaseVisible'] = this.isReleaseVisible;
    data['IsNoteTeamOwner'] = this.isNoteTeamOwner;
    data['IsRejectionReasonRequired'] = this.isRejectionReasonRequired;
    data['ReturnButton'] = this.returnButton;
    data['ReopenButton'] = this.reopenButton;
    data['IsReopenReasonRequired'] = this.isReopenReasonRequired;
    data['IsReturnReasonRequired'] = this.isReturnReasonRequired;
    data['DelegateButton'] = this.delegateButton;
    data['IsDelegateReasonRequired'] = this.isDelegateReasonRequired;
    data['CancelButton'] = this.cancelButton;
    data['IsCancelReasonRequired'] = this.isCancelReasonRequired;
    data['BackButton'] = this.backButton;
    data['CloseButton'] = this.closeButton;
    data['CloseButtonText'] = this.closeButtonText;
    data['TemplateAction'] = this.templateAction;
    data['ActiveUserId'] = this.activeUserId;
    data['DisplayMode'] = this.displayMode;
    data['TemplateUserType'] = this.templateUserType;
    data['CanEditHeader'] = this.canEditHeader;
    data['CancelEditButtonText'] = this.cancelEditButtonText;
    data['TeamMembers'] = this.teamMembers;
    data['AssigneeDisplayName'] = this.assigneeDisplayName;
    data['NoteOwnerFirstLetter'] = this.noteOwnerFirstLetter;
    data['OwnerUserName'] = this.ownerUserName;
    data['AssigneeUserName'] = this.assigneeUserName;
    data['RequestedByUserName'] = this.requestedByUserName;
    data['CreatedByUserName'] = this.createdByUserName;
    data['LastUpdatedByUserName'] = this.lastUpdatedByUserName;
    data['NoteStatusName'] = this.noteStatusName;
    data['StatusClass'] = this.statusClass;
    data['ExpiryDateDisplay'] = this.expiryDateDisplay;
    data['StepTemplateIds'] = this.stepTemplateIds;
    data['DisplayDueDate'] = this.displayDueDate;
    data['ServiceDetailsHeight'] = this.serviceDetailsHeight;
    data['HomeType'] = this.homeType;
    data['OtherWalls'] = this.otherWalls;
    data['PositionId'] = this.positionId;
    data['DepartmentId'] = this.departmentId;
    data['DepartmentName'] = this.departmentName;
    data['S_RequestOverdue'] = this.sRequestOverdue;
    data['S_RequestPending'] = this.sRequestPending;
    data['T_AssignPending'] = this.tAssignPending;
    data['T_AssignOverdue'] = this.tAssignOverdue;
    data['N_Active'] = this.nActive;
    data['base64Img'] = this.base64Img;
    data['OwnerDisplayName'] = this.ownerDisplayName;
    data['IsUserGuide'] = this.isUserGuide;
    data['IsPrivate'] = this.isPrivate;
    data['TargetName'] = this.targetName;
    data['SourcePost'] = this.sourcePost;
    data['Action'] = this.action;
    data['LikeStatus'] = this.likeStatus;
    data['LikesUserCount'] = this.likesUserCount;
    data['ILiked'] = this.iLiked;
    data['CommentsCount'] = this.commentsCount;
    data['ShareCount'] = this.shareCount;
    data['MessageComment'] = this.messageComment;
    data['NoteId'] = this.noteId;
    data['SourceName'] = this.sourceName;
    data['UserPhotoId'] = this.userPhotoId;
    data['IsOwner'] = this.isOwner;
    data['FormattedCreateDate'] = this.formattedCreateDate;
    data['FormattedStartDate'] = this.formattedStartDate;
    data['AttachmentList'] = this.attachmentList;
    data['FileId'] = this.fileId;
    data['FileExtension'] = this.fileExtension;
    data['NoteNo'] = this.noteNo;
    data['NoteSubject'] = this.noteSubject;
    data['NoteDescription'] = this.noteDescription;
    data['TemplateCode'] = this.templateCode;
    data['StartDate'] = this.startDate;
    data['ExpiryDate'] = this.expiryDate;
    data['ReminderDate'] = this.reminderDate;
    data['CompletedDate'] = this.completedDate;
    data['NoteStatusId'] = this.noteStatusId;
    data['NoteStatus'] = this.noteStatus;
    data['NotePriorityId'] = this.notePriorityId;
    data['NotePriority'] = this.notePriority;
    data['TemplateId'] = this.templateId;
    data['Template'] = this.template;
    data['NoteTemplateId'] = this.noteTemplateId;
    data['NoteTemplate'] = this.noteTemplate;
    data['NoteOwnerTypeId'] = this.noteOwnerTypeId;
    data['NoteOwnerType'] = this.noteOwnerType;
    data['RequestedByUserId'] = this.requestedByUserId;
    data['RequestedByUser'] = this.requestedByUser;
    data['OwnerUserId'] = this.ownerUserId;
    data['OwnerUser'] = this.ownerUser;
    data['ParentNoteId'] = this.parentNoteId;
    data['ParentNote'] = this.parentNote;
    data['ParentTaskId'] = this.parentTaskId;
    data['ParentTask'] = this.parentTask;
    data['ParentServiceId'] = this.parentServiceId;
    data['ParentService'] = this.parentService;
    data['NoteActionId'] = this.noteActionId;
    data['NoteAction'] = this.noteAction;
    data['CanceledDate'] = this.canceledDate;
    data['CancelReason'] = this.cancelReason;
    data['CompleteReason'] = this.completeReason;
    data['UserRating'] = this.userRating;
    data['CloseComment'] = this.closeComment;
    data['ClosedDate'] = this.closedDate;
    data['IsVersioning'] = this.isVersioning;
    data['ReferenceId'] = this.referenceId;
    data['ReferenceType'] = this.referenceType;
    data['IsArchived'] = this.isArchived;
    data['LockStatus'] = this.lockStatus;
    data['LastLockedDate'] = this.lastLockedDate;
    data['DisablePermissionInheritance'] = this.disablePermissionInheritance;
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
