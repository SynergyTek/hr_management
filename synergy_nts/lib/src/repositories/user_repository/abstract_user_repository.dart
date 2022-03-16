import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/user_model/user_response.dart';

part 'user_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractUserRepository {
  AbstractUserRepository();

  Future<UserListResponse> readUserData();

  Future<ReadTeamDataResponse> readTeamData();

  Future<ReadUserHierarchyResponse> readUserHierarchyData();

  Future<UserListResponse> readTeamUserData(
      {Map<String, dynamic>? queryparams});
}
