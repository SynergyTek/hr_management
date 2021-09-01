import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/manage_workspace_repository/manage_workspace_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class ManageWorkspaceBloc {
  final DMSManageWorkspaceRepository _apiRepository =
      DMSManageWorkspaceRepository();

  final BehaviorSubject _subject = BehaviorSubject();
  final BehaviorSubject _getAPISubject = BehaviorSubject();

  postAPIData({
    @required Map<String, dynamic> queryparams,
  }) async {
    dynamic response = await _apiRepository.postAPIData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  Future<WorkspaceViewModel> getAPIData({
    @required Map<String, dynamic> queryparams,
  }) async {
    WorkspaceViewModel response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );

    _getAPISubject.sink.add(response);

    return response;
  }

  dispose() {
    _subject.close();
    _getAPISubject.close();
  }

  BehaviorSubject get subject => _subject;
  BehaviorSubject get getAPISubject => _getAPISubject;
}

final dmsManageWorkspaceBloc = ManageWorkspaceBloc();
