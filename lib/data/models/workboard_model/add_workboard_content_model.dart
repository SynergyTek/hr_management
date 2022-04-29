import 'dart:convert';

AddContentWorkBoardModel addWorkBoardContentModelFromJson(String str) =>
    AddContentWorkBoardModel.fromJson(json.decode(str));

String addWorkBoardContentModelToJson(AddContentWorkBoardModel data) =>
    json.encode(data.toJson());

class AddContentWorkBoardModel {
  AddContentWorkBoardModel({
    this.itemType,
    this.addWorkBoardContentModelId,
    this.itemContent,
    this.itemName,
    this.itemContentIndex,
    this.itemFileId,
    this.itemFileFileId,
    this.workBoardId,
    this.parentId,
    this.colorCode,
    this.workBoardItemShape,
    this.workBoardItemSize,
    this.colorName,
    this.workBoardSectionId,
    this.workBoardItemId,
    this.ntsNoteId,
    this.item,
    this.jsonCopy,
    this.json,
    this.dataJson,
    this.page,
    this.pageId,
    this.recordId,
    this.portalName,
    this.setUdfValue,
    this.prms,
    this.udfs,
    this.readoOnlyUdfs,
    this.templateCode,
    this.templateDisplayName,
    this.noteCount,
    this.noteEventId,
    this.noteTemplateVm,
    this.templateViewModel,
    this.noteTable,
    this.columnList,
    this.parentTemplateId,
    this.activeUserId,
    this.noteNo,
    this.noteId,
    this.udfNoteTableId,
    this.startDate,
    this.expiryDate,
    this.slaSeconds,
    this.actualSla,
    this.reminderDate,
    this.noteStatusBgCss,
    this.noteStatusFontCss,
    this.noteStatusId,
    this.tableMetadataId,
    this.noteStatusCode,
    this.noteStatusName,
    this.noteActionId,
    this.noteActionCode,
    this.noteActionName,
    this.notePriorityId,
    this.notePriorityCode,
    this.notePriorityName,
    this.submittedDate,
    this.completedDate,
    this.canceledDate,
    this.returnedDate,
    this.reopenedDate,
    this.closedDate,
    this.closeComment,
    this.userRating,
    this.cancelReason,
    this.completeReason,
    this.requestedByUserId,
    this.requestedByUserName,
    this.requestedByUserEmail,
    this.requestedByUserPhotoId,
    this.ownerUserId,
    this.ownerUserName,
    this.ownerUserEmail,
    this.ownerUserPhotoId,
    this.noteOwnerTypeId,
    this.activeUserType,
    this.sharedByUserId,
    this.sharedWithUserId,
    this.sharedListText,
    this.sharedList,
    this.assignedToUserEmail,
    this.lockStatus,
    this.parentNoteId,
    this.includeReadonlyData,
    this.isDraftButtonVisible,
    this.isAcceptButtonVisible,
    this.isSubmitButtonVisible,
    this.isExpireButtonVisible,
    this.isInEditMode,
    this.isVersioningButtonVisible,
    this.isReplyButtonVisible,
    this.isBackButtonVisibile,
    this.isPermittedUser,
    this.isAddCommentEnabled,
    this.isAddAttachmentEnabled,
    this.isSharingEnabled,
    this.isCompleteButtonVisible,
    this.isCloseButtonVisible,
    this.sharedCount,
    this.attachmentCount,
    this.notificationCount,
    this.commentCount,
    this.canChangeOwner,
    this.noteSequenceOrder,
    this.noteDescription,
    this.noteSubject,
    this.includeSharedList,
    this.customUrl,
    this.returnUrl,
    this.layoutMode,
    this.popupCallbackMethod,
    this.noteIndexPageTemplateDetails,
    this.notificationTemplate,
    this.isVersioning,
    this.isLogRecord,
    this.chartItems,
    this.resource,
    this.ignorePermission,
    this.previousParentId,
    this.uploadedContent,
    this.fileIds,
    this.logId,
    this.referenceId,
    this.referenceType,
    this.postComment,
    this.servicePlusId,
    this.notePlusId,
    this.taskPlusId,
    this.parentTaskId,
    this.parentServiceId,
    this.viewType,
    this.viewMode,
    this.bookItems,
    this.attachmentIds,
    this.tableName,
    this.allReadOnly,
    this.fileName,
    this.folderType,
    this.enableIndexPage,
    this.enableNoteNumberManual,
    this.enableSaveAsDraft,
    this.saveAsDraftText,
    this.saveAsDraftCss,
    this.completeButtonText,
    this.completeButtonCss,
    this.enableBackButton,
    this.backButtonText,
    this.backButtonCss,
    this.enableAttachment,
    this.enableComment,
    this.disableVersioning,
    this.saveNewVersionButtonText,
    this.saveNewVersionButtonCss,
    this.templateId,
    this.template,
    this.noteIndexPageTemplateId,
    this.noteIndexPageTemplate,
    this.createReturnType,
    this.editReturnType,
    this.preScript,
    this.postScript,
    this.iconFileId,
    this.templateColor,
    this.bannerFileId,
    this.backgroundFileId,
    this.ocrTemplateFileId,
    this.subject,
    this.notificationSubject,
    this.description,
    this.subjectText,
    this.ownerUserText,
    this.requestedByUserText,
    this.priorityId,
    this.priority,
    this.enableCancelButton,
    this.isCancelReasonRequired,
    this.cancelButtonText,
    this.cancelButtonCss,
    this.isUdfTemplate,
    this.isCompleteReasonRequired,
    this.noteNoText,
    this.descriptionText,
    this.hideHeader,
    this.hideSubject,
    this.hideDescription,
    this.hideStartDate,
    this.hideExpiryDate,
    this.hidePriority,
    this.hideOwner,
    this.isSubjectMandatory,
    this.isSubjectUnique,
    this.isDescriptionMandatory,
    this.hideToolbar,
    this.hideBanner,
    this.allowPastStartDate,
    this.enablePrintButton,
    this.printButtonText,
    this.enableDataPermission,
    this.dataPermissionColumnId,
    this.numberGenerationType,
    this.isNumberNotMandatory,
    this.enableLegalEntityFilter,
    this.enablePermission,
    this.enableInlineComment,
    this.adhocTaskTemplateIds,
    this.adhocServiceTemplateIds,
    this.adhocNoteTemplateIds,
    this.noteTemplateType,
    this.emailCopyTemplateCode,
    this.formType,
    this.enableSequenceOrder,
    this.subjectMappingUdfId,
    this.descriptionMappingUdfId,
    this.actionButtonPosition,
    this.subjectUdfMappingColumn,
    this.descriptionUdfMappingColumn,
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

  dynamic itemType;
  dynamic addWorkBoardContentModelId;
  dynamic itemContent;
  dynamic itemName;
  dynamic itemContentIndex;
  dynamic itemFileId;
  dynamic itemFileFileId;
  dynamic workBoardId;
  dynamic parentId;
  dynamic colorCode;
  dynamic workBoardItemShape;
  dynamic workBoardItemSize;
  String? colorName;
  dynamic workBoardSectionId;
  dynamic workBoardItemId;
  dynamic ntsNoteId;
  dynamic item;
  dynamic jsonCopy;
  dynamic json;
  dynamic dataJson;
  dynamic page;
  dynamic pageId;
  dynamic recordId;
  dynamic portalName;
  bool? setUdfValue;
  dynamic prms;
  dynamic udfs;
  dynamic readoOnlyUdfs;
  dynamic templateCode;
  dynamic templateDisplayName;
  int? noteCount;
  dynamic noteEventId;
  dynamic noteTemplateVm;
  dynamic templateViewModel;
  dynamic noteTable;
  dynamic columnList;
  dynamic parentTemplateId;
  dynamic activeUserId;
  dynamic noteNo;
  dynamic noteId;
  dynamic udfNoteTableId;
  dynamic startDate;
  dynamic expiryDate;
  dynamic slaSeconds;
  String? actualSla;
  dynamic reminderDate;
  String? noteStatusBgCss;
  String? noteStatusFontCss;
  dynamic noteStatusId;
  dynamic tableMetadataId;
  dynamic noteStatusCode;
  dynamic noteStatusName;
  dynamic noteActionId;
  dynamic noteActionCode;
  dynamic noteActionName;
  dynamic notePriorityId;
  dynamic notePriorityCode;
  dynamic notePriorityName;
  dynamic submittedDate;
  dynamic completedDate;
  dynamic canceledDate;
  dynamic returnedDate;
  dynamic reopenedDate;
  dynamic closedDate;
  dynamic closeComment;
  dynamic userRating;
  dynamic cancelReason;
  dynamic completeReason;
  dynamic requestedByUserId;
  dynamic requestedByUserName;
  dynamic requestedByUserEmail;
  dynamic requestedByUserPhotoId;
  dynamic ownerUserId;
  dynamic ownerUserName;
  dynamic ownerUserEmail;
  dynamic ownerUserPhotoId;
  dynamic noteOwnerTypeId;
  int? activeUserType;
  dynamic sharedByUserId;
  dynamic sharedWithUserId;
  String? sharedListText;
  dynamic sharedList;
  dynamic assignedToUserEmail;
  dynamic lockStatus;
  dynamic parentNoteId;
  bool? includeReadonlyData;
  bool? isDraftButtonVisible;
  bool? isAcceptButtonVisible;
  bool? isSubmitButtonVisible;
  bool? isExpireButtonVisible;
  bool? isInEditMode;
  bool? isVersioningButtonVisible;
  bool? isReplyButtonVisible;
  bool? isBackButtonVisibile;
  bool? isPermittedUser;
  bool? isAddCommentEnabled;
  bool? isAddAttachmentEnabled;
  bool? isSharingEnabled;
  bool? isCompleteButtonVisible;
  bool? isCloseButtonVisible;
  int? sharedCount;
  int? attachmentCount;
  int? notificationCount;
  int? commentCount;
  bool? canChangeOwner;
  dynamic noteSequenceOrder;
  dynamic noteDescription;
  dynamic noteSubject;
  bool? includeSharedList;
  dynamic customUrl;
  dynamic returnUrl;
  dynamic layoutMode;
  dynamic popupCallbackMethod;
  dynamic noteIndexPageTemplateDetails;
  dynamic notificationTemplate;
  bool? isVersioning;
  bool? isLogRecord;
  dynamic chartItems;
  dynamic resource;
  bool? ignorePermission;
  dynamic previousParentId;
  dynamic uploadedContent;
  dynamic fileIds;
  dynamic logId;
  dynamic referenceId;
  int? referenceType;
  dynamic postComment;
  dynamic servicePlusId;
  dynamic notePlusId;
  dynamic taskPlusId;
  dynamic parentTaskId;
  dynamic parentServiceId;
  dynamic viewType;
  dynamic viewMode;
  List<BookItem>? bookItems;
  dynamic attachmentIds;
  dynamic tableName;
  bool? allReadOnly;
  dynamic fileName;
  dynamic folderType;
  bool? enableIndexPage;
  bool? enableNoteNumberManual;
  bool? enableSaveAsDraft;
  dynamic saveAsDraftText;
  dynamic saveAsDraftCss;
  dynamic completeButtonText;
  dynamic completeButtonCss;
  bool? enableBackButton;
  dynamic backButtonText;
  dynamic backButtonCss;
  bool? enableAttachment;
  bool? enableComment;
  bool? disableVersioning;
  dynamic saveNewVersionButtonText;
  dynamic saveNewVersionButtonCss;
  dynamic templateId;
  dynamic template;
  dynamic noteIndexPageTemplateId;
  dynamic noteIndexPageTemplate;
  int? createReturnType;
  int? editReturnType;
  dynamic preScript;
  dynamic postScript;
  dynamic iconFileId;
  dynamic templateColor;
  dynamic bannerFileId;
  dynamic backgroundFileId;
  dynamic ocrTemplateFileId;
  dynamic subject;
  dynamic notificationSubject;
  dynamic description;
  dynamic subjectText;
  dynamic ownerUserText;
  dynamic requestedByUserText;
  dynamic priorityId;
  dynamic priority;
  bool? enableCancelButton;
  bool? isCancelReasonRequired;
  dynamic cancelButtonText;
  dynamic cancelButtonCss;
  bool? isUdfTemplate;
  bool? isCompleteReasonRequired;
  dynamic noteNoText;
  dynamic descriptionText;
  bool? hideHeader;
  bool? hideSubject;
  bool? hideDescription;
  bool? hideStartDate;
  bool? hideExpiryDate;
  bool? hidePriority;
  bool? hideOwner;
  bool? isSubjectMandatory;
  bool? isSubjectUnique;
  bool? isDescriptionMandatory;
  bool? hideToolbar;
  bool? hideBanner;
  bool? allowPastStartDate;
  bool? enablePrintButton;
  dynamic printButtonText;
  bool? enableDataPermission;
  dynamic dataPermissionColumnId;
  int? numberGenerationType;
  bool? isNumberNotMandatory;
  bool? enableLegalEntityFilter;
  bool? enablePermission;
  bool? enableInlineComment;
  dynamic adhocTaskTemplateIds;
  dynamic adhocServiceTemplateIds;
  dynamic adhocNoteTemplateIds;
  dynamic noteTemplateType;
  dynamic emailCopyTemplateCode;
  int? formType;
  bool? enableSequenceOrder;
  dynamic subjectMappingUdfId;
  dynamic descriptionMappingUdfId;
  int? actionButtonPosition;
  dynamic subjectUdfMappingColumn;
  dynamic descriptionUdfMappingColumn;
  dynamic id;
  DateTime? createdDate;
  dynamic createdBy;
  DateTime? lastUpdatedDate;
  dynamic lastUpdatedBy;
  bool? isDeleted;
  dynamic sequenceOrder;
  dynamic companyId;
  dynamic legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  dynamic portalId;

  factory AddContentWorkBoardModel.fromJson(Map<String, dynamic> json) =>
      AddContentWorkBoardModel(
        itemType: json["ItemType"] == null ? null : json["ItemType"],
        addWorkBoardContentModelId: json["id"],
        itemContent: json["ItemContent"],
        itemName: json["ItemName"],
        itemContentIndex: json["ItemContentIndex"],
        itemFileId: json["ItemFileId"],
        itemFileFileId: json["ItemFileFileId"],
        workBoardId: json["WorkBoardId"],
        parentId: json["ParentId"],
        colorCode: json["ColorCode"],
        workBoardItemShape: json["WorkBoardItemShape"] == null
            ? null
            : json["WorkBoardItemShape"],
        workBoardItemSize: json["WorkBoardItemSize"] == null
            ? null
            : json["WorkBoardItemSize"],
        colorName: json["ColorName"] == null ? null : json["ColorName"],
        workBoardSectionId: json["WorkBoardSectionId"],
        workBoardItemId: json["WorkBoardItemId"],
        ntsNoteId: json["NtsNoteId"],
        item: json["item"],
        jsonCopy: json["JsonCopy"],
        json: json["Json"],
        dataJson: json["DataJson"],
        page: json["Page"],
        pageId: json["PageId"],
        recordId: json["RecordId"],
        portalName: json["PortalName"],
        setUdfValue: json["SetUdfValue"] == null ? null : json["SetUdfValue"],
        prms: json["Prms"],
        udfs: json["Udfs"],
        readoOnlyUdfs: json["ReadoOnlyUdfs"],
        templateCode: json["TemplateCode"],
        templateDisplayName: json["TemplateDisplayName"],
        noteCount: json["NoteCount"] == null ? null : json["NoteCount"],
        noteEventId: json["NoteEventId"],
        noteTemplateVm: json["NoteTemplateVM"],
        templateViewModel: json["TemplateViewModel"],
        noteTable: json["NoteTable"],
        columnList: json["ColumnList"],
        parentTemplateId: json["ParentTemplateId"],
        activeUserId: json["ActiveUserId"],
        noteNo: json["NoteNo"],
        noteId: json["NoteId"],
        udfNoteTableId: json["UdfNoteTableId"],
        startDate: json["StartDate"],
        expiryDate: json["ExpiryDate"],
        slaSeconds: json["SLASeconds"],
        actualSla: json["ActualSLA"] == null ? null : json["ActualSLA"],
        reminderDate: json["ReminderDate"],
        noteStatusBgCss:
            json["NoteStatusBgCss"] == null ? null : json["NoteStatusBgCss"],
        noteStatusFontCss: json["NoteStatusFontCss"] == null
            ? null
            : json["NoteStatusFontCss"],
        noteStatusId: json["NoteStatusId"],
        tableMetadataId: json["TableMetadataId"],
        noteStatusCode: json["NoteStatusCode"],
        noteStatusName: json["NoteStatusName"],
        noteActionId: json["NoteActionId"],
        noteActionCode: json["NoteActionCode"],
        noteActionName: json["NoteActionName"],
        notePriorityId: json["NotePriorityId"],
        notePriorityCode: json["NotePriorityCode"],
        notePriorityName: json["NotePriorityName"],
        submittedDate: json["SubmittedDate"],
        completedDate: json["CompletedDate"],
        canceledDate: json["CanceledDate"],
        returnedDate: json["ReturnedDate"],
        reopenedDate: json["ReopenedDate"],
        closedDate: json["ClosedDate"],
        closeComment: json["CloseComment"],
        userRating: json["UserRating"],
        cancelReason: json["CancelReason"],
        completeReason: json["CompleteReason"],
        requestedByUserId: json["RequestedByUserId"],
        requestedByUserName: json["RequestedByUserName"],
        requestedByUserEmail: json["RequestedByUserEmail"],
        requestedByUserPhotoId: json["RequestedByUserPhotoId"],
        ownerUserId: json["OwnerUserId"],
        ownerUserName: json["OwnerUserName"],
        ownerUserEmail: json["OwnerUserEmail"],
        ownerUserPhotoId: json["OwnerUserPhotoId"],
        noteOwnerTypeId: json["NoteOwnerTypeId"],
        activeUserType:
            json["ActiveUserType"] == null ? null : json["ActiveUserType"],
        sharedByUserId: json["SharedByUserId"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedListText:
            json["SharedListText"] == null ? null : json["SharedListText"],
        sharedList: json["SharedList"],
        assignedToUserEmail: json["AssignedToUserEmail"],
        lockStatus: json["LockStatus"],
        parentNoteId: json["ParentNoteId"],
        includeReadonlyData: json["IncludeReadonlyData"] == null
            ? null
            : json["IncludeReadonlyData"],
        isDraftButtonVisible: json["IsDraftButtonVisible"] == null
            ? null
            : json["IsDraftButtonVisible"],
        isAcceptButtonVisible: json["IsAcceptButtonVisible"] == null
            ? null
            : json["IsAcceptButtonVisible"],
        isSubmitButtonVisible: json["IsSubmitButtonVisible"] == null
            ? null
            : json["IsSubmitButtonVisible"],
        isExpireButtonVisible: json["IsExpireButtonVisible"] == null
            ? null
            : json["IsExpireButtonVisible"],
        isInEditMode:
            json["IsInEditMode"] == null ? null : json["IsInEditMode"],
        isVersioningButtonVisible: json["IsVersioningButtonVisible"] == null
            ? null
            : json["IsVersioningButtonVisible"],
        isReplyButtonVisible: json["IsReplyButtonVisible"] == null
            ? null
            : json["IsReplyButtonVisible"],
        isBackButtonVisibile: json["IsBackButtonVisibile"] == null
            ? null
            : json["IsBackButtonVisibile"],
        isPermittedUser:
            json["IsPermittedUser"] == null ? null : json["IsPermittedUser"],
        isAddCommentEnabled: json["IsAddCommentEnabled"] == null
            ? null
            : json["IsAddCommentEnabled"],
        isAddAttachmentEnabled: json["IsAddAttachmentEnabled"] == null
            ? null
            : json["IsAddAttachmentEnabled"],
        isSharingEnabled:
            json["IsSharingEnabled"] == null ? null : json["IsSharingEnabled"],
        isCompleteButtonVisible: json["IsCompleteButtonVisible"] == null
            ? null
            : json["IsCompleteButtonVisible"],
        isCloseButtonVisible: json["IsCloseButtonVisible"] == null
            ? null
            : json["IsCloseButtonVisible"],
        sharedCount: json["SharedCount"] == null ? null : json["SharedCount"],
        attachmentCount:
            json["AttachmentCount"] == null ? null : json["AttachmentCount"],
        notificationCount: json["NotificationCount"] == null
            ? null
            : json["NotificationCount"],
        commentCount:
            json["CommentCount"] == null ? null : json["CommentCount"],
        canChangeOwner:
            json["CanChangeOwner"] == null ? null : json["CanChangeOwner"],
        noteSequenceOrder: json["NoteSequenceOrder"],
        noteDescription: json["NoteDescription"],
        noteSubject: json["NoteSubject"],
        includeSharedList: json["IncludeSharedList"] == null
            ? null
            : json["IncludeSharedList"],
        customUrl: json["CustomUrl"],
        returnUrl: json["ReturnUrl"],
        layoutMode: json["LayoutMode"],
        popupCallbackMethod: json["PopupCallbackMethod"],
        noteIndexPageTemplateDetails: json["NoteIndexPageTemplateDetails"],
        notificationTemplate: json["NotificationTemplate"],
        isVersioning:
            json["IsVersioning"] == null ? null : json["IsVersioning"],
        isLogRecord: json["IsLogRecord"] == null ? null : json["IsLogRecord"],
        chartItems: json["ChartItems"],
        resource: json["Resource"],
        ignorePermission:
            json["IgnorePermission"] == null ? null : json["IgnorePermission"],
        previousParentId: json["PreviousParentId"],
        uploadedContent: json["UploadedContent"],
        fileIds: json["FileIds"],
        logId: json["LogId"],
        referenceId: json["ReferenceId"],
        referenceType:
            json["ReferenceType"] == null ? null : json["ReferenceType"],
        postComment: json["PostComment"],
        servicePlusId: json["ServicePlusId"],
        notePlusId: json["NotePlusId"],
        taskPlusId: json["TaskPlusId"],
        parentTaskId: json["ParentTaskId"],
        parentServiceId: json["ParentServiceId"],
        viewType: json["ViewType"],
        viewMode: json["ViewMode"],
        bookItems: json["BookItems"],
        attachmentIds: json["AttachmentIds"],
        tableName: json["TableName"],
        allReadOnly: json["AllReadOnly"] == null ? null : json["AllReadOnly"],
        fileName: json["FileName"],
        folderType: json["FolderType"],
        enableIndexPage:
            json["EnableIndexPage"] == null ? null : json["EnableIndexPage"],
        enableNoteNumberManual: json["EnableNoteNumberManual"] == null
            ? null
            : json["EnableNoteNumberManual"],
        enableSaveAsDraft: json["EnableSaveAsDraft"] == null
            ? null
            : json["EnableSaveAsDraft"],
        saveAsDraftText: json["SaveAsDraftText"],
        saveAsDraftCss: json["SaveAsDraftCss"],
        completeButtonText: json["CompleteButtonText"],
        completeButtonCss: json["CompleteButtonCss"],
        enableBackButton:
            json["EnableBackButton"] == null ? null : json["EnableBackButton"],
        backButtonText: json["BackButtonText"],
        backButtonCss: json["BackButtonCss"],
        enableAttachment:
            json["EnableAttachment"] == null ? null : json["EnableAttachment"],
        enableComment:
            json["EnableComment"] == null ? null : json["EnableComment"],
        disableVersioning: json["DisableVersioning"] == null
            ? null
            : json["DisableVersioning"],
        saveNewVersionButtonText: json["SaveNewVersionButtonText"],
        saveNewVersionButtonCss: json["SaveNewVersionButtonCss"],
        templateId: json["TemplateId"],
        template: json["Template"],
        noteIndexPageTemplateId: json["NoteIndexPageTemplateId"],
        noteIndexPageTemplate: json["NoteIndexPageTemplate"],
        createReturnType:
            json["CreateReturnType"] == null ? null : json["CreateReturnType"],
        editReturnType:
            json["EditReturnType"] == null ? null : json["EditReturnType"],
        preScript: json["PreScript"],
        postScript: json["PostScript"],
        iconFileId: json["IconFileId"],
        templateColor: json["TemplateColor"],
        bannerFileId: json["BannerFileId"],
        backgroundFileId: json["BackgroundFileId"],
        ocrTemplateFileId: json["OcrTemplateFileId"],
        subject: json["Subject"],
        notificationSubject: json["NotificationSubject"],
        description: json["Description"],
        subjectText: json["SubjectText"],
        ownerUserText: json["OwnerUserText"],
        requestedByUserText: json["RequestedByUserText"],
        priorityId: json["PriorityId"],
        priority: json["Priority"],
        enableCancelButton: json["EnableCancelButton"] == null
            ? null
            : json["EnableCancelButton"],
        isCancelReasonRequired: json["IsCancelReasonRequired"] == null
            ? null
            : json["IsCancelReasonRequired"],
        cancelButtonText: json["CancelButtonText"],
        cancelButtonCss: json["CancelButtonCss"],
        isUdfTemplate:
            json["IsUdfTemplate"] == null ? null : json["IsUdfTemplate"],
        isCompleteReasonRequired: json["IsCompleteReasonRequired"] == null
            ? null
            : json["IsCompleteReasonRequired"],
        noteNoText: json["NoteNoText"],
        descriptionText: json["DescriptionText"],
        hideHeader: json["HideHeader"] == null ? null : json["HideHeader"],
        hideSubject: json["HideSubject"] == null ? null : json["HideSubject"],
        hideDescription:
            json["HideDescription"] == null ? null : json["HideDescription"],
        hideStartDate:
            json["HideStartDate"] == null ? null : json["HideStartDate"],
        hideExpiryDate:
            json["HideExpiryDate"] == null ? null : json["HideExpiryDate"],
        hidePriority:
            json["HidePriority"] == null ? null : json["HidePriority"],
        hideOwner: json["HideOwner"] == null ? null : json["HideOwner"],
        isSubjectMandatory: json["IsSubjectMandatory"] == null
            ? null
            : json["IsSubjectMandatory"],
        isSubjectUnique:
            json["IsSubjectUnique"] == null ? null : json["IsSubjectUnique"],
        isDescriptionMandatory: json["IsDescriptionMandatory"] == null
            ? null
            : json["IsDescriptionMandatory"],
        hideToolbar: json["HideToolbar"] == null ? null : json["HideToolbar"],
        hideBanner: json["HideBanner"] == null ? null : json["HideBanner"],
        allowPastStartDate: json["AllowPastStartDate"] == null
            ? null
            : json["AllowPastStartDate"],
        enablePrintButton: json["EnablePrintButton"] == null
            ? null
            : json["EnablePrintButton"],
        printButtonText: json["PrintButtonText"],
        enableDataPermission: json["EnableDataPermission"] == null
            ? null
            : json["EnableDataPermission"],
        dataPermissionColumnId: json["DataPermissionColumnId"],
        numberGenerationType: json["NumberGenerationType"] == null
            ? null
            : json["NumberGenerationType"],
        isNumberNotMandatory: json["IsNumberNotMandatory"] == null
            ? null
            : json["IsNumberNotMandatory"],
        enableLegalEntityFilter: json["EnableLegalEntityFilter"] == null
            ? null
            : json["EnableLegalEntityFilter"],
        enablePermission:
            json["EnablePermission"] == null ? null : json["EnablePermission"],
        enableInlineComment: json["EnableInlineComment"] == null
            ? null
            : json["EnableInlineComment"],
        adhocTaskTemplateIds: json["AdhocTaskTemplateIds"],
        adhocServiceTemplateIds: json["AdhocServiceTemplateIds"],
        adhocNoteTemplateIds: json["AdhocNoteTemplateIds"],
        noteTemplateType: json["NoteTemplateType"],
        emailCopyTemplateCode: json["EmailCopyTemplateCode"],
        formType: json["FormType"] == null ? null : json["FormType"],
        enableSequenceOrder: json["EnableSequenceOrder"] == null
            ? null
            : json["EnableSequenceOrder"],
        subjectMappingUdfId: json["SubjectMappingUdfId"],
        descriptionMappingUdfId: json["DescriptionMappingUdfId"],
        actionButtonPosition: json["ActionButtonPosition"] == null
            ? null
            : json["ActionButtonPosition"],
        subjectUdfMappingColumn: json["SubjectUdfMappingColumn"],
        descriptionUdfMappingColumn: json["DescriptionUdfMappingColumn"],
        id: json["Id"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: json["LastUpdatedDate"] == null
            ? null
            : DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"] == null ? null : json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        legalEntityId: json["LegalEntityId"],
        dataAction: json["DataAction"] == null ? null : json["DataAction"],
        status: json["Status"] == null ? null : json["Status"],
        versionNo: json["VersionNo"] == null ? null : json["VersionNo"],
        portalId: json["PortalId"],
      );

  Map<String, dynamic> toJson() => {
        "ItemType": itemType == null ? null : itemType,
        "id": addWorkBoardContentModelId,
        "ItemContent": itemContent,
        "ItemName": itemName,
        "ItemContentIndex": itemContentIndex,
        "ItemFileId": itemFileId,
        "ItemFileFileId": itemFileFileId,
        "WorkBoardId": workBoardId,
        "ParentId": parentId,
        "ColorCode": colorCode,
        "WorkBoardItemShape":
            workBoardItemShape == null ? null : workBoardItemShape,
        "WorkBoardItemSize":
            workBoardItemSize == null ? null : workBoardItemSize,
        "ColorName": colorName == null ? null : colorName,
        "WorkBoardSectionId": workBoardSectionId,
        "WorkBoardItemId": workBoardItemId,
        "NtsNoteId": ntsNoteId,
        "item": item,
        "JsonCopy": jsonCopy,
        "Json": json,
        "DataJson": dataJson,
        "Page": page,
        "PageId": pageId,
        "RecordId": recordId,
        "PortalName": portalName,
        "SetUdfValue": setUdfValue == null ? null : setUdfValue,
        "Prms": prms,
        "Udfs": udfs,
        "ReadoOnlyUdfs": readoOnlyUdfs,
        "TemplateCode": templateCode,
        "TemplateDisplayName": templateDisplayName,
        "NoteCount": noteCount == null ? null : noteCount,
        "NoteEventId": noteEventId,
        "NoteTemplateVM": noteTemplateVm,
        "TemplateViewModel": templateViewModel,
        "NoteTable": noteTable,
        "ColumnList": columnList,
        "ParentTemplateId": parentTemplateId,
        "ActiveUserId": activeUserId,
        "NoteNo": noteNo,
        "NoteId": noteId,
        "UdfNoteTableId": udfNoteTableId,
        "StartDate": startDate,
        "ExpiryDate": expiryDate,
        "SLASeconds": slaSeconds,
        "ActualSLA": actualSla == null ? null : actualSla,
        "ReminderDate": reminderDate,
        "NoteStatusBgCss": noteStatusBgCss == null ? null : noteStatusBgCss,
        "NoteStatusFontCss":
            noteStatusFontCss == null ? null : noteStatusFontCss,
        "NoteStatusId": noteStatusId,
        "TableMetadataId": tableMetadataId,
        "NoteStatusCode": noteStatusCode,
        "NoteStatusName": noteStatusName,
        "NoteActionId": noteActionId,
        "NoteActionCode": noteActionCode,
        "NoteActionName": noteActionName,
        "NotePriorityId": notePriorityId,
        "NotePriorityCode": notePriorityCode,
        "NotePriorityName": notePriorityName,
        "SubmittedDate": submittedDate,
        "CompletedDate": completedDate,
        "CanceledDate": canceledDate,
        "ReturnedDate": returnedDate,
        "ReopenedDate": reopenedDate,
        "ClosedDate": closedDate,
        "CloseComment": closeComment,
        "UserRating": userRating,
        "CancelReason": cancelReason,
        "CompleteReason": completeReason,
        "RequestedByUserId": requestedByUserId,
        "RequestedByUserName": requestedByUserName,
        "RequestedByUserEmail": requestedByUserEmail,
        "RequestedByUserPhotoId": requestedByUserPhotoId,
        "OwnerUserId": ownerUserId,
        "OwnerUserName": ownerUserName,
        "OwnerUserEmail": ownerUserEmail,
        "OwnerUserPhotoId": ownerUserPhotoId,
        "NoteOwnerTypeId": noteOwnerTypeId,
        "ActiveUserType": activeUserType == null ? null : activeUserType,
        "SharedByUserId": sharedByUserId,
        "SharedWithUserId": sharedWithUserId,
        "SharedListText": sharedListText == null ? null : sharedListText,
        "SharedList": sharedList,
        "AssignedToUserEmail": assignedToUserEmail,
        "LockStatus": lockStatus,
        "ParentNoteId": parentNoteId,
        "IncludeReadonlyData":
            includeReadonlyData == null ? null : includeReadonlyData,
        "IsDraftButtonVisible":
            isDraftButtonVisible == null ? null : isDraftButtonVisible,
        "IsAcceptButtonVisible":
            isAcceptButtonVisible == null ? null : isAcceptButtonVisible,
        "IsSubmitButtonVisible":
            isSubmitButtonVisible == null ? null : isSubmitButtonVisible,
        "IsExpireButtonVisible":
            isExpireButtonVisible == null ? null : isExpireButtonVisible,
        "IsInEditMode": isInEditMode == null ? null : isInEditMode,
        "IsVersioningButtonVisible": isVersioningButtonVisible == null
            ? null
            : isVersioningButtonVisible,
        "IsReplyButtonVisible":
            isReplyButtonVisible == null ? null : isReplyButtonVisible,
        "IsBackButtonVisibile":
            isBackButtonVisibile == null ? null : isBackButtonVisibile,
        "IsPermittedUser": isPermittedUser == null ? null : isPermittedUser,
        "IsAddCommentEnabled":
            isAddCommentEnabled == null ? null : isAddCommentEnabled,
        "IsAddAttachmentEnabled":
            isAddAttachmentEnabled == null ? null : isAddAttachmentEnabled,
        "IsSharingEnabled": isSharingEnabled == null ? null : isSharingEnabled,
        "IsCompleteButtonVisible":
            isCompleteButtonVisible == null ? null : isCompleteButtonVisible,
        "IsCloseButtonVisible":
            isCloseButtonVisible == null ? null : isCloseButtonVisible,
        "SharedCount": sharedCount == null ? null : sharedCount,
        "AttachmentCount": attachmentCount == null ? null : attachmentCount,
        "NotificationCount":
            notificationCount == null ? null : notificationCount,
        "CommentCount": commentCount == null ? null : commentCount,
        "CanChangeOwner": canChangeOwner == null ? null : canChangeOwner,
        "NoteSequenceOrder": noteSequenceOrder,
        "NoteDescription": noteDescription,
        "NoteSubject": noteSubject,
        "IncludeSharedList":
            includeSharedList == null ? null : includeSharedList,
        "CustomUrl": customUrl,
        "ReturnUrl": returnUrl,
        "LayoutMode": layoutMode,
        "PopupCallbackMethod": popupCallbackMethod,
        "NoteIndexPageTemplateDetails": noteIndexPageTemplateDetails,
        "NotificationTemplate": notificationTemplate,
        "IsVersioning": isVersioning == null ? null : isVersioning,
        "IsLogRecord": isLogRecord == null ? null : isLogRecord,
        "ChartItems": chartItems,
        "Resource": resource,
        "IgnorePermission": ignorePermission == null ? null : ignorePermission,
        "PreviousParentId": previousParentId,
        "UploadedContent": uploadedContent,
        "FileIds": fileIds,
        "LogId": logId,
        "ReferenceId": referenceId,
        "ReferenceType": referenceType == null ? null : referenceType,
        "PostComment": postComment,
        "ServicePlusId": servicePlusId,
        "NotePlusId": notePlusId,
        "TaskPlusId": taskPlusId,
        "ParentTaskId": parentTaskId,
        "ParentServiceId": parentServiceId,
        "ViewType": viewType,
        "ViewMode": viewMode,
        "BookItems": bookItems,
        "AttachmentIds": attachmentIds,
        "TableName": tableName,
        "AllReadOnly": allReadOnly == null ? null : allReadOnly,
        "FileName": fileName,
        "FolderType": folderType,
        "EnableIndexPage": enableIndexPage == null ? null : enableIndexPage,
        "EnableNoteNumberManual":
            enableNoteNumberManual == null ? null : enableNoteNumberManual,
        "EnableSaveAsDraft":
            enableSaveAsDraft == null ? null : enableSaveAsDraft,
        "SaveAsDraftText": saveAsDraftText,
        "SaveAsDraftCss": saveAsDraftCss,
        "CompleteButtonText": completeButtonText,
        "CompleteButtonCss": completeButtonCss,
        "EnableBackButton": enableBackButton == null ? null : enableBackButton,
        "BackButtonText": backButtonText,
        "BackButtonCss": backButtonCss,
        "EnableAttachment": enableAttachment == null ? null : enableAttachment,
        "EnableComment": enableComment == null ? null : enableComment,
        "DisableVersioning":
            disableVersioning == null ? null : disableVersioning,
        "SaveNewVersionButtonText": saveNewVersionButtonText,
        "SaveNewVersionButtonCss": saveNewVersionButtonCss,
        "TemplateId": templateId,
        "Template": template,
        "NoteIndexPageTemplateId": noteIndexPageTemplateId,
        "NoteIndexPageTemplate": noteIndexPageTemplate,
        "CreateReturnType": createReturnType == null ? null : createReturnType,
        "EditReturnType": editReturnType == null ? null : editReturnType,
        "PreScript": preScript,
        "PostScript": postScript,
        "IconFileId": iconFileId,
        "TemplateColor": templateColor,
        "BannerFileId": bannerFileId,
        "BackgroundFileId": backgroundFileId,
        "OcrTemplateFileId": ocrTemplateFileId,
        "Subject": subject,
        "NotificationSubject": notificationSubject,
        "Description": description,
        "SubjectText": subjectText,
        "OwnerUserText": ownerUserText,
        "RequestedByUserText": requestedByUserText,
        "PriorityId": priorityId,
        "Priority": priority,
        "EnableCancelButton":
            enableCancelButton == null ? null : enableCancelButton,
        "IsCancelReasonRequired":
            isCancelReasonRequired == null ? null : isCancelReasonRequired,
        "CancelButtonText": cancelButtonText,
        "CancelButtonCss": cancelButtonCss,
        "IsUdfTemplate": isUdfTemplate == null ? null : isUdfTemplate,
        "IsCompleteReasonRequired":
            isCompleteReasonRequired == null ? null : isCompleteReasonRequired,
        "NoteNoText": noteNoText,
        "DescriptionText": descriptionText,
        "HideHeader": hideHeader == null ? null : hideHeader,
        "HideSubject": hideSubject == null ? null : hideSubject,
        "HideDescription": hideDescription == null ? null : hideDescription,
        "HideStartDate": hideStartDate == null ? null : hideStartDate,
        "HideExpiryDate": hideExpiryDate == null ? null : hideExpiryDate,
        "HidePriority": hidePriority == null ? null : hidePriority,
        "HideOwner": hideOwner == null ? null : hideOwner,
        "IsSubjectMandatory":
            isSubjectMandatory == null ? null : isSubjectMandatory,
        "IsSubjectUnique": isSubjectUnique == null ? null : isSubjectUnique,
        "IsDescriptionMandatory":
            isDescriptionMandatory == null ? null : isDescriptionMandatory,
        "HideToolbar": hideToolbar == null ? null : hideToolbar,
        "HideBanner": hideBanner == null ? null : hideBanner,
        "AllowPastStartDate":
            allowPastStartDate == null ? null : allowPastStartDate,
        "EnablePrintButton":
            enablePrintButton == null ? null : enablePrintButton,
        "PrintButtonText": printButtonText,
        "EnableDataPermission":
            enableDataPermission == null ? null : enableDataPermission,
        "DataPermissionColumnId": dataPermissionColumnId,
        "NumberGenerationType":
            numberGenerationType == null ? null : numberGenerationType,
        "IsNumberNotMandatory":
            isNumberNotMandatory == null ? null : isNumberNotMandatory,
        "EnableLegalEntityFilter":
            enableLegalEntityFilter == null ? null : enableLegalEntityFilter,
        "EnablePermission": enablePermission == null ? null : enablePermission,
        "EnableInlineComment":
            enableInlineComment == null ? null : enableInlineComment,
        "AdhocTaskTemplateIds": adhocTaskTemplateIds,
        "AdhocServiceTemplateIds": adhocServiceTemplateIds,
        "AdhocNoteTemplateIds": adhocNoteTemplateIds,
        "NoteTemplateType": noteTemplateType,
        "EmailCopyTemplateCode": emailCopyTemplateCode,
        "FormType": formType == null ? null : formType,
        "EnableSequenceOrder":
            enableSequenceOrder == null ? null : enableSequenceOrder,
        "SubjectMappingUdfId": subjectMappingUdfId,
        "DescriptionMappingUdfId": descriptionMappingUdfId,
        "ActionButtonPosition":
            actionButtonPosition == null ? null : actionButtonPosition,
        "SubjectUdfMappingColumn": subjectUdfMappingColumn,
        "DescriptionUdfMappingColumn": descriptionUdfMappingColumn,
        "Id": id,
        "CreatedDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate":
            lastUpdatedDate == null ? null : lastUpdatedDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted == null ? null : isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId,
        "DataAction": dataAction == null ? null : dataAction,
        "Status": status == null ? null : status,
        "VersionNo": versionNo == null ? null : versionNo,
        "PortalId": portalId,
      };
}

class BookItem {
  BookItem({
    this.id,
    this.ntsType,
    this.ntsNo,
    this.subject,
    this.description,
    this.templateCode,
    this.startDate,
    this.expiryDate,
    this.dueDate,
    this.reminderDate,
    this.completedDate,
    this.statusId,
    this.statusName,
    this.statusCode,
    this.ownerUserId,
    this.ownerUserName,
    this.assigneeUserId,
    this.assigneeUserName,
    this.priorityId,
    this.priorityName,
    this.priorityCode,
    this.columnList,
    this.parentNtsType,
    this.templateName,
    this.parentId,
    this.level,
    this.itemNo,
    this.sequenceOrder,
    this.assigneeOrOwner,
    this.section,
    this.itemType,
    this.autoLoad,
    this.templateId,
    this.referenceNo,
    this.hasChild,
    this.maxChildSequence,
    this.udfCount,
    this.sequence,
    this.hideHeader,
    this.hideSubject,
    this.hideDescription,
    this.templateSequence,
  });

  String? id;
  int? ntsType;
  String? ntsNo;
  String? subject;
  String? description;
  String? templateCode;
  DateTime? startDate;
  String? expiryDate;
  String? dueDate;
  String? reminderDate;
  String? completedDate;
  String? statusId;
  String? statusName;
  String? statusCode;
  String? ownerUserId;
  String? ownerUserName;
  String? assigneeUserId;
  String? assigneeUserName;
  String? priorityId;
  String? priorityName;
  String? priorityCode;
  String? columnList;
  int? parentNtsType;
  String? templateName;
  String? parentId;
  int? level;
  String? itemNo;
  int? sequenceOrder;
  String? assigneeOrOwner;
  String? section;
  int? itemType;
  bool? autoLoad;
  String? templateId;
  String? referenceNo;
  bool? hasChild;
  int? maxChildSequence;
  int? udfCount;
  int? sequence;
  bool? hideHeader;
  bool? hideSubject;
  bool? hideDescription;
  int? templateSequence;

  factory BookItem.fromJson(Map<String, dynamic> json) => BookItem(
        id: json["Id"],
        ntsType: json["NtsType"],
        ntsNo: json["NtsNo"],
        subject: json["Subject"],
        description: json["Description"] == null ? null : json["Description"],
        templateCode: json["TemplateCode"],
        startDate: DateTime.parse(json["StartDate"]),
        expiryDate: json["ExpiryDate"],
        dueDate: json["DueDate"],
        reminderDate: json["ReminderDate"],
        completedDate: json["CompletedDate"],
        statusId: json["StatusId"],
        statusName: json["StatusName"],
        statusCode: json["StatusCode"],
        ownerUserId: json["OwnerUserId"],
        ownerUserName: json["OwnerUserName"],
        assigneeUserId: json["AssigneeUserId"],
        assigneeUserName: json["AssigneeUserName"],
        priorityId: json["PriorityId"],
        priorityName: json["PriorityName"],
        priorityCode: json["PriorityCode"],
        columnList: json["ColumnList"],
        parentNtsType:
            json["ParentNtsType"] == null ? null : json["ParentNtsType"],
        templateName: json["TemplateName"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        level: json["Level"],
        itemNo: json["ItemNo"],
        sequenceOrder: json["SequenceOrder"],
        assigneeOrOwner: json["AssigneeOrOwner"],
        section: json["Section"],
        itemType: json["ItemType"],
        autoLoad: json["AutoLoad"],
        templateId: json["TemplateId"],
        referenceNo: json["ReferenceNo"],
        hasChild: json["HasChild"],
        maxChildSequence: json["MaxChildSequence"],
        udfCount: json["UdfCount"],
        sequence: json["Sequence"],
        hideHeader: json["HideHeader"],
        hideSubject: json["HideSubject"],
        hideDescription: json["HideDescription"],
        templateSequence: json["TemplateSequence"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NtsType": ntsType,
        "NtsNo": ntsNo,
        "Subject": subject,
        "Description": description == null ? null : description,
        "TemplateCode": templateCode,
        "StartDate": startDate!.toIso8601String() ?? '',
        "ExpiryDate": expiryDate,
        "DueDate": dueDate,
        "ReminderDate": reminderDate,
        "CompletedDate": completedDate,
        "StatusId": statusId,
        "StatusName": statusName,
        "StatusCode": statusCode,
        "OwnerUserId": ownerUserId,
        "OwnerUserName": ownerUserName,
        "AssigneeUserId": assigneeUserId,
        "AssigneeUserName": assigneeUserName,
        "PriorityId": priorityId,
        "PriorityName": priorityName,
        "PriorityCode": priorityCode,
        "ColumnList": columnList,
        "ParentNtsType": parentNtsType == null ? null : parentNtsType,
        "TemplateName": templateName,
        "parentId": parentId == null ? null : parentId,
        "Level": level,
        "ItemNo": itemNo,
        "SequenceOrder": sequenceOrder,
        "AssigneeOrOwner": assigneeOrOwner,
        "Section": section,
        "ItemType": itemType,
        "AutoLoad": autoLoad,
        "TemplateId": templateId,
        "ReferenceNo": referenceNo,
        "HasChild": hasChild,
        "MaxChildSequence": maxChildSequence,
        "UdfCount": udfCount,
        "Sequence": sequence,
        "HideHeader": hideHeader,
        "HideSubject": hideSubject,
        "HideDescription": hideDescription,
        "TemplateSequence": templateSequence,
      };
}
