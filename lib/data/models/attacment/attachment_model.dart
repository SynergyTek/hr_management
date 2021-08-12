import 'dart:core';

import 'video_file.dart';

//part 'attachment.g.dart';
//@JsonSerializable(explicitToJson: true)
class Attachment {
  String userId;
  int ntsId;
  String name;
  String fileType;
  String ntsType;
  String comment;
  List<VideoFile> images;
  bool isNtsComments;

  Attachment();

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentPostFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentPostToJson(this);
}

Attachment _$AttachmentPostFromJson(Map<String, dynamic> json) {
  return Attachment()
    ..userId = json['UserId'] as String
    ..ntsId = json['NtsId'] as int
    ..name = json['Name'] as String
    ..fileType = json['FileType'] as String
    ..ntsType = json['NtsType'] as String
    ..comment = json['Comment'] as String
    ..images = json['Images'] as List
    ..isNtsComments = json['IsNtsComments'] as bool;
}

Map<String, dynamic> _$AttachmentPostToJson(Attachment instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'NtsId': instance.ntsId,
      'Name': instance.name,
      'FileType': instance.fileType,
      'NtsType': instance.ntsType,
      'Comment': instance.comment,
      'Images': instance.images,
      'IsNtsComments': instance.isNtsComments,
    };
