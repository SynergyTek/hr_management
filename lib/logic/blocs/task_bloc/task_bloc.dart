import 'package:flutter/material.dart';
import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/task_models/task_response_model.dart';
import '../../../data/repositories/task_repository/task_repository.dart';
import 'package:rxdart/subjects.dart';

class TaskBloc {
  final TaskRepository _taskRepository = TaskRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<TaskResponseModel> _subject =
      BehaviorSubject<TaskResponseModel>();

  /// Used to fetch new entries.
  getTaskHomeListData({
      // String userId,
      String moduleId,
      String mode,
      String taskNo,
      String taskStatus,
      String taskAssigneeIds,
      String subject,
      DateTime startDate,
      DateTime dueDate,
      DateTime completionDate,
      String templateMasterCode,
      String text}) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["moduleId"] = moduleId;
    queryparams["mode"] = mode;
    queryparams["taskNo"] = taskNo;
    queryparams["taskStatus"] = taskStatus;
    queryparams["taskAssigneeIds"] = taskAssigneeIds;
    queryparams["subject"] = subject;
    queryparams["startDate"] = startDate;
    queryparams["dueDate"] = dueDate;
    queryparams["completionDate"] = completionDate;
    queryparams["templateMasterCode"] = templateMasterCode;
    queryparams["text"] = text;
    TaskResponseModel response = await _taskRepository.getTaskHomeListData(queryparams: queryparams,);
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postData({
    @required TaskResponseModel taskResponseModel,
  }) async {
    // PostResponse response = await _taskRepository.postAPIData(
    //   TaskResponseModel: taskResponseModel,
    // );

    // return response;
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getTask call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getTask call.
    // getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TaskResponseModel> get subject => _subject;
}

final taskBloc = TaskBloc();
