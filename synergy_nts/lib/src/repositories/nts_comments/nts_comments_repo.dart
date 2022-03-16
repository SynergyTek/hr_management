part of 'abstract_nts_comments_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NTSCommentsRepository extends AbstractNTSCommentsRepository {
  final Dio _dio = Dio();

  @override
  Future<CommentListResponse> getCommentsData({
    Map<String, dynamic>? queryparams,
  }) async {
    String endpoint = '';

    endpoint = APIEndpointConstants.GET_TASK_COMMENT_DATA;

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
    PostComment? comment,
    String? userid,
  }) async {
    String endpoint = '';

    endpoint = APIEndpointConstants.POST_TASK_COMMENT;

    comment!.commentedByUserId = userid;

    dynamic model = jsonEncode(comment.toJson());
    try {
      Response response = await _dio.post(
        endpoint,
        data: model,
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
  Future<bool?> deleteAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    String endpoint = '';

    endpoint = APIEndpointConstants.DELETE_TASK_COMMENT_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      // print("[DIO]: \nDelete API data: ${response.data}");

      return response.data as bool?;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }
}
