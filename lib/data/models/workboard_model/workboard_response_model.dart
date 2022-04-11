import 'package:hr_management/data/models/workboard_model/add_workboard_content_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_section_model.dart';

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

class AddContentWorkBoardMapResponseModel {
  final AddContentWorkBoardModel? mapdata;
  String? error;

  AddContentWorkBoardMapResponseModel({
    this.mapdata,
  });

  AddContentWorkBoardMapResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = AddContentWorkBoardModel.fromJson(response);

  AddContentWorkBoardMapResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}


class WorkBoardSectionMapResponseModel {
  final WorkBoardSectionModel? mapdata;
  String? error;

  WorkBoardSectionMapResponseModel({
    this.mapdata,
  });

  WorkBoardSectionMapResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = WorkBoardSectionModel.fromJson(response);

  WorkBoardSectionMapResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}

class WorkBoardPostResponse {
  bool? isSuccess;
  dynamic item;
  WorkboardModel? data;

  WorkBoardPostResponse();

  WorkBoardPostResponse.fromJson(Map<String, dynamic> jsonResponse) {
    isSuccess = jsonResponse['success'];
    item = jsonResponse['Item'];
    data = WorkboardModel.fromJson(jsonResponse);
  }

  WorkBoardPostResponse.withError(String errorValue)
      : item = null,
        isSuccess = false;
}
class WorkBoardPostResponseSection {
  bool? isSuccess;
  dynamic item;
  WorkBoardSectionModel? data;

  WorkBoardPostResponseSection();

  WorkBoardPostResponseSection.fromJson(Map<String, dynamic> jsonResponse) {
    isSuccess = jsonResponse['success'];
    item = jsonResponse['Item'];
    data = WorkBoardSectionModel.fromJson(jsonResponse);
  }

  WorkBoardPostResponseSection.withError(String errorValue)
      : item = null,
        isSuccess = false;
}
class WorkBoardPostResponseContent {
  bool? isSuccess;
  dynamic item;
  AddContentWorkBoardModel? data;

  WorkBoardPostResponseContent();

  WorkBoardPostResponseContent.fromJson(Map<String, dynamic> jsonResponse) {
    isSuccess = jsonResponse['success'];
    item = jsonResponse['Item'];
    data = AddContentWorkBoardModel.fromJson(jsonResponse);
  }

  WorkBoardPostResponseContent.withError(String errorValue)
      : item = null,
        isSuccess = false;
}
