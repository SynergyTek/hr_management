import 'package:flutter/material.dart';

import 'permission_model.dart';

class PermissionResponse {
  final List<Permission> data;
  String error;

  PermissionResponse({
    @required this.data,
  });

  PermissionResponse.fromJson(List response)
      : data = response.map((i) => new Permission.fromJson(i)).toList(),
        error = "";

  PermissionResponse.withError(dynamic errorValue)
      : data = null,
        error = errorValue;
}

class ViewPermissionResponse {
  final Permission data;
  String error;

  ViewPermissionResponse({
    @required this.data,
  });

  ViewPermissionResponse.fromJson(Map<String, dynamic> response)
      : data = Permission.fromJson(response);

  ViewPermissionResponse.withError(dynamic errorValue)
      : data = null,
        error = errorValue;
}

class SubmitPermissionResponse {
  final PermissionSubmitModel data;
  String error;

  SubmitPermissionResponse({
    @required this.data,
  });

  SubmitPermissionResponse.fromJson(Map<String, dynamic> response)
      : data = PermissionSubmitModel.fromJson(response);

  SubmitPermissionResponse.withError(dynamic errorValue)
      : data = null,
        error = errorValue;
}
