// To parse this JSON data, do
//
//     final commonListModel = commonListModelFromJson(jsonString);

import 'dart:convert';

List<CommonListModel> commonListModelFromJson(String str) => List<CommonListModel>.from(json.decode(str).map((x) => CommonListModel.fromJson(x)));

String commonListModelToJson(List<CommonListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommonListModel {
    CommonListModel({
        this.name,
        this.code,
        this.enumId,
        this.dateTest,
        this.dataType,
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

    String? name;
    String? code;
    int? enumId;
    dynamic dateTest;
    dynamic dataType;
    String? id;
    DateTime? createdDate;
    dynamic createdBy;
    DateTime? lastUpdatedDate;
    dynamic lastUpdatedBy;
    bool? isDeleted;
    dynamic sequenceOrder;
    dynamic companyId;
    dynamic legalEntityId;
    int? dataAction;
    int? status;
    int? versionNo;
    dynamic portalId;

    factory CommonListModel.fromJson(Map<String, dynamic> json) => CommonListModel(
        name: json["Name"],
        code: json["Code"],
        enumId: json["EnumId"],
        dateTest: json["DateTest"],
        dataType: json["DataType"],
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
        "Name": name,
        "Code": code,
        "EnumId": enumId,
        "DateTest": dateTest,
        "DataType": dataType,
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
