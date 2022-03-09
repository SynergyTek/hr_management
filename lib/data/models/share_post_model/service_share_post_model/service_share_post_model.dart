// To parse this JSON data, do
//
//     final serviceSharePostModel = serviceSharePostModelFromJson(jsonString);

import 'dart:convert';

List<ServiceSharePostModel> serviceSharePostModelFromJson(String str) =>
    List<ServiceSharePostModel>.from(
        json.decode(str).map((x) => ServiceSharePostModel.fromJson(x)));

String serviceSharePostModelToJson(List<ServiceSharePostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceSharePostModel {
  ServiceSharePostModel({
    this.ntsServiceId,
    this.sharedWithUserId,
    this.sharedWithTeamId,
    this.serviceSharedWithTypeId,
  });

  String? ntsServiceId;
  String? sharedWithUserId;
  String? sharedWithTeamId;
  int? serviceSharedWithTypeId;

  factory ServiceSharePostModel.fromJson(Map<String, dynamic> json) =>
      ServiceSharePostModel(
        ntsServiceId: json["NtsServiceId"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedWithTeamId: json["SharedWithTeamId"],
        serviceSharedWithTypeId: json["serviceSharedWithTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "NtsServiceId": ntsServiceId,
        "SharedWithUserId": sharedWithUserId,
        "SharedWithTeamId": sharedWithTeamId,
        "serviceSharedWithTypeId": serviceSharedWithTypeId,
      };
}
