import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/manage_workspace_repository/manage_workspace_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class ManageWorkspaceBloc {
  final DMSManageWorkspaceRepository _apiRepository =
      DMSManageWorkspaceRepository();

  final BehaviorSubject _subject = BehaviorSubject();
  final BehaviorSubject _getAPISubject = BehaviorSubject();
  final BehaviorSubject<WorkspaceViewResponse?> _getWorkspaceSubject =
      BehaviorSubject<WorkspaceViewResponse?>();

  Future postAPIData({
    required Map<String, dynamic> queryparams,
  }) async {
    dynamic response = await _apiRepository.postAPIData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);

    return response;
  }

  Future<WorkspaceViewModel?> getAPIData({
    required Map<String, dynamic> queryparams,
  }) async {
    WorkspaceViewModel? response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );

    _getAPISubject.sink.add(response);

    return response;
  }

  Future<WorkspaceViewResponse> getWorkspaceData({
    required Map<String, dynamic> queryparams,
  }) async {
    WorkspaceViewResponse response = await _apiRepository.getWorkspaceData(
      queryparams: queryparams,
    );

    _getWorkspaceSubject.sink.add(response);

    return response;
  }

  Future<WorkspaceViewModel> deleteWorkspace({
    required Map<String, dynamic> queryparams,
  }) async {
    WorkspaceViewModel response = await _apiRepository.deleteWorkspace(
      queryparams: queryparams,
    );

    _getAPISubject.sink.add(response);
    getWorkspaceSubject.sink.add(null);
    getWorkspaceData(queryparams: {});
    return response;
  }

  dispose() {
    _subject.close();
    _getAPISubject.close();
    _getWorkspaceSubject.close();
  }

  BehaviorSubject get subject => _subject;
  BehaviorSubject get getAPISubject => _getAPISubject;
  BehaviorSubject<WorkspaceViewResponse?> get getWorkspaceSubject =>
      _getWorkspaceSubject;
}

final dmsManageWorkspaceBloc = ManageWorkspaceBloc();
