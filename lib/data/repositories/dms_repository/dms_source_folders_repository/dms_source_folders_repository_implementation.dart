part of 'dms_source_folders_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class DMSSourceFolderRepository extends AbstractDMSSourceFolderRepository {
  final Dio _dio = Dio();

  Future<DMSSourceFolderResponse> getDMSSourceFolderData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_SOURCE_FOLDERS,
        queryParameters: queryparams ?? {},
      );

      return DMSSourceFolderResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return DMSSourceFolderResponse.withError(err.toString());
    }
  }
}
