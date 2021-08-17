part of 'abstract_manage_accrual_repo.dart';

class ManageAccrualRepository extends AbstractManageAccrualRepository {
  final Dio _dio = Dio();

  Future<ManageAccrualResponse> getManageAccrual({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_PAYROLL_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      //print(response.data);
      return ManageAccrualResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ManageAccrualResponse.withError("$err");
    }
  }
}
