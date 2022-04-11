import 'package:rxdart/rxdart.dart';

import '../../../../data/models/permissions_model/user_permission_model/user_permission_response.dart';
import '../../../../data/repositories/permission_repository/user_permission_repository/abstract_user_permission_repository.dart.dart';

export '../../../../data/models/permissions_model/user_permission_model/user_permission_response.dart';
export '../../../../data/repositories/permission_repository/user_permission_repository/abstract_user_permission_repository.dart.dart';

class UserPermissionBloc {
  final UserPermissionRepository _apiRepository = UserPermissionRepository();

  final BehaviorSubject<UserPermissionResponse?> _subject =
      BehaviorSubject<UserPermissionResponse?>();

  Future<UserPermissionResponse?> getUserPermission({
    Map<String, dynamic>? queryparams,
  }) async {
    // Reseting to default.
    _subject.sink.add(null);

    UserPermissionResponse? response = await _apiRepository.getUserPermission(
      queryparams: queryparams,
    );

    _subject.sink.add(response);

    return response;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserPermissionResponse?> get subject => _subject;
}

final userPermissionBloc = UserPermissionBloc();
