// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
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
    this.taskIndexPageTemplateDetails,
    this.notificationTemplate,
    this.udfTableMetadata,
    this.noteUdfTemplate,
    this.templateViewModel,
    this.taskTemplateVm,
    this.taskTable,
    this.columnList,
    this.activeUserId,
    this.taskNo,
    this.taskId,
    this.taskTableId,
    this.taskNoteTableId,
    this.startDate,
    this.dueDate,
    this.taskSla,
    this.taskSlaSeconds,
    this.slaSeconds,
    this.actualSla,
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
    this.allowSlaChange,
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
    this.hideSla,
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

  dynamic jsonCopy;
  dynamic json;
  dynamic dataJson;
  dynamic page;
  dynamic pageId;
  dynamic recordId;
  dynamic portalName;
  dynamic templateCode;
  dynamic templateDisplayName;
  int taskCount;
  dynamic taskIndexPageTemplateDetails;
  dynamic notificationTemplate;
  dynamic udfTableMetadata;
  dynamic noteUdfTemplate;
  dynamic templateViewModel;
  dynamic taskTemplateVm;
  dynamic taskTable;
  dynamic columnList;
  String activeUserId;
  dynamic taskNo;
  dynamic taskId;
  dynamic taskTableId;
  dynamic taskNoteTableId;
  dynamic startDate;
  dynamic dueDate;
  dynamic taskSla;
  dynamic taskSlaSeconds;
  dynamic slaSeconds;
  String actualSla;
  dynamic reminderDate;
  dynamic planDate;
  String taskStatusBgCss;
  String taskStatusFontCss;
  dynamic taskStatusId;
  dynamic tableMetadataId;
  dynamic udfTableMetadataId;
  dynamic udfNoteId;
  dynamic udfNoteTableId;
  dynamic taskStatusCode;
  dynamic taskStatusName;
  dynamic taskActionId;
  dynamic taskActionCode;
  dynamic taskActionName;
  dynamic taskPriorityId;
  dynamic taskPriorityCode;
  dynamic taskPriorityName;
  dynamic submittedDate;
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
  dynamic requestedByUserId;
  dynamic requestedByUserName;
  dynamic requestedByUserEmail;
  dynamic requestedByUserPhotoId;
  dynamic ownerUserId;
  dynamic ownerUserName;
  dynamic ownerUserEmail;
  dynamic ownerUserPhotoId;
  dynamic taskOwnerTypeId;
  int activeUserType;
  dynamic assignedToTypeId;
  dynamic assignedToTypeCode;
  dynamic assignedToTypeName;
  dynamic assignedToUserId;
  dynamic sharedByUserId;
  dynamic sharedWithUserId;
  dynamic assignedToUserName;
  String sharedListText;
  dynamic sharedList;
  dynamic assignedToUserEmail;
  dynamic assignedToTeamId;
  dynamic assignedToTeamName;
  dynamic assignedToTeamUserId;
  dynamic assignedToTeamUserName;
  dynamic assignedToHierarchyMasterId;
  dynamic assignedToHierarchyMasterName;
  dynamic assignedToHierarchyMasterLevelId;
  dynamic assignedToHierarchyMasterLevelName;
  bool isStepTaskAutoCompleteIfSameAssignee;
  dynamic lockStatusId;
  dynamic lockStatus;
  dynamic parentTaskId;
  dynamic parentServiceId;
  dynamic parentService;
  bool includeReadonlyData;
  bool isDraftButtonVisible;
  bool isAcceptButtonVisible;
  bool isSubmitButtonVisible;
  bool isInEditMode;
  bool isVersioningButtonVisible;
  bool isReplyButtonVisible;
  bool isAddCommentEnabled;
  bool isAddAttachmentEnabled;
  bool isSharingEnabled;
  bool isCompleteButtonVisible;
  bool isTimeEntryButtonVisible;
  bool isRejectButtonVisible;
  bool isCloseButtonVisible;
  int sharedCount;
  int attachmentCount;
  int notificationCount;
  int commentCount;
  dynamic prms;
  dynamic udfs;
  dynamic readoOnlyUdfs;
  bool canChangeOwner;
  dynamic taskSequenceOrder;
  dynamic taskDescription;
  dynamic taskSubject;
  bool includeSharedList;
  dynamic customUrl;
  dynamic returnUrl;
  dynamic layoutMode;
  dynamic popupCallbackMethod;
  dynamic stepTasksList;
  bool hideStepTaskDetails;
  bool isVersioning;
  dynamic stepTaskComponentId;
  dynamic chartItems;
  dynamic subject;
  dynamic notificationSubject;
  dynamic description;
  bool enableIndexPage;
  bool enableTaskNumberManual;
  bool enableSaveAsDraft;
  dynamic saveAsDraftText;
  dynamic saveAsDraftCss;
  dynamic submitButtonText;
  dynamic submitButtonCss;
  dynamic sla;
  bool allowSlaChange;
  dynamic completeButtonText;
  bool isCompleteReasonRequired;
  dynamic completeButtonCss;
  dynamic priorityId;
  dynamic priority;
  bool enableRejectButton;
  bool isRejectReasonRequired;
  dynamic rejectButtonText;
  dynamic rejectButtonCss;
  bool enableBackButton;
  dynamic backButtonText;
  dynamic backButtonCss;
  bool enableAttachment;
  bool enableComment;
  dynamic templateId;
  dynamic template;
  dynamic udfTemplateId;
  dynamic udfTemplate;
  dynamic taskIndexPageTemplateId;
  dynamic taskIndexPageTemplate;
  int createReturnType;
  int editReturnType;
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
  bool enableCancelButton;
  bool isCancelReasonRequired;
  dynamic cancelButtonText;
  dynamic cancelButtonCss;
  bool enableTimeEntry;
  int taskTemplateType;
  dynamic taskNoText;
  dynamic descriptionText;
  bool hideHeader;
  bool hideSubject;
  bool hideDescription;
  bool hideStartDate;
  bool hideDueDate;
  bool hideSla;
  bool hidePriority;
  bool isSubjectMandatory;
  bool isSubjectUnique;
  bool isDescriptionMandatory;
  bool hideToolbar;
  bool hideBanner;
  bool hideOwner;
  bool allowPastStartDate;
  bool enablePrintButton;
  dynamic printButtonText;
  bool enableEmail;
  bool enableDataPermission;
  dynamic dataPermissionColumnId;
  dynamic id;
  DateTime createdDate;
  dynamic createdBy;
  DateTime lastUpdatedDate;
  dynamic lastUpdatedBy;
  bool isDeleted;
  dynamic sequenceOrder;
  dynamic companyId;
  dynamic legalEntityId;
  int dataAction;
  int status;
  int versionNo;
  dynamic portalId;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        jsonCopy: json["JsonCopy"],
        json: json["Json"],
        dataJson: json["DataJson"],
        page: json["Page"],
        pageId: json["PageId"],
        recordId: json["RecordId"],
        portalName: json["PortalName"],
        templateCode: json["TemplateCode"],
        templateDisplayName: json["TemplateDisplayName"],
        taskCount: json["TaskCount"],
        taskIndexPageTemplateDetails: json["TaskIndexPageTemplateDetails"],
        notificationTemplate: json["NotificationTemplate"],
        udfTableMetadata: json["UdfTableMetadata"],
        noteUdfTemplate: json["NoteUdfTemplate"],
        templateViewModel: json["TemplateViewModel"],
        taskTemplateVm: json["TaskTemplateVM"],
        taskTable: json["TaskTable"],
        columnList: json["ColumnList"],
        activeUserId: json["ActiveUserId"],
        taskNo: json["TaskNo"],
        taskId: json["TaskId"],
        taskTableId: json["TaskTableId"],
        taskNoteTableId: json["TaskNoteTableId"],
        startDate: json["StartDate"],
        dueDate: json["DueDate"],
        taskSla: json["TaskSLA"],
        taskSlaSeconds: json["TaskSLASeconds"],
        slaSeconds: json["SLASeconds"],
        actualSla: json["ActualSLA"],
        reminderDate: json["ReminderDate"],
        planDate: json["PlanDate"],
        taskStatusBgCss: json["TaskStatusBgCss"],
        taskStatusFontCss: json["TaskStatusFontCss"],
        taskStatusId: json["TaskStatusId"],
        tableMetadataId: json["TableMetadataId"],
        udfTableMetadataId: json["UdfTableMetadataId"],
        udfNoteId: json["UdfNoteId"],
        udfNoteTableId: json["UdfNoteTableId"],
        taskStatusCode: json["TaskStatusCode"],
        taskStatusName: json["TaskStatusName"],
        taskActionId: json["TaskActionId"],
        taskActionCode: json["TaskActionCode"],
        taskActionName: json["TaskActionName"],
        taskPriorityId: json["TaskPriorityId"],
        taskPriorityCode: json["TaskPriorityCode"],
        taskPriorityName: json["TaskPriorityName"],
        submittedDate: json["SubmittedDate"],
        completedDate: json["CompletedDate"],
        rejectedDate: json["RejectedDate"],
        canceledDate: json["CanceledDate"],
        returnedDate: json["ReturnedDate"],
        reopenedDate: json["ReopenedDate"],
        closedDate: json["ClosedDate"],
        closeComment: json["CloseComment"],
        rejectionReason: json["RejectionReason"],
        returnReason: json["ReturnReason"],
        reopenReason: json["ReopenReason"],
        cancelReason: json["CancelReason"],
        completeReason: json["CompleteReason"],
        delegateReason: json["DelegateReason"],
        requestedByUserId: json["RequestedByUserId"],
        requestedByUserName: json["RequestedByUserName"],
        requestedByUserEmail: json["RequestedByUserEmail"],
        requestedByUserPhotoId: json["RequestedByUserPhotoId"],
        ownerUserId: json["OwnerUserId"],
        ownerUserName: json["OwnerUserName"],
        ownerUserEmail: json["OwnerUserEmail"],
        ownerUserPhotoId: json["OwnerUserPhotoId"],
        taskOwnerTypeId: json["TaskOwnerTypeId"],
        activeUserType: json["ActiveUserType"],
        assignedToTypeId: json["AssignedToTypeId"],
        assignedToTypeCode: json["AssignedToTypeCode"],
        assignedToTypeName: json["AssignedToTypeName"],
        assignedToUserId: json["AssignedToUserId"],
        sharedByUserId: json["SharedByUserId"],
        sharedWithUserId: json["SharedWithUserId"],
        assignedToUserName: json["AssignedToUserName"],
        sharedListText: json["SharedListText"],
        sharedList: json["SharedList"],
        assignedToUserEmail: json["AssignedToUserEmail"],
        assignedToTeamId: json["AssignedToTeamId"],
        assignedToTeamName: json["AssignedToTeamName"],
        assignedToTeamUserId: json["AssignedToTeamUserId"],
        assignedToTeamUserName: json["AssignedToTeamUserName"],
        assignedToHierarchyMasterId: json["AssignedToHierarchyMasterId"],
        assignedToHierarchyMasterName: json["AssignedToHierarchyMasterName"],
        assignedToHierarchyMasterLevelId:
            json["AssignedToHierarchyMasterLevelId"],
        assignedToHierarchyMasterLevelName:
            json["AssignedToHierarchyMasterLevelName"],
        isStepTaskAutoCompleteIfSameAssignee:
            json["IsStepTaskAutoCompleteIfSameAssignee"],
        lockStatusId: json["LockStatusId"],
        lockStatus: json["LockStatus"],
        parentTaskId: json["ParentTaskId"],
        parentServiceId: json["ParentServiceId"],
        parentService: json["ParentService"],
        includeReadonlyData: json["IncludeReadonlyData"],
        isDraftButtonVisible: json["IsDraftButtonVisible"],
        isAcceptButtonVisible: json["IsAcceptButtonVisible"],
        isSubmitButtonVisible: json["IsSubmitButtonVisible"],
        isInEditMode: json["IsInEditMode"],
        isVersioningButtonVisible: json["IsVersioningButtonVisible"],
        isReplyButtonVisible: json["IsReplyButtonVisible"],
        isAddCommentEnabled: json["IsAddCommentEnabled"],
        isAddAttachmentEnabled: json["IsAddAttachmentEnabled"],
        isSharingEnabled: json["IsSharingEnabled"],
        isCompleteButtonVisible: json["IsCompleteButtonVisible"],
        isTimeEntryButtonVisible: json["IsTimeEntryButtonVisible"],
        isRejectButtonVisible: json["IsRejectButtonVisible"],
        isCloseButtonVisible: json["IsCloseButtonVisible"],
        sharedCount: json["SharedCount"],
        attachmentCount: json["AttachmentCount"],
        notificationCount: json["NotificationCount"],
        commentCount: json["CommentCount"],
        prms: json["Prms"],
        udfs: json["Udfs"],
        readoOnlyUdfs: json["ReadoOnlyUdfs"],
        canChangeOwner: json["CanChangeOwner"],
        taskSequenceOrder: json["TaskSequenceOrder"],
        taskDescription: json["TaskDescription"],
        taskSubject: json["TaskSubject"],
        includeSharedList: json["IncludeSharedList"],
        customUrl: json["CustomUrl"],
        returnUrl: json["ReturnUrl"],
        layoutMode: json["LayoutMode"],
        popupCallbackMethod: json["PopupCallbackMethod"],
        stepTasksList: json["StepTasksList"],
        hideStepTaskDetails: json["HideStepTaskDetails"],
        isVersioning: json["IsVersioning"],
        stepTaskComponentId: json["StepTaskComponentId"],
        chartItems: json["ChartItems"],
        subject: json["Subject"],
        notificationSubject: json["NotificationSubject"],
        description: json["Description"],
        enableIndexPage: json["EnableIndexPage"],
        enableTaskNumberManual: json["EnableTaskNumberManual"],
        enableSaveAsDraft: json["EnableSaveAsDraft"],
        saveAsDraftText: json["SaveAsDraftText"],
        saveAsDraftCss: json["SaveAsDraftCss"],
        submitButtonText: json["SubmitButtonText"],
        submitButtonCss: json["SubmitButtonCss"],
        sla: json["SLA"],
        allowSlaChange: json["AllowSLAChange"],
        completeButtonText: json["CompleteButtonText"],
        isCompleteReasonRequired: json["IsCompleteReasonRequired"],
        completeButtonCss: json["CompleteButtonCss"],
        priorityId: json["PriorityId"],
        priority: json["Priority"],
        enableRejectButton: json["EnableRejectButton"],
        isRejectReasonRequired: json["IsRejectReasonRequired"],
        rejectButtonText: json["RejectButtonText"],
        rejectButtonCss: json["RejectButtonCss"],
        enableBackButton: json["EnableBackButton"],
        backButtonText: json["BackButtonText"],
        backButtonCss: json["BackButtonCss"],
        enableAttachment: json["EnableAttachment"],
        enableComment: json["EnableComment"],
        templateId: json["TemplateId"],
        template: json["Template"],
        udfTemplateId: json["UdfTemplateId"],
        udfTemplate: json["UdfTemplate"],
        taskIndexPageTemplateId: json["TaskIndexPageTemplateId"],
        taskIndexPageTemplate: json["TaskIndexPageTemplate"],
        createReturnType: json["CreateReturnType"],
        editReturnType: json["EditReturnType"],
        preScript: json["PreScript"],
        postScript: json["PostScript"],
        iconFileId: json["IconFileId"],
        templateColor: json["TemplateColor"],
        bannerFileId: json["BannerFileId"],
        backgroundFileId: json["BackgroundFileId"],
        subjectText: json["SubjectText"],
        ownerUserText: json["OwnerUserText"],
        requestedByUserText: json["RequestedByUserText"],
        assignedToUserText: json["AssignedToUserText"],
        enableCancelButton: json["EnableCancelButton"],
        isCancelReasonRequired: json["IsCancelReasonRequired"],
        cancelButtonText: json["CancelButtonText"],
        cancelButtonCss: json["CancelButtonCss"],
        enableTimeEntry: json["EnableTimeEntry"],
        taskTemplateType: json["TaskTemplateType"],
        taskNoText: json["TaskNoText"],
        descriptionText: json["DescriptionText"],
        hideHeader: json["HideHeader"],
        hideSubject: json["HideSubject"],
        hideDescription: json["HideDescription"],
        hideStartDate: json["HideStartDate"],
        hideDueDate: json["HideDueDate"],
        hideSla: json["HideSLA"],
        hidePriority: json["HidePriority"],
        isSubjectMandatory: json["IsSubjectMandatory"],
        isSubjectUnique: json["IsSubjectUnique"],
        isDescriptionMandatory: json["IsDescriptionMandatory"],
        hideToolbar: json["HideToolbar"],
        hideBanner: json["HideBanner"],
        hideOwner: json["HideOwner"],
        allowPastStartDate: json["AllowPastStartDate"],
        enablePrintButton: json["EnablePrintButton"],
        printButtonText: json["PrintButtonText"],
        enableEmail: json["EnableEmail"],
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
        "TemplateCode": templateCode,
        "TemplateDisplayName": templateDisplayName,
        "TaskCount": taskCount,
        "TaskIndexPageTemplateDetails": taskIndexPageTemplateDetails,
        "NotificationTemplate": notificationTemplate,
        "UdfTableMetadata": udfTableMetadata,
        "NoteUdfTemplate": noteUdfTemplate,
        "TemplateViewModel": templateViewModel,
        "TaskTemplateVM": taskTemplateVm,
        "TaskTable": taskTable,
        "ColumnList": columnList,
        "ActiveUserId": activeUserId,
        "TaskNo": taskNo,
        "TaskId": taskId,
        "TaskTableId": taskTableId,
        "TaskNoteTableId": taskNoteTableId,
        "StartDate": startDate,
        "DueDate": dueDate,
        "TaskSLA": taskSla,
        "TaskSLASeconds": taskSlaSeconds,
        "SLASeconds": slaSeconds,
        "ActualSLA": actualSla,
        "ReminderDate": reminderDate,
        "PlanDate": planDate,
        "TaskStatusBgCss": taskStatusBgCss,
        "TaskStatusFontCss": taskStatusFontCss,
        "TaskStatusId": taskStatusId,
        "TableMetadataId": tableMetadataId,
        "UdfTableMetadataId": udfTableMetadataId,
        "UdfNoteId": udfNoteId,
        "UdfNoteTableId": udfNoteTableId,
        "TaskStatusCode": taskStatusCode,
        "TaskStatusName": taskStatusName,
        "TaskActionId": taskActionId,
        "TaskActionCode": taskActionCode,
        "TaskActionName": taskActionName,
        "TaskPriorityId": taskPriorityId,
        "TaskPriorityCode": taskPriorityCode,
        "TaskPriorityName": taskPriorityName,
        "SubmittedDate": submittedDate,
        "CompletedDate": completedDate,
        "RejectedDate": rejectedDate,
        "CanceledDate": canceledDate,
        "ReturnedDate": returnedDate,
        "ReopenedDate": reopenedDate,
        "ClosedDate": closedDate,
        "CloseComment": closeComment,
        "RejectionReason": rejectionReason,
        "ReturnReason": returnReason,
        "ReopenReason": reopenReason,
        "CancelReason": cancelReason,
        "CompleteReason": completeReason,
        "DelegateReason": delegateReason,
        "RequestedByUserId": requestedByUserId,
        "RequestedByUserName": requestedByUserName,
        "RequestedByUserEmail": requestedByUserEmail,
        "RequestedByUserPhotoId": requestedByUserPhotoId,
        "OwnerUserId": ownerUserId,
        "OwnerUserName": ownerUserName,
        "OwnerUserEmail": ownerUserEmail,
        "OwnerUserPhotoId": ownerUserPhotoId,
        "TaskOwnerTypeId": taskOwnerTypeId,
        "ActiveUserType": activeUserType,
        "AssignedToTypeId": assignedToTypeId,
        "AssignedToTypeCode": assignedToTypeCode,
        "AssignedToTypeName": assignedToTypeName,
        "AssignedToUserId": assignedToUserId,
        "SharedByUserId": sharedByUserId,
        "SharedWithUserId": sharedWithUserId,
        "AssignedToUserName": assignedToUserName,
        "SharedListText": sharedListText,
        "SharedList": sharedList,
        "AssignedToUserEmail": assignedToUserEmail,
        "AssignedToTeamId": assignedToTeamId,
        "AssignedToTeamName": assignedToTeamName,
        "AssignedToTeamUserId": assignedToTeamUserId,
        "AssignedToTeamUserName": assignedToTeamUserName,
        "AssignedToHierarchyMasterId": assignedToHierarchyMasterId,
        "AssignedToHierarchyMasterName": assignedToHierarchyMasterName,
        "AssignedToHierarchyMasterLevelId": assignedToHierarchyMasterLevelId,
        "AssignedToHierarchyMasterLevelName":
            assignedToHierarchyMasterLevelName,
        "IsStepTaskAutoCompleteIfSameAssignee":
            isStepTaskAutoCompleteIfSameAssignee,
        "LockStatusId": lockStatusId,
        "LockStatus": lockStatus,
        "ParentTaskId": parentTaskId,
        "ParentServiceId": parentServiceId,
        "ParentService": parentService,
        "IncludeReadonlyData": includeReadonlyData,
        "IsDraftButtonVisible": isDraftButtonVisible,
        "IsAcceptButtonVisible": isAcceptButtonVisible,
        "IsSubmitButtonVisible": isSubmitButtonVisible,
        "IsInEditMode": isInEditMode,
        "IsVersioningButtonVisible": isVersioningButtonVisible,
        "IsReplyButtonVisible": isReplyButtonVisible,
        "IsAddCommentEnabled": isAddCommentEnabled,
        "IsAddAttachmentEnabled": isAddAttachmentEnabled,
        "IsSharingEnabled": isSharingEnabled,
        "IsCompleteButtonVisible": isCompleteButtonVisible,
        "IsTimeEntryButtonVisible": isTimeEntryButtonVisible,
        "IsRejectButtonVisible": isRejectButtonVisible,
        "IsCloseButtonVisible": isCloseButtonVisible,
        "SharedCount": sharedCount,
        "AttachmentCount": attachmentCount,
        "NotificationCount": notificationCount,
        "CommentCount": commentCount,
        "Prms": prms,
        "Udfs": udfs,
        "ReadoOnlyUdfs": readoOnlyUdfs,
        "CanChangeOwner": canChangeOwner,
        "TaskSequenceOrder": taskSequenceOrder,
        "TaskDescription": taskDescription,
        "TaskSubject": taskSubject,
        "IncludeSharedList": includeSharedList,
        "CustomUrl": customUrl,
        "ReturnUrl": returnUrl,
        "LayoutMode": layoutMode,
        "PopupCallbackMethod": popupCallbackMethod,
        "StepTasksList": stepTasksList,
        "HideStepTaskDetails": hideStepTaskDetails,
        "IsVersioning": isVersioning,
        "StepTaskComponentId": stepTaskComponentId,
        "ChartItems": chartItems,
        "Subject": subject,
        "NotificationSubject": notificationSubject,
        "Description": description,
        "EnableIndexPage": enableIndexPage,
        "EnableTaskNumberManual": enableTaskNumberManual,
        "EnableSaveAsDraft": enableSaveAsDraft,
        "SaveAsDraftText": saveAsDraftText,
        "SaveAsDraftCss": saveAsDraftCss,
        "SubmitButtonText": submitButtonText,
        "SubmitButtonCss": submitButtonCss,
        "SLA": sla,
        "AllowSLAChange": allowSlaChange,
        "CompleteButtonText": completeButtonText,
        "IsCompleteReasonRequired": isCompleteReasonRequired,
        "CompleteButtonCss": completeButtonCss,
        "PriorityId": priorityId,
        "Priority": priority,
        "EnableRejectButton": enableRejectButton,
        "IsRejectReasonRequired": isRejectReasonRequired,
        "RejectButtonText": rejectButtonText,
        "RejectButtonCss": rejectButtonCss,
        "EnableBackButton": enableBackButton,
        "BackButtonText": backButtonText,
        "BackButtonCss": backButtonCss,
        "EnableAttachment": enableAttachment,
        "EnableComment": enableComment,
        "TemplateId": templateId,
        "Template": template,
        "UdfTemplateId": udfTemplateId,
        "UdfTemplate": udfTemplate,
        "TaskIndexPageTemplateId": taskIndexPageTemplateId,
        "TaskIndexPageTemplate": taskIndexPageTemplate,
        "CreateReturnType": createReturnType,
        "EditReturnType": editReturnType,
        "PreScript": preScript,
        "PostScript": postScript,
        "IconFileId": iconFileId,
        "TemplateColor": templateColor,
        "BannerFileId": bannerFileId,
        "BackgroundFileId": backgroundFileId,
        "SubjectText": subjectText,
        "OwnerUserText": ownerUserText,
        "RequestedByUserText": requestedByUserText,
        "AssignedToUserText": assignedToUserText,
        "EnableCancelButton": enableCancelButton,
        "IsCancelReasonRequired": isCancelReasonRequired,
        "CancelButtonText": cancelButtonText,
        "CancelButtonCss": cancelButtonCss,
        "EnableTimeEntry": enableTimeEntry,
        "TaskTemplateType": taskTemplateType,
        "TaskNoText": taskNoText,
        "DescriptionText": descriptionText,
        "HideHeader": hideHeader,
        "HideSubject": hideSubject,
        "HideDescription": hideDescription,
        "HideStartDate": hideStartDate,
        "HideDueDate": hideDueDate,
        "HideSLA": hideSla,
        "HidePriority": hidePriority,
        "IsSubjectMandatory": isSubjectMandatory,
        "IsSubjectUnique": isSubjectUnique,
        "IsDescriptionMandatory": isDescriptionMandatory,
        "HideToolbar": hideToolbar,
        "HideBanner": hideBanner,
        "HideOwner": hideOwner,
        "AllowPastStartDate": allowPastStartDate,
        "EnablePrintButton": enablePrintButton,
        "PrintButtonText": printButtonText,
        "EnableEmail": enableEmail,
        "EnableDataPermission": enableDataPermission,
        "DataPermissionColumnId": dataPermissionColumnId,
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
