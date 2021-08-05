
import 'dart:core';

//@JsonSerializable(explicitToJson: true)
class AttachmentViewModel {
  String fileId;
  String contentLength;
  String fileExtension;
  String createdDate;
  bool isInPhysicalPath;
  String contentType;
  String fileName;
  String commentedByUserUserName;
  String comment;
  int commentedByUserId;

  AttachmentViewModel();

  factory AttachmentViewModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentPostFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentPostToJson(this);
}

AttachmentViewModel _$AttachmentPostFromJson(Map<String, dynamic> json) {
  return AttachmentViewModel()
    ..fileId = json['FileId'] as String
    ..fileName = json['FileName'] as String
    ..contentLength = json['ContentLength'] as String
    ..fileExtension = json['FileExtension'] as String
    ..createdDate = json['CreatedDate'] as String
    ..isInPhysicalPath = (json['IsInPhysicalPath']?? false) as bool
    ..commentedByUserUserName = json['CommentedByUserUserName'] as String
    ..comment = json['Comment'] as String
    ..commentedByUserId = json['CommentedByUserId'] as int
    ..contentType = json['ContentType'] as String;
}

Map<String, dynamic> _$AttachmentPostToJson(AttachmentViewModel instance) =>
    <String, dynamic>{
      'FileId': instance.fileId,
      'ContentLength': instance.contentLength,
      'FileExtension': instance.fileExtension,
      'CreatedDate': instance.createdDate,
      'IsInPhysicalPath': instance.isInPhysicalPath,
      'ContentType': instance.contentType,
      'FileName': instance.fileName,
      'CommentedByUserUserName': instance.commentedByUserUserName,
      'Comment': instance.comment,
      'CommentedByUserId': instance.commentedByUserId
    };
