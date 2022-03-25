import 'workboard_model.dart';

class WorkBoardResponseModel {
  final List<WorkboardModel>? data;
  String? error;

  WorkBoardResponseModel({
    this.data,
  });

  WorkBoardResponseModel.fromJson(List response)
      : data = (response).map((i) => WorkboardModel.fromJson(i)).toList();

  WorkBoardResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}

class WorkBoardBoolResponseModel {
  final bool? booldata;
  String? error;

  WorkBoardBoolResponseModel({
    this.booldata,
  });

  WorkBoardBoolResponseModel.fromJson(bool response) : booldata = response;

  WorkBoardBoolResponseModel.withError(String errorValue)
      : booldata = null,
        error = errorValue;
}

class WorkBoardMapResponseModel {
  final WorkboardModel? mapdata;
  String? error;

  WorkBoardMapResponseModel({
    this.mapdata,
  });

  WorkBoardMapResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = WorkboardModel.fromJson(response);

  WorkBoardMapResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}
