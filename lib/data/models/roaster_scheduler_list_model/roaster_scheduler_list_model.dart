// To parse this JSON data, do
//
//     final roasterSchedulerListModel = roasterSchedulerListModelFromJson(jsonString);

import 'dart:convert';

import 'package:hr_management/data/models/task_models/task_list_model.dart';

List<RoasterSchedulerListModel> roasterSchedulerListModelFromJson(String str) =>
    List<RoasterSchedulerListModel>.from(
        json.decode(str).map((x) => RoasterSchedulerListModel.fromJson(x)));

String roasterSchedulerListModelToJson(List<RoasterSchedulerListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoasterSchedulerListModel {
  RoasterSchedulerListModel({
    this.legalEntityCode,
    this.rosterDate,
    this.weekDateString,
    this.rosterDutyType,
    this.duty1Enabled,
    this.duty1StartTime,
    this.duty1EndTime,
    this.duty1FallsNextDay,
    this.duty2Enabled,
    this.duty2StartTime,
    this.duty2EndTime,
    this.duty2FallsNextDay,
    this.duty3Enabled,
    this.duty3StartTime,
    this.duty3EndTime,
    this.duty3FallsNextDay,
    this.totalHours,
    this.draftRosterDutyType,
    this.draftDuty1Enabled,
    this.draftDuty1StartTime,
    this.draftDuty1EndTime,
    this.draftDuty1FallsNextDay,
    this.draftDuty2Enabled,
    this.draftDuty2StartTime,
    this.draftDuty2EndTime,
    this.draftDuty2FallsNextDay,
    this.draftDuty3Enabled,
    this.draftDuty3StartTime,
    this.draftDuty3EndTime,
    this.draftDuty3FallsNextDay,
    this.draftTotalHours,
    this.publishStatus,
    this.isDraft,
    this.publishDate,
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sundayHours,
    this.mondayHours,
    this.tuesdayHours,
    this.wednesdayHours,
    this.thursdayHours,
    this.fridayHours,
    this.saturdayHours,
    this.employeeNo,
    this.personId,
    this.isAttendanceCalculated,
    this.biometricId,
    this.dutyText,
    this.employeeName,
    this.userNameWithEmail,
    this.email,
    this.iqamahNo,
    this.displayName,
    this.organizationName,
    this.jobName,
    this.gradeName,
    this.nationality,
    this.organizationId,
    this.sectionId,
    this.sectionName,
    this.subSectionId,
    this.subSectionName,
    this.userId,
    this.assignmentId,
    this.userIds,
    this.rosterDates,
    this.leaveList,
    this.sundayText,
    this.copyToWeeks,
    this.mondayText,
    this.tuesdayText,
    this.wednesdayText,
    this.thursdayText,
    this.fridayText,
    this.saturdayText,
    this.sundayTotalHours,
    this.mondayTotalHours,
    this.tuesdayTotalHours,
    this.wednesdayTotalHours,
    this.thursdayTotalHours,
    this.fridayTotalHours,
    this.saturdayTotalHours,
    this.sumOfWeekHours,
    this.weekDisplayName,
    this.publishWhileCopying,
    this.contractEndDate,
    this.contractRenewable,
    this.sponsor,
    this.dayOff1,
    this.dayOff2,
    this.dayOff3,
    this.dayOff4,
    this.dayOff5,
    this.dayOff6,
    this.dayOff7,
    this.draft1,
    this.draft2,
    this.draft3,
    this.draft4,
    this.draft5,
    this.draft6,
    this.draft7,
    this.count1,
    this.count2,
    this.count3,
    this.count4,
    this.count5,
    this.count6,
    this.count7,
    this.userList,
    this.sundayReporting,
    this.mondayReporting,
    this.tuesdayReporting,
    this.wednesdayReporting,
    this.thursdayReporting,
    this.fridayReporting,
    this.saturdayReporting,
    this.personNo,
    this.sponsorshipNo,
    this.shiftPatternName,
    this.rostarStatus1,
    this.rostarStatus2,
    this.rostarStatus3,
    this.rostarStatus4,
    this.rostarStatus5,
    this.rostarStatus6,
    this.rostarStatus7,
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
    this.hiddenUdfs,
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
    this.isUserGuide,
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
    this.localizedColumnId,
    this.localizedColumn,
    this.displayColumnId,
    this.displayColumn,
    this.formClientScript,
    this.enableAuditLog,
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
    this.taskList,
   
  });

  dynamic legalEntityCode;
  DateTime? rosterDate;
  dynamic weekDateString;
  int? rosterDutyType;
  bool? duty1Enabled;
  String? duty1StartTime;
  String? duty1EndTime;
  bool? duty1FallsNextDay;
  bool? duty2Enabled;
  dynamic duty2StartTime;
  dynamic duty2EndTime;
  bool? duty2FallsNextDay;
  bool? duty3Enabled;
  dynamic duty3StartTime;
  dynamic duty3EndTime;
  bool? duty3FallsNextDay;
  dynamic totalHours;
  int? draftRosterDutyType;
  bool? draftDuty1Enabled;
  String? draftDuty1StartTime;
  String? draftDuty1EndTime;
  bool? draftDuty1FallsNextDay;
  bool? draftDuty2Enabled;
  dynamic draftDuty2StartTime;
  dynamic draftDuty2EndTime;
  bool? draftDuty2FallsNextDay;
  bool? draftDuty3Enabled;
  dynamic draftDuty3StartTime;
  dynamic draftDuty3EndTime;
  bool? draftDuty3FallsNextDay;
  String? draftTotalHours;
  int? publishStatus;
  bool? isDraft;
  DateTime? publishDate;
  dynamic sunday;
  dynamic monday;
  dynamic tuesday;
  dynamic wednesday;
  dynamic thursday;
  dynamic friday;
  dynamic saturday;
  dynamic sundayHours;
  dynamic mondayHours;
  dynamic tuesdayHours;
  dynamic wednesdayHours;
  dynamic thursdayHours;
  dynamic fridayHours;
  dynamic saturdayHours;
  dynamic employeeNo;
  dynamic personId;
  bool? isAttendanceCalculated;
  dynamic biometricId;
  String? dutyText;
  dynamic employeeName;
  dynamic userNameWithEmail;
  dynamic email;
  dynamic iqamahNo;
  dynamic displayName;
  dynamic organizationName;
  dynamic jobName;
  dynamic gradeName;
  dynamic nationality;
  dynamic organizationId;
  dynamic sectionId;
  dynamic sectionName;
  dynamic subSectionId;
  dynamic subSectionName;
  String? userId;
  dynamic assignmentId;
  dynamic userIds;
  dynamic rosterDates;
  dynamic leaveList;
  dynamic sundayText;
  dynamic copyToWeeks;
  dynamic mondayText;
  dynamic tuesdayText;
  dynamic wednesdayText;
  dynamic thursdayText;
  dynamic fridayText;
  dynamic saturdayText;
  dynamic sundayTotalHours;
  dynamic mondayTotalHours;
  dynamic tuesdayTotalHours;
  dynamic wednesdayTotalHours;
  dynamic thursdayTotalHours;
  dynamic fridayTotalHours;
  dynamic saturdayTotalHours;
  dynamic sumOfWeekHours;
  dynamic weekDisplayName;
  bool? publishWhileCopying;
  dynamic contractEndDate;
  dynamic contractRenewable;
  dynamic sponsor;
  dynamic dayOff1;
  dynamic dayOff2;
  dynamic dayOff3;
  dynamic dayOff4;
  dynamic dayOff5;
  dynamic dayOff6;
  dynamic dayOff7;
  dynamic draft1;
  dynamic draft2;
  dynamic draft3;
  dynamic draft4;
  dynamic draft5;
  dynamic draft6;
  dynamic draft7;
  dynamic count1;
  dynamic count2;
  dynamic count3;
  dynamic count4;
  dynamic count5;
  dynamic count6;
  dynamic count7;
  dynamic userList;
  String? sundayReporting;
  String? mondayReporting;
  String? tuesdayReporting;
  String? wednesdayReporting;
  String? thursdayReporting;
  String? fridayReporting;
  String? saturdayReporting;
  dynamic personNo;
  dynamic sponsorshipNo;
  String? shiftPatternName;
  dynamic rostarStatus1;
  dynamic rostarStatus2;
  dynamic rostarStatus3;
  dynamic rostarStatus4;
  dynamic rostarStatus5;
  dynamic rostarStatus6;
  dynamic rostarStatus7;
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
  dynamic hiddenUdfs;
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
  dynamic bookItems;
  dynamic attachmentIds;
  dynamic tableName;
  bool? allReadOnly;
  dynamic fileName;
  dynamic folderType;
  bool? isUserGuide;
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
  dynamic localizedColumnId;
  dynamic localizedColumn;
  dynamic displayColumnId;
  dynamic displayColumn;
  dynamic formClientScript;
  dynamic enableAuditLog;
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
  List<TaskListModel>? taskList;
 

  factory RoasterSchedulerListModel.fromJson(Map<String, dynamic> json) =>
      RoasterSchedulerListModel(
        legalEntityCode: json["LegalEntityCode"],
        rosterDate: json["RosterDate"] == null
            ? null
            : DateTime.parse(json["RosterDate"]),
        weekDateString: json["WeekDateString"],
        rosterDutyType: json["RosterDutyType"],
        duty1Enabled: json["Duty1Enabled"],
        duty1StartTime: json["Duty1StartTime"],
        duty1EndTime: json["Duty1EndTime"],
        duty1FallsNextDay: json["Duty1FallsNextDay"],
        duty2Enabled: json["Duty2Enabled"],
        duty2StartTime: json["Duty2StartTime"],
        duty2EndTime: json["Duty2EndTime"],
        duty2FallsNextDay: json["Duty2FallsNextDay"],
        duty3Enabled: json["Duty3Enabled"],
        duty3StartTime: json["Duty3StartTime"],
        duty3EndTime: json["Duty3EndTime"],
        duty3FallsNextDay: json["Duty3FallsNextDay"],
        totalHours: json["TotalHours"],
        draftRosterDutyType: json["DraftRosterDutyType"],
        draftDuty1Enabled: json["DraftDuty1Enabled"],
        draftDuty1StartTime: json["DraftDuty1StartTime"],
        draftDuty1EndTime: json["DraftDuty1EndTime"],
        draftDuty1FallsNextDay: json["DraftDuty1FallsNextDay"],
        draftDuty2Enabled: json["DraftDuty2Enabled"],
        draftDuty2StartTime: json["DraftDuty2StartTime"],
        draftDuty2EndTime: json["DraftDuty2EndTime"],
        draftDuty2FallsNextDay: json["DraftDuty2FallsNextDay"],
        draftDuty3Enabled: json["DraftDuty3Enabled"],
        draftDuty3StartTime: json["DraftDuty3StartTime"],
        draftDuty3EndTime: json["DraftDuty3EndTime"],
        draftDuty3FallsNextDay: json["DraftDuty3FallsNextDay"],
        draftTotalHours: json["DraftTotalHours"],
        publishStatus: json["PublishStatus"],
        isDraft: json["IsDraft"],
        publishDate: json["PublishDate"] == null
            ? null
            : DateTime.parse(json["PublishDate"]),
        sunday: json["Sunday"],
        monday: json["Monday"],
        tuesday: json["Tuesday"],
        wednesday: json["Wednesday"],
        thursday: json["Thursday"],
        friday: json["Friday"],
        saturday: json["Saturday"],
        sundayHours: json["SundayHours"],
        mondayHours: json["MondayHours"],
        tuesdayHours: json["TuesdayHours"],
        wednesdayHours: json["WednesdayHours"],
        thursdayHours: json["ThursdayHours"],
        fridayHours: json["FridayHours"],
        saturdayHours: json["SaturdayHours"],
        employeeNo: json["EmployeeNo"],
        personId: json["PersonId"],
        isAttendanceCalculated: json["IsAttendanceCalculated"],
        biometricId: json["BiometricId"],
        dutyText: json["DutyText"],
        employeeName: json["EmployeeName"],
        userNameWithEmail: json["UserNameWithEmail"],
        email: json["Email"],
        iqamahNo: json["IqamahNo"],
        displayName: json["DisplayName"],
        organizationName: json["OrganizationName"],
        jobName: json["JobName"],
        gradeName: json["GradeName"],
        nationality: json["Nationality"],
        organizationId: json["OrganizationId"],
        sectionId: json["SectionId"],
        sectionName: json["SectionName"],
        subSectionId: json["SubSectionId"],
        subSectionName: json["SubSectionName"],
        userId: json["UserId"],
        assignmentId: json["AssignmentId"],
        userIds: json["UserIds"],
        rosterDates: json["RosterDates"],
        leaveList: json["leaveList"],
        sundayText: json["SundayText"],
        copyToWeeks: json["CopyToWeeks"],
        mondayText: json["MondayText"],
        tuesdayText: json["TuesdayText"],
        wednesdayText: json["WednesdayText"],
        thursdayText: json["ThursdayText"],
        fridayText: json["FridayText"],
        saturdayText: json["SaturdayText"],
        sundayTotalHours: json["SundayTotalHours"],
        mondayTotalHours: json["MondayTotalHours"],
        tuesdayTotalHours: json["TuesdayTotalHours"],
        wednesdayTotalHours: json["WednesdayTotalHours"],
        thursdayTotalHours: json["ThursdayTotalHours"],
        fridayTotalHours: json["FridayTotalHours"],
        saturdayTotalHours: json["SaturdayTotalHours"],
        sumOfWeekHours: json["SumOfWeekHours"],
        weekDisplayName: json["WeekDisplayName"],
        publishWhileCopying: json["PublishWhileCopying"],
        contractEndDate: json["ContractEndDate"],
        contractRenewable: json["ContractRenewable"],
        sponsor: json["Sponsor"],
        dayOff1: json["DayOff1"],
        dayOff2: json["DayOff2"],
        dayOff3: json["DayOff3"],
        dayOff4: json["DayOff4"],
        dayOff5: json["DayOff5"],
        dayOff6: json["DayOff6"],
        dayOff7: json["DayOff7"],
        draft1: json["Draft1"],
        draft2: json["Draft2"],
        draft3: json["Draft3"],
        draft4: json["Draft4"],
        draft5: json["Draft5"],
        draft6: json["Draft6"],
        draft7: json["Draft7"],
        count1: json["Count1"],
        count2: json["Count2"],
        count3: json["Count3"],
        count4: json["Count4"],
        count5: json["Count5"],
        count6: json["Count6"],
        count7: json["Count7"],
        userList: json["userList"],
        sundayReporting: json["SundayReporting"],
        mondayReporting: json["MondayReporting"],
        tuesdayReporting: json["TuesdayReporting"],
        wednesdayReporting: json["WednesdayReporting"],
        thursdayReporting: json["ThursdayReporting"],
        fridayReporting: json["FridayReporting"],
        saturdayReporting: json["SaturdayReporting"],
        personNo: json["PersonNo"],
        sponsorshipNo: json["SponsorshipNo"],
        shiftPatternName: json["ShiftPatternName"],
        rostarStatus1: json["RostarStatus1"],
        rostarStatus2: json["RostarStatus2"],
        rostarStatus3: json["RostarStatus3"],
        rostarStatus4: json["RostarStatus4"],
        rostarStatus5: json["RostarStatus5"],
        rostarStatus6: json["RostarStatus6"],
        rostarStatus7: json["RostarStatus7"],
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
        hiddenUdfs: json["HiddenUdfs"],
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
        isUserGuide: json["IsUserGuide"],
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
        localizedColumnId: json["LocalizedColumnId"],
        localizedColumn: json["LocalizedColumn"],
        displayColumnId: json["DisplayColumnId"],
        displayColumn: json["DisplayColumn"],
        formClientScript: json["FormClientScript"],
        enableAuditLog: json["EnableAuditLog"],
        id: json["Id"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: json["LastUpdatedDate"] == null
            ? null
            : DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        legalEntityId: json["LegalEntityId"],
        dataAction: json["DataAction"],
        status: json["Status"],
        versionNo: json["VersionNo"],
        portalId: json["PortalId"],
       
        taskList: json["TaskList"] == null
            ? []
            : List<TaskListModel>.from(
                json["TaskList"]!.map((x) => TaskListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LegalEntityCode": legalEntityCode,
        "RosterDate": rosterDate?.toIso8601String(),
        "WeekDateString": weekDateString,
        "RosterDutyType": rosterDutyType,
        "Duty1Enabled": duty1Enabled,
        "Duty1StartTime": duty1StartTime,
        "Duty1EndTime": duty1EndTime,
        "Duty1FallsNextDay": duty1FallsNextDay,
        "Duty2Enabled": duty2Enabled,
        "Duty2StartTime": duty2StartTime,
        "Duty2EndTime": duty2EndTime,
        "Duty2FallsNextDay": duty2FallsNextDay,
        "Duty3Enabled": duty3Enabled,
        "Duty3StartTime": duty3StartTime,
        "Duty3EndTime": duty3EndTime,
        "Duty3FallsNextDay": duty3FallsNextDay,
        "TotalHours": totalHours,
        "DraftRosterDutyType": draftRosterDutyType,
        "DraftDuty1Enabled": draftDuty1Enabled,
        "DraftDuty1StartTime": draftDuty1StartTime,
        "DraftDuty1EndTime": draftDuty1EndTime,
        "DraftDuty1FallsNextDay": draftDuty1FallsNextDay,
        "DraftDuty2Enabled": draftDuty2Enabled,
        "DraftDuty2StartTime": draftDuty2StartTime,
        "DraftDuty2EndTime": draftDuty2EndTime,
        "DraftDuty2FallsNextDay": draftDuty2FallsNextDay,
        "DraftDuty3Enabled": draftDuty3Enabled,
        "DraftDuty3StartTime": draftDuty3StartTime,
        "DraftDuty3EndTime": draftDuty3EndTime,
        "DraftDuty3FallsNextDay": draftDuty3FallsNextDay,
        "DraftTotalHours": draftTotalHours,
        "PublishStatus": publishStatus,
        "IsDraft": isDraft,
        "PublishDate": publishDate?.toIso8601String(),
        "Sunday": sunday,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "SundayHours": sundayHours,
        "MondayHours": mondayHours,
        "TuesdayHours": tuesdayHours,
        "WednesdayHours": wednesdayHours,
        "ThursdayHours": thursdayHours,
        "FridayHours": fridayHours,
        "SaturdayHours": saturdayHours,
        "EmployeeNo": employeeNo,
        "PersonId": personId,
        "IsAttendanceCalculated": isAttendanceCalculated,
        "BiometricId": biometricId,
        "DutyText": dutyText,
        "EmployeeName": employeeName,
        "UserNameWithEmail": userNameWithEmail,
        "Email": email,
        "IqamahNo": iqamahNo,
        "DisplayName": displayName,
        "OrganizationName": organizationName,
        "JobName": jobName,
        "GradeName": gradeName,
        "Nationality": nationality,
        "OrganizationId": organizationId,
        "SectionId": sectionId,
        "SectionName": sectionName,
        "SubSectionId": subSectionId,
        "SubSectionName": subSectionName,
        "UserId": userId,
        "AssignmentId": assignmentId,
        "UserIds": userIds,
        "RosterDates": rosterDates,
        "leaveList": leaveList,
        "SundayText": sundayText,
        "CopyToWeeks": copyToWeeks,
        "MondayText": mondayText,
        "TuesdayText": tuesdayText,
        "WednesdayText": wednesdayText,
        "ThursdayText": thursdayText,
        "FridayText": fridayText,
        "SaturdayText": saturdayText,
        "SundayTotalHours": sundayTotalHours,
        "MondayTotalHours": mondayTotalHours,
        "TuesdayTotalHours": tuesdayTotalHours,
        "WednesdayTotalHours": wednesdayTotalHours,
        "ThursdayTotalHours": thursdayTotalHours,
        "FridayTotalHours": fridayTotalHours,
        "SaturdayTotalHours": saturdayTotalHours,
        "SumOfWeekHours": sumOfWeekHours,
        "WeekDisplayName": weekDisplayName,
        "PublishWhileCopying": publishWhileCopying,
        "ContractEndDate": contractEndDate,
        "ContractRenewable": contractRenewable,
        "Sponsor": sponsor,
        "DayOff1": dayOff1,
        "DayOff2": dayOff2,
        "DayOff3": dayOff3,
        "DayOff4": dayOff4,
        "DayOff5": dayOff5,
        "DayOff6": dayOff6,
        "DayOff7": dayOff7,
        "Draft1": draft1,
        "Draft2": draft2,
        "Draft3": draft3,
        "Draft4": draft4,
        "Draft5": draft5,
        "Draft6": draft6,
        "Draft7": draft7,
        "Count1": count1,
        "Count2": count2,
        "Count3": count3,
        "Count4": count4,
        "Count5": count5,
        "Count6": count6,
        "Count7": count7,
        "userList": userList,
        "SundayReporting": sundayReporting,
        "MondayReporting": mondayReporting,
        "TuesdayReporting": tuesdayReporting,
        "WednesdayReporting": wednesdayReporting,
        "ThursdayReporting": thursdayReporting,
        "FridayReporting": fridayReporting,
        "SaturdayReporting": saturdayReporting,
        "PersonNo": personNo,
        "SponsorshipNo": sponsorshipNo,
        "ShiftPatternName": shiftPatternName,
        "RostarStatus1": rostarStatus1,
        "RostarStatus2": rostarStatus2,
        "RostarStatus3": rostarStatus3,
        "RostarStatus4": rostarStatus4,
        "RostarStatus5": rostarStatus5,
        "RostarStatus6": rostarStatus6,
        "RostarStatus7": rostarStatus7,
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
        "HiddenUdfs": hiddenUdfs,
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
        "IsUserGuide": isUserGuide,
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
        "LocalizedColumnId": localizedColumnId,
        "LocalizedColumn": localizedColumn,
        "DisplayColumnId": displayColumnId,
        "DisplayColumn": displayColumn,
        "FormClientScript": formClientScript,
        "EnableAuditLog": enableAuditLog,
        "Id": id,
        "CreatedDate": createdDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "LegalEntityId": legalEntityId,
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId,
       
        "TaskList": taskList == null
            ? []
            : List<dynamic>.from(taskList!.map((x) => x.toJson())),
      };
}
