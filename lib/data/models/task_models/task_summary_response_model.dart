import 'package:hr_management/data/models/task_models/task_summary_model.dart';

class TaskSummaryResponse {
  bool? isSuccess;
  final Map<String,dynamic>? data;
  String? error;

  TaskSummaryResponse({
    required this.data,
  });

  TaskSummaryResponse.fromJson(Map<String, dynamic> response) : data = response;

  TaskSummaryResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
