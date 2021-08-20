import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/manage_workspace_repository/manage_workspace_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class ManageWorkspaceBloc {
  final ManageWorkspaceRepository _apiRepository = ManageWorkspaceRepository();

  final BehaviorSubject _subject = BehaviorSubject();

  getAPIData({
    @required WorkspaceViewModel model,
  }) async {
    dynamic response = await _apiRepository.getAPIData(
      model: model,
    );

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final manageWorkspaceBloc = ManageWorkspaceBloc();
