part of 'nts_dropdown_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NTSDdRepository extends AbstractNTSDdRepository {
  final Dio _dio = Dio();

  Future<NTSDdResponse> getdynamicUrlData(
      {
      // Optional Params to be added to the request if required.
      Map<String, dynamic> queryparams,
      String url,
      String idKey,
      String nameKey}) async {
    try {
      queryparams = {
        // 'api_key': APIEndpointConstants.API_KEY,
        // 'language': 'en-US',
        // 'page': 1
      };

      Response response = await _dio.get(
        APIEndpointConstants.BASE_URL + '/' + url,
        queryParameters: queryparams ?? {},
      );
      print("DIO Response: ${response.data} ${response.data.runtimeType}");
      return NTSDdResponse.fromJson(response.data, idKey, nameKey);
    } catch (err, stacktrace) {
      // print(
      //     "[Exception]: Error occured while fetching the API Response for endpoint: ${APIEndpointConstants.GET_READSERVICETEMPLATE_URL}.");

      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return NTSDdResponse.withError("$err");
    }
  }

  @override
  Future<NTSDdResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<NTSDdResponse> postAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<NTSDdResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  Future<NTSDdResponse> getFilteredDDData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
    String url,
    String idKey,
    String nameKey,
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
