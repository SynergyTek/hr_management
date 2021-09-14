import 'package:hr_management/data/models/dms/permission/permission_response_model.dart';
import 'package:hr_management/data/repositories/dms_repository/document_permission_repository/document_permission_repository.dart';
import 'package:rxdart/rxdart.dart';

class PermissionBloc {
  final DocumentPermissionRepository _apiRepository =
      DocumentPermissionRepository();

  final BehaviorSubject<PermissionResponse> _subject = BehaviorSubject();

  getViewPermissionData({
    Map<String, dynamic> queryparams,
  }) async {
    PermissionResponse response = await _apiRepository.getViewPermissionData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  getPermissionDetails({
    Map<String, dynamic> queryparams,
  }) async {
    PermissionResponse response = await _apiRepository.getPermissionDetails(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  disableParentPermission({
    Map<String, dynamic> queryparams,
  }) async {
    PermissionResponse response = await _apiRepository.disableParentPermission(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  deletePermission({
    Map<String, dynamic> queryparams,
  }) async {
    PermissionResponse response = await _apiRepository.deletePermission(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PermissionResponse> get subject => _subject;
}

final permissionBloc = PermissionBloc();
