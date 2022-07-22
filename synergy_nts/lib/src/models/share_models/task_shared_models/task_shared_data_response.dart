import 'task_shared_data_model.dart';

class TaskSharedDataResponse {
  bool? isSuccess;
  List<TaskSharedDataModel>? list;
  String? error;

  TaskSharedDataResponse({this.list});

  TaskSharedDataResponse.fromJson(List response)
      : list = (response).map((i) => TaskSharedDataModel.fromJson(i)).toList();

  TaskSharedDataResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
