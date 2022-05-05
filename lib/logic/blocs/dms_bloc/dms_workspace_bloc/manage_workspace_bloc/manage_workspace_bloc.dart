import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/manage_workspace_repository/manage_workspace_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../user_model_bloc/user_model_bloc.dart';

class ManageWorkspaceBloc {
  final DMSManageWorkspaceRepository _apiRepository =
      DMSManageWorkspaceRepository();

  final BehaviorSubject _subject = BehaviorSubject();
  final BehaviorSubject _getAPISubject = BehaviorSubject();
  final BehaviorSubject<WorkspaceViewResponse?> _getWorkspaceSubject =
      BehaviorSubject<WorkspaceViewResponse?>();

  Future postManageWorkspace({
    required Map<String, dynamic> queryparams,
  }) async {
    dynamic response = await _apiRepository.postManageWorkspace(
      queryparams: queryparams,
    );

    _subject.sink.add(response);

    return response;
  }

  Future<WorkspaceViewModel?> getCreateWorkspace({
    required Map<String, dynamic> queryparams,
  }) async {
    WorkspaceViewModel? response = await _apiRepository.getCreateWorkspace(
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
    required BuildContext context,
  }) async {
    WorkspaceViewModel response = await _apiRepository.deleteWorkspace(
      queryparams: queryparams,
    );

    _getAPISubject.sink.add(response);
    getWorkspaceSubject.sink.add(null);
    getWorkspaceData(queryparams: {
      "portalName": BlocProvider.of<UserModelBloc>(context)
              .state
              .extraUserInformation
              ?.portalType ??
          "HR",
      'userid':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    });

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
