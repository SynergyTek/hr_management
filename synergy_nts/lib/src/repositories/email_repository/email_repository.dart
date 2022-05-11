part of 'abstract_email_repository.dart';

class EmailRepository extends AbstractEmailRepository {
  final Dio _dio = Dio();

  @override
  Future<EmailResponseModel> getReadEmailData({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.READ_EMAIL_DATA;
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return EmailResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return EmailResponseModel.withError("$err");
    }
  }
}
