part of 'abstract_read_component_repo.dart';

class ReadComponentRepository extends AbstractReadComponentRepository {
  final Dio _dio = Dio();

  Future<ReadComponentResponse> readComponentData(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.READ_USER_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return ReadComponentResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ReadComponentResponse.withError("$err");
    }
  }
}
