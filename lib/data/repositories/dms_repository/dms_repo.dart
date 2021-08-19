part of 'abstract_dms_repo.dart';

class DMSRepository extends AbstractDMSRepository {
  final Dio _dio = Dio();

  Future<DMSFlderStrResponse> getReadDependantList({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GETDMSFILES;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return DMSFlderStrResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Err: \n $err");
      print("Stack: \n $stacktrace");
      return DMSFlderStrResponse.withError("$err");
    }
  }
}
