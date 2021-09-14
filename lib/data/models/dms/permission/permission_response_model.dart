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

  PermissionResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
