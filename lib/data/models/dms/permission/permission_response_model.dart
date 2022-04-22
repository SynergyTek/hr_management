import 'package:flutter/material.dart';

import 'permission_model.dart';

class PermissionResponse {
  final List<Permission>? data;
  String? error;

  PermissionResponse({
    required this.data,
  });

  PermissionResponse.fromJson(List response)
      : data = response.map((i) => new Permission.fromJson(i)).toList(),
        error = "";

  PermissionResponse.withError(dynamic errorValue)
      : data = null,
        error = errorValue;
}

class ViewPermissionResponse {
  final Permission? data;
  String? error;

  ViewPermissionResponse({
    required this.data,
  });

  ViewPermissionResponse.fromJson(Map<String, dynamic> response)
      : data = Permission.fromJson(response);

  ViewPermissionResponse.withError(dynamic errorValue)
      : data = null,
        error = errorValue;
}

class SubmitPermissionResponse {
  PermissionSubmitModel? data;
  String? error;
  bool? isSuccess;
  String? messages;

  SubmitPermissionResponse({
    required this.data,
    this.isSuccess,
  });

  SubmitPermissionResponse.fromJson(Map<String, dynamic> response) {
    data = PermissionSubmitModel.fromJson(response);
    isSuccess = response["success"] ?? false;
    messages = response["error"] ?? 'Permission added successfully';
  }

  SubmitPermissionResponse.withError(dynamic errorValue)
      : data = null,
        error = errorValue;
}
