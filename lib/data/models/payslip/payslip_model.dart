class PayslipModel {
  PayslipModel();
  String? salaryName;
  DateTime? payrollRunDate;
  DateTime? payrollStartDate;
  DateTime? payrollEndDate;
  DateTime? dateOfJoin;
  //  String dateOfJoinText { get { return DateOfJoin.ToDefaultDateFormat(); } }
  int? yearMonth;
  String? month;
  int? year;
  double? totalEarning;
  double? totalDeduction;
  double? netAmount;
  double? vacationBalance;
  double? grossSalary;

  String? bankAccountNo;
  String? bankIBanNo;
  String? bankName;
  String? bankBranchName;
  String? error;

  String? payrollId;
  String? payrollRunId;
  String? personId;
  String? userId;
  String? personFullName;
  String? sponsorshipNo;

  String? payrollGroupId;
  String? payrollCalendarId;

  DateTime? startDate;

  DateTime? endDate;

  String? jobId;
  String? jobName;
  String? organizationId;
  String? organizationName;
  String? positionId;
  String? positionName;
  String? gradeId;
  String? gradeName;
  String? locationId;
  String? locationName;
  String? personNo;
  String? netAmountInWords;

  String? elements;

  double? actualWorkingDays;
  double? employeeWorkingDays;
  double? annualLeaveDays;
  double? sickLeaveDays;
  double? unpaidLeaveDays;
  double? otherLeaveDays;
  String? underTime;
  String? overTime;
  String? currencyCode;
  String? companyNameBasedOnLegalEntity;
  String? paySlipEarning;
  String? paySlipDeduction;

  factory PayslipModel.fromJson(Map<String, dynamic> json) {
    return PayslipModel();
  }

  Map<String, dynamic> toJson() => {};
}
