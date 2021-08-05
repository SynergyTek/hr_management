import 'package:hr_management/data/models/share_models/note_shared_models/note_shared_data_model.dart';
import 'package:hr_management/data/models/share_models/task_shared_models/task_shared_data_model.dart';

class TaskSharedDataResponse {
  bool isSuccess;
  List<TaskSharedDataModel> list;
  String error;

  TaskSharedDataResponse({this.list});

  TaskSharedDataResponse.fromJson(List response)
      : list =
            (response).map((i) => new TaskSharedDataModel.fromJson(i)).toList();

  TaskSharedDataResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
