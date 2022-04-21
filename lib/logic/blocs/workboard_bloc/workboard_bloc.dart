import 'package:hr_management/data/models/workboard_model/add_workboard_content_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_section_model.dart';
import 'package:rxdart/subjects.dart';
import '../../../data/models/task_models/task_list_resp_model.dart';
import '../../../data/repositories/workboard_repo/abstract_workboard_repo.dart';

class WorkboardBloc {
  final WorkboardRepository _workboardRepository = WorkboardRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<WorkBoardResponseModel?> _subjectWorkboardList =
      BehaviorSubject<WorkBoardResponseModel?>();
  final BehaviorSubject<WorkBoardSectionMapResponseModel?>
      _subjectManageWorkboardDetailsList =
      BehaviorSubject<WorkBoardSectionMapResponseModel?>();
  final BehaviorSubject<WorkBoardBoolResponseModel?>
      _subjectOpenCLoseWorkboard =
      BehaviorSubject<WorkBoardBoolResponseModel?>();
  final BehaviorSubject<TaskListResponseModel?> _subjectWorkboardTaskList =
      BehaviorSubject<TaskListResponseModel?>();
  final BehaviorSubject<int?> _subjectWorkboardTaskCount =
      BehaviorSubject<int?>();
  final BehaviorSubject<int?> _subjectWorkboardCompletedTaskCount =
      BehaviorSubject<int?>();
  final BehaviorSubject<WorkBoardMapResponseModel?>
      _subjectCreateWorkboardList =
      BehaviorSubject<WorkBoardMapResponseModel?>();
  final BehaviorSubject<WorkBoardResponseModel?> _subjectChooseTemplate =
      BehaviorSubject<WorkBoardResponseModel?>();
  final BehaviorSubject<WorkBoardMapResponseModel?>
      _subjectGetDuplicateWorkBoard =
      BehaviorSubject<WorkBoardMapResponseModel?>();
  final BehaviorSubject<WorkBoardPostResponse?> _subjectPostDuplicateWorkBoard =
      BehaviorSubject<WorkBoardPostResponse?>();
  final BehaviorSubject<WorkBoardPostResponse?> _subjectPostManageWorkBoard =
      BehaviorSubject<WorkBoardPostResponse?>();
  final BehaviorSubject<WorkBoardPostResponseSection?>
      _subjectPostManageWorkBoardSection =
      BehaviorSubject<WorkBoardPostResponseSection?>();
  final BehaviorSubject<WorkBoardSectionMapResponseModel?>
      _subjectCreateSectionWorkboardList =
      BehaviorSubject<WorkBoardSectionMapResponseModel?>();
  final BehaviorSubject<AddContentWorkBoardMapResponseModel?>
      _subjectGetItemWorkBoardContent =
      BehaviorSubject<AddContentWorkBoardMapResponseModel?>();
  final BehaviorSubject<AddContentWorkBoardMapResponseModel?>
      _subjectGetCopyMoveItems =
      BehaviorSubject<AddContentWorkBoardMapResponseModel?>();
  final BehaviorSubject<WorkBoardPostResponseContent?>
      _subjectPostItemWorkBoardContent =
      BehaviorSubject<WorkBoardPostResponseContent?>();
  final BehaviorSubject<WorkBoardPostResponseContent?>
      _subjectpostSharingMoveCopy =
      BehaviorSubject<WorkBoardPostResponseContent?>();
  final BehaviorSubject<WorkBoardPostResponseContent?>
      _subjectpostDuplicateItem =
      BehaviorSubject<WorkBoardPostResponseContent?>();
  final BehaviorSubject<WorkBoardPostResponseContent?>
      _subjectPostUpdateWorkBoardSectionAndItem =
      BehaviorSubject<WorkBoardPostResponseContent?>();

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
    WorkBoardMapResponseModel response =
        await _workboardRepository.getCreateWorkboardList(
      queryparams: queryparams,
    );
    _subjectCreateWorkboardList.sink.add(response);
  }

  getCreateSectionWorkboardData({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardSectionMapResponseModel response =
        await _workboardRepository.getCreateSectionList(
      queryparams: queryparams,
    );
    _subjectCreateSectionWorkboardList.sink.add(response);
  }

  getManageWorkBoardDetailsList({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardSectionMapResponseModel response =
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

  getItemWorkBoardContent({
    Map<String, dynamic>? queryparams,
  }) async {
    AddContentWorkBoardMapResponseModel response =
        await _workboardRepository.getItemWorkBoardContent(
      queryparams: queryparams,
    );
    _subjectGetItemWorkBoardContent.sink.add(response);
  }

  getCopyMoveItems({
    Map<String, dynamic>? queryparams,
  }) async {
    AddContentWorkBoardMapResponseModel response =
        await _workboardRepository.getCopyMoveItems(
      queryparams: queryparams,
    );
    _subjectGetCopyMoveItems.sink.add(response);
  }

  postDuplicateWorkBoard({
    WorkboardModel? workBoardModel,
  }) async {
    WorkBoardPostResponse response =
        await _workboardRepository.postDuplicateWorkBoard(
      workBoardModel: workBoardModel,
    );
    _subjectPostDuplicateWorkBoard.sink.add(response);
    return response;
  }

  //
  postItemWorkBoardContent({
    AddContentWorkBoardModel? addContentWorkBoardModel,
  }) async {
    WorkBoardPostResponseContent response =
        await _workboardRepository.postWorkBoardContent(
      addContentWorkBoardModel: addContentWorkBoardModel,
    );
    _subjectPostItemWorkBoardContent.sink.add(response);
    return response;
  }

  postUpdateWorkBoardSectionAndItem({
    WorkBoardSectionModel? workBoardSectionModel,
  }) async {
    WorkBoardPostResponseContent response =
        await _workboardRepository.postUpdateWorkBoardSectionAndItem(
      workBoardSectionModel: workBoardSectionModel,
    );
    _subjectPostUpdateWorkBoardSectionAndItem.sink.add(response);
    return response;
  }

  postDuplicateItem({
    Map<String, dynamic>? queryParams,
  }) async {
    WorkBoardPostResponseContent response =
        await _workboardRepository.postDuplicateItem(
      queryParams: queryParams,
    );
    _subjectpostDuplicateItem.sink.add(response);
    return response;
  }

  postSharingMoveCopy({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardPostResponseContent response =
        await _workboardRepository.postSharingMoveCopy(
      queryparams: queryparams,
    );
    _subjectpostSharingMoveCopy.sink.add(response);
    return response;
  }

  postManageWorkBoard({
    WorkboardModel? workBoardModel,
  }) async {
    WorkBoardPostResponse response =
        await _workboardRepository.postManageWorkBoard(
      workBoardModel: workBoardModel,
    );
    _subjectPostManageWorkBoard.sink.add(response);
    return response;
  }

  postManageWorkBoardSection({
    WorkBoardSectionModel? workBoardSectionModel,
  }) async {
    WorkBoardPostResponseSection response =
        await _workboardRepository.postManageWorkBoardSection(
      workBoardSectionModel: workBoardSectionModel,
    );
    _subjectPostManageWorkBoardSection.sink.add(response);
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
    _subjectPostManageWorkBoard.close();
    _subjectPostManageWorkBoardSection.close();
    _subjectCreateSectionWorkboardList.close();
    _subjectGetItemWorkBoardContent.close();
    _subjectPostItemWorkBoardContent.close();
    _subjectGetCopyMoveItems.close();
    _subjectpostSharingMoveCopy.close();
    _subjectpostDuplicateItem.close();
    _subjectPostUpdateWorkBoardSectionAndItem.close();
  }

  BehaviorSubject<WorkBoardResponseModel?> get subjectWorkboardList =>
      _subjectWorkboardList;
  BehaviorSubject<WorkBoardSectionMapResponseModel?>
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
  BehaviorSubject<WorkBoardMapResponseModel?> get subjectCreateWorkboardList =>
      _subjectCreateWorkboardList;
  BehaviorSubject<WorkBoardMapResponseModel?>
      get subjectGetDuplicateWorkBoard => _subjectGetDuplicateWorkBoard;
  BehaviorSubject<WorkBoardPostResponse?> get subjectPostDuplicateWorkBoard =>
      _subjectPostDuplicateWorkBoard;
  BehaviorSubject<WorkBoardPostResponse?> get subjectPostManageWorkBoard =>
      _subjectPostManageWorkBoard;
  BehaviorSubject<WorkBoardPostResponseSection?>
      get subjectPostManageWorkBoardSection =>
          _subjectPostManageWorkBoardSection;
  BehaviorSubject<WorkBoardSectionMapResponseModel?>
      get subjectCreateSectionWorkboardList =>
          _subjectCreateSectionWorkboardList;
  BehaviorSubject<AddContentWorkBoardMapResponseModel?>
      get subjectGetItemWorkBoardContent => _subjectGetItemWorkBoardContent;
  BehaviorSubject<AddContentWorkBoardMapResponseModel?>
      get subjectGetCopyMoveItems => _subjectGetCopyMoveItems;
  BehaviorSubject<WorkBoardPostResponseContent?>
      get subjectPostItemWorkBoardContent => _subjectPostItemWorkBoardContent;
  BehaviorSubject<WorkBoardPostResponseContent?>
      get subjectpostSharingMoveCopy => _subjectpostSharingMoveCopy;
  BehaviorSubject<WorkBoardPostResponseContent?> get subjectpostDuplicateItem =>
      _subjectpostDuplicateItem;
  BehaviorSubject<WorkBoardPostResponseContent?>
      get subjectPostUpdateWorkBoardSectionAndItem =>
          _subjectPostUpdateWorkBoardSectionAndItem;
}

final workboardBloc = WorkboardBloc();
