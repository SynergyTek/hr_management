import 'dart:convert';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
  NoteModel({
    this.jsonCopy,
    this.json,
    this.dataJson,
    this.page,
    this.pageId,
    this.recordId,
    this.portalName,
    this.prms,
    this.udfs,
    this.readoOnlyUdfs,
    this.templateCode,
    this.templateDisplayName,
    this.noteCount,
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
    this.chartItems,
    this.resource,
    this.ignorePermission,
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
    this.moveToParent,
    this.movePostionEnum,
    this.bookMoveTypeEnum,
    this.ntsType,
    this.ntsId,
  });

  dynamic jsonCopy;
  String? json;
  dynamic dataJson;
  dynamic page;
  dynamic pageId;
  dynamic recordId;
  dynamic portalName;
  dynamic prms;
  dynamic udfs;
  dynamic readoOnlyUdfs;
  String? templateCode;
  String? templateDisplayName;
  int? noteCount;
  dynamic noteTemplateVm;
  dynamic templateViewModel;
  dynamic noteTable;
  List<ColumnList>? columnList;
  dynamic parentTemplateId;
  String? activeUserId;
  String? noteNo;
  String? noteId;
  String? udfNoteTableId;
  String? startDate;
  dynamic expiryDate;
  dynamic slaSeconds;
  String? actualSla;
  dynamic reminderDate;
  String? noteStatusBgCss;
  String? noteStatusFontCss;
  String? noteStatusId;
  String? tableMetadataId;
  String? noteStatusCode;
  String? noteStatusName;
  String? noteActionId;
  String? noteActionCode;
  String? noteActionName;
  String? notePriorityId;
  String? notePriorityCode;
  String? notePriorityName;
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
  String? requestedByUserId;
  String? requestedByUserName;
  String? requestedByUserEmail;
  String? requestedByUserPhotoId;
  String? ownerUserId;
  String? ownerUserName;
  String? ownerUserEmail;
  String? ownerUserPhotoId;
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
  String? noteSubject;
  bool? includeSharedList;
  dynamic customUrl;
  dynamic returnUrl;
  dynamic layoutMode;
  dynamic popupCallbackMethod;
  dynamic noteIndexPageTemplateDetails;
  dynamic notificationTemplate;
  bool? isVersioning;
  dynamic chartItems;
  dynamic resource;
  bool? ignorePermission;
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
  String? templateId;
  dynamic template;
  String? noteIndexPageTemplateId;
  dynamic noteIndexPageTemplate;
  int? createReturnType;
  int? editReturnType;
  dynamic preScript;
  dynamic postScript;
  dynamic iconFileId;
  dynamic templateColor;
  dynamic bannerFileId;
  dynamic backgroundFileId;
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
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  int? sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  dynamic portalId;
  String? moveToParent;
  String? movePostionEnum;
  String? bookMoveTypeEnum;
  String? ntsType;
  String? ntsId;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        jsonCopy: json["JsonCopy"],
        json: json["Json"],
        dataJson: json["DataJson"],
        page: json["Page"],
        pageId: json["PageId"],
        recordId: json["RecordId"],
        portalName: json["PortalName"],
        prms: json["Prms"],
        udfs: json["Udfs"],
        readoOnlyUdfs: json["ReadoOnlyUdfs"],
        templateCode: json["TemplateCode"],
        templateDisplayName: json["TemplateDisplayName"],
        noteCount: json["NoteCount"],
        noteTemplateVm: json["NoteTemplateVM"],
        templateViewModel: json["TemplateViewModel"],
        noteTable: json["NoteTable"],
        columnList: json["ColumnList"] != null
            ? List<ColumnList>.from(
                json["ColumnList"].map((x) => ColumnList.fromJson(x)))
            : null,
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
        noteStatusBgCss: json["NoteStatusBgCss"],
        noteStatusFontCss: json["NoteStatusFontCss"],
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
        chartItems: json["ChartItems"],
        resource: json["Resource"],
        ignorePermission: json["IgnorePermission"],
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
        "JsonCopy": jsonCopy,
        "Json": json,
        "DataJson": dataJson,
        "Page": page,
        "PageId": pageId,
        "RecordId": recordId,
        "PortalName": portalName,
        "Prms": prms,
        "Udfs": udfs,
        "ReadoOnlyUdfs": readoOnlyUdfs,
        "TemplateCode": templateCode,
        "TemplateDisplayName": templateDisplayName,
        "NoteCount": noteCount,
        "NoteTemplateVM": noteTemplateVm,
        "TemplateViewModel": templateViewModel,
        "NoteTable": noteTable,
        "ColumnList": List<dynamic>.from(columnList!.map((x) => x.toJson())),
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
        "NoteStatusBgCss": noteStatusBgCss,
        "NoteStatusFontCss": noteStatusFontCss,
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
        "ChartItems": chartItems,
        "Resource": resource,
        "IgnorePermission": ignorePermission,
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
        "Id": id,
        "CreatedDate": createdDate!.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate!.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId,
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId,
        "MoveToParent": moveToParent,
        "MovePostionEnum": movePostionEnum,
        "BookMoveTypeEnum": bookMoveTypeEnum,
        "NtsType": ntsType,
        "NtsId": ntsId,
      };
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
    this.tableSchemaName,
    this.tableAliasName,
    this.tableMetadataName,
    this.isVisible,
    this.isEditable,
    this.activeUserType,
    this.ntsStatusCode,
    this.isChecked,
    this.ignorePermission,
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
  dynamic tableSchemaName;
  dynamic tableAliasName;
  dynamic tableMetadataName;
  bool? isVisible;
  bool? isEditable;
  int? activeUserType;
  String? ntsStatusCode;
  bool? isChecked;
  bool? ignorePermission;
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
  dynamic referenceTableName;
  dynamic referenceTableSchemaName;
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
  List<String>? editableBy;
  List<dynamic>? viewableBy;
  List<dynamic>? editableContext;
  List<dynamic>? viewableContext;
  bool? showInForeignKeyReference;
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  dynamic sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  dynamic portalId;

  factory ColumnList.fromJson(Map<String, dynamic> json) => ColumnList(
        foreignKeyTableId: json["ForeignKeyTableId"] == null
            ? null
            : json["ForeignKeyTableId"],
        foreignKeyTableName: json["ForeignKeyTableName"] == null
            ? null
            : json["ForeignKeyTableName"],
        foreignKeyColumnId: json["ForeignKeyColumnId"] == null
            ? null
            : json["ForeignKeyColumnId"],
        foreignKeyColumnName: json["ForeignKeyColumnName"] == null
            ? null
            : json["ForeignKeyColumnName"],
        foreignKeyDisplayColumnId: json["ForeignKeyDisplayColumnId"],
        foreignKeyDisplayColumnName: json["ForeignKeyDisplayColumnName"] == null
            ? null
            : json["ForeignKeyDisplayColumnName"],
        dataTypestr: json["DataTypestr"],
        value: json["Value"],
        isForeignKeyTableColumn: json["IsForeignKeyTableColumn"],
        tableName: json["TableName"],
        tableSchemaName: json["TableSchemaName"],
        tableAliasName: json["TableAliasName"],
        tableMetadataName: json["TableMetadataName"],
        isVisible: json["IsVisible"],
        isEditable: json["IsEditable"],
        activeUserType:
            json["ActiveUserType"] == null ? null : json["ActiveUserType"],
        ntsStatusCode:
            json["NtsStatusCode"] == null ? null : json["NtsStatusCode"],
        isChecked: json["IsChecked"],
        ignorePermission: json["IgnorePermission"],
        name: json["Name"],
        isDefaultDisplayColumn: json["IsDefaultDisplayColumn"],
        labelName: json["LabelName"],
        alias: json["Alias"],
        isNullable: json["IsNullable"],
        dataType: json["DataType"],
        udfUiType: json["UdfUIType"],
        isForeignKey: json["IsForeignKey"],
        isVirtualColumn: json["IsVirtualColumn"],
        isVirtualForeignKey: json["IsVirtualForeignKey"],
        isPrimaryKey: json["IsPrimaryKey"],
        isSystemColumn: json["IsSystemColumn"],
        isUniqueColumn: json["IsUniqueColumn"],
        isLogColumn: json["IsLogColumn"],
        isUdfColumn: json["IsUdfColumn"],
        isHiddenColumn: json["IsHiddenColumn"],
        hideForeignKeyTableColumns: json["HideForeignKeyTableColumns"],
        isReferenceColumn: json["IsReferenceColumn"],
        referenceTableName: json["ReferenceTableName"],
        referenceTableSchemaName: json["ReferenceTableSchemaName"],
        foreignKeyTable: json["ForeignKeyTable"],
        foreignKeyTableAliasName: json["ForeignKeyTableAliasName"] == null
            ? null
            : json["ForeignKeyTableAliasName"],
        foreignKeyTableSchemaName: json["ForeignKeyTableSchemaName"] == null
            ? null
            : json["ForeignKeyTableSchemaName"],
        foreignKeyDisplayColumnReferenceId:
            json["ForeignKeyDisplayColumnReferenceId"],
        foreignKeyColumn: json["ForeignKeyColumn"],
        foreignKeyDisplayColumn: json["ForeignKeyDisplayColumn"],
        foreignKeyDisplayColumnLabelName:
            json["ForeignKeyDisplayColumnLabelName"] == null
                ? null
                : json["ForeignKeyDisplayColumnLabelName"],
        foreignKeyDisplayColumnAlias:
            json["ForeignKeyDisplayColumnAlias"] == null
                ? null
                : json["ForeignKeyDisplayColumnAlias"],
        foreignKeyDisplayColumnDataType:
            json["ForeignKeyDisplayColumnDataType"],
        foreignKeyConstraintName: json["ForeignKeyConstraintName"] == null
            ? null
            : json["ForeignKeyConstraintName"],
        tableMetadataId: json["TableMetadataId"],
        tableMetadata: json["TableMetadata"],
        editableBy: List<String>.from(json["EditableBy"].map((x) => x)),
        viewableBy: List<dynamic>.from(json["ViewableBy"].map((x) => x)),
        editableContext:
            List<dynamic>.from(json["EditableContext"].map((x) => x)),
        viewableContext:
            List<dynamic>.from(json["ViewableContext"].map((x) => x)),
        showInForeignKeyReference: json["ShowInForeignKeyReference"],
        id: json["Id"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        legalEntityId:
            json["LegalEntityId"] == null ? null : json["LegalEntityId"],
        dataAction: json["DataAction"],
        status: json["Status"],
        versionNo: json["VersionNo"],
        portalId: json["PortalId"],
      );

  Map<String, dynamic> toJson() => {
        "ForeignKeyTableId":
            foreignKeyTableId == null ? null : foreignKeyTableId,
        "ForeignKeyTableName":
            foreignKeyTableName == null ? null : foreignKeyTableName,
        "ForeignKeyColumnId":
            foreignKeyColumnId == null ? null : foreignKeyColumnId,
        "ForeignKeyColumnName":
            foreignKeyColumnName == null ? null : foreignKeyColumnName,
        "ForeignKeyDisplayColumnId": foreignKeyDisplayColumnId,
        "ForeignKeyDisplayColumnName": foreignKeyDisplayColumnName == null
            ? null
            : foreignKeyDisplayColumnName,
        "DataTypestr": dataTypestr,
        "Value": value,
        "IsForeignKeyTableColumn": isForeignKeyTableColumn,
        "TableName": tableName,
        "TableSchemaName": tableSchemaName,
        "TableAliasName": tableAliasName,
        "TableMetadataName": tableMetadataName,
        "IsVisible": isVisible,
        "IsEditable": isEditable,
        "ActiveUserType": activeUserType == null ? null : activeUserType,
        "NtsStatusCode": ntsStatusCode == null ? null : ntsStatusCode,
        "IsChecked": isChecked,
        "IgnorePermission": ignorePermission,
        "Name": name,
        "IsDefaultDisplayColumn": isDefaultDisplayColumn,
        "LabelName": labelName,
        "Alias": alias,
        "IsNullable": isNullable,
        "DataType": dataType,
        "UdfUIType": udfUiType,
        "IsForeignKey": isForeignKey,
        "IsVirtualColumn": isVirtualColumn,
        "IsVirtualForeignKey": isVirtualForeignKey,
        "IsPrimaryKey": isPrimaryKey,
        "IsSystemColumn": isSystemColumn,
        "IsUniqueColumn": isUniqueColumn,
        "IsLogColumn": isLogColumn,
        "IsUdfColumn": isUdfColumn,
        "IsHiddenColumn": isHiddenColumn,
        "HideForeignKeyTableColumns": hideForeignKeyTableColumns,
        "IsReferenceColumn": isReferenceColumn,
        "ReferenceTableName": referenceTableName,
        "ReferenceTableSchemaName": referenceTableSchemaName,
        "ForeignKeyTable": foreignKeyTable,
        "ForeignKeyTableAliasName":
            foreignKeyTableAliasName == null ? null : foreignKeyTableAliasName,
        "ForeignKeyTableSchemaName": foreignKeyTableSchemaName == null
            ? null
            : foreignKeyTableSchemaName,
        "ForeignKeyDisplayColumnReferenceId":
            foreignKeyDisplayColumnReferenceId,
        "ForeignKeyColumn": foreignKeyColumn,
        "ForeignKeyDisplayColumn": foreignKeyDisplayColumn,
        "ForeignKeyDisplayColumnLabelName":
            foreignKeyDisplayColumnLabelName == null
                ? null
                : foreignKeyDisplayColumnLabelName,
        "ForeignKeyDisplayColumnAlias": foreignKeyDisplayColumnAlias == null
            ? null
            : foreignKeyDisplayColumnAlias,
        "ForeignKeyDisplayColumnDataType": foreignKeyDisplayColumnDataType,
        "ForeignKeyConstraintName":
            foreignKeyConstraintName == null ? null : foreignKeyConstraintName,
        "TableMetadataId": tableMetadataId,
        "TableMetadata": tableMetadata,
        "EditableBy": List<dynamic>.from(editableBy!.map((x) => x)),
        "ViewableBy": List<dynamic>.from(viewableBy!.map((x) => x)),
        "EditableContext": List<dynamic>.from(editableContext!.map((x) => x)),
        "ViewableContext": List<dynamic>.from(viewableContext!.map((x) => x)),
        "ShowInForeignKeyReference": showInForeignKeyReference,
        "Id": id,
        "CreatedDate": createdDate!.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate!.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId == null ? null : legalEntityId,
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId,
      };
}
