import 'dart:convert';

import 'package:hr_management/data/models/dms/doc_files_model.dart';

DmsPostModel dmsPostModelFromJson(String str) =>
    DmsPostModel.fromJson(json.decode(str));

String dmsPostModelToJson(DmsPostModel data) => json.encode(data.toJson());

class DmsPostModel {
  DmsPostModel({
    this.action,
    this.path,
    this.showHiddenItems,
    this.data,
    this.userId,
  });

  String? action;
  String? path;
  bool? showHiddenItems;
  List<Cwd?>? data;
  String? userId;

  factory DmsPostModel.fromJson(Map<String, dynamic> json) => DmsPostModel(
        action: json["action"],
        path: json["path"],
        showHiddenItems: json["showHiddenItems"],
        data: List<Cwd>.from(json["data"].map((x) => Cwd.fromJson(x))),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "path": path,
        "showHiddenItems": showHiddenItems,
        "data": List<dynamic>.from(data!.map((x) => x!.toJson())),
        "userId": userId,
      };
}
