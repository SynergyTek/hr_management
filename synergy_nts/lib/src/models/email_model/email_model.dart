// To parse this JSON data, do
//
//     final emailTasksModel = emailTasksModelFromJson(jsonString);

import 'dart:convert';

EmailTasksModel emailTasksModelFromJson(String str) =>
    EmailTasksModel.fromJson(json.decode(str));

String emailTasksModelToJson(EmailTasksModel data) =>
    json.encode(data.toJson());

class EmailTasksModel {
  EmailTasksModel({
    this.data,
    this.total,
  });

  List<EmailData>? data;
  int? total;

  factory EmailTasksModel.fromJson(Map<String, dynamic> json) =>
      EmailTasksModel(
        data: List<EmailData>.from(
            json["Data"].map((x) => EmailData.fromJson(x))),
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "Total": total,
      };
}

class EmailData {
  EmailData({
    this.subject,
    this.body,
    this.bcc,
    this.cc,
    this.to,
    this.from,
    this.messageId,
    this.toUserId,
    this.fromUserId,
    this.taskId,
    this.isTaskCreated,
    this.emailType,
    this.attachmentIds,
    this.total,
  });

  String? subject;
  String? body;
  String? bcc;
  String? cc;
  String? to;
  String? from;
  String? messageId;
  String? toUserId;
  String? fromUserId;
  String? taskId;
  bool? isTaskCreated;
  EmailType? emailType;
  String? attachmentIds;
  int? total;

  factory EmailData.fromJson(Map<String, dynamic> json) => EmailData(
        subject: json["Subject"],
        body: json["Body"],
        bcc: json["Bcc"],
        cc: json["Cc"],
        to: json["To"],
        from: json["From"],
        messageId: json["MessageId"],
        toUserId: json["ToUserId"],
        fromUserId: json["FromUserId"],
        taskId: json["TaskId"],
        isTaskCreated: json["IsTaskCreated"],
        emailType: emailTypeValues.map![json["EmailType"]],
        attachmentIds: json["AttachmentIds"],
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "Subject": subject,
        "Body": body,
        "Bcc": bcc,
        "Cc": cc,
        "To": to,
        "From": from,
        "MessageId": messageId,
        "ToUserId": toUserId,
        "FromUserId": fromUserId,
        "TaskId": taskId,
        "IsTaskCreated": isTaskCreated,
        "EmailType": emailTypeValues.reverse[emailType],
        "AttachmentIds": attachmentIds,
        "Total": total,
      };
}

enum EmailType { INBOX }

final emailTypeValues = EnumValues({"INBOX": EmailType.INBOX});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
