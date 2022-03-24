// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<ReadUserHierarchyModel> readHierarchyModelFromJson(String str) =>
    List<ReadUserHierarchyModel>.from(
        json.decode(str).map((x) => ReadUserHierarchyModel.fromJson(x)));

String readHierarchyModelToJson(List<ReadUserHierarchyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadUserHierarchyModel {
  ReadUserHierarchyModel({
    this.hierarchyType,
    this.code,
    this.name,
    this.description,
    this.level1Name,
    this.level2Name,
    this.level3Name,
    this.level4Name,
    this.level5Name,
    this.rootNodeId,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastUpdatedDate,
    this.lastUpdatedBy,
    this.isDeleted,
    this.sequenceOrder,
    this.companyId,
    // this.legalEntityId,
    this.dataAction,
    this.status,
    this.versionNo,
    this.portalId,
  });

  int? hierarchyType;
  String? code;
  String? name;
  String? description;
  String? level1Name;
  String? level2Name;
  String? level3Name;
  String? level4Name;
  String? level5Name;
  String? rootNodeId;
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  int? sequenceOrder;
  String? companyId;
  // LegalEntityId? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  factory ReadUserHierarchyModel.fromJson(Map<String, dynamic> json) =>
      ReadUserHierarchyModel(
        hierarchyType: json["HierarchyType"],
        code: json["Code"],
        name: json["Name"],
        description: json["Description"] == null ? null : json["Description"],
        level1Name: json["Level1Name"] == null ? null : json["Level1Name"],
        level2Name: json["Level2Name"] == null ? null : json["Level2Name"],
        level3Name: json["Level3Name"] == null ? null : json["Level3Name"],
        level4Name: json["Level4Name"] == null ? null : json["Level4Name"],
        level5Name: json["Level5Name"] == null ? null : json["Level5Name"],
        rootNodeId: json["RootNodeId"] == null ? null : json["RootNodeId"],
        id: json["Id"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder:
            json["SequenceOrder"] == null ? null : json["SequenceOrder"],
        companyId: json["CompanyId"],
        // legalEntityId: json["LegalEntityId"] == null ? null : legalEntityIdValues.map[json["LegalEntityId"]],
        dataAction: json["DataAction"],
        status: json["Status"],
        versionNo: json["VersionNo"],
        portalId: json["PortalId"] == null ? null : json["PortalId"],
      );

  Map<String, dynamic> toJson() => {
        "HierarchyType": hierarchyType,
        "Code": code,
        "Name": name,
        "Description": description == null ? null : description,
        "Level1Name": level1Name == null ? null : level1Name,
        "Level2Name": level2Name == null ? null : level2Name,
        "Level3Name": level3Name == null ? null : level3Name,
        "Level4Name": level4Name == null ? null : level4Name,
        "Level5Name": level5Name == null ? null : level5Name,
        "RootNodeId": rootNodeId == null ? null : rootNodeId,
        "Id": id,
        "CreatedDate": createdDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder == null ? null : sequenceOrder,
        "CompanyId": companyId,
        // "LegalEntityId": legalEntityId == null ? null : legalEntityIdValues.reverse[legalEntityId],
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
        "PortalId": portalId == null ? null : portalId,
      };
}

// enum LegalEntityId { THE_60_D2_DF036755_E8_DE168_D8_DB7 }

// final legalEntityIdValues = EnumValues({
//     "60d2df036755e8de168d8db7": LegalEntityId.THE_60_D2_DF036755_E8_DE168_D8_DB7
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap!;
//     }
// }
