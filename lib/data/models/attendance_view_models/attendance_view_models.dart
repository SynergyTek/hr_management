class AttendanceViewModel {
  String attendanceDate;
  bool duty1Enabled;
  String duty1StartTime;
  String duty1EndTime;
  String duty1FallsPreviousDay;
  bool duty1FallsNextDay;
  bool duty2Enabled;
  String duty2StartTime;
  String duty2EndTime;
  String duty2FallsPreviousDay;
  bool duty2FallsNextDay;
  bool duty3Enabled;
  String duty3StartTime;
  String duty3EndTime;
  String duty3FallsPreviousDay;
  bool duty3FallsNextDay;
  String totalHours;
  String systemAttendance;
  String systemAttendanceId;
  String attendanceLeaveType;
  String attendanceTypeId;
  String attendanceLeaveTypeId;
  String systemOTHours;
  String systemDeductionHours;
  String underTimeHours;
  String overrideUnderTimeHours;
  String overrideAttendance;
  String overrideAttendanceId;
  String overrideOTHours;
  String overrideDeductionHours;
  String overrideComments;
  String employeeComments;
  bool isOverridden;
  bool approved;
  bool isCalculated;
  String payrollPostedStatus;
  String payrollPostedStatusId;
  String payrollPostedDate;
  String referenceNode;
  String referenceId;
  String userId;
  String ntsNoteId;
  String serviceId;
  String searchDate;
  String organizationId;
  String organizationName;
  String employeeName;
  String personId;
  String personNo;
  String jobName;
  String accessLogText;
  String actualText;
  String actualHours;
  String systemOTHoursText;
  String systemDeductionHoursText;
  String oTHours;
  String deductionHours;
  String overrideOTHoursText;
  String overrideDeductionHoursText;
  String returnUrl;
  String userIds;
  String mode;
  String payrollGroupId;
  String searchMonth;
  String year;
  String searchStart;
  String searchEnd;
  String different;
  String columns;
  String rosterText;
  String rosterHours;
  String rosterDuty1Enabled;
  String rosterDuty1StartTime;
  String rosterDuty1EndTime;
  String rosterDuty1FallsNextDay;
  String rosterDuty2Enabled;
  String rosterDuty2StartTime;
  String rosterDuty2EndTime;
  String rosterDuty2FallsNextDay;
  String rosterDuty3Enabled;
  String rosterDuty3StartTime;
  String rosterDuty3EndTime;
  String rosterDuty3FallsNextDay;
  String rosterStartDate;
  String rosterEndDate;
  String sponsorCode;
  String nationalityCode;
  String attendanceFlag;
  String basicSalary;
  String message;
  String searchFromDate;
  String searchToDate;
  int employeeStatus;
  String sponsorshipNo;
  String attDate;
  String systemAttendanceText;
  String permittedOTHoursText;
  String calculatedOTHoursText;
  String permittedOTHours;
  String calculatedOTHours;
  String permittedDeductionHoursText;
  String calculatedDeductionHoursText;
  String leaveTypeCode;
  String permittedDeductionHours;
  String calculatedDeductionHours;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  String sequenceOrder;
  String companyId;
  int dataAction;
  int status;
  int versionNo;

  AttendanceViewModel({
    this.attendanceDate,
    this.duty1Enabled,
    this.duty1StartTime,
    this.duty1EndTime,
    this.duty1FallsPreviousDay,
    this.duty1FallsNextDay,
    this.duty2Enabled,
    this.duty2StartTime,
    this.duty2EndTime,
    this.duty2FallsPreviousDay,
    this.duty2FallsNextDay,
    this.duty3Enabled,
    this.duty3StartTime,
    this.duty3EndTime,
    this.duty3FallsPreviousDay,
    this.duty3FallsNextDay,
    this.totalHours,
    this.systemAttendance,
    this.systemAttendanceId,
    this.attendanceLeaveType,
    this.attendanceTypeId,
    this.attendanceLeaveTypeId,
    this.systemOTHours,
    this.systemDeductionHours,
    this.underTimeHours,
    this.overrideUnderTimeHours,
    this.overrideAttendance,
    this.overrideAttendanceId,
    this.overrideOTHours,
    this.overrideDeductionHours,
    this.overrideComments,
    this.employeeComments,
    this.isOverridden,
    this.approved,
    this.isCalculated,
    this.payrollPostedStatus,
    this.payrollPostedStatusId,
    this.payrollPostedDate,
    this.referenceNode,
    this.referenceId,
    this.userId,
    this.ntsNoteId,
    this.serviceId,
    this.searchDate,
    this.organizationId,
    this.organizationName,
    this.employeeName,
    this.personId,
    this.personNo,
    this.jobName,
    this.accessLogText,
    this.actualText,
    this.actualHours,
    this.systemOTHoursText,
    this.systemDeductionHoursText,
    this.oTHours,
    this.deductionHours,
    this.overrideOTHoursText,
    this.overrideDeductionHoursText,
    this.returnUrl,
    this.userIds,
    this.mode,
    this.payrollGroupId,
    this.searchMonth,
    this.year,
    this.searchStart,
    this.searchEnd,
    this.different,
    this.columns,
    this.rosterText,
    this.rosterHours,
    this.rosterDuty1Enabled,
    this.rosterDuty1StartTime,
    this.rosterDuty1EndTime,
    this.rosterDuty1FallsNextDay,
    this.rosterDuty2Enabled,
    this.rosterDuty2StartTime,
    this.rosterDuty2EndTime,
    this.rosterDuty2FallsNextDay,
    this.rosterDuty3Enabled,
    this.rosterDuty3StartTime,
    this.rosterDuty3EndTime,
    this.rosterDuty3FallsNextDay,
    this.rosterStartDate,
    this.rosterEndDate,
    this.sponsorCode,
    this.nationalityCode,
    this.attendanceFlag,
    this.basicSalary,
    this.message,
    this.searchFromDate,
    this.searchToDate,
    this.employeeStatus,
    this.sponsorshipNo,
    this.attDate,
    this.systemAttendanceText,
    this.permittedOTHoursText,
    this.calculatedOTHoursText,
    this.permittedOTHours,
    this.calculatedOTHours,
    this.permittedDeductionHoursText,
    this.calculatedDeductionHoursText,
    this.leaveTypeCode,
    this.permittedDeductionHours,
    this.calculatedDeductionHours,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastUpdatedDate,
    this.lastUpdatedBy,
    this.isDeleted,
    this.sequenceOrder,
    this.companyId,
    this.dataAction,
    this.status,
    this.versionNo,
  });

  AttendanceViewModel.fromJson(Map<String, dynamic> json) {
    attendanceDate = json['AttendanceDate'];
    duty1Enabled = json['Duty1Enabled'];
    duty1StartTime = json['Duty1StartTime'];
    duty1EndTime = json['Duty1EndTime'];
    duty1FallsPreviousDay = json['Duty1FallsPreviousDay'];
    duty1FallsNextDay = json['Duty1FallsNextDay'];
    duty2Enabled = json['Duty2Enabled'];
    duty2StartTime = json['Duty2StartTime'];
    duty2EndTime = json['Duty2EndTime'];
    duty2FallsPreviousDay = json['Duty2FallsPreviousDay'];
    duty2FallsNextDay = json['Duty2FallsNextDay'];
    duty3Enabled = json['Duty3Enabled'];
    duty3StartTime = json['Duty3StartTime'];
    duty3EndTime = json['Duty3EndTime'];
    duty3FallsPreviousDay = json['Duty3FallsPreviousDay'];
    duty3FallsNextDay = json['Duty3FallsNextDay'];
    totalHours = json['TotalHours'];
    systemAttendance = json['SystemAttendance'];
    systemAttendanceId = json['SystemAttendanceId'];
    attendanceLeaveType = json['AttendanceLeaveType'];
    attendanceTypeId = json['AttendanceTypeId'];
    attendanceLeaveTypeId = json['AttendanceLeaveTypeId'];
    systemOTHours = json['SystemOTHours'];
    systemDeductionHours = json['SystemDeductionHours'];
    underTimeHours = json['UnderTimeHours'];
    overrideUnderTimeHours = json['OverrideUnderTimeHours'];
    overrideAttendance = json['OverrideAttendance'];
    overrideAttendanceId = json['OverrideAttendanceId'];
    overrideOTHours = json['OverrideOTHours'];
    overrideDeductionHours = json['OverrideDeductionHours'];
    overrideComments = json['OverrideComments'];
    employeeComments = json['EmployeeComments'];
    isOverridden = json['IsOverridden'];
    approved = json['Approved'];
    isCalculated = json['IsCalculated'];
    payrollPostedStatus = json['PayrollPostedStatus'];
    payrollPostedStatusId = json['PayrollPostedStatusId'];
    payrollPostedDate = json['PayrollPostedDate'];
    referenceNode = json['ReferenceNode'];
    referenceId = json['ReferenceId'];
    userId = json['UserId'];
    ntsNoteId = json['NtsNoteId'];
    serviceId = json['ServiceId'];
    searchDate = json['SearchDate'];
    organizationId = json['OrganizationId'];
    organizationName = json['OrganizationName'];
    employeeName = json['EmployeeName'];
    personId = json['PersonId'];
    personNo = json['PersonNo'];
    jobName = json['JobName'];
    accessLogText = json['AccessLogText'];
    actualText = json['ActualText'];
    actualHours = json['ActualHours'];
    systemOTHoursText = json['SystemOTHoursText'];
    systemDeductionHoursText = json['SystemDeductionHoursText'];
    oTHours = json['OTHours'];
    deductionHours = json['DeductionHours'];
    overrideOTHoursText = json['OverrideOTHoursText'];
    overrideDeductionHoursText = json['OverrideDeductionHoursText'];
    returnUrl = json['ReturnUrl'];
    userIds = json['UserIds'];
    mode = json['Mode'];
    payrollGroupId = json['PayrollGroupId'];
    searchMonth = json['SearchMonth'];
    year = json['Year'];
    searchStart = json['SearchStart'];
    searchEnd = json['SearchEnd'];
    different = json['Different'];
    columns = json['Columns'];
    rosterText = json['RosterText'];
    rosterHours = json['RosterHours'];
    rosterDuty1Enabled = json['RosterDuty1Enabled'];
    rosterDuty1StartTime = json['RosterDuty1StartTime'];
    rosterDuty1EndTime = json['RosterDuty1EndTime'];
    rosterDuty1FallsNextDay = json['RosterDuty1FallsNextDay'];
    rosterDuty2Enabled = json['RosterDuty2Enabled'];
    rosterDuty2StartTime = json['RosterDuty2StartTime'];
    rosterDuty2EndTime = json['RosterDuty2EndTime'];
    rosterDuty2FallsNextDay = json['RosterDuty2FallsNextDay'];
    rosterDuty3Enabled = json['RosterDuty3Enabled'];
    rosterDuty3StartTime = json['RosterDuty3StartTime'];
    rosterDuty3EndTime = json['RosterDuty3EndTime'];
    rosterDuty3FallsNextDay = json['RosterDuty3FallsNextDay'];
    rosterStartDate = json['RosterStartDate'];
    rosterEndDate = json['RosterEndDate'];
    sponsorCode = json['SponsorCode'];
    nationalityCode = json['NationalityCode'];
    attendanceFlag = json['AttendanceFlag'];
    basicSalary = json['BasicSalary'];
    message = json['Message'];
    searchFromDate = json['SearchFromDate'];
    searchToDate = json['SearchToDate'];
    employeeStatus = json['EmployeeStatus'];
    sponsorshipNo = json['SponsorshipNo'];
    attDate = json['AttDate'];
    systemAttendanceText = json['SystemAttendanceText'];
    permittedOTHoursText = json['PermittedOTHoursText'];
    calculatedOTHoursText = json['CalculatedOTHoursText'];
    permittedOTHours = json['PermittedOTHours'];
    calculatedOTHours = json['CalculatedOTHours'];
    permittedDeductionHoursText = json['PermittedDeductionHoursText'];
    calculatedDeductionHoursText = json['CalculatedDeductionHoursText'];
    leaveTypeCode = json['LeaveTypeCode'];
    permittedDeductionHours = json['PermittedDeductionHours'];
    calculatedDeductionHours = json['CalculatedDeductionHours'];
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AttendanceDate'] = this.attendanceDate;
    data['Duty1Enabled'] = this.duty1Enabled;
    data['Duty1StartTime'] = this.duty1StartTime;
    data['Duty1EndTime'] = this.duty1EndTime;
    data['Duty1FallsPreviousDay'] = this.duty1FallsPreviousDay;
    data['Duty1FallsNextDay'] = this.duty1FallsNextDay;
    data['Duty2Enabled'] = this.duty2Enabled;
    data['Duty2StartTime'] = this.duty2StartTime;
    data['Duty2EndTime'] = this.duty2EndTime;
    data['Duty2FallsPreviousDay'] = this.duty2FallsPreviousDay;
    data['Duty2FallsNextDay'] = this.duty2FallsNextDay;
    data['Duty3Enabled'] = this.duty3Enabled;
    data['Duty3StartTime'] = this.duty3StartTime;
    data['Duty3EndTime'] = this.duty3EndTime;
    data['Duty3FallsPreviousDay'] = this.duty3FallsPreviousDay;
    data['Duty3FallsNextDay'] = this.duty3FallsNextDay;
    data['TotalHours'] = this.totalHours;
    data['SystemAttendance'] = this.systemAttendance;
    data['SystemAttendanceId'] = this.systemAttendanceId;
    data['AttendanceLeaveType'] = this.attendanceLeaveType;
    data['AttendanceTypeId'] = this.attendanceTypeId;
    data['AttendanceLeaveTypeId'] = this.attendanceLeaveTypeId;
    data['SystemOTHours'] = this.systemOTHours;
    data['SystemDeductionHours'] = this.systemDeductionHours;
    data['UnderTimeHours'] = this.underTimeHours;
    data['OverrideUnderTimeHours'] = this.overrideUnderTimeHours;
    data['OverrideAttendance'] = this.overrideAttendance;
    data['OverrideAttendanceId'] = this.overrideAttendanceId;
    data['OverrideOTHours'] = this.overrideOTHours;
    data['OverrideDeductionHours'] = this.overrideDeductionHours;
    data['OverrideComments'] = this.overrideComments;
    data['EmployeeComments'] = this.employeeComments;
    data['IsOverridden'] = this.isOverridden;
    data['Approved'] = this.approved;
    data['IsCalculated'] = this.isCalculated;
    data['PayrollPostedStatus'] = this.payrollPostedStatus;
    data['PayrollPostedStatusId'] = this.payrollPostedStatusId;
    data['PayrollPostedDate'] = this.payrollPostedDate;
    data['ReferenceNode'] = this.referenceNode;
    data['ReferenceId'] = this.referenceId;
    data['UserId'] = this.userId;
    data['NtsNoteId'] = this.ntsNoteId;
    data['ServiceId'] = this.serviceId;
    data['SearchDate'] = this.searchDate;
    data['OrganizationId'] = this.organizationId;
    data['OrganizationName'] = this.organizationName;
    data['EmployeeName'] = this.employeeName;
    data['PersonId'] = this.personId;
    data['PersonNo'] = this.personNo;
    data['JobName'] = this.jobName;
    data['AccessLogText'] = this.accessLogText;
    data['ActualText'] = this.actualText;
    data['ActualHours'] = this.actualHours;
    data['SystemOTHoursText'] = this.systemOTHoursText;
    data['SystemDeductionHoursText'] = this.systemDeductionHoursText;
    data['OTHours'] = this.oTHours;
    data['DeductionHours'] = this.deductionHours;
    data['OverrideOTHoursText'] = this.overrideOTHoursText;
    data['OverrideDeductionHoursText'] = this.overrideDeductionHoursText;
    data['ReturnUrl'] = this.returnUrl;
    data['UserIds'] = this.userIds;
    data['Mode'] = this.mode;
    data['PayrollGroupId'] = this.payrollGroupId;
    data['SearchMonth'] = this.searchMonth;
    data['Year'] = this.year;
    data['SearchStart'] = this.searchStart;
    data['SearchEnd'] = this.searchEnd;
    data['Different'] = this.different;
    data['Columns'] = this.columns;
    data['RosterText'] = this.rosterText;
    data['RosterHours'] = this.rosterHours;
    data['RosterDuty1Enabled'] = this.rosterDuty1Enabled;
    data['RosterDuty1StartTime'] = this.rosterDuty1StartTime;
    data['RosterDuty1EndTime'] = this.rosterDuty1EndTime;
    data['RosterDuty1FallsNextDay'] = this.rosterDuty1FallsNextDay;
    data['RosterDuty2Enabled'] = this.rosterDuty2Enabled;
    data['RosterDuty2StartTime'] = this.rosterDuty2StartTime;
    data['RosterDuty2EndTime'] = this.rosterDuty2EndTime;
    data['RosterDuty2FallsNextDay'] = this.rosterDuty2FallsNextDay;
    data['RosterDuty3Enabled'] = this.rosterDuty3Enabled;
    data['RosterDuty3StartTime'] = this.rosterDuty3StartTime;
    data['RosterDuty3EndTime'] = this.rosterDuty3EndTime;
    data['RosterDuty3FallsNextDay'] = this.rosterDuty3FallsNextDay;
    data['RosterStartDate'] = this.rosterStartDate;
    data['RosterEndDate'] = this.rosterEndDate;
    data['SponsorCode'] = this.sponsorCode;
    data['NationalityCode'] = this.nationalityCode;
    data['AttendanceFlag'] = this.attendanceFlag;
    data['BasicSalary'] = this.basicSalary;
    data['Message'] = this.message;
    data['SearchFromDate'] = this.searchFromDate;
    data['SearchToDate'] = this.searchToDate;
    data['EmployeeStatus'] = this.employeeStatus;
    data['SponsorshipNo'] = this.sponsorshipNo;
    data['AttDate'] = this.attDate;
    data['SystemAttendanceText'] = this.systemAttendanceText;
    data['PermittedOTHoursText'] = this.permittedOTHoursText;
    data['CalculatedOTHoursText'] = this.calculatedOTHoursText;
    data['PermittedOTHours'] = this.permittedOTHours;
    data['CalculatedOTHours'] = this.calculatedOTHours;
    data['PermittedDeductionHoursText'] = this.permittedDeductionHoursText;
    data['CalculatedDeductionHoursText'] = this.calculatedDeductionHoursText;
    data['LeaveTypeCode'] = this.leaveTypeCode;
    data['PermittedDeductionHours'] = this.permittedDeductionHours;
    data['CalculatedDeductionHours'] = this.calculatedDeductionHours;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SequenceOrder'] = this.sequenceOrder;
    data['CompanyId'] = this.companyId;
    data['DataAction'] = this.dataAction;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    return data;
  }
}
