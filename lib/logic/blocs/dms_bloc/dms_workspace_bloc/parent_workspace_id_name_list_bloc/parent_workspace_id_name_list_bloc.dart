import 'package:hr_management/data/models/dms/parent_workspace_id_name_list_model/parent_workspace_id_name_list_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/parent_workspace_id_name_list_repository/parent_workspace_id_name_list_repository.dart';

import 'package:rxdart/rxdart.dart';

class DMSParentWorkspaceIdNameListBloc {
  final ParentWorkspaceIdNameListRepository _apiRepository =
      ParentWorkspaceIdNameListRepository();

  final BehaviorSubject<ParentWorkspaceIdNameListResponse> _subject =
      BehaviorSubject<ParentWorkspaceIdNameListResponse>();

  getParentWorkspace({
    Map<String, dynamic>? queryparams,
    String? legalEntity,
    String? id,
  }) async {
    ParentWorkspaceIdNameListResponse response =
        await _apiRepository.getParentWorkspace(
      queryparams: queryparams,
      legalEntity: legalEntity,
      id: id,
    );

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ParentWorkspaceIdNameListResponse> get subject => _subject;
}

final dmsParentWorkspaceIdNameListBloc = DMSParentWorkspaceIdNameListBloc();
