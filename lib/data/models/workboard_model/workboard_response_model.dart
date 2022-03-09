
import 'workboard_model.dart';

class WorkBoardListResponseModel {
  final List<WorkboardModel>? data;
  String? error;

  WorkBoardListResponseModel({
    required this.data,
  });

  WorkBoardListResponseModel.fromJson(List response)
      : data = (response).map((i) => new WorkboardModel.fromJson(i)).toList();

  WorkBoardListResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}