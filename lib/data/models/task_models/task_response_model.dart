import 'package:flutter/material.dart';

import 'task_model.dart';

class TaskResponseModel {
  final TaskModel? data;
  String? error;

  TaskResponseModel({
    required this.data,
  });

  TaskResponseModel.fromJson(Map<String, dynamic> response)
      : data = TaskModel.fromJson(response);

  TaskResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}
