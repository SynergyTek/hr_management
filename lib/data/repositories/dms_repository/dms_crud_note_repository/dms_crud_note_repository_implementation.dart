part of 'dms_crud_note_repository.dart';

class DMSCRUDNoteRepository extends AbstractDMSCRUDNoteRepository {
  final Dio _dio = Dio();

  @override
  Future<bool> getArchiveNoteAPIData({
    required String? id,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DMS_ARCHIVE_NOTE_DATA,
        queryParameters: {
          'id': id ?? '',
        },
      );
      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  @override
  Future<bool> getCopyNoteAPIData({
    required String? sourceId,
    required String? targetId,
    required String userId,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DMS_COPY_NOTE_DATA,
        queryParameters: {
          'sourceId': sourceId ?? '',
          'targetId': targetId ?? '',
          'userId': userId,
        },
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  @override
  Future<bool> getCreateNoteAPIData({
    required String sourceId,
    required String targetId,
    required String userId,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DMS_CREATE_NOTE_DATA,
        queryParameters: {
          'sourceId': sourceId,
          'targetId': targetId,
          'userId': userId,
        },
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return false;
    }
  }

  @override
  Future<bool> getDeleteNoteAPIData({
    required String? id,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DMS_DELETE_NOTE_DATA,
        queryParameters: {
          'id': id ?? '',
        },
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return false;
    }
  }

  @override
  Future<bool> getMoveNoteAPIData({
    required String? sourceId,
    required String? targetId,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DMS_MOVE_NOTE_DATA,
        queryParameters: {
          'sourceId': sourceId ?? '',
          'targetId': targetId ?? '',
        },
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  @override
  Future<bool> getRenameFilesAPIData({
    required DmsPostModel model,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DMS_RENAME_NOTE_DATA,
        queryParameters: {},
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  @override
  Future<bool> postSearchFilesAPIData({
    required DmsPostModel model,
  }) async {
    try {
      Response response = await _dio.post(
        APIEndpointConstants.POST_DMS_SEARCH_FILE_DATA,
        queryParameters: {},
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }
}
