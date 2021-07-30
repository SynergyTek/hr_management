part of 'abstract_user_repo.dart';

class UserRepository extends AbstractUserRepository {
  final Dio _dio = Dio();

  Future<UserListResponse> readUserData(
      {Map<String, dynamic> queryparams}) async {
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
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return UserListResponse.withError("$err");
    }
  }

  @override
  Future<ReadTeamDataResponse> readTeamData(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.READ_USER_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return ReadTeamDataResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return ReadTeamDataResponse.withError("$err");
    }
  }
}
