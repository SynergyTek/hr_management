import 'workboard_model.dart';

class WorkBoardResponseModel {
  final List<WorkboardModel>? data;
  String? error;

  WorkBoardResponseModel({
    required this.data,
  });

  WorkBoardResponseModel.fromJson(List response)
      : data = (response).map((i) => new WorkboardModel.fromJson(i)).toList();

  WorkBoardResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}
