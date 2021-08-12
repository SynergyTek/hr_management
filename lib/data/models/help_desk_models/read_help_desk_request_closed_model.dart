import 'dart:convert';

List<ReadHelpDeskRequestClosedModel> readHelpDeskRequestClosedModelFromJson(
        String str) =>
    List<ReadHelpDeskRequestClosedModel>.from(json
        .decode(str)
        .map((x) => ReadHelpDeskRequestClosedModel.fromJson(x)));

String readHelpDeskRequestClosedModelToJson(
        List<ReadHelpDeskRequestClosedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadHelpDeskRequestClosedModel {
  ReadHelpDeskRequestClosedModel({
    this.id,
    this.name,
    this.inProgress,
    this.draft,
    this.overDue,
    this.completed,
    this.templateCode,
    this.templateName,
    this.priority,
    this.categoryCode,
    this.count,
    this.day,
    this.violated,
    this.nonViolated,
    this.dueDate,
  });

  dynamic id;
  dynamic name;
  double inProgress;
  double draft;
  double overDue;
  double completed;
  dynamic templateCode;
  dynamic templateName;
  dynamic priority;
  dynamic categoryCode;
  double count;
  String day;
  double violated;
  double nonViolated;
  dynamic dueDate;

  factory ReadHelpDeskRequestClosedModel.fromJson(Map<String, dynamic> json) =>
      ReadHelpDeskRequestClosedModel(
        id: json["Id"],
        name: json["Name"],
        inProgress: json["InProgress"],
        draft: json["Draft"],
        overDue: json["OverDue"],
        completed: json["Completed"],
        templateCode: json["TemplateCode"],
        templateName: json["TemplateName"],
        priority: json["Priority"],
        categoryCode: json["CategoryCode"],
        count: json["Count"],
        day: json["Day"],
        violated: json["Violated"],
        nonViolated: json["NonViolated"],
        dueDate: json["DueDate"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "InProgress": inProgress,
        "Draft": draft,
        "OverDue": overDue,
        "Completed": completed,
        "TemplateCode": templateCode,
        "TemplateName": templateName,
        "Priority": priority,
        "CategoryCode": categoryCode,
        "Count": count,
        "Day": day,
        "Violated": violated,
        "NonViolated": nonViolated,
        "DueDate": dueDate,
      };
}
