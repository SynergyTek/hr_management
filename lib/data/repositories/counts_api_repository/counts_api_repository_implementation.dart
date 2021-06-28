part of 'counts_api_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class CountsAPIRepository extends AbstractCountsAPIRepository {
  final Dio _dio = Dio();

  final Map<String, dynamic> _combinedResponse = Map();

  Future<CountsAPIResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    await _getAttachmentCount();
    await _getCommentsCount();
    await _getNotificationCount();
    await _getSharedCount();

    return CountsAPIResponse.fromJson(_combinedResponse);
  }

  @override
  Future<CountsAPIResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<CountsAPIResponse> postAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<CountsAPIResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  _getAttachmentCount({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    String endpoint = APIEndpointConstants.GET_SERVICE_ATTACHMENT_COUNT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print("DIO Response: ${response.data} ${response.data.runtimeType}");

      _combinedResponse["serviceAttachmentCount"] = response.data;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return _combinedResponse["serviceAttachmentCount"] = null;
    }
  }

  _getCommentsCount({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    String endpoint = APIEndpointConstants.GET_SERVICE_COMMENTS_COUNT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print("DIO Response: ${response.data} ${response.data.runtimeType}");

      _combinedResponse["serviceCommentsCount"] = response.data;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      _combinedResponse["serviceCommentsCount"] = null;
    }
  }

  _getNotificationCount({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    String endpoint = APIEndpointConstants.GET_SERVICE_NOTIFICATION_COUNT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print("DIO Response: ${response.data} ${response.data.runtimeType}");

      _combinedResponse["serviceNotificationCount"] = response.data;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      _combinedResponse["serviceNotificationCount"] = null;
    }
  }

  _getSharedCount({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    String endpoint = APIEndpointConstants.GET_SERVICE_SHARED_COUNT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print("DIO Response: ${response.data} ${response.data.runtimeType}");

      _combinedResponse["serviceSharedCount"] = response.data;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      _combinedResponse["serviceSharedCount"] = null;
    }
  }
}
