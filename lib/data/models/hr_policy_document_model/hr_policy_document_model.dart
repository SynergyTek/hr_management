// To parse this JSON data, do
//
//     final policyDocumentsModel = policyDocumentsModelFromJson(jsonString);

import 'dart:convert';

List<PolicyDocumentsModel> policyDocumentsModelFromJson(String str) => List<PolicyDocumentsModel>.from(json.decode(str).map((x) => PolicyDocumentsModel.fromJson(x)));

String policyDocumentsModelToJson(List<PolicyDocumentsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PolicyDocumentsModel {
    PolicyDocumentsModel({
        this.policyName,
        this.policyDescription,
        this.policyDocument,
        this.startDate,
        this.ntsNoteId,
        this.id,
        this.userId,
    });

    String? policyName;
    String? policyDescription;
    String? policyDocument;
    DateTime? startDate;
    String? ntsNoteId;
    String? id;
    dynamic? userId;

    factory PolicyDocumentsModel.fromJson(Map<String, dynamic> json) => PolicyDocumentsModel(
        policyName: json["PolicyName"],
        policyDescription: json["PolicyDescription"],
        policyDocument: json["PolicyDocument"],
        startDate: DateTime.parse(json["StartDate"]),
        ntsNoteId: json["NtsNoteId"],
        id: json["Id"],
        userId: json["UserId"],
    );

    Map<String, dynamic> toJson() => {
        "PolicyName": policyName,
        "PolicyDescription": policyDescription,
        "PolicyDocument": policyDocument,
        "StartDate": startDate?.toIso8601String(),
        "NtsNoteId": ntsNoteId,
        "Id": id,
        "UserId": userId,
    };
}
