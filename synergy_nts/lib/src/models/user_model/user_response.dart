import 'read_hierarchy_model.dart';
import 'team_model.dart';
import 'user.dart';
export 'user.dart';

class UserListResponse {
  bool? isSuccess;
  List<User>? list;
  String? error;

  UserListResponse({
    required this.list,
  });

  UserListResponse.fromJson(List response)
      : list = (response).map((i) => User.fromJson(i)).toList();

  UserListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}

class ReadTeamDataResponse {
  bool? isSuccess;
  List<ReadTeamDataModel>? list;
  String? error;

  ReadTeamDataResponse({
    required this.list,
  });

  ReadTeamDataResponse.fromJson(List? response)
      : list = (response)!.map((i) => ReadTeamDataModel.fromJson(i)).toList();

  ReadTeamDataResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}

class ReadUserHierarchyResponse {
  bool? isSuccess;
  List<ReadUserHierarchyModel>? list;
  String? error;

  ReadUserHierarchyResponse({
    required this.list,
  });

  ReadUserHierarchyResponse.fromJson(List? response)
      : list = (response)!.map((i) => ReadUserHierarchyModel.fromJson(i)).toList();

  ReadUserHierarchyResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
