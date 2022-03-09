import 'dart:convert';

LeaveTemplateModel leaveTemplateModelFromJson(String str) =>
    LeaveTemplateModel.fromJson(json.decode(str));

String leaveTemplateModelToJson(LeaveTemplateModel data) =>
    json.encode(data.toJson());

class LeaveTemplateModel {
  LeaveTemplateModel({
    this.taskType,
    this.categoryCode,
    this.iconFileId,
    this.templateColor,
    this.displayName,
    this.code,
    this.description,
    this.templateStatus,
    this.templateType,
    this.tableSelectionType,
    this.id,
    this.createdDate,
    this.lastUpdatedDate,
    this.isDeleted,
    this.dataAction,
    this.status,
    this.versionNo,
  });

  int? taskType;
  String? categoryCode;
  String? iconFileId;
  String? templateColor;
  String? displayName;
  String? code;
  String? description;
  int? templateStatus;
  int? templateType;
  int? tableSelectionType;
  String? id;
  DateTime? createdDate;
  DateTime? lastUpdatedDate;
  bool? isDeleted;
  int? dataAction;
  int? status;
  int? versionNo;

  factory LeaveTemplateModel.fromJson(Map<String, dynamic> json) {
    print(json['Code']);

    return LeaveTemplateModel(
      taskType: json["TaskType"],
      categoryCode: json["CategoryCode"],
      iconFileId: json["IconFileId"],
      templateColor: json["TemplateColor"],
      displayName: json["DisplayName"],
      code: json["Code"],
      description: json["Description"],
      templateStatus: json["TemplateStatus"],
      templateType: json["TemplateType"],
      tableSelectionType: json["TableSelectionType"],
      id: json["Id"],
      createdDate: DateTime.parse(json["CreatedDate"]),
      lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
      isDeleted: json["IsDeleted"],
      dataAction: json["DataAction"],
      status: json["Status"],
      versionNo: json["VersionNo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "TaskType": taskType,
        "CategoryCode": categoryCode,
        "IconFileId": iconFileId,
        "TemplateColor": templateColor,
        "DisplayName": displayName,
        "Code": code,
        "Description": description,
        "TemplateStatus": templateStatus,
        "TemplateType": templateType,
        "TableSelectionType": tableSelectionType,
        "Id": id,
        "CreatedDate": createdDate!.toIso8601String(),
        "LastUpdatedDate": lastUpdatedDate!.toIso8601String(),
        "IsDeleted": isDeleted,
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
      };
}
