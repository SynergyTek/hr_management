import 'dart:convert';

import '../permissions_model/user_permission_model/user_permission_response.dart';

class ExtraUserInformationModel {
  final bool isSignedIn;
  final String? portalType;
  final UserPermissionResponse? userPermissionResponse;

  ExtraUserInformationModel({
    this.isSignedIn = false,
    this.portalType,
    this.userPermissionResponse,
  });

  factory ExtraUserInformationModel.fromMap(Map<String, dynamic> map) {
    return ExtraUserInformationModel(
      isSignedIn: map['isSignedIn'] ?? false,
      portalType: map['portalType'],
      userPermissionResponse: map['userPermissionResponse'] != null
          ? UserPermissionResponse.fromMap(map['userPermissionResponse'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isSignedIn': isSignedIn,
      'portalType': portalType,
      'userPermissionResponse': userPermissionResponse?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  factory ExtraUserInformationModel.fromJson(String source) =>
      ExtraUserInformationModel.fromMap(json.decode(source));
}
