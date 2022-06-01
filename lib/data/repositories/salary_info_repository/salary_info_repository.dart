part of 'abstract_salary_info_repository.dart';

class SalaryInfoRepository extends AbstractSalaryInfoRepository {
  final Dio _dio = Dio();

  Future<SalaryInfoResponse> getSalaryInfo({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_SALARY_INFO;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return SalaryInfoResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return SalaryInfoResponse.withError("$err");
    }
  }
}
