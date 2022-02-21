part of 'abstract_dependent_repo.dart';

class DependentRepository extends AbstractDependentRepository {
  final Dio _dio = Dio();

  Future<ReadDependnetResponse> getReadDependantList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_DEPENDENT_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return ReadDependnetResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Err: \n $err");
      print("Stack: \n $stacktrace");
      return ReadDependnetResponse.withError("$err");
    }
  }

  Future<DependnetDocReqResponse> getReadDependantDocumentRequestList({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.READ_DEPENDENT_DOCUMENT_REQUEST_LIST,
        queryParameters: queryparams ?? {},
      );

      return DependnetDocReqResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Err: \n $err");
      print("Stack: \n $stacktrace");

      return DependnetDocReqResponse.withError("$err");
    }
  }
}
