import 'user_permission_model.dart';
export 'user_permission_model.dart';

class UserPermissionResponse {
  List<UserPermissionModel?> data;
  String? error;

  UserPermissionResponse({
    this.data = const [],
  });

  UserPermissionResponse.fromJson(List response)
      : data = response.map((e) => UserPermissionModel.fromJson(e)).toList();

  UserPermissionResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
