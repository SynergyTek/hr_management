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

  factory UserPermissionResponse.fromMap(Map<String, dynamic> map) {
    return UserPermissionResponse(
      data: List<UserPermissionModel?>.from(
        map['userpermissionresp']?.map(
              (x) => UserPermissionModel.fromMap(x),
            ) ??
            [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userpermissionresp':
          data.map((eachElement) => eachElement?.toMap()).toList(),
    };
  }
}
