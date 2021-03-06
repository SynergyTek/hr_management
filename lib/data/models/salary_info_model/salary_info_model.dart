// To parse this JSON data, do
//
//     final salaryInfoModel = salaryInfoModelFromJson(jsonString);

import 'dart:convert';

List<SalaryInfoModel> salaryInfoModelFromJson(String str) =>
    List<SalaryInfoModel>.from(
        json.decode(str).map((x) => SalaryInfoModel.fromJson(x)));

String salaryInfoModelToJson(List<SalaryInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalaryInfoModel {
  SalaryInfoModel({
    this.salaryInfoId,
    this.elementId,
    this.elementName,
    this.elementCode,
    this.amount,
    this.effectiveStartDate,
    this.effectiveEndDate,
    this.personId,
    this.elementEffectiveStartDate,
    this.elementEffectiveEndDate,
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

  dynamic salaryInfoId;
  String? elementId;
  String? elementName;
  dynamic elementCode;
  double? amount;
  DateTime? effectiveStartDate;
  DateTime? effectiveEndDate;
  dynamic personId;
  dynamic elementEffectiveStartDate;
  dynamic elementEffectiveEndDate;
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
  String? noteId;
  dynamic udfNoteTableId;
  dynamic startDate;
  dynamic expiryDate;
  dynamic slaSeconds;
  String? actualSla;
  dynamic reminderDate;
  NoteStatusBgCss? noteStatusBgCss;
  NoteStatusFontCss? noteStatusFontCss;
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
  dynamic bookItems;
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
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  int? sequenceOrder;
  String? companyId;
  LegalEntityId? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  dynamic portalId;

  factory SalaryInfoModel.fromJson(Map<String, dynamic> json) =>
      SalaryInfoModel(
        salaryInfoId: json["SalaryInfoId"],
        elementId: json["ElementId"],
        elementName: json["ElementName"],
        elementCode: json["ElementCode"],
        amount: json["Amount"],
        effectiveStartDate: DateTime.parse(json["EffectiveStartDate"]),
        effectiveEndDate: DateTime.parse(json["EffectiveEndDate"]),
        personId: json["PersonId"],
        elementEffectiveStartDate: json["ElementEffectiveStartDate"],
        elementEffectiveEndDate: json["ElementEffectiveEndDate"],
        jsonCopy: json["JsonCopy"],
        json: json["Json"],
        dataJson: json["DataJson"],
        page: json["Page"],
        pageId: json["PageId"],
        recordId: json["RecordId"],
        portalName: json["PortalName"],
        setUdfValue: json["SetUdfValue"],
        prms: json["Prms"],
        udfs: json["Udfs"],
        readoOnlyUdfs: json["ReadoOnlyUdfs"],
        templateCode: json["TemplateCode"],
        templateDisplayName: json["TemplateDisplayName"],
        noteCount: json["NoteCount"],
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
        actualSla: json["ActualSLA"],
        reminderDate: json["ReminderDate"],
        noteStatusBgCss: noteStatusBgCssValues.map?[json["NoteStatusBgCss"]],
        noteStatusFontCss:
            noteStatusFontCssValues.map?[json["NoteStatusFontCss"]],
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
        activeUserType: json["ActiveUserType"],
        sharedByUserId: json["SharedByUserId"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedListText: json["SharedListText"],
        sharedList: json["SharedList"],
        assignedToUserEmail: json["AssignedToUserEmail"],
        lockStatus: json["LockStatus"],
        parentNoteId: json["ParentNoteId"],
        includeReadonlyData: json["IncludeReadonlyData"],
        isDraftButtonVisible: json["IsDraftButtonVisible"],
        isAcceptButtonVisible: json["IsAcceptButtonVisible"],
        isSubmitButtonVisible: json["IsSubmitButtonVisible"],
        isExpireButtonVisible: json["IsExpireButtonVisible"],
        isInEditMode: json["IsInEditMode"],
        isVersioningButtonVisible: json["IsVersioningButtonVisible"],
        isReplyButtonVisible: json["IsReplyButtonVisible"],
        isBackButtonVisibile: json["IsBackButtonVisibile"],
        isPermittedUser: json["IsPermittedUser"],
        isAddCommentEnabled: json["IsAddCommentEnabled"],
        isAddAttachmentEnabled: json["IsAddAttachmentEnabled"],
        isSharingEnabled: json["IsSharingEnabled"],
        isCompleteButtonVisible: json["IsCompleteButtonVisible"],
        isCloseButtonVisible: json["IsCloseButtonVisible"],
        sharedCount: json["SharedCount"],
        attachmentCount: json["AttachmentCount"],
        notificationCount: json["NotificationCount"],
        commentCount: json["CommentCount"],
        canChangeOwner: json["CanChangeOwner"],
        noteSequenceOrder: json["NoteSequenceOrder"],
        noteDescription: json["NoteDescription"],
        noteSubject: json["NoteSubject"],
        includeSharedList: json["IncludeSharedList"],
        customUrl: json["CustomUrl"],
        returnUrl: json["ReturnUrl"],
        layoutMode: json["LayoutMode"],
        popupCallbackMethod: json["PopupCallbackMethod"],
        noteIndexPageTemplateDetails: json["NoteIndexPageTemplateDetails"],
        notificationTemplate: json["NotificationTemplate"],
        isVersioning: json["IsVersioning"],
        isLogRecord: json["IsLogRecord"],
        chartItems: json["ChartItems"],
        resource: json["Resource"],
        ignorePermission: json["IgnorePermission"],
        previousParentId: json["PreviousParentId"],
        uploadedContent: json["UploadedContent"],
        fileIds: json["FileIds"],
        logId: json["LogId"],
        referenceId: json["ReferenceId"],
        referenceType: json["ReferenceType"],
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
        allReadOnly: json["AllReadOnly"],
        fileName: json["FileName"],
        folderType: json["FolderType"],
        enableIndexPage: json["EnableIndexPage"],
        enableNoteNumberManual: json["EnableNoteNumberManual"],
        enableSaveAsDraft: json["EnableSaveAsDraft"],
        saveAsDraftText: json["SaveAsDraftText"],
        saveAsDraftCss: json["SaveAsDraftCss"],
        completeButtonText: json["CompleteButtonText"],
        completeButtonCss: json["CompleteButtonCss"],
        enableBackButton: json["EnableBackButton"],
        backButtonText: json["BackButtonText"],
        backButtonCss: json["BackButtonCss"],
        enableAttachment: json["EnableAttachment"],
        enableComment: json["EnableComment"],
        disableVersioning: json["DisableVersioning"],
        saveNewVersionButtonText: json["SaveNewVersionButtonText"],
        saveNewVersionButtonCss: json["SaveNewVersionButtonCss"],
        templateId: json["TemplateId"],
        template: json["Template"],
        noteIndexPageTemplateId: json["NoteIndexPageTemplateId"],
        noteIndexPageTemplate: json["NoteIndexPageTemplate"],
        createReturnType: json["CreateReturnType"],
        editReturnType: json["EditReturnType"],
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
        enableCancelButton: json["EnableCancelButton"],
        isCancelReasonRequired: json["IsCancelReasonRequired"],
        cancelButtonText: json["CancelButtonText"],
        cancelButtonCss: json["CancelButtonCss"],
        isUdfTemplate: json["IsUdfTemplate"],
        isCompleteReasonRequired: json["IsCompleteReasonRequired"],
        noteNoText: json["NoteNoText"],
        descriptionText: json["DescriptionText"],
        hideHeader: json["HideHeader"],
        hideSubject: json["HideSubject"],
        hideDescription: json["HideDescription"],
        hideStartDate: json["HideStartDate"],
        hideExpiryDate: json["HideExpiryDate"],
        hidePriority: json["HidePriority"],
        hideOwner: json["HideOwner"],
        isSubjectMandatory: json["IsSubjectMandatory"],
        isSubjectUnique: json["IsSubjectUnique"],
        isDescriptionMandatory: json["IsDescriptionMandatory"],
        hideToolbar: json["HideToolbar"],
        hideBanner: json["HideBanner"],
        allowPastStartDate: json["AllowPastStartDate"],
        enablePrintButton: json["EnablePrintButton"],
        printButtonText: json["PrintButtonText"],
        enableDataPermission: json["EnableDataPermission"],
        dataPermissionColumnId: json["DataPermissionColumnId"],
        numberGenerationType: json["NumberGenerationType"],
        isNumberNotMandatory: json["IsNumberNotMandatory"],
        enableLegalEntityFilter: json["EnableLegalEntityFilter"],
        enablePermission: json["EnablePermission"],
        enableInlineComment: json["EnableInlineComment"],
        adhocTaskTemplateIds: json["AdhocTaskTemplateIds"],
        adhocServiceTemplateIds: json["AdhocServiceTemplateIds"],
        adhocNoteTemplateIds: json["AdhocNoteTemplateIds"],
        noteTemplateType: json["NoteTemplateType"],
        emailCopyTemplateCode: json["EmailCopyTemplateCode"],
        formType: json["FormType"],
        enableSequenceOrder: json["EnableSequenceOrder"],
        subjectMappingUdfId: json["SubjectMappingUdfId"],
        descriptionMappingUdfId: json["DescriptionMappingUdfId"],
        actionButtonPosition: json["ActionButtonPosition"],
        subjectUdfMappingColumn: json["SubjectUdfMappingColumn"],
        descriptionUdfMappingColumn: json["DescriptionUdfMappingColumn"],
        id: json["Id"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        legalEntityId: json["LegalEntityId"] == null
            ? null
            : legalEntityIdValues.map?[json["LegalEntityId"]],
        dataAction: json["DataAction"],
        status: json["Status"],
        versionNo: json["VersionNo"],
        portalId: json["PortalId"],
      );

  Map<String, dynamic> toJson() => {
        "SalaryInfoId": salaryInfoId,
        "ElementId": elementId,
        "ElementName": elementName,
        "ElementCode": elementCode,
        "Amount": amount,
        "EffectiveStartDate": effectiveStartDate?.toIso8601String(),
        "EffectiveEndDate": effectiveEndDate?.toIso8601String(),
        "PersonId": personId,
        "ElementEffectiveStartDate": elementEffectiveStartDate,
        "ElementEffectiveEndDate": elementEffectiveEndDate,
        "JsonCopy": jsonCopy,
        "Json": json,
        "DataJson": dataJson,
        "Page": page,
        "PageId": pageId,
        "RecordId": recordId,
        "PortalName": portalName,
        "SetUdfValue": setUdfValue,
        "Prms": prms,
        "Udfs": udfs,
        "ReadoOnlyUdfs": readoOnlyUdfs,
        "TemplateCode": templateCode,
        "TemplateDisplayName": templateDisplayName,
        "NoteCount": noteCount,
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
        "ActualSLA": actualSla,
        "ReminderDate": reminderDate,
        "NoteStatusBgCss": noteStatusBgCssValues.reverse?[noteStatusBgCss],
        "NoteStatusFontCss":
            noteStatusFontCssValues.reverse?[noteStatusFontCss],
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
        "ActiveUserType": activeUserType,
        "SharedByUserId": sharedByUserId,
        "SharedWithUserId": sharedWithUserId,
        "SharedListText": sharedListText,
        "SharedList": sharedList,
        "AssignedToUserEmail": assignedToUserEmail,
        "LockStatus": lockStatus,
        "ParentNoteId": parentNoteId,
        "IncludeReadonlyData": includeReadonlyData,
        "IsDraftButtonVisible": isDraftButtonVisible,
        "IsAcceptButtonVisible": isAcceptButtonVisible,
        "IsSubmitButtonVisible": isSubmitButtonVisible,
        "IsExpireButtonVisible": isExpireButtonVisible,
        "IsInEditMode": isInEditMode,
        "IsVersioningButtonVisible": isVersioningButtonVisible,
        "IsReplyButtonVisible": isReplyButtonVisible,
        "IsBackButtonVisibile": isBackButtonVisibile,
        "IsPermittedUser": isPermittedUser,
        "IsAddCommentEnabled": isAddCommentEnabled,
        "IsAddAttachmentEnabled": isAddAttachmentEnabled,
        "IsSharingEnabled": isSharingEnabled,
        "IsCompleteButtonVisible": isCompleteButtonVisible,
        "IsCloseButtonVisible": isCloseButtonVisible,
        "SharedCount": sharedCount,
        "AttachmentCount": attachmentCount,
        "NotificationCount": notificationCount,
        "CommentCount": commentCount,
        "CanChangeOwner": canChangeOwner,
        "NoteSequenceOrder": noteSequenceOrder,
        "NoteDescription": noteDescription,
        "NoteSubject": noteSubject,
        "IncludeSharedList": includeSharedList,
        "CustomUrl": customUrl,
        "ReturnUrl": returnUrl,
        "LayoutMode": layoutMode,
        "PopupCallbackMethod": popupCallbackMethod,
        "NoteIndexPageTemplateDetails": noteIndexPageTemplateDetails,
        "NotificationTemplate": notificationTemplate,
        "IsVersioning": isVersioning,
        "IsLogRecord": isLogRecord,
        "ChartItems": chartItems,
        "Resource": resource,
        "IgnorePermission": ignorePermission,
        "PreviousParentId": previousParentId,
        "UploadedContent": uploadedContent,
        "FileIds": fileIds,
        "LogId": logId,
        "ReferenceId": referenceId,
        "ReferenceType": referenceType,
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
        "AllReadOnly": allReadOnly,
        "FileName": fileName,
        "FolderType": folderType,
        "EnableIndexPage": enableIndexPage,
        "EnableNoteNumberManual": enableNoteNumberManual,
        "EnableSaveAsDraft": enableSaveAsDraft,
        "SaveAsDraftText": saveAsDraftText,
        "SaveAsDraftCss": saveAsDraftCss,
        "CompleteButtonText": completeButtonText,
        "CompleteButtonCss": completeButtonCss,
        "EnableBackButton": enableBackButton,
        "BackButtonText": backButtonText,
        "BackButtonCss": backButtonCss,
        "EnableAttachment": enableAttachment,
        "EnableComment": enableComment,
        "DisableVersioning": disableVersioning,
        "SaveNewVersionButtonText": saveNewVersionButtonText,
        "SaveNewVersionButtonCss": saveNewVersionButtonCss,
        "TemplateId": templateId,
        "Template": template,
        "NoteIndexPageTemplateId": noteIndexPageTemplateId,
        "NoteIndexPageTemplate": noteIndexPageTemplate,
        "CreateReturnType": createReturnType,
        "EditReturnType": editReturnType,
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
        "EnableCancelButton": enableCancelButton,
        "IsCancelReasonRequired": isCancelReasonRequired,
        "CancelButtonText": cancelButtonText,
        "CancelButtonCss": cancelButtonCss,
        "IsUdfTemplate": isUdfTemplate,
        "IsCompleteReasonRequired": isCompleteReasonRequired,
        "NoteNoText": noteNoText,
        "DescriptionText": descriptionText,
        "HideHeader": hideHeader,
        "HideSubject": hideSubject,
        "HideDescription": hideDescription,
        "HideStartDate": hideStartDate,
        "HideExpiryDate": hideExpiryDate,
        "HidePriority": hidePriority,
        "HideOwner": hideOwner,
        "IsSubjectMandatory": isSubjectMandatory,
        "IsSubjectUnique": isSubjectUnique,
        "IsDescriptionMandatory": isDescriptionMandatory,
        "HideToolbar": hideToolbar,
        "HideBanner": hideBanner,
        "AllowPastStartDate": allowPastStartDate,
        "EnablePrintButton": enablePrintButton,
        "PrintButtonText": printButtonText,
        "EnableDataPermission": enableDataPermission,
        "DataPermissionColumnId": dataPermissionColumnId,
        "NumberGenerationType": numberGenerationType,
        "IsNumberNotMandatory": isNumberNotMandatory,
        "EnableLegalEntityFilter": enableLegalEntityFilter,
        "EnablePermission": enablePermission,
        "EnableInlineComment": enableInlineComment,
        "AdhocTaskTemplateIds": adhocTaskTemplateIds,
        "AdhocServiceTemplateIds": adhocServiceTemplateIds,
        "AdhocNoteTemplateIds": adhocNoteTemplateIds,
        "NoteTemplateType": noteTemplateType,
        "EmailCopyTemplateCode": emailCopyTemplateCode,
        "FormType": formType,
        "EnableSequenceOrder": enableSequenceOrder,
        "SubjectMappingUdfId": subjectMappingUdfId,
        "DescriptionMappingUdfId": descriptionMappingUdfId,
        "ActionButtonPosition": actionButtonPosition,
        "SubjectUdfMappingColumn": subjectUdfMappingColumn,
        "DescriptionUdfMappingColumn": descriptionUdfMappingColumn,
        "Id": id,
        "CreatedDate": createdDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId == null
            ? null
            : legalEntityIdValues.reverse?[legalEntityId],
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId,
      };
}

enum LegalEntityId { THE_60_D2_DF036755_E8_DE168_D8_DB7 }

final legalEntityIdValues = EnumValues({
  "60d2df036755e8de168d8db7": LegalEntityId.THE_60_D2_DF036755_E8_DE168_D8_DB7
});

enum NoteStatusBgCss { BG_DEFAULT }

final noteStatusBgCssValues =
    EnumValues({"bg-default": NoteStatusBgCss.BG_DEFAULT});

enum NoteStatusFontCss { TEXT_DEFAULT }

final noteStatusFontCssValues =
    EnumValues({"text-default": NoteStatusFontCss.TEXT_DEFAULT});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
