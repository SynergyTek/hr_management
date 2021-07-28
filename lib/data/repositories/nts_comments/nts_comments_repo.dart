part of 'abstract_nts_comments_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NTSCommentsRepository extends AbstractNTSCommentsRepository {
  final Dio _dio = Dio();

  Future<CommentListResponse> getCommentsData(
      {Map<String, dynamic> queryparams, NTSType ntsType})
  // Optional Params to be added to the request if required
  async {
    String endpoint = '';
    if (ntsType == NTSType.service) {
      endpoint = APIEndpointConstants.GET_SERVICE_COMMENT_DATA;
    } else if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.GET_NOTE_COMMENT_DATA;
    } else if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.GET_TASK_COMMENT_DATA;
    }

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      //print(response.data);
      return CommentListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return CommentListResponse.withError("$err");
    }
  }

  @override
  Future<PostResponse> postCommentData({
    PostComment comment,
    NTSType ntsType,
  }) async {
    String endpoint = '';
    if (ntsType == NTSType.service) {
      endpoint = APIEndpointConstants.POST_SERVICE_COMMENT;
    } else if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.POST_NOTE_COMMENT;
    } else if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.POST_TASK_COMMENT;
    }

    comment.commentedByUserId = await getUserId();

    dynamic model = jsonEncode(comment.toJson());
    try {
      Response response = await _dio.post(endpoint, data: model);

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
  Future<CommentResponse> putAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<CommentResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    throw UnimplementedError();
  }
}
