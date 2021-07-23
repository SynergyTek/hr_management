import 'package:dio/dio.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/models/user/user_response.dart';

part 'user_repo.dart';

// Overview of the repository class.
abstract class AbstractUserRepository {
  AbstractUserRepository();

  Future<UserListResponse> readUserData();
}
