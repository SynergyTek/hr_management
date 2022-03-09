// To parse this JSON data, do
//
//     final taskSharePostModel = taskSharePostModelFromJson(jsonString);

import 'dart:convert';

List<TaskSharePostModel> taskSharePostModelFromJson(String str) =>
    List<TaskSharePostModel>.from(
        json.decode(str).map((x) => TaskSharePostModel.fromJson(x)));

String taskSharePostModelToJson(List<TaskSharePostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskSharePostModel {
  TaskSharePostModel({
    this.ntsTaskId,
    this.sharedWithUserId,
    this.sharedWithTeamId,
    this.serviceSharedWithTypeId,
  });

  String? ntsTaskId;
  String? sharedWithUserId;
  String? sharedWithTeamId;
  int? serviceSharedWithTypeId;

  factory TaskSharePostModel.fromJson(Map<String, dynamic> json) =>
      TaskSharePostModel(
        ntsTaskId: json["NtsTaskId"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedWithTeamId: json["SharedWithTeamId"],
        serviceSharedWithTypeId: json["serviceSharedWithTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "NtsTaskId": ntsTaskId,
        "SharedWithUserId": sharedWithUserId,
        "SharedWithTeamId": sharedWithTeamId,
        "serviceSharedWithTypeId": serviceSharedWithTypeId,
      };
}
