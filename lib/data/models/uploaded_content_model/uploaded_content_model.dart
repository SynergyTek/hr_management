import 'dart:convert';

UploadedContentModel uploadedContentModelFromJson(String str) =>
    UploadedContentModel.fromJson(json.decode(str));

String uploadedContentModelToJson(UploadedContentModel data) =>
    json.encode(data.toJson());

class UploadedContentModel {
  UploadedContentModel({
    this.uploadedContent,
    this.parentId,
  });

  String? uploadedContent;
  String? parentId;

  factory UploadedContentModel.fromJson(Map<String, dynamic> json) =>
      UploadedContentModel(
        uploadedContent: json["UploadedContent"],
        parentId: json["parentId"],
      );

  Map<String, dynamic> toJson() => {
        "UploadedContent": uploadedContent,
        "parentId": parentId,
      };
}

List<UploadedContent> uploadedContentFromJson(String str) =>
    List<UploadedContent>.from(
        json.decode(str).map((x) => UploadedContent.fromJson(x)));

String uploadedContentToJson(List<UploadedContent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UploadedContent {
  UploadedContent({
    this.uploaded,
    this.fileUid,
    this.fileIds,
    this.id,
    this.folderName,
    this.parentFolderName,
    this.fileId,
    this.relativePath,
    this.folders,
    this.dataAction,
  });

  bool? uploaded;
  String? fileUid;
  String? fileIds;
  dynamic id;
  String? folderName;
  dynamic parentFolderName;
  String? fileId;
  String? relativePath;
  dynamic folders;
  dynamic dataAction;

  factory UploadedContent.fromJson(Map<String, dynamic> json) =>
      UploadedContent(
        uploaded: json["uploaded"],
        fileUid: json["fileUid"],
        fileIds: json["fileIds"],
        id: json["Id"],
        folderName: json["FolderName"],
        parentFolderName: json["ParentFolderName"],
        fileId: json["FileId"],
        relativePath: json["RelativePath"],
        folders: json["Folders"],
        dataAction: json['DataAction'],
      );

  Map<String, dynamic> toJson() => {
        "uploaded": uploaded,
        "fileUid": fileUid,
        "fileIds": fileIds,
        "Id": id,
        "FolderName": folderName,
        "ParentFolderName": parentFolderName,
        "FileId": fileId,
        "RelativePath": relativePath,
        "Folders": folders,
        "DataAction": dataAction,
      };
}
