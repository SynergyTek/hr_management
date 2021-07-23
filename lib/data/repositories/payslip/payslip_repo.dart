part of 'abstract_payslip_repo.dart';

class PayslipRepository extends AbstractPayslipRepository {
  final Dio _dio = Dio();

  Future<PayslipResponse> getPaylsipList({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_PAYSLIP_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print(response.data);
      return PayslipResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PayslipResponse.withError("$err");
    }
  }
}
