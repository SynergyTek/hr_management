// To parse this JSON data, do
//
//     final attendanceDetailsListModel = attendanceDetailsListModelFromJson(jsonString);

import 'dart:convert';

AttendanceDetailsListModel attendanceDetailsListModelFromJson(String str) =>
    AttendanceDetailsListModel.fromJson(json.decode(str));

String attendanceDetailsListModelToJson(AttendanceDetailsListModel data) =>
    json.encode(data.toJson());

class AttendanceDetailsListModel {
  AttendanceDetailsListModel({
    this.id,
    this.userId,
    this.personId,
    this.date,
    this.roster,
    this.actual,
    this.duty2Roster,
    this.duty3Roster,
    this.duty2Actual,
    this.duty3Actual,
    this.employeeComments,
    this.overrideComments,
    this.searchMonth,
    this.searchStart,
    this.searchEnd,
    this.searchType,
  });

  dynamic id;
  dynamic userId;
  dynamic personId;
  DateTime? date;
  String? roster;
  String? actual;
  String? duty2Roster;
  String? duty3Roster;
  String? duty2Actual;
  String? duty3Actual;
  dynamic employeeComments;
  dynamic overrideComments;
  DateTime? searchMonth;
  dynamic searchStart;
  dynamic searchEnd;
  dynamic searchType;

  factory AttendanceDetailsListModel.fromJson(Map<String, dynamic> json) =>
      AttendanceDetailsListModel(
        id: json["Id"],
        userId: json["UserId"],
        personId: json["PersonId"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        roster: json["Roster"],
        actual: json["Actual"],
        duty2Roster: json["Duty2Roster"],
        duty3Roster: json["Duty3Roster"],
        duty2Actual: json["Duty2Actual"],
        duty3Actual: json["Duty3Actual"],
        employeeComments: json["EmployeeComments"],
        overrideComments: json["OverrideComments"],
        searchMonth: json["SearchMonth"] == null
            ? null
            : DateTime.parse(json["SearchMonth"]),
        searchStart: json["SearchStart"],
        searchEnd: json["SearchEnd"],
        searchType: json["SearchType"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "PersonId": personId,
        "Date": date?.toIso8601String(),
        "Roster": roster,
        "Actual": actual,
        "Duty2Roster": duty2Roster,
        "Duty3Roster": duty3Roster,
        "Duty2Actual": duty2Actual,
        "Duty3Actual": duty3Actual,
        "EmployeeComments": employeeComments,
        "OverrideComments": overrideComments,
        "SearchMonth": searchMonth?.toIso8601String(),
        "SearchStart": searchStart,
        "SearchEnd": searchEnd,
        "SearchType": searchType,
      };
}
