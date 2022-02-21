// To parse this JSON data, do
//
//     final manageAccrualModel = manageAccrualModelFromJson(jsonString);

import 'dart:convert';

List<ManageAccrualModel> manageAccrualModelFromJson(String str) =>
    List<ManageAccrualModel>.from(
        json.decode(str).map((x) => ManageAccrualModel.fromJson(x)));

String manageAccrualModelToJson(List<ManageAccrualModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManageAccrualModel {
  ManageAccrualModel({
    this.payrollName,
    this.payrollStartDate,
    this.payrollEndDate,
    this.payrollRunDate,
    this.executionStatus,
    this.yearMonth,
    this.payrollStateStart,
    this.payrollStateEnd,
    this.runType,
    this.name,
    this.payRollNo,
    this.executionStartDate,
    this.executionEndDate,
    this.executedBy,
    this.totalEarning,
    this.totalDeduction,
    this.netAmount,
    this.isExecuteAllEmployee,
    this.totalProcessed,
    this.totalSucceeded,
    this.executePayrollTotal,
    this.executePayrollError,
    this.payslipTotal,
    this.payslipError,
    this.bankLetterTotal,
    this.bankLetterError,
    this.vacationAccrual,
    this.flightTicketAccrual,
    this.eosAccrual,
    this.loanAccrual,
    this.sickLeaveAccrual,
    this.attendanceStartDate,
    this.attendanceEndDate,
    this.payrollInterval,
    this.elementCategory,
    this.payrollId,
    this.payrollBatchId,
    this.payrollPersonId,
    this.personsNotInList,
    this.personsInList,
    this.payrollGroupName,
    this.organizationName,
    this.payrollGroupId,
    this.payrollRunServiceId,
    this.elementList,
    this.employeeList,
    this.employeeSalaryElementInfoList,
    this.unProcessedTransactionList,
    this.employeePayrollRunResult,
    this.employeePayrollElementRunResult,
    this.employeePayrollElementDailyRunResult,
    this.payrollActiveEmployeeList,
    this.employeeSalaryEntryList,
    this.bankLetterDetails,
    this.employeeSalaryElementEntryList,
    this.runElements,
    this.salaryElements,
    this.yearMonthText,
    this.vacationAccrualText,
    this.flightTicketAccrualText,
    this.eosAccrualText,
    this.loanAccrualText,
    this.sickLeaveAccrualText,
    this.vacationAccrualStatusCss,
    this.flightTicketAccrualStatusCss,
    this.eosAccrualStatusCss,
    this.loanAccrualStatusCss,
    this.sickLeaveAccrualStatusCss,
    this.isVacationAccrual,
    this.isFlightTicketAccrual,
    this.isEosAccrual,
    this.isLoanAccrual,
    this.isSickLeaveAccrual,
    this.runAccrual,
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
  });

  dynamic payrollName;
  DateTime? payrollStartDate;
  DateTime? payrollEndDate;
  DateTime? payrollRunDate;
  int? executionStatus;
  int? yearMonth;
  int? payrollStateStart;
  int? payrollStateEnd;
  int? runType;
  String? name;
  dynamic payRollNo;
  dynamic executionStartDate;
  dynamic executionEndDate;
  String? executedBy;
  double? totalEarning;
  double? totalDeduction;
  double? netAmount;
  bool? isExecuteAllEmployee;
  int? totalProcessed;
  int? totalSucceeded;
  int? executePayrollTotal;
  int? executePayrollError;
  int? payslipTotal;
  int? payslipError;
  int? bankLetterTotal;
  int? bankLetterError;
  int? vacationAccrual;
  int? flightTicketAccrual;
  int? eosAccrual;
  int? loanAccrual;
  int? sickLeaveAccrual;
  DateTime? attendanceStartDate;
  DateTime? attendanceEndDate;
  dynamic payrollInterval;
  dynamic elementCategory;
  String? payrollId;
  String? payrollBatchId;
  dynamic payrollPersonId;
  dynamic personsNotInList;
  dynamic personsInList;
  dynamic payrollGroupName;
  dynamic organizationName;
  String? payrollGroupId;
  dynamic payrollRunServiceId;
  dynamic elementList;
  dynamic employeeList;
  dynamic employeeSalaryElementInfoList;
  dynamic unProcessedTransactionList;
  dynamic employeePayrollRunResult;
  dynamic employeePayrollElementRunResult;
  dynamic employeePayrollElementDailyRunResult;
  dynamic payrollActiveEmployeeList;
  dynamic employeeSalaryEntryList;
  dynamic bankLetterDetails;
  dynamic employeeSalaryElementEntryList;
  dynamic runElements;
  dynamic salaryElements;
  String? yearMonthText;
  String? vacationAccrualText;
  String? flightTicketAccrualText;
  String? eosAccrualText;
  String? loanAccrualText;
  String? sickLeaveAccrualText;
  String? vacationAccrualStatusCss;
  String? flightTicketAccrualStatusCss;
  String? eosAccrualStatusCss;
  String? loanAccrualStatusCss;
  String? sickLeaveAccrualStatusCss;
  bool? isVacationAccrual;
  bool? isFlightTicketAccrual;
  bool? isEosAccrual;
  bool? isLoanAccrual;
  bool? isSickLeaveAccrual;
  bool? runAccrual;
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
  dynamic subject;
  dynamic notificationSubject;
  String? description;
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

  factory ManageAccrualModel.fromJson(Map<String, dynamic> json) =>
      ManageAccrualModel(
        payrollName: json["PayrollName"],
        payrollStartDate: DateTime.parse(json["PayrollStartDate"]),
        payrollEndDate: DateTime.parse(json["PayrollEndDate"]),
        payrollRunDate: DateTime.parse(json["PayrollRunDate"]),
        executionStatus: json["ExecutionStatus"],
        yearMonth: json["YearMonth"] == null ? null : json["YearMonth"],
        payrollStateStart: json["PayrollStateStart"],
        payrollStateEnd: json["PayrollStateEnd"],
        runType: json["RunType"],
        name: json["Name"] == null ? null : json["Name"],
        payRollNo: json["PayRollNo"],
        executionStartDate: json["ExecutionStartDate"],
        executionEndDate: json["ExecutionEndDate"],
        executedBy: json["ExecutedBy"],
        totalEarning: json["TotalEarning"],
        totalDeduction: json["TotalDeduction"],
        netAmount: json["NetAmount"],
        isExecuteAllEmployee: json["IsExecuteAllEmployee"],
        totalProcessed: json["TotalProcessed"],
        totalSucceeded: json["TotalSucceeded"],
        executePayrollTotal: json["ExecutePayrollTotal"],
        executePayrollError: json["ExecutePayrollError"],
        payslipTotal: json["PayslipTotal"],
        payslipError: json["PayslipError"],
        bankLetterTotal: json["BankLetterTotal"],
        bankLetterError: json["BankLetterError"],
        vacationAccrual:
            json["VacationAccrual"] == null ? null : json["VacationAccrual"],
        flightTicketAccrual: json["FlightTicketAccrual"] == null
            ? null
            : json["FlightTicketAccrual"],
        eosAccrual: json["EOSAccrual"],
        loanAccrual: json["LoanAccrual"] == null ? null : json["LoanAccrual"],
        sickLeaveAccrual:
            json["SickLeaveAccrual"] == null ? null : json["SickLeaveAccrual"],
        attendanceStartDate: DateTime.parse(json["AttendanceStartDate"]),
        attendanceEndDate: DateTime.parse(json["AttendanceEndDate"]),
        payrollInterval: json["PayrollInterval"],
        elementCategory: json["ElementCategory"],
        payrollId: json["PayrollId"],
        payrollBatchId: json["PayrollBatchId"],
        payrollPersonId: json["PayrollPersonId"],
        personsNotInList: json["PersonsNotInList"],
        personsInList: json["PersonsInList"],
        payrollGroupName: json["PayrollGroupName"],
        organizationName: json["OrganizationName"],
        payrollGroupId: json["PayrollGroupId"],
        payrollRunServiceId: json["PayrollRunServiceId"],
        elementList: json["ElementList"],
        employeeList: json["EmployeeList"],
        employeeSalaryElementInfoList: json["EmployeeSalaryElementInfoList"],
        unProcessedTransactionList: json["UnProcessedTransactionList"],
        employeePayrollRunResult: json["EmployeePayrollRunResult"],
        employeePayrollElementRunResult:
            json["EmployeePayrollElementRunResult"],
        employeePayrollElementDailyRunResult:
            json["EmployeePayrollElementDailyRunResult"],
        payrollActiveEmployeeList: json["PayrollActiveEmployeeList"],
        employeeSalaryEntryList: json["EmployeeSalaryEntryList"],
        bankLetterDetails: json["BankLetterDetails"],
        employeeSalaryElementEntryList: json["EmployeeSalaryElementEntryList"],
        runElements: json["RunElements"],
        salaryElements: json["SalaryElements"],
        yearMonthText: json["YearMonthText"],
        vacationAccrualText: json["VacationAccrualText"],
        flightTicketAccrualText: json["FlightTicketAccrualText"],
        eosAccrualText: json["EOSAccrualText"],
        loanAccrualText: json["LoanAccrualText"],
        sickLeaveAccrualText: json["SickLeaveAccrualText"],
        vacationAccrualStatusCss: json["VacationAccrualStatusCss"],
        flightTicketAccrualStatusCss: json["FlightTicketAccrualStatusCss"],
        eosAccrualStatusCss: json["EOSAccrualStatusCss"],
        loanAccrualStatusCss: json["LoanAccrualStatusCss"],
        sickLeaveAccrualStatusCss: json["SickLeaveAccrualStatusCss"],
        isVacationAccrual: json["IsVacationAccrual"],
        isFlightTicketAccrual: json["IsFlightTicketAccrual"],
        isEosAccrual: json["IsEOSAccrual"],
        isLoanAccrual: json["IsLoanAccrual"],
        isSickLeaveAccrual: json["IsSickLeaveAccrual"],
        runAccrual: json["RunAccrual"],
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
        description: json["Description"] == null ? null : json["Description"],
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
        "PayrollName": payrollName,
        "PayrollStartDate": payrollStartDate!.toIso8601String(),
        "PayrollEndDate": payrollEndDate!.toIso8601String(),
        "PayrollRunDate": payrollRunDate!.toIso8601String(),
        "ExecutionStatus": executionStatus,
        "YearMonth": yearMonth == null ? null : yearMonth,
        "PayrollStateStart": payrollStateStart,
        "PayrollStateEnd": payrollStateEnd,
        "RunType": runType,
        "Name": name == null ? null : name,
        "PayRollNo": payRollNo,
        "ExecutionStartDate": executionStartDate,
        "ExecutionEndDate": executionEndDate,
        "ExecutedBy": executedBy,
        "TotalEarning": totalEarning,
        "TotalDeduction": totalDeduction,
        "NetAmount": netAmount,
        "IsExecuteAllEmployee": isExecuteAllEmployee,
        "TotalProcessed": totalProcessed,
        "TotalSucceeded": totalSucceeded,
        "ExecutePayrollTotal": executePayrollTotal,
        "ExecutePayrollError": executePayrollError,
        "PayslipTotal": payslipTotal,
        "PayslipError": payslipError,
        "BankLetterTotal": bankLetterTotal,
        "BankLetterError": bankLetterError,
        "VacationAccrual": vacationAccrual == null ? null : vacationAccrual,
        "FlightTicketAccrual":
            flightTicketAccrual == null ? null : flightTicketAccrual,
        "EOSAccrual": eosAccrual,
        "LoanAccrual": loanAccrual == null ? null : loanAccrual,
        "SickLeaveAccrual": sickLeaveAccrual == null ? null : sickLeaveAccrual,
        "AttendanceStartDate": attendanceStartDate!.toIso8601String(),
        "AttendanceEndDate": attendanceEndDate!.toIso8601String(),
        "PayrollInterval": payrollInterval,
        "ElementCategory": elementCategory,
        "PayrollId": payrollId,
        "PayrollBatchId": payrollBatchId,
        "PayrollPersonId": payrollPersonId,
        "PersonsNotInList": personsNotInList,
        "PersonsInList": personsInList,
        "PayrollGroupName": payrollGroupName,
        "OrganizationName": organizationName,
        "PayrollGroupId": payrollGroupId,
        "PayrollRunServiceId": payrollRunServiceId,
        "ElementList": elementList,
        "EmployeeList": employeeList,
        "EmployeeSalaryElementInfoList": employeeSalaryElementInfoList,
        "UnProcessedTransactionList": unProcessedTransactionList,
        "EmployeePayrollRunResult": employeePayrollRunResult,
        "EmployeePayrollElementRunResult": employeePayrollElementRunResult,
        "EmployeePayrollElementDailyRunResult":
            employeePayrollElementDailyRunResult,
        "PayrollActiveEmployeeList": payrollActiveEmployeeList,
        "EmployeeSalaryEntryList": employeeSalaryEntryList,
        "BankLetterDetails": bankLetterDetails,
        "EmployeeSalaryElementEntryList": employeeSalaryElementEntryList,
        "RunElements": runElements,
        "SalaryElements": salaryElements,
        "YearMonthText": yearMonthText,
        "VacationAccrualText": vacationAccrualText,
        "FlightTicketAccrualText": flightTicketAccrualText,
        "EOSAccrualText": eosAccrualText,
        "LoanAccrualText": loanAccrualText,
        "SickLeaveAccrualText": sickLeaveAccrualText,
        "VacationAccrualStatusCss": vacationAccrualStatusCss,
        "FlightTicketAccrualStatusCss": flightTicketAccrualStatusCss,
        "EOSAccrualStatusCss": eosAccrualStatusCss,
        "LoanAccrualStatusCss": loanAccrualStatusCss,
        "SickLeaveAccrualStatusCss": sickLeaveAccrualStatusCss,
        "IsVacationAccrual": isVacationAccrual,
        "IsFlightTicketAccrual": isFlightTicketAccrual,
        "IsEOSAccrual": isEosAccrual,
        "IsLoanAccrual": isLoanAccrual,
        "IsSickLeaveAccrual": isSickLeaveAccrual,
        "RunAccrual": runAccrual,
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
        "Description": description == null ? null : description,
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
      };
}
