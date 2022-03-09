import 'dart:convert';

List<EnumTreeListModel> enumTreeListModelFromJson(String str) =>
    List<EnumTreeListModel>.from(
        json.decode(str).map((x) => EnumTreeListModel.fromJson(x)));

String enumTreeListModelToJson(List<EnumTreeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnumTreeListModel {
  EnumTreeListModel({
    this.id,
    this.name,
    this.displayName,
    this.iconCss,
    this.iconTitle,
    this.parentId,
    this.hasChildren,
    this.expanded,
    this.type,
    this.portalId,
    this.rootId,
    this.itemLevel,
    this.checked,
    this.url,
    this.userRoleId,
    this.projectId,
    this.performanceId,
    this.stageName,
    this.stageId,
    this.batchId,
    this.statusCode,
    this.statusCodeStr,
    this.bannerId,
    this.bannerStyle,
    this.directory,
    this.templateType,
    this.templateTypeText,
    this.fieldDataType,
  });

  String? id;
  String? name;
  String? displayName;
  dynamic iconCss;
  dynamic iconTitle;
  String? parentId;
  bool? hasChildren;
  bool? expanded;
  String? type;
  dynamic portalId;
  dynamic rootId;
  int? itemLevel;
  bool? checked;
  dynamic url;
  dynamic userRoleId;
  dynamic projectId;
  dynamic performanceId;
  dynamic stageName;
  dynamic stageId;
  dynamic batchId;
  dynamic statusCode;
  String? statusCodeStr;
  dynamic bannerId;
  dynamic bannerStyle;
  dynamic directory;
  dynamic templateType;
  String? templateTypeText;
  dynamic fieldDataType;

  factory EnumTreeListModel.fromJson(Map<String, dynamic> json) =>
      EnumTreeListModel(
        id: json["id"],
        name: json["Name"],
        displayName: json["DisplayName"],
        iconCss: json["IconCss"],
        iconTitle: json["IconTitle"],
        parentId: json["ParentId"],
        hasChildren: json["hasChildren"],
        expanded: json["expanded"],
        type: json["Type"],
        portalId: json["PortalId"],
        rootId: json["RootId"],
        itemLevel: json["ItemLevel"],
        checked: json["Checked"],
        url: json["Url"],
        userRoleId: json["UserRoleId"],
        projectId: json["ProjectId"],
        performanceId: json["PerformanceId"],
        stageName: json["StageName"],
        stageId: json["StageId"],
        batchId: json["BatchId"],
        statusCode: json["StatusCode"],
        statusCodeStr: json["StatusCodeStr"],
        bannerId: json["BannerId"],
        bannerStyle: json["BannerStyle"],
        directory: json["Directory"],
        templateType: json["TemplateType"],
        templateTypeText: json["TemplateTypeText"],
        fieldDataType: json["FieldDataType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "DisplayName": displayName,
        "IconCss": iconCss,
        "IconTitle": iconTitle,
        "ParentId": parentId,
        "hasChildren": hasChildren,
        "expanded": expanded,
        "Type": type,
        "PortalId": portalId,
        "RootId": rootId,
        "ItemLevel": itemLevel,
        "Checked": checked,
        "Url": url,
        "UserRoleId": userRoleId,
        "ProjectId": projectId,
        "PerformanceId": performanceId,
        "StageName": stageName,
        "StageId": stageId,
        "BatchId": batchId,
        "StatusCode": statusCode,
        "StatusCodeStr": statusCodeStr,
        "BannerId": bannerId,
        "BannerStyle": bannerStyle,
        "Directory": directory,
        "TemplateType": templateType,
        "TemplateTypeText": templateTypeText,
        "FieldDataType": fieldDataType,
      };
}
