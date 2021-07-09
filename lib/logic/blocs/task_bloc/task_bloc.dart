import 'package:flutter/material.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/task_models/task_response_model.dart';
import '../../../data/repositories/task_repository/abstract_task_repo.dart';
import 'package:rxdart/subjects.dart';

class TaskBloc {
  final TaskRepository _taskRepository = TaskRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<TaskListResponseModel> _subject =
      BehaviorSubject<TaskListResponseModel>();

  /// Used to fetch new entries.
  getTaskHomeListData({
    Map<String, dynamic> queryparams, // String userId,
  }) async {
    TaskListResponseModel response = await _taskRepository.getTaskHomeListData(
      queryparams: queryparams,
    );
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

  BehaviorSubject<TaskListResponseModel> get subject => _subject;
}

final taskBloc = TaskBloc();
