// To parse this JSON data, do
//
//     final payrollSlipModel = payrollSlipModelFromJson(jsonString);

import 'dart:convert';

List<PayrollSlipModel> payrollSlipModelFromJson(String str) =>
    List<PayrollSlipModel>.from(
        json.decode(str).map((x) => PayrollSlipModel.fromJson(x)));

String payrollSlipModelToJson(List<PayrollSlipModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PayrollSlipModel {
  PayrollSlipModel({
    this.salaryName,
    this.payrollRunDate,
    this.payrollStartDate,
    this.payrollEndDate,
    this.dateOfJoin,
    this.dateOfJoinText,
    this.yearMonth,
    this.month,
    this.year,
    this.totalEarning,
    this.totalDeduction,
    this.netAmount,
    this.vacationBalance,
    this.grossSalary,
    this.bankAccountNo,
    this.bankIBanNo,
    this.bankName,
    this.bankBranchName,
    this.paymentMode,
    this.payrollInterval,
    this.publishStatus,
    this.executionStatus,
    this.error,
    this.payrollId,
    this.payrollRunId,
    this.personId,
    this.userId,
    this.personFullName,
    this.sponsorshipNo,
    this.payrollGroupId,
    this.payrollCalendarId,
    this.startDate,
    this.endDate,
    this.jobId,
    this.jobName,
    this.organizationId,
    this.organizationName,
    this.positionId,
    this.positionName,
    this.gradeId,
    this.gradeName,
    this.locationId,
    this.locationName,
    this.personNo,
    this.netAmountInWords,
    this.elements,
    this.actualWorkingDays,
    this.employeeWorkingDays,
    this.annualLeaveDays,
    this.sickLeaveDays,
    this.unpaidLeaveDays,
    this.otherLeaveDays,
    this.underTime,
    this.overTime,
    this.currencyCode,
    this.companyNameBasedOnLegalEntity,
    this.paySlipEarning,
    this.paySlipDeduction,
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

  final String? salaryName;
  final DateTime? payrollRunDate;
  final DateTime? payrollStartDate;
  final DateTime? payrollEndDate;
  final DateTime? dateOfJoin;
  final String? dateOfJoinText;
  final int? yearMonth;
  final dynamic month;
  final dynamic year;
  final int? totalEarning;
  final int? totalDeduction;
  final int? netAmount;
  final int? vacationBalance;
  final int? grossSalary;
  final dynamic bankAccountNo;
  final dynamic bankIBanNo;
  final dynamic bankName;
  final dynamic bankBranchName;
  final int? paymentMode;
  final dynamic payrollInterval;
  final int? publishStatus;
  final int? executionStatus;
  final dynamic error;
  final String? payrollId;
  final String? payrollRunId;
  final String? personId;
  final dynamic userId;
  final String? personFullName;
  final dynamic sponsorshipNo;
  final dynamic payrollGroupId;
  final dynamic payrollCalendarId;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? jobId;
  final dynamic jobName;
  final dynamic organizationId;
  final dynamic organizationName;
  final String? positionId;
  final dynamic positionName;
  final String? gradeId;
  final dynamic gradeName;
  final dynamic locationId;
  final dynamic locationName;
  final dynamic personNo;
  final dynamic netAmountInWords;
  final dynamic elements;
  final int? actualWorkingDays;
  final int? employeeWorkingDays;
  final int? annualLeaveDays;
  final int? sickLeaveDays;
  final int? unpaidLeaveDays;
  final int? otherLeaveDays;
  final String? underTime;
  final String? overTime;
  final dynamic currencyCode;
  final dynamic companyNameBasedOnLegalEntity;
  final dynamic paySlipEarning;
  final dynamic paySlipDeduction;
  final String? id;
  final DateTime? createdDate;
  final String? createdBy;
  final DateTime? lastUpdatedDate;
  final String? lastUpdatedBy;
  final bool? isDeleted;
  final int? sequenceOrder;
  final String? companyId;
  final int? dataAction;
  final int? status;
  final int? versionNo;

  factory PayrollSlipModel.fromJson(Map<String, dynamic> json) =>
      PayrollSlipModel(
        salaryName: json["SalaryName"] == null ? null : json["SalaryName"],
        payrollRunDate: json["PayrollRunDate"] == null
            ? null
            : DateTime.parse(json["PayrollRunDate"]),
        payrollStartDate: json["PayrollStartDate"] == null
            ? null
            : DateTime.parse(json["PayrollStartDate"]),
        payrollEndDate: json["PayrollEndDate"] == null
            ? null
            : DateTime.parse(json["PayrollEndDate"]),
        dateOfJoin: json["DateOfJoin"] == null
            ? null
            : DateTime.parse(json["DateOfJoin"]),
        dateOfJoinText:
            json["DateOfJoinText"] == null ? null : json["DateOfJoinText"],
        yearMonth: json["YearMonth"] == null ? null : json["YearMonth"],
        month: json["Month"],
        year: json["Year"],
        totalEarning:
            json["TotalEarning"] == null ? null : json["TotalEarning"],
        totalDeduction:
            json["TotalDeduction"] == null ? null : json["TotalDeduction"],
        netAmount: json["NetAmount"] == null ? null : json["NetAmount"],
        vacationBalance:
            json["VacationBalance"] == null ? null : json["VacationBalance"],
        grossSalary: json["GrossSalary"] == null ? null : json["GrossSalary"],
        bankAccountNo: json["BankAccountNo"],
        bankIBanNo: json["BankIBanNo"],
        bankName: json["BankName"],
        bankBranchName: json["BankBranchName"],
        paymentMode: json["PaymentMode"] == null ? null : json["PaymentMode"],
        payrollInterval: json["PayrollInterval"],
        publishStatus:
            json["PublishStatus"] == null ? null : json["PublishStatus"],
        executionStatus:
            json["ExecutionStatus"] == null ? null : json["ExecutionStatus"],
        error: json["Error"],
        payrollId: json["PayrollId"] == null ? null : json["PayrollId"],
        payrollRunId:
            json["PayrollRunId"] == null ? null : json["PayrollRunId"],
        personId: json["PersonId"] == null ? null : json["PersonId"],
        userId: json["UserId"],
        personFullName:
            json["PersonFullName"] == null ? null : json["PersonFullName"],
        sponsorshipNo: json["SponsorshipNo"],
        payrollGroupId: json["PayrollGroupId"],
        payrollCalendarId: json["PayrollCalendarId"],
        startDate: json["StartDate"] == null
            ? null
            : DateTime.parse(json["StartDate"]),
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
        jobId: json["JobId"] == null ? null : json["JobId"],
        jobName: json["JobName"],
        organizationId: json["OrganizationId"],
        organizationName: json["OrganizationName"],
        positionId: json["PositionId"] == null ? null : json["PositionId"],
        positionName: json["PositionName"],
        gradeId: json["GradeId"] == null ? null : json["GradeId"],
        gradeName: json["GradeName"],
        locationId: json["LocationId"],
        locationName: json["LocationName"],
        personNo: json["PersonNo"],
        netAmountInWords: json["NetAmountInWords"],
        elements: json["Elements"],
        actualWorkingDays: json["ActualWorkingDays"] == null
            ? null
            : json["ActualWorkingDays"],
        employeeWorkingDays: json["EmployeeWorkingDays"] == null
            ? null
            : json["EmployeeWorkingDays"],
        annualLeaveDays:
            json["AnnualLeaveDays"] == null ? null : json["AnnualLeaveDays"],
        sickLeaveDays:
            json["SickLeaveDays"] == null ? null : json["SickLeaveDays"],
        unpaidLeaveDays:
            json["UnpaidLeaveDays"] == null ? null : json["UnpaidLeaveDays"],
        otherLeaveDays:
            json["OtherLeaveDays"] == null ? null : json["OtherLeaveDays"],
        underTime: json["UnderTime"] == null ? null : json["UnderTime"],
        overTime: json["OverTime"] == null ? null : json["OverTime"],
        currencyCode: json["CurrencyCode"],
        companyNameBasedOnLegalEntity: json["CompanyNameBasedOnLegalEntity"],
        paySlipEarning: json["PaySlipEarning"],
        paySlipDeduction: json["PaySlipDeduction"],
        id: json["Id"] == null ? null : json["Id"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"] == null ? null : json["CreatedBy"],
        lastUpdatedDate: json["LastUpdatedDate"] == null
            ? null
            : DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy:
            json["LastUpdatedBy"] == null ? null : json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"] == null ? null : json["IsDeleted"],
        sequenceOrder:
            json["SequenceOrder"] == null ? null : json["SequenceOrder"],
        companyId: json["CompanyId"] == null ? null : json["CompanyId"],
        dataAction: json["DataAction"] == null ? null : json["DataAction"],
        status: json["Status"] == null ? null : json["Status"],
        versionNo: json["VersionNo"] == null ? null : json["VersionNo"],
      );

  Map<String, dynamic> toJson() => {
        "SalaryName": salaryName == null ? null : salaryName,
        "PayrollRunDate":
            payrollRunDate == null ? null : payrollRunDate?.toIso8601String(),
        "PayrollStartDate": payrollStartDate == null
            ? null
            : payrollStartDate?.toIso8601String(),
        "PayrollEndDate":
            payrollEndDate == null ? null : payrollEndDate?.toIso8601String(),
        "DateOfJoin": dateOfJoin == null ? null : dateOfJoin?.toIso8601String(),
        "DateOfJoinText": dateOfJoinText == null ? null : dateOfJoinText,
        "YearMonth": yearMonth == null ? null : yearMonth,
        "Month": month,
        "Year": year,
        "TotalEarning": totalEarning == null ? null : totalEarning,
        "TotalDeduction": totalDeduction == null ? null : totalDeduction,
        "NetAmount": netAmount == null ? null : netAmount,
        "VacationBalance": vacationBalance == null ? null : vacationBalance,
        "GrossSalary": grossSalary == null ? null : grossSalary,
        "BankAccountNo": bankAccountNo,
        "BankIBanNo": bankIBanNo,
        "BankName": bankName,
        "BankBranchName": bankBranchName,
        "PaymentMode": paymentMode == null ? null : paymentMode,
        "PayrollInterval": payrollInterval,
        "PublishStatus": publishStatus == null ? null : publishStatus,
        "ExecutionStatus": executionStatus == null ? null : executionStatus,
        "Error": error,
        "PayrollId": payrollId == null ? null : payrollId,
        "PayrollRunId": payrollRunId == null ? null : payrollRunId,
        "PersonId": personId == null ? null : personId,
        "UserId": userId,
        "PersonFullName": personFullName == null ? null : personFullName,
        "SponsorshipNo": sponsorshipNo,
        "PayrollGroupId": payrollGroupId,
        "PayrollCalendarId": payrollCalendarId,
        "StartDate": startDate == null ? null : startDate?.toIso8601String(),
        "EndDate": endDate == null ? null : endDate?.toIso8601String(),
        "JobId": jobId == null ? null : jobId,
        "JobName": jobName,
        "OrganizationId": organizationId,
        "OrganizationName": organizationName,
        "PositionId": positionId == null ? null : positionId,
        "PositionName": positionName,
        "GradeId": gradeId == null ? null : gradeId,
        "GradeName": gradeName,
        "LocationId": locationId,
        "LocationName": locationName,
        "PersonNo": personNo,
        "NetAmountInWords": netAmountInWords,
        "Elements": elements,
        "ActualWorkingDays":
            actualWorkingDays == null ? null : actualWorkingDays,
        "EmployeeWorkingDays":
            employeeWorkingDays == null ? null : employeeWorkingDays,
        "AnnualLeaveDays": annualLeaveDays == null ? null : annualLeaveDays,
        "SickLeaveDays": sickLeaveDays == null ? null : sickLeaveDays,
        "UnpaidLeaveDays": unpaidLeaveDays == null ? null : unpaidLeaveDays,
        "OtherLeaveDays": otherLeaveDays == null ? null : otherLeaveDays,
        "UnderTime": underTime == null ? null : underTime,
        "OverTime": overTime == null ? null : overTime,
        "CurrencyCode": currencyCode,
        "CompanyNameBasedOnLegalEntity": companyNameBasedOnLegalEntity,
        "PaySlipEarning": paySlipEarning,
        "PaySlipDeduction": paySlipDeduction,
        "Id": id == null ? null : id,
        "CreatedDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "CreatedBy": createdBy == null ? null : createdBy,
        "LastUpdatedDate":
            lastUpdatedDate == null ? null : lastUpdatedDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy == null ? null : lastUpdatedBy,
        "IsDeleted": isDeleted == null ? null : isDeleted,
        "SequenceOrder": sequenceOrder == null ? null : sequenceOrder,
        "CompanyId": companyId == null ? null : companyId,
        "DataAction": dataAction == null ? null : dataAction,
        "Status": status == null ? null : status,
        "VersionNo": versionNo == null ? null : versionNo,
      };
}
