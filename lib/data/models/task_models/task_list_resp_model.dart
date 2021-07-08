import 'package:flutter/material.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';

class TaskListResponseModel {
  final List<TaskListModel> data;
  String error;

  TaskListResponseModel({
    @required this.data,
  });

  TaskListResponseModel.fromJson(List response)
      : data = (response).map((i) => new TaskListModel.fromJson(i)).toList();

  TaskListResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}
