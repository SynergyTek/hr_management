part of 'abstract_user_repository.dart';

class UserRepository extends AbstractUserRepository {
  final Dio _dio = Dio();

  @override
  Future<UserListResponse> readUserData(
      {Map<String, dynamic>? queryparams}) async {
    final String endpoint = APIEndpointConstants.READ_USER_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return UserListResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return UserListResponse.withError("$err");
    }
  }

  @override
  Future<ReadTeamDataResponse> readTeamData(
      {Map<String, dynamic>? queryparams}) async {
    final String endpoint = APIEndpointConstants.READ_TEAM_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return ReadTeamDataResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return ReadTeamDataResponse.withError("$err");
    }
  }

  @override
  Future<ReadUserHierarchyResponse> readUserHierarchyData(
      {Map<String, dynamic>? queryparams}) async {
    final String endpoint = APIEndpointConstants.READ_HIERARCHY_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return ReadUserHierarchyResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return ReadUserHierarchyResponse.withError("$err");
    }
  }

  @override
  Future<UserListResponse> readTeamUserData(
      {Map<String, dynamic>? queryparams}) async {
    final String endpoint = APIEndpointConstants.READ_TEAM_USER_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return UserListResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return UserListResponse.withError("$err");
    }
  }
}
