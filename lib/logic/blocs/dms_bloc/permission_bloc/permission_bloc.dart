import 'dart:async';

import 'package:hr_management/data/models/dms/permission/permission_model.dart';
import 'package:hr_management/data/models/dms/permission/permission_response_model.dart';
import 'package:hr_management/data/repositories/dms_repository/document_permission_repository/document_permission_repository.dart';
import 'package:rxdart/rxdart.dart';

class PermissionBloc {
  final DocumentPermissionRepository _apiRepository =
      DocumentPermissionRepository();

  final BehaviorSubject<PermissionResponse?> _subject = BehaviorSubject();
  final BehaviorSubject<ViewPermissionResponse> _viewPermissionSubject =
      BehaviorSubject();

  getViewPermissionData({
    Map<String, dynamic>? queryparams,
  }) async {
    ViewPermissionResponse response =
        await _apiRepository.getViewPermissionData(
      queryparams: queryparams,
    );

    _viewPermissionSubject.sink.add(response);
    return response.data;
  }

  getPermissionDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    PermissionResponse response = await _apiRepository.getPermissionDetails(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  Future<String?> disableParentPermission({
    Map<String, dynamic>? queryparams,
  }) async {
    ViewPermissionResponse response =
        await _apiRepository.disableParentPermission(
      queryparams: queryparams,
    );
    // _viewPermissionSubject.sink.add(response);
    return response.error;
  }

  deletePermission({
    Map<String, dynamic>? queryparams,
    String? noteId,
  }) async {
    bool response = await (_apiRepository.deletePermission(
      queryparams: queryparams,
    ) as FutureOr<bool>);

    if (response) {
      permissionBloc.subject.sink.add(null);
      getPermissionDetails(queryparams: {
        'NoteId': noteId,
      });
    }
  }

  savePermission({required PermissionSubmitModel permissionModel}) async {
    SubmitPermissionResponse response = await _apiRepository.savePermission(
      permissionModel: permissionModel,
    );
    return response;
    // if (response) {
    //   permissionBloc.subject.sink.add(null);
    //   getPermissionDetails(queryparams: {
    //     'NoteId': noteId,
    //   });
    // }
  }

  dispose() {
    _subject.close();
    _viewPermissionSubject.close();
  }

  BehaviorSubject<PermissionResponse?> get subject => _subject;
}

final permissionBloc = PermissionBloc();
