import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CountsAPIModel {
  int serviceAttachmentCount;
  int serviceNotificationCount;
  int serviceCommentsCount;
  int serviceSharedCount;

  CountsAPIModel({
    @required this.serviceAttachmentCount,
    @required this.serviceCommentsCount,
    @required this.serviceNotificationCount,
    @required this.serviceSharedCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceAttachmentCount': serviceAttachmentCount,
      'serviceNotificationCount': serviceNotificationCount,
      'serviceCommentsCount': serviceCommentsCount,
      'serviceSharedCount': serviceSharedCount,
    };
  }

  factory CountsAPIModel.fromMap(Map<String, dynamic> map) {
    return CountsAPIModel(
      serviceAttachmentCount: map['serviceAttachmentCount'],
      serviceNotificationCount: map['serviceNotificationCount'],
      serviceCommentsCount: map['serviceCommentsCount'],
      serviceSharedCount: map['serviceSharedCount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CountsAPIModel.fromJson(Map<String, dynamic> map) =>
      CountsAPIModel.fromMap(map);
}
