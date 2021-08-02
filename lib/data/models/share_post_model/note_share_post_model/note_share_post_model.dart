// To parse this JSON data, do
//
//     final noteSharePostModel = noteSharePostModelFromJson(jsonString);

import 'dart:convert';

List<NoteSharePostModel> noteSharePostModelFromJson(String str) =>
    List<NoteSharePostModel>.from(
        json.decode(str).map((x) => NoteSharePostModel.fromJson(x)));

String noteSharePostModelToJson(List<NoteSharePostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoteSharePostModel {
  NoteSharePostModel({
    this.ntsNoteId,
    this.sharedWithUserId,
    this.sharedWithTeamId,
    this.serviceSharedWithTypeId,
  });

  String ntsNoteId;
  String sharedWithUserId;
  String sharedWithTeamId;
  int serviceSharedWithTypeId;

  factory NoteSharePostModel.fromJson(Map<String, dynamic> json) =>
      NoteSharePostModel(
        ntsNoteId: json["NtsNoteId"],
        sharedWithUserId: json["SharedWithUserId"],
        sharedWithTeamId: json["SharedWithTeamId"],
        serviceSharedWithTypeId: json["serviceSharedWithTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "NtsNoteId": ntsNoteId,
        "SharedWithUserId": sharedWithUserId,
        "SharedWithTeamId": sharedWithTeamId,
        "serviceSharedWithTypeId": serviceSharedWithTypeId,
      };
}
