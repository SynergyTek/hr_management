part of 'abstract_employee_profile_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class EmployeeProfileRepository extends AbstractEmployeeProfileRepository {
  final Dio _dio = Dio();

  Future<EmployeeProfileResponse> getEmployeeProfileData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.EMPLOYEE_PROFILE;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      
      return EmployeeProfileResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return EmployeeProfileResponse.withError("$err");
    }
  }
}
