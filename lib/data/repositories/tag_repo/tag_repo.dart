part of 'abstract_tag_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class TagRepository extends AbstractTagRepository {
  final Dio _dio = Dio();

  Future<TagCategoryResponseModel> getNTSTagData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_NTS_TAG_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return TagCategoryResponseModel.fromJson(
      response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return TagCategoryResponseModel.withError("$err");
    }
  }

  Future<TagCategoryResponseModel> getTagCategoriesWithTag({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_TAG_CATEGORIES_WITH_TAG;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return TagCategoryResponseModel.fromJson(
      response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return TagCategoryResponseModel.withError("$err");
    }
  }
}
