import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/user/user_response.dart';

part 'user_repo.dart';

// Overview of the repository class.
abstract class AbstractUserRepository {
  AbstractUserRepository();

  Future<UserListResponse> readUserData();

  Future<ReadTeamDataResponse> readTeamData();

  Future<bool> updateUserMobileDeviceToken({
    Map<String, dynamic>? queryparams,
  });
}
