import 'dart:convert';

NoteListModel noteListModelFromJson(String str) =>
    NoteListModel.fromJson(json.decode(str));

String noteListModelToJson(NoteListModel data) => json.encode(data.toJson());

class NoteListModel {
  NoteListModel({
    this.ntsNoteOwnerType,
    this.noteStatusCode,
    this.templateMasterCode,
    this.isDraftButtonVisible,
    this.isSubmitButtonVisible,
    this.subjectLabelName,
    this.isSubjectRequired,
    this.isSubjectEditable,
    this.descriptionLabelName,
    this.isDescriptionRequired,
    this.isDescriptionEditable,
    this.hideDateAndSla,
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

  int ntsNoteOwnerType;
  String noteStatusCode;
  String templateMasterCode;
  bool isDraftButtonVisible;
  bool isSubmitButtonVisible;
  dynamic subjectLabelName;
  bool isSubjectRequired;
  bool isSubjectEditable;
  dynamic descriptionLabelName;
  bool isDescriptionRequired;
  bool isDescriptionEditable;
  dynamic hideDateAndSla;
  dynamic textBoxDisplay1;
  dynamic textBoxLink1;
  dynamic textBoxDisplayType1;
  bool isRequiredTextBoxDisplay1;
  bool isAssigneeAvailableTextBoxDisplay1;
  dynamic isDropdownDisplay1;
  dynamic dropdownValueMethod1;
  bool isRequiredDropdownDisplay1;
  bool isAssigneeAvailableDropdownDisplay1;
  dynamic textBoxDisplay2;
  dynamic textBoxDisplayType2;
  bool isRequiredTextBoxDisplay2;
  bool isAssigneeAvailableTextBoxDisplay2;
  dynamic isDropdownDisplay2;
  dynamic dropdownValueMethod2;
  bool isRequiredDropdownDisplay2;
  bool isAssigneeAvailableDropdownDisplay2;
  dynamic textBoxDisplay3;
  dynamic textBoxDisplayType3;
  bool isRequiredTextBoxDisplay3;
  bool isAssigneeAvailableTextBoxDisplay3;
  dynamic isDropdownDisplay3;
  dynamic dropdownValueMethod3;
  bool isRequiredDropdownDisplay3;
  bool isAssigneeAvailableDropdownDisplay3;
  dynamic textBoxDisplay4;
  dynamic textBoxDisplayType4;
  bool isRequiredTextBoxDisplay4;
  bool isAssigneeAvailableTextBoxDisplay4;
  dynamic isDropdownDisplay4;
  dynamic dropdownValueMethod4;
  bool isRequiredDropdownDisplay4;
  bool isAssigneeAvailableDropdownDisplay4;
  dynamic textBoxDisplay5;
  dynamic textBoxDisplayType5;
  bool isRequiredTextBoxDisplay5;
  bool isAssigneeAvailableTextBoxDisplay5;
  dynamic isDropdownDisplay5;
  dynamic dropdownValueMethod5;
  bool isRequiredDropdownDisplay5;
  bool isAssigneeAvailableDropdownDisplay5;
  dynamic textBoxDisplay6;
  dynamic textBoxDisplayType6;
  bool isRequiredTextBoxDisplay6;
  bool isAssigneeAvailableTextBoxDisplay6;
  dynamic isDropdownDisplay6;
  dynamic dropdownValueMethod6;
  bool isRequiredDropdownDisplay6;
  bool isAssigneeAvailableDropdownDisplay6;
  dynamic textBoxDisplay7;
  dynamic textBoxDisplayType7;
  bool isRequiredTextBoxDisplay7;
  bool isAssigneeAvailableTextBoxDisplay7;
  dynamic isDropdownDisplay7;
  dynamic dropdownValueMethod7;
  bool isRequiredDropdownDisplay7;
  bool isAssigneeAvailableDropdownDisplay7;
  dynamic textBoxDisplay8;
  dynamic textBoxDisplayType8;
  bool isRequiredTextBoxDisplay8;
  bool isAssigneeAvailableTextBoxDisplay8;
  dynamic isDropdownDisplay8;
  dynamic dropdownValueMethod8;
  bool isRequiredDropdownDisplay8;
  bool isAssigneeAvailableDropdownDisplay8;
  dynamic textBoxDisplay9;
  dynamic textBoxDisplayType9;
  bool isRequiredTextBoxDisplay9;
  bool isAssigneeAvailableTextBoxDisplay9;
  dynamic isDropdownDisplay9;
  dynamic dropdownValueMethod9;
  bool isRequiredDropdownDisplay9;
  bool isAssigneeAvailableDropdownDisplay9;
  dynamic textBoxDisplay10;
  dynamic textBoxDisplayType10;
  bool isRequiredTextBoxDisplay10;
  bool isAssigneeAvailableTextBoxDisplay10;
  dynamic isDropdownDisplay10;
  dynamic dropdownValueMethod10;
  bool isRequiredDropdownDisplay10;
  bool isAssigneeAvailableDropdownDisplay10;
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
  bool draftButton;
  bool createNewVersionButton;
  bool saveNewVersionButton;
  dynamic moduleName;
  dynamic moduleId;
  dynamic module;
  bool saveButton;
  bool canViewVersions;
  dynamic displayActionButtonBelow;
  bool saveChangesButton;
  bool completeButton;
  bool isCompleteReasonRequired;
  bool rejectButton;
  bool notApplicableButton;
  bool isLockVisible;
  bool isReleaseVisible;
  bool isNoteTeamOwner;
  bool isRejectionReasonRequired;
  bool returnButton;
  dynamic reopenButton;
  dynamic isReopenReasonRequired;
  bool isReturnReasonRequired;
  bool delegateButton;
  bool isDelegateReasonRequired;
  bool cancelButton;
  bool isCancelReasonRequired;
  bool backButton;
  bool closeButton;
  dynamic closeButtonText;
  dynamic templateAction;
  dynamic activeUserId;
  dynamic displayMode;
  dynamic templateUserType;
  bool canEditHeader;
  dynamic cancelEditButtonText;
  dynamic teamMembers;
  dynamic assigneeDisplayName;
  dynamic noteOwnerFirstLetter;
  String ownerUserName;
  dynamic assigneeUserName;
  String requestedByUserName;
  String createdByUserName;
  String lastUpdatedByUserName;
  String noteStatusName;
  String statusClass;
  String expiryDateDisplay;
  dynamic stepTemplateIds;
  dynamic displayDueDate;
  dynamic serviceDetailsHeight;
  dynamic homeType;
  dynamic otherWalls;
  dynamic positionId;
  dynamic departmentId;
  dynamic departmentName;
  int sRequestOverdue;
  int sRequestPending;
  int tAssignPending;
  int tAssignOverdue;
  int nActive;
  dynamic base64Img;
  dynamic ownerDisplayName;
  dynamic isUserGuide;
  dynamic isPrivate;
  dynamic targetName;
  dynamic sourcePost;
  dynamic action;
  dynamic likeStatus;
  int likesUserCount;
  int iLiked;
  int commentsCount;
  int shareCount;
  dynamic messageComment;
  dynamic noteId;
  dynamic sourceName;
  dynamic userPhotoId;
  bool isOwner;
  String formattedCreateDate;
  String formattedStartDate;
  dynamic attachmentList;
  String noteNo;
  String noteSubject;
  dynamic noteDescription;
  String templateCode;
  DateTime startDate;
  dynamic expiryDate;
  dynamic reminderDate;
  dynamic completedDate;
  String noteStatusId;
  dynamic noteStatus;
  String notePriorityId;
  dynamic notePriority;
  String templateId;
  dynamic template;
  String noteTemplateId;
  dynamic noteTemplate;
  dynamic noteOwnerTypeId;
  dynamic noteOwnerType;
  String requestedByUserId;
  dynamic requestedByUser;
  String ownerUserId;
  dynamic ownerUser;
  dynamic parentNoteId;
  dynamic parentNote;
  dynamic parentTaskId;
  dynamic parentTask;
  dynamic parentServiceId;
  dynamic parentService;
  String noteActionId;
  dynamic noteAction;
  dynamic canceledDate;
  dynamic cancelReason;
  dynamic completeReason;
  dynamic userRating;
  dynamic closeComment;
  dynamic closedDate;
  bool isVersioning;
  String id;
  DateTime createdDate;
  String createdBy;
  DateTime lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  int sequenceOrder;
  String companyId;
  String legalEntityId;
  int dataAction;
  int status;
  int versionNo;
  String portalId;

  factory NoteListModel.fromJson(Map<String, dynamic> json) => NoteListModel(
        ntsNoteOwnerType: json["NtsNoteOwnerType"],
        noteStatusCode: json["NoteStatusCode"],
        templateMasterCode: json["TemplateMasterCode"],
        isDraftButtonVisible: json["IsDraftButtonVisible"],
        isSubmitButtonVisible: json["IsSubmitButtonVisible"],
        subjectLabelName: json["SubjectLabelName"],
        isSubjectRequired: json["IsSubjectRequired"],
        isSubjectEditable: json["IsSubjectEditable"],
        descriptionLabelName: json["DescriptionLabelName"],
        isDescriptionRequired: json["IsDescriptionRequired"],
        isDescriptionEditable: json["IsDescriptionEditable"],
        hideDateAndSla: json["HideDateAndSLA"],
        textBoxDisplay1: json["TextBoxDisplay1"],
        textBoxLink1: json["TextBoxLink1"],
        textBoxDisplayType1: json["TextBoxDisplayType1"],
        isRequiredTextBoxDisplay1: json["IsRequiredTextBoxDisplay1"],
        isAssigneeAvailableTextBoxDisplay1:
            json["IsAssigneeAvailableTextBoxDisplay1"],
        isDropdownDisplay1: json["IsDropdownDisplay1"],
        dropdownValueMethod1: json["DropdownValueMethod1"],
        isRequiredDropdownDisplay1: json["IsRequiredDropdownDisplay1"],
        isAssigneeAvailableDropdownDisplay1:
            json["IsAssigneeAvailableDropdownDisplay1"],
        textBoxDisplay2: json["TextBoxDisplay2"],
        textBoxDisplayType2: json["TextBoxDisplayType2"],
        isRequiredTextBoxDisplay2: json["IsRequiredTextBoxDisplay2"],
        isAssigneeAvailableTextBoxDisplay2:
            json["IsAssigneeAvailableTextBoxDisplay2"],
        isDropdownDisplay2: json["IsDropdownDisplay2"],
        dropdownValueMethod2: json["DropdownValueMethod2"],
        isRequiredDropdownDisplay2: json["IsRequiredDropdownDisplay2"],
        isAssigneeAvailableDropdownDisplay2:
            json["IsAssigneeAvailableDropdownDisplay2"],
        textBoxDisplay3: json["TextBoxDisplay3"],
        textBoxDisplayType3: json["TextBoxDisplayType3"],
        isRequiredTextBoxDisplay3: json["IsRequiredTextBoxDisplay3"],
        isAssigneeAvailableTextBoxDisplay3:
            json["IsAssigneeAvailableTextBoxDisplay3"],
        isDropdownDisplay3: json["IsDropdownDisplay3"],
        dropdownValueMethod3: json["DropdownValueMethod3"],
        isRequiredDropdownDisplay3: json["IsRequiredDropdownDisplay3"],
        isAssigneeAvailableDropdownDisplay3:
            json["IsAssigneeAvailableDropdownDisplay3"],
        textBoxDisplay4: json["TextBoxDisplay4"],
        textBoxDisplayType4: json["TextBoxDisplayType4"],
        isRequiredTextBoxDisplay4: json["IsRequiredTextBoxDisplay4"],
        isAssigneeAvailableTextBoxDisplay4:
            json["IsAssigneeAvailableTextBoxDisplay4"],
        isDropdownDisplay4: json["IsDropdownDisplay4"],
        dropdownValueMethod4: json["DropdownValueMethod4"],
        isRequiredDropdownDisplay4: json["IsRequiredDropdownDisplay4"],
        isAssigneeAvailableDropdownDisplay4:
            json["IsAssigneeAvailableDropdownDisplay4"],
        textBoxDisplay5: json["TextBoxDisplay5"],
        textBoxDisplayType5: json["TextBoxDisplayType5"],
        isRequiredTextBoxDisplay5: json["IsRequiredTextBoxDisplay5"],
        isAssigneeAvailableTextBoxDisplay5:
            json["IsAssigneeAvailableTextBoxDisplay5"],
        isDropdownDisplay5: json["IsDropdownDisplay5"],
        dropdownValueMethod5: json["DropdownValueMethod5"],
        isRequiredDropdownDisplay5: json["IsRequiredDropdownDisplay5"],
        isAssigneeAvailableDropdownDisplay5:
            json["IsAssigneeAvailableDropdownDisplay5"],
        textBoxDisplay6: json["TextBoxDisplay6"],
        textBoxDisplayType6: json["TextBoxDisplayType6"],
        isRequiredTextBoxDisplay6: json["IsRequiredTextBoxDisplay6"],
        isAssigneeAvailableTextBoxDisplay6:
            json["IsAssigneeAvailableTextBoxDisplay6"],
        isDropdownDisplay6: json["IsDropdownDisplay6"],
        dropdownValueMethod6: json["DropdownValueMethod6"],
        isRequiredDropdownDisplay6: json["IsRequiredDropdownDisplay6"],
        isAssigneeAvailableDropdownDisplay6:
            json["IsAssigneeAvailableDropdownDisplay6"],
        textBoxDisplay7: json["TextBoxDisplay7"],
        textBoxDisplayType7: json["TextBoxDisplayType7"],
        isRequiredTextBoxDisplay7: json["IsRequiredTextBoxDisplay7"],
        isAssigneeAvailableTextBoxDisplay7:
            json["IsAssigneeAvailableTextBoxDisplay7"],
        isDropdownDisplay7: json["IsDropdownDisplay7"],
        dropdownValueMethod7: json["DropdownValueMethod7"],
        isRequiredDropdownDisplay7: json["IsRequiredDropdownDisplay7"],
        isAssigneeAvailableDropdownDisplay7:
            json["IsAssigneeAvailableDropdownDisplay7"],
        textBoxDisplay8: json["TextBoxDisplay8"],
        textBoxDisplayType8: json["TextBoxDisplayType8"],
        isRequiredTextBoxDisplay8: json["IsRequiredTextBoxDisplay8"],
        isAssigneeAvailableTextBoxDisplay8:
            json["IsAssigneeAvailableTextBoxDisplay8"],
        isDropdownDisplay8: json["IsDropdownDisplay8"],
        dropdownValueMethod8: json["DropdownValueMethod8"],
        isRequiredDropdownDisplay8: json["IsRequiredDropdownDisplay8"],
        isAssigneeAvailableDropdownDisplay8:
            json["IsAssigneeAvailableDropdownDisplay8"],
        textBoxDisplay9: json["TextBoxDisplay9"],
        textBoxDisplayType9: json["TextBoxDisplayType9"],
        isRequiredTextBoxDisplay9: json["IsRequiredTextBoxDisplay9"],
        isAssigneeAvailableTextBoxDisplay9:
            json["IsAssigneeAvailableTextBoxDisplay9"],
        isDropdownDisplay9: json["IsDropdownDisplay9"],
        dropdownValueMethod9: json["DropdownValueMethod9"],
        isRequiredDropdownDisplay9: json["IsRequiredDropdownDisplay9"],
        isAssigneeAvailableDropdownDisplay9:
            json["IsAssigneeAvailableDropdownDisplay9"],
        textBoxDisplay10: json["TextBoxDisplay10"],
        textBoxDisplayType10: json["TextBoxDisplayType10"],
        isRequiredTextBoxDisplay10: json["IsRequiredTextBoxDisplay10"],
        isAssigneeAvailableTextBoxDisplay10:
            json["IsAssigneeAvailableTextBoxDisplay10"],
        isDropdownDisplay10: json["IsDropdownDisplay10"],
        dropdownValueMethod10: json["DropdownValueMethod10"],
        isRequiredDropdownDisplay10: json["IsRequiredDropdownDisplay10"],
        isAssigneeAvailableDropdownDisplay10:
            json["IsAssigneeAvailableDropdownDisplay10"],
        draftButtonText: json["DraftButtonText"],
        saveButtonText: json["SaveButtonText"],
        completeButtonText: json["CompleteButtonText"],
        rejectButtonText: json["RejectButtonText"],
        returnButtonText: json["ReturnButtonText"],
        reopenButtonText: json["ReopenButtonText"],
        delegateButtonText: json["DelegateButtonText"],
        cancelButtonText: json["CancelButtonText"],
        backButtonText: json["BackButtonText"],
        createNewVersionButtonText: json["CreateNewVersionButtonText"],
        saveChangesButtonText: json["SaveChangesButtonText"],
        saveNewVersionButtonText: json["SaveNewVersionButtonText"],
        draftButton: json["DraftButton"],
        createNewVersionButton: json["CreateNewVersionButton"],
        saveNewVersionButton: json["SaveNewVersionButton"],
        moduleName: json["ModuleName"],
        moduleId: json["ModuleId"],
        module: json["Module"],
        saveButton: json["SaveButton"],
        canViewVersions: json["CanViewVersions"],
        displayActionButtonBelow: json["DisplayActionButtonBelow"],
        saveChangesButton: json["SaveChangesButton"],
        completeButton: json["CompleteButton"],
        isCompleteReasonRequired: json["IsCompleteReasonRequired"],
        rejectButton: json["RejectButton"],
        notApplicableButton: json["NotApplicableButton"],
        isLockVisible: json["IsLockVisible"],
        isReleaseVisible: json["IsReleaseVisible"],
        isNoteTeamOwner: json["IsNoteTeamOwner"],
        isRejectionReasonRequired: json["IsRejectionReasonRequired"],
        returnButton: json["ReturnButton"],
        reopenButton: json["ReopenButton"],
        isReopenReasonRequired: json["IsReopenReasonRequired"],
        isReturnReasonRequired: json["IsReturnReasonRequired"],
        delegateButton: json["DelegateButton"],
        isDelegateReasonRequired: json["IsDelegateReasonRequired"],
        cancelButton: json["CancelButton"],
        isCancelReasonRequired: json["IsCancelReasonRequired"],
        backButton: json["BackButton"],
        closeButton: json["CloseButton"],
        closeButtonText: json["CloseButtonText"],
        templateAction: json["TemplateAction"],
        activeUserId: json["ActiveUserId"],
        displayMode: json["DisplayMode"],
        templateUserType: json["TemplateUserType"],
        canEditHeader: json["CanEditHeader"],
        cancelEditButtonText: json["CancelEditButtonText"],
        teamMembers: json["TeamMembers"],
        assigneeDisplayName: json["AssigneeDisplayName"],
        noteOwnerFirstLetter: json["NoteOwnerFirstLetter"],
        ownerUserName: json["OwnerUserName"],
        assigneeUserName: json["AssigneeUserName"],
        requestedByUserName: json["RequestedByUserName"],
        createdByUserName: json["CreatedByUserName"],
        lastUpdatedByUserName: json["LastUpdatedByUserName"],
        noteStatusName: json["NoteStatusName"],
        statusClass: json["StatusClass"],
        expiryDateDisplay: json["ExpiryDateDisplay"],
        stepTemplateIds: json["StepTemplateIds"],
        displayDueDate: json["DisplayDueDate"],
        serviceDetailsHeight: json["ServiceDetailsHeight"],
        homeType: json["HomeType"],
        otherWalls: json["OtherWalls"],
        positionId: json["PositionId"],
        departmentId: json["DepartmentId"],
        departmentName: json["DepartmentName"],
        sRequestOverdue: json["S_RequestOverdue"],
        sRequestPending: json["S_RequestPending"],
        tAssignPending: json["T_AssignPending"],
        tAssignOverdue: json["T_AssignOverdue"],
        nActive: json["N_Active"],
        base64Img: json["base64Img"],
        ownerDisplayName: json["OwnerDisplayName"],
        isUserGuide: json["IsUserGuide"],
        isPrivate: json["IsPrivate"],
        targetName: json["TargetName"],
        sourcePost: json["SourcePost"],
        action: json["Action"],
        likeStatus: json["LikeStatus"],
        likesUserCount: json["LikesUserCount"],
        iLiked: json["ILiked"],
        commentsCount: json["CommentsCount"],
        shareCount: json["ShareCount"],
        messageComment: json["MessageComment"],
        noteId: json["NoteId"],
        sourceName: json["SourceName"],
        userPhotoId: json["UserPhotoId"],
        isOwner: json["IsOwner"],
        formattedCreateDate: json["FormattedCreateDate"],
        formattedStartDate: json["FormattedStartDate"],
        attachmentList: json["AttachmentList"],
        noteNo: json["NoteNo"],
        noteSubject: json["NoteSubject"],
        noteDescription: json["NoteDescription"],
        templateCode: json["TemplateCode"],
        startDate: DateTime.parse(json["StartDate"]),
        expiryDate: json["ExpiryDate"],
        reminderDate: json["ReminderDate"],
        completedDate: json["CompletedDate"],
        noteStatusId: json["NoteStatusId"],
        noteStatus: json["NoteStatus"],
        notePriorityId: json["NotePriorityId"],
        notePriority: json["NotePriority"],
        templateId: json["TemplateId"],
        template: json["Template"],
        noteTemplateId: json["NoteTemplateId"],
        noteTemplate: json["NoteTemplate"],
        noteOwnerTypeId: json["NoteOwnerTypeId"],
        noteOwnerType: json["NoteOwnerType"],
        requestedByUserId: json["RequestedByUserId"],
        requestedByUser: json["RequestedByUser"],
        ownerUserId: json["OwnerUserId"],
        ownerUser: json["OwnerUser"],
        parentNoteId: json["ParentNoteId"],
        parentNote: json["ParentNote"],
        parentTaskId: json["ParentTaskId"],
        parentTask: json["ParentTask"],
        parentServiceId: json["ParentServiceId"],
        parentService: json["ParentService"],
        noteActionId: json["NoteActionId"],
        noteAction: json["NoteAction"],
        canceledDate: json["CanceledDate"],
        cancelReason: json["CancelReason"],
        completeReason: json["CompleteReason"],
        userRating: json["UserRating"],
        closeComment: json["CloseComment"],
        closedDate: json["ClosedDate"],
        isVersioning: json["IsVersioning"],
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
        "NtsNoteOwnerType": ntsNoteOwnerType,
        "NoteStatusCode": noteStatusCode,
        "TemplateMasterCode": templateMasterCode,
        "IsDraftButtonVisible": isDraftButtonVisible,
        "IsSubmitButtonVisible": isSubmitButtonVisible,
        "SubjectLabelName": subjectLabelName,
        "IsSubjectRequired": isSubjectRequired,
        "IsSubjectEditable": isSubjectEditable,
        "DescriptionLabelName": descriptionLabelName,
        "IsDescriptionRequired": isDescriptionRequired,
        "IsDescriptionEditable": isDescriptionEditable,
        "HideDateAndSLA": hideDateAndSla,
        "TextBoxDisplay1": textBoxDisplay1,
        "TextBoxLink1": textBoxLink1,
        "TextBoxDisplayType1": textBoxDisplayType1,
        "IsRequiredTextBoxDisplay1": isRequiredTextBoxDisplay1,
        "IsAssigneeAvailableTextBoxDisplay1":
            isAssigneeAvailableTextBoxDisplay1,
        "IsDropdownDisplay1": isDropdownDisplay1,
        "DropdownValueMethod1": dropdownValueMethod1,
        "IsRequiredDropdownDisplay1": isRequiredDropdownDisplay1,
        "IsAssigneeAvailableDropdownDisplay1":
            isAssigneeAvailableDropdownDisplay1,
        "TextBoxDisplay2": textBoxDisplay2,
        "TextBoxDisplayType2": textBoxDisplayType2,
        "IsRequiredTextBoxDisplay2": isRequiredTextBoxDisplay2,
        "IsAssigneeAvailableTextBoxDisplay2":
            isAssigneeAvailableTextBoxDisplay2,
        "IsDropdownDisplay2": isDropdownDisplay2,
        "DropdownValueMethod2": dropdownValueMethod2,
        "IsRequiredDropdownDisplay2": isRequiredDropdownDisplay2,
        "IsAssigneeAvailableDropdownDisplay2":
            isAssigneeAvailableDropdownDisplay2,
        "TextBoxDisplay3": textBoxDisplay3,
        "TextBoxDisplayType3": textBoxDisplayType3,
        "IsRequiredTextBoxDisplay3": isRequiredTextBoxDisplay3,
        "IsAssigneeAvailableTextBoxDisplay3":
            isAssigneeAvailableTextBoxDisplay3,
        "IsDropdownDisplay3": isDropdownDisplay3,
        "DropdownValueMethod3": dropdownValueMethod3,
        "IsRequiredDropdownDisplay3": isRequiredDropdownDisplay3,
        "IsAssigneeAvailableDropdownDisplay3":
            isAssigneeAvailableDropdownDisplay3,
        "TextBoxDisplay4": textBoxDisplay4,
        "TextBoxDisplayType4": textBoxDisplayType4,
        "IsRequiredTextBoxDisplay4": isRequiredTextBoxDisplay4,
        "IsAssigneeAvailableTextBoxDisplay4":
            isAssigneeAvailableTextBoxDisplay4,
        "IsDropdownDisplay4": isDropdownDisplay4,
        "DropdownValueMethod4": dropdownValueMethod4,
        "IsRequiredDropdownDisplay4": isRequiredDropdownDisplay4,
        "IsAssigneeAvailableDropdownDisplay4":
            isAssigneeAvailableDropdownDisplay4,
        "TextBoxDisplay5": textBoxDisplay5,
        "TextBoxDisplayType5": textBoxDisplayType5,
        "IsRequiredTextBoxDisplay5": isRequiredTextBoxDisplay5,
        "IsAssigneeAvailableTextBoxDisplay5":
            isAssigneeAvailableTextBoxDisplay5,
        "IsDropdownDisplay5": isDropdownDisplay5,
        "DropdownValueMethod5": dropdownValueMethod5,
        "IsRequiredDropdownDisplay5": isRequiredDropdownDisplay5,
        "IsAssigneeAvailableDropdownDisplay5":
            isAssigneeAvailableDropdownDisplay5,
        "TextBoxDisplay6": textBoxDisplay6,
        "TextBoxDisplayType6": textBoxDisplayType6,
        "IsRequiredTextBoxDisplay6": isRequiredTextBoxDisplay6,
        "IsAssigneeAvailableTextBoxDisplay6":
            isAssigneeAvailableTextBoxDisplay6,
        "IsDropdownDisplay6": isDropdownDisplay6,
        "DropdownValueMethod6": dropdownValueMethod6,
        "IsRequiredDropdownDisplay6": isRequiredDropdownDisplay6,
        "IsAssigneeAvailableDropdownDisplay6":
            isAssigneeAvailableDropdownDisplay6,
        "TextBoxDisplay7": textBoxDisplay7,
        "TextBoxDisplayType7": textBoxDisplayType7,
        "IsRequiredTextBoxDisplay7": isRequiredTextBoxDisplay7,
        "IsAssigneeAvailableTextBoxDisplay7":
            isAssigneeAvailableTextBoxDisplay7,
        "IsDropdownDisplay7": isDropdownDisplay7,
        "DropdownValueMethod7": dropdownValueMethod7,
        "IsRequiredDropdownDisplay7": isRequiredDropdownDisplay7,
        "IsAssigneeAvailableDropdownDisplay7":
            isAssigneeAvailableDropdownDisplay7,
        "TextBoxDisplay8": textBoxDisplay8,
        "TextBoxDisplayType8": textBoxDisplayType8,
        "IsRequiredTextBoxDisplay8": isRequiredTextBoxDisplay8,
        "IsAssigneeAvailableTextBoxDisplay8":
            isAssigneeAvailableTextBoxDisplay8,
        "IsDropdownDisplay8": isDropdownDisplay8,
        "DropdownValueMethod8": dropdownValueMethod8,
        "IsRequiredDropdownDisplay8": isRequiredDropdownDisplay8,
        "IsAssigneeAvailableDropdownDisplay8":
            isAssigneeAvailableDropdownDisplay8,
        "TextBoxDisplay9": textBoxDisplay9,
        "TextBoxDisplayType9": textBoxDisplayType9,
        "IsRequiredTextBoxDisplay9": isRequiredTextBoxDisplay9,
        "IsAssigneeAvailableTextBoxDisplay9":
            isAssigneeAvailableTextBoxDisplay9,
        "IsDropdownDisplay9": isDropdownDisplay9,
        "DropdownValueMethod9": dropdownValueMethod9,
        "IsRequiredDropdownDisplay9": isRequiredDropdownDisplay9,
        "IsAssigneeAvailableDropdownDisplay9":
            isAssigneeAvailableDropdownDisplay9,
        "TextBoxDisplay10": textBoxDisplay10,
        "TextBoxDisplayType10": textBoxDisplayType10,
        "IsRequiredTextBoxDisplay10": isRequiredTextBoxDisplay10,
        "IsAssigneeAvailableTextBoxDisplay10":
            isAssigneeAvailableTextBoxDisplay10,
        "IsDropdownDisplay10": isDropdownDisplay10,
        "DropdownValueMethod10": dropdownValueMethod10,
        "IsRequiredDropdownDisplay10": isRequiredDropdownDisplay10,
        "IsAssigneeAvailableDropdownDisplay10":
            isAssigneeAvailableDropdownDisplay10,
        "DraftButtonText": draftButtonText,
        "SaveButtonText": saveButtonText,
        "CompleteButtonText": completeButtonText,
        "RejectButtonText": rejectButtonText,
        "ReturnButtonText": returnButtonText,
        "ReopenButtonText": reopenButtonText,
        "DelegateButtonText": delegateButtonText,
        "CancelButtonText": cancelButtonText,
        "BackButtonText": backButtonText,
        "CreateNewVersionButtonText": createNewVersionButtonText,
        "SaveChangesButtonText": saveChangesButtonText,
        "SaveNewVersionButtonText": saveNewVersionButtonText,
        "DraftButton": draftButton,
        "CreateNewVersionButton": createNewVersionButton,
        "SaveNewVersionButton": saveNewVersionButton,
        "ModuleName": moduleName,
        "ModuleId": moduleId,
        "Module": module,
        "SaveButton": saveButton,
        "CanViewVersions": canViewVersions,
        "DisplayActionButtonBelow": displayActionButtonBelow,
        "SaveChangesButton": saveChangesButton,
        "CompleteButton": completeButton,
        "IsCompleteReasonRequired": isCompleteReasonRequired,
        "RejectButton": rejectButton,
        "NotApplicableButton": notApplicableButton,
        "IsLockVisible": isLockVisible,
        "IsReleaseVisible": isReleaseVisible,
        "IsNoteTeamOwner": isNoteTeamOwner,
        "IsRejectionReasonRequired": isRejectionReasonRequired,
        "ReturnButton": returnButton,
        "ReopenButton": reopenButton,
        "IsReopenReasonRequired": isReopenReasonRequired,
        "IsReturnReasonRequired": isReturnReasonRequired,
        "DelegateButton": delegateButton,
        "IsDelegateReasonRequired": isDelegateReasonRequired,
        "CancelButton": cancelButton,
        "IsCancelReasonRequired": isCancelReasonRequired,
        "BackButton": backButton,
        "CloseButton": closeButton,
        "CloseButtonText": closeButtonText,
        "TemplateAction": templateAction,
        "ActiveUserId": activeUserId,
        "DisplayMode": displayMode,
        "TemplateUserType": templateUserType,
        "CanEditHeader": canEditHeader,
        "CancelEditButtonText": cancelEditButtonText,
        "TeamMembers": teamMembers,
        "AssigneeDisplayName": assigneeDisplayName,
        "NoteOwnerFirstLetter": noteOwnerFirstLetter,
        "OwnerUserName": ownerUserName,
        "AssigneeUserName": assigneeUserName,
        "RequestedByUserName": requestedByUserName,
        "CreatedByUserName": createdByUserName,
        "LastUpdatedByUserName": lastUpdatedByUserName,
        "NoteStatusName": noteStatusName,
        "StatusClass": statusClass,
        "ExpiryDateDisplay": expiryDateDisplay,
        "StepTemplateIds": stepTemplateIds,
        "DisplayDueDate": displayDueDate,
        "ServiceDetailsHeight": serviceDetailsHeight,
        "HomeType": homeType,
        "OtherWalls": otherWalls,
        "PositionId": positionId,
        "DepartmentId": departmentId,
        "DepartmentName": departmentName,
        "S_RequestOverdue": sRequestOverdue,
        "S_RequestPending": sRequestPending,
        "T_AssignPending": tAssignPending,
        "T_AssignOverdue": tAssignOverdue,
        "N_Active": nActive,
        "base64Img": base64Img,
        "OwnerDisplayName": ownerDisplayName,
        "IsUserGuide": isUserGuide,
        "IsPrivate": isPrivate,
        "TargetName": targetName,
        "SourcePost": sourcePost,
        "Action": action,
        "LikeStatus": likeStatus,
        "LikesUserCount": likesUserCount,
        "ILiked": iLiked,
        "CommentsCount": commentsCount,
        "ShareCount": shareCount,
        "MessageComment": messageComment,
        "NoteId": noteId,
        "SourceName": sourceName,
        "UserPhotoId": userPhotoId,
        "IsOwner": isOwner,
        "FormattedCreateDate": formattedCreateDate,
        "FormattedStartDate": formattedStartDate,
        "AttachmentList": attachmentList,
        "NoteNo": noteNo,
        "NoteSubject": noteSubject,
        "NoteDescription": noteDescription,
        "TemplateCode": templateCode,
        "StartDate": startDate.toIso8601String(),
        "ExpiryDate": expiryDate,
        "ReminderDate": reminderDate,
        "CompletedDate": completedDate,
        "NoteStatusId": noteStatusId,
        "NoteStatus": noteStatus,
        "NotePriorityId": notePriorityId,
        "NotePriority": notePriority,
        "TemplateId": templateId,
        "Template": template,
        "NoteTemplateId": noteTemplateId,
        "NoteTemplate": noteTemplate,
        "NoteOwnerTypeId": noteOwnerTypeId,
        "NoteOwnerType": noteOwnerType,
        "RequestedByUserId": requestedByUserId,
        "RequestedByUser": requestedByUser,
        "OwnerUserId": ownerUserId,
        "OwnerUser": ownerUser,
        "ParentNoteId": parentNoteId,
        "ParentNote": parentNote,
        "ParentTaskId": parentTaskId,
        "ParentTask": parentTask,
        "ParentServiceId": parentServiceId,
        "ParentService": parentService,
        "NoteActionId": noteActionId,
        "NoteAction": noteAction,
        "CanceledDate": canceledDate,
        "CancelReason": cancelReason,
        "CompleteReason": completeReason,
        "UserRating": userRating,
        "CloseComment": closeComment,
        "ClosedDate": closedDate,
        "IsVersioning": isVersioning,
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
        "PortalId": portalId,
      };
}
