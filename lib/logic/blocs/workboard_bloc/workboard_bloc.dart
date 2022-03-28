import 'package:hr_management/data/models/workboard_model/workboard_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:rxdart/subjects.dart';
import '../../../data/models/task_models/task_list_resp_model.dart';
import '../../../data/repositories/workboard_repo/abstract_workboard_repo.dart';

class WorkboardBloc {
  final WorkboardRepository _workboardRepository = WorkboardRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<WorkBoardResponseModel?> _subjectWorkboardList =
      BehaviorSubject<WorkBoardResponseModel?>();
  final BehaviorSubject<WorkBoardMapResponseModel?>
      _subjectManageWorkboardDetailsList =
      BehaviorSubject<WorkBoardMapResponseModel?>();
  final BehaviorSubject<WorkBoardBoolResponseModel?>
      _subjectOpenCLoseWorkboard =
      BehaviorSubject<WorkBoardBoolResponseModel?>();
  final BehaviorSubject<TaskListResponseModel?> _subjectWorkboardTaskList =
      BehaviorSubject<TaskListResponseModel?>();
  final BehaviorSubject<int?> _subjectWorkboardTaskCount =
      BehaviorSubject<int?>();
  final BehaviorSubject<int?> _subjectWorkboardCompletedTaskCount =
      BehaviorSubject<int?>();
  final BehaviorSubject<WorkBoardResponseModel?> _subjectCreateWorkboardList =
      BehaviorSubject<WorkBoardResponseModel?>();
  final BehaviorSubject<WorkBoardResponseModel?> _subjectChooseTemplate =
      BehaviorSubject<WorkBoardResponseModel?>();
  final BehaviorSubject<WorkBoardMapResponseModel?>
      _subjectGetDuplicateWorkBoard =
      BehaviorSubject<WorkBoardMapResponseModel?>();
  final BehaviorSubject<WorkBoardMapResponseModel?>
      _subjectPostDuplicateWorkBoard =
      BehaviorSubject<WorkBoardMapResponseModel?>();

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

  getOpenCloseWorkboard({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardBoolResponseModel response =
        await _workboardRepository.getOpenCloseWorkboard(
      queryparams: queryparams,
    );
    _subjectOpenCLoseWorkboard.sink.add(response);
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

  getManageWorkBoardDetailsList({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardMapResponseModel response =
        await _workboardRepository.getManageWorkBoardDetailsList(
      queryparams: queryparams,
    );
    _subjectManageWorkboardDetailsList.sink.add(response);
  }

  getChooseTemplate({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardResponseModel response =
        await _workboardRepository.getChooseTemplate(
      queryparams: queryparams,
    );
    _subjectChooseTemplate.sink.add(response);
  }

  getDuplicateWorkBoard({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardMapResponseModel response =
        await _workboardRepository.getDuplicateWorkBoard(
      queryparams: queryparams,
    );
    _subjectGetDuplicateWorkBoard.sink.add(response);
  }

  postDuplicateWorkBoard({
    WorkboardModel? workBoardModel,
  }) async {
    WorkBoardMapResponseModel response =
        await _workboardRepository.postDuplicateWorkBoard(
      workBoardModel: workBoardModel,
    );
    _subjectPostDuplicateWorkBoard.sink.add(response);
    return response;
  }

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

  dispose() {
    _subjectWorkboardList.close();
    _subjectCreateWorkboardList.close();
    _subjectWorkboardTaskList.close();
    _subjectWorkboardTaskCount.close();
    _subjectWorkboardCompletedTaskCount.close();
    _subjectChooseTemplate.close();
    _subjectOpenCLoseWorkboard.close();
    _subjectManageWorkboardDetailsList.close();
    _subjectPostDuplicateWorkBoard.close();
    _subjectGetDuplicateWorkBoard.close();
  }

  BehaviorSubject<WorkBoardResponseModel?> get subjectWorkboardList =>
      _subjectWorkboardList;
  BehaviorSubject<WorkBoardMapResponseModel?>
      get subjectManageWorkboardDetailsList =>
          _subjectManageWorkboardDetailsList;
  BehaviorSubject<WorkBoardBoolResponseModel?> get subjectOpenCloseWorkboard =>
      _subjectOpenCLoseWorkboard;
  BehaviorSubject<WorkBoardResponseModel?> get subjectChooseTemplate =>
      _subjectChooseTemplate;
  BehaviorSubject<TaskListResponseModel?> get subjectWorkboardTaskList =>
      _subjectWorkboardTaskList;
  BehaviorSubject<int?> get subjectWorkboardTaskCount =>
      _subjectWorkboardTaskCount;
  BehaviorSubject<int?> get subjectWorkboardCompletedTaskCount =>
      _subjectWorkboardCompletedTaskCount;
  BehaviorSubject<WorkBoardResponseModel?> get subjectCreateWorkboardList =>
      _subjectCreateWorkboardList;
  BehaviorSubject<WorkBoardMapResponseModel?>
      get subjectGetDuplicateWorkBoard => _subjectGetDuplicateWorkBoard;
  BehaviorSubject<WorkBoardMapResponseModel?>
      get subjectPostDuplicateWorkBoard => _subjectPostDuplicateWorkBoard;
}

final workboardBloc = WorkboardBloc();
