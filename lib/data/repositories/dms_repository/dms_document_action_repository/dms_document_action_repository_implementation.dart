part of 'dms_document_action_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class DMSDocumentActionRepository extends AbstractDMSDocumentActionRepository {
  final Dio _dio = Dio();

  Future<DMSDocumentActionResponse> getArchiveDocumentData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DOCUMENT_ARCHIVE_DATA,
        queryParameters: queryparams ?? {},
      );

      return DMSDocumentActionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return DMSDocumentActionResponse.withError(err.toString());
    }
  }

  Future<DMSDocumentActionResponse> getBinDocumentData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_BIN_DOCUMENT_DATA,
        queryParameters: queryparams ?? {},
      );

      return DMSDocumentActionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return DMSDocumentActionResponse.withError(err.toString());
    }
  }

  Future<DMSDocumentActionResponse> getDocumentHistoryData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DOCUMENT_DATA,
        queryParameters: queryparams ?? {},
      );

      return DMSDocumentActionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return DMSDocumentActionResponse.withError(err.toString());
    }
  }

  Future<DMSDocumentActionResponse> getSearchDocumentData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_ALL_FOLDER_AND_DOCUMENT_DATA,
        queryParameters: queryparams ?? {},
      );

      return DMSDocumentActionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return DMSDocumentActionResponse.withError(err.toString());
    }
  }

  Future<DMSDocumentActionResponse> getViewPermissionData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_VIEW_PERMISSIONS_DATA,
        queryParameters: queryparams ?? {},
      );

      return DMSDocumentActionResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return DMSDocumentActionResponse.withError(err.toString());
    }
  }
}
