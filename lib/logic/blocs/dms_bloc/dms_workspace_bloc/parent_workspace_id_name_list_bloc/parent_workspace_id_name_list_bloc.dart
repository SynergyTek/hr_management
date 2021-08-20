import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/parent_workspace_id_name_list_repository/parent_workspace_id_name_list_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class ParentWorkspaceIdNameListBloc {
  final ParentWorkspaceIdNameListRepository _apiRepository =
      ParentWorkspaceIdNameListRepository();

  final BehaviorSubject _subject = BehaviorSubject();

  getAPIData({
    @required String legalEntity,
    @required String id,
  }) async {
    dynamic response = await _apiRepository.getAPIData(
      legalEntity: legalEntity,
      id: id,
    );

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final parentWorkspaceIdNameListBloc = ParentWorkspaceIdNameListBloc();
