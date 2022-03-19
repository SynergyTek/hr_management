import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:rxdart/subjects.dart';
import '../../../data/models/task_models/task_list_resp_model.dart';
import '../../../data/repositories/workboard_repo/abstract_workboard_repo.dart';

class WorkboardBloc {
  final WorkboardRepository _workboardRepository = WorkboardRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<WorkBoardResponseModel> _subjectWorkboardList =
      BehaviorSubject<WorkBoardResponseModel>();

  final BehaviorSubject<WorkBoardResponseModel> _subjectCreateWorkboardList =
      BehaviorSubject<WorkBoardResponseModel>();
  final BehaviorSubject<TaskListResponseModel?> _subjectWorkboardTaskList =
      BehaviorSubject<TaskListResponseModel?>();

  final BehaviorSubject<int?> _subjectWorkboardTaskCount =
      BehaviorSubject<int?>();

  final BehaviorSubject<int?> _subjectWorkboardCompletedTaskCount =
      BehaviorSubject<int?>();

  /// Used to fetch new entries.
  getWorkboardData({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardResponseModel response =
        await _workboardRepository.getWorkboardList(
      queryparams: queryparams,
    );
    _subjectWorkboardList.sink.add(response);
  }

  getCreateWorkboardData({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardResponseModel response =
        await _workboardRepository.getCreateWorkboardList(
      queryparams: queryparams,
    );
    _subjectCreateWorkboardList.sink.add(response);
  }

  dispose() {
    _subjectWorkboardList.close();
    _subjectCreateWorkboardList.close();
    _subjectWorkboardTaskList.close();
    _subjectWorkboardTaskCount.close();
    _subjectWorkboardCompletedTaskCount.close();
  }

  BehaviorSubject<WorkBoardResponseModel> get subjectWorkboardList =>
      _subjectWorkboardList;
  BehaviorSubject<WorkBoardResponseModel> get subjectCreateWorkboardList =>
      _subjectCreateWorkboardList;
  BehaviorSubject<TaskListResponseModel?> get subjectWorkboardTaskList =>
      _subjectWorkboardTaskList;

  BehaviorSubject<int?> get subjectWorkboardTaskCount =>
      _subjectWorkboardTaskCount;

  BehaviorSubject<int?> get subjectWorkboardCompletedTaskCount =>
      _subjectWorkboardCompletedTaskCount;

  getTaskDashBoardData({
    Map<String, dynamic>? queryparams,
    String? taskListStatus,
    String? requestBy, // String userId,
  }) async {
    TaskListResponseModel response =
        await _workboardRepository.getTaskDashBoardData(
      queryparams: queryparams,
    );
    _subjectWorkboardTaskList.sink.add(response);

    if (queryparams?['status'] == "TASK_STATUS_COMPLETE" ||
        queryparams?['status'] == null) {
      _subjectWorkboardTaskCount.sink.add(response.data?.length);

      var comCnt = response.data?.where((element) =>
          element.taskStatusCode == "TASK_STATUS_COMPLETE" ||
          element.taskStatusCode == "TASK_STATUS_REJECT" ||
          element.taskStatusCode == "TASK_STATUS_CANCEL");
      _subjectWorkboardCompletedTaskCount.add(comCnt?.length);
    }
  }
}

final workboardBloc = WorkboardBloc();

// import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
// import 'package:rxdart/subjects.dart';
// import '../../../data/models/task_models/task_list_resp_model.dart';
// import '../../../data/repositories/workboard_repo/abstract_workboard_repo.dart';

// class WorkboardBloc {
//   final WorkboardRepository _workboardRepository = WorkboardRepository();

//   // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
//   final BehaviorSubject<WorkBoardResponseModel?> _subjectWorkboardList =
//       BehaviorSubject<WorkBoardResponseModel?>();

//   final BehaviorSubject<TaskListResponseModel?> _subjectWorkboardTaskList =
//       BehaviorSubject<TaskListResponseModel?>();

//   final BehaviorSubject<int?> _subjectWorkboardTaskCount =
//       BehaviorSubject<int?>();

//   final BehaviorSubject<int?> _subjectWorkboardCompletedTaskCount =
//       BehaviorSubject<int?>();

//   final BehaviorSubject<WorkBoardResponseModel> _subjectCreateWorkboardList =
//       BehaviorSubject<WorkBoardResponseModel>();

//   /// Used to fetch new entries.
//   getWorkboardData({
//     Map<String, dynamic>? queryparams,
//   }) async {
//     WorkBoardResponseModel response =
//         await _workboardRepository.getWorkboardList(
//       queryparams: queryparams,
//     );
//     _subjectWorkboardList.sink.add(response);
//   }

//   getCreateWorkboardData({
//     Map<String, dynamic>? queryparams,
//   }) async {
//     WorkBoardResponseModel response =
//         await _workboardRepository.getCreateWorkboardList(
//       queryparams: queryparams,
//     );
//     _subjectCreateWorkboardList.sink.add(response);
//   }

//   dispose() {
//     _subjectWorkboardList.close();
//     _subjectWorkboardTaskList.close();
//     _subjectWorkboardTaskCount.close();
//     _subjectWorkboardCompletedTaskCount.close();
//     _subjectCreateWorkboardList.close();
//   }

//   BehaviorSubject<WorkBoardResponseModel?> get subjectWorkboardList =>
//       _subjectWorkboardList;

//   BehaviorSubject<TaskListResponseModel?> get subjectWorkboardTaskList =>
//       _subjectWorkboardTaskList;

//   BehaviorSubject<int?> get subjectWorkboardTaskCount =>
//       _subjectWorkboardTaskCount;

//   BehaviorSubject<int?> get subjectWorkboardCompletedTaskCount =>
//       _subjectWorkboardCompletedTaskCount;

//   getTaskDashBoardData({
//     Map<String, dynamic>? queryparams,
//     String? taskListStatus,
//     String? requestBy, // String userId,
//   }) async {
//     TaskListResponseModel response =
//         await _workboardRepository.getTaskDashBoardData(
//       queryparams: queryparams,
//     );
//     _subjectWorkboardTaskList.sink.add(response);

//     if (queryparams?['status'] == "TASK_STATUS_COMPLETE" ||
//         queryparams?['status'] == null) {
//       _subjectWorkboardTaskCount.sink.add(response.data?.length);
//       _subjectWorkboardCompletedTaskCount.add(response.data?.length);
//     }
//   }
//   BehaviorSubject<WorkBoardResponseModel> get subjectCreateWorkboardList =>
//       _subjectCreateWorkboardList;
// }

// final workboardBloc = WorkboardBloc();