import 'dart:convert';

List<DependentDocReqListModel> dependentDocReqListModelFromJson(String str) =>
    List<DependentDocReqListModel>.from(
        json.decode(str).map((x) => DependentDocReqListModel.fromJson(x)));

String dependentDocReqListModelToJson(List<DependentDocReqListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DependentDocReqListModel {
  DependentDocReqListModel({
    this.documentType,
    this.ownerName,
    this.expiryDate,
    this.issueDate,
    this.templateCode,
    this.serviceNo,
    this.serviceId,
    this.status,
    this.fileId,
    this.depNoteId,
    this.noteNo,
    this.noteId,
    this.documentCount,
    this.noteVersionNo,
    this.attachVersionNo,
    this.createdDate,
  });

  String? documentType;
  dynamic ownerName;
  dynamic expiryDate;
  DateTime? issueDate;
  String? templateCode;
  String? serviceNo;
  String? serviceId;
  String? status;
  dynamic fileId;
  dynamic depNoteId;
  dynamic noteNo;
  dynamic noteId;
  int? documentCount;
  dynamic noteVersionNo;
  dynamic attachVersionNo;
  dynamic createdDate;

  factory DependentDocReqListModel.fromJson(Map<String, dynamic> json) =>
      DependentDocReqListModel(
        documentType: json["DocumentType"],
        ownerName: json["OwnerName"],
        expiryDate: json["ExpiryDate"],
        issueDate: DateTime.parse(json["IssueDate"]),
        templateCode: json["TemplateCode"],
        serviceNo: json["ServiceNo"],
        serviceId: json["ServiceId"],
        status: json["Status"],
        fileId: json["FileId"],
        depNoteId: json["DepNoteId"],
        noteNo: json["NoteNo"],
        noteId: json["NoteId"],
        documentCount: json["DocumentCount"],
        noteVersionNo: json["NoteVersionNo"],
        attachVersionNo: json["AttachVersionNo"],
        createdDate: json["CreatedDate"],
      );

  Map<String, dynamic> toJson() => {
        "DocumentType": documentType,
        "OwnerName": ownerName,
        "ExpiryDate": expiryDate,
        "IssueDate": issueDate!.toIso8601String(),
        "TemplateCode": templateCode,
        "ServiceNo": serviceNo,
        "ServiceId": serviceId,
        "Status": status,
        "FileId": fileId,
        "DepNoteId": depNoteId,
        "NoteNo": noteNo,
        "NoteId": noteId,
        "DocumentCount": documentCount,
        "NoteVersionNo": noteVersionNo,
        "AttachVersionNo": attachVersionNo,
        "CreatedDate": createdDate,
      };
}
