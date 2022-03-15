
import 'dart:core';

//@JsonSerializable(explicitToJson: true)
class VideoFile {
  String? fileName;
  String? mimeType;
  String? imageData;
  String? stringData;

  VideoFile();

  factory VideoFile.fromJson(Map<String, dynamic> json) =>
      _$VideoFilePostFromJson(json);
  Map<String, dynamic> toJson() => _$VideoFilePostToJson(this);
}

VideoFile _$VideoFilePostFromJson(Map<String, dynamic> json) {
  return VideoFile()
    ..fileName = json['FileName'] as String
    ..mimeType = json['MimeType'] as String
    ..imageData = json['ImageData'] as String
    ..stringData = json['stringData'] as String;
  }
  Map<String, dynamic> _$VideoFilePostToJson(VideoFile instance) => <String, dynamic>{
      'FileName': instance.fileName,
      'MimeType': instance.mimeType,
      'ImageData': instance.imageData,    
      'StringData': instance.stringData,
  };