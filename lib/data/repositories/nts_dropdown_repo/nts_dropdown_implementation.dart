part of 'nts_dropdown_repo.dart';

class NTSDdRepository extends AbstractNTSDdRepository {
  final Dio _dio = Dio();

  Future<NTSDdResponse> getdynamicUrlData({
    Map<String, dynamic>? queryparams,
    required String url,
    String? idKey,
    String? nameKey,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.BASE_URL + '/' + url,
        queryParameters: queryparams,
      );

      print("DIO Response: ${response.data} ${response.data.runtimeType}");

      return NTSDdResponse.fromJson(response.data, idKey, nameKey);
    } catch (err, stacktrace) {
      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return NTSDdResponse.withError("$err");
    }
  }

  @override
  Future<NTSDdResponse> getFilteredDDData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
    required String url,
    String? idKey,
    String? nameKey,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.BASE_URL + '/' + url,
        queryParameters: queryparams ?? {},
      );
      print(
          "DIO Response: ${response.statusCode}, ${response.data} ${response.data.runtimeType}");
      return NTSDdResponse.fromJson(response.data, idKey, nameKey);
    } catch (err, stacktrace) {
      // print(
      //     "[Exception]: Error occured while fetching the API Response for endpoint: ${APIEndpointConstants.GET_READSERVICETEMPLATE_URL}.");

      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return NTSDdResponse.withError("$err");
    }
  }
}
