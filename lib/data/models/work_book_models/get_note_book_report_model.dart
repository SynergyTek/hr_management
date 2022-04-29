// To parse this JSON data, do
//
//     final getNoteBookReportModel = getNoteBookReportModelFromJson(jsonString);

import 'dart:convert';

GetNoteBookReportModel getNoteBookReportModelFromJson(String str) =>
    GetNoteBookReportModel.fromJson(json.decode(str));

String getNoteBookReportModelToJson(GetNoteBookReportModel data) =>
    json.encode(data.toJson());

class GetNoteBookReportModel {
  GetNoteBookReportModel({
    this.logo,
    this.currentDate,
    this.loggedInUserName,
    this.ntsItems,
  });

  String? logo;
  DateTime? currentDate;
  dynamic? loggedInUserName;
  List<NtsItem>? ntsItems;

  factory GetNoteBookReportModel.fromJson(Map<String, dynamic> json) =>
      GetNoteBookReportModel(
        logo: json["Logo"],
        currentDate: DateTime.parse(json["CurrentDate"]),
        loggedInUserName: json["LoggedInUserName"],
        ntsItems: List<NtsItem>.from(
            json["NtsItems"].map((x) => NtsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Logo": logo,
        "CurrentDate": currentDate,
        "LoggedInUserName": loggedInUserName,
        "NtsItems": List<dynamic>.from(ntsItems!.map((x) => x.toJson())),
      };
}

class NtsItem {
  NtsItem({
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

  factory NtsItem.fromJson(Map<String, dynamic> json) => NtsItem(
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
        "StartDate": startDate,
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
