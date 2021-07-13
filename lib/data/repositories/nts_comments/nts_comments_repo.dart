part of 'abstract_nts_comments_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NTSCommentsRepository extends AbstractNTSCommentsRepository {
  final Dio _dio = Dio();

  Future<ServiceResponse> getCommentsData({
    Map<String, dynamic> queryparams,
  }) //{
  // Optional Params to be added to the request if required.
  //Map<String, dynamic> queryparams,templatecode}
  async {
    final String endpoint = APIEndpointConstants.GET_SERVICE_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print(response.data);
      return ServiceResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ServiceResponse.withError("$err");
    }
  }

  @override
  Future<PostResponse> postCommentData({
    Map<String, dynamic> queryparams,
    NTSType ntsType,
  }) async {
    String endpoint = '';
    if (ntsType == NTSType.service) {
      endpoint = APIEndpointConstants.POST_SERVICE_COMMENT;
    } else if (ntsType ==NTSType.note) {
      endpoint = APIEndpointConstants.POST_NOTE_COMMENT;
    } else if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.POST_TASK_COMMENT;
    }
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print("response: ${response.data}");

      var result = PostResponse.fromJson(
        response.data,
      );

      return result;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return PostResponse.withError("$err");
    }
  }

  @override
  Future<ServiceResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<ServiceResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
