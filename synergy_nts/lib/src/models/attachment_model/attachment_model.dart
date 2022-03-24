import 'dart:core';

import '../../helpers/video_file.dart';
//part 'attachment.g.dart';
//@JsonSerializable(explicitToJson: true)
class AttachmentModel {
  String? userId;
  String? ntsId;
  String? name;
  String? fileType;
  String? ntsType;
  String? comment;
  List<VideoFile>? images;
  bool? isNtsComments;

  AttachmentModel();

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentPostFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentPostToJson(this);
}

AttachmentModel _$AttachmentPostFromJson(Map<String, dynamic> json) {
  return AttachmentModel()
    ..userId = json['UserId'] as String
    ..ntsId = json['NtsId'] as String
    ..name = json['Name'] as String
    ..fileType = json['FileType'] as String
    ..ntsType = json['NtsType'] as String
    ..comment = json['Comment'] as String
    ..images = json['Images'] as List<VideoFile>
    ..isNtsComments = json['IsNtsComments'] as bool;
}

Map<String, dynamic> _$AttachmentPostToJson(AttachmentModel instance) =>
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
