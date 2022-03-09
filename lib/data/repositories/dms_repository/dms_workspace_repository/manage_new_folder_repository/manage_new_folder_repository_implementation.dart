part of 'manage_new_folder_repository.dart';

class DMSManageNewFolderRepository extends AbstractManageNewFolderRepository {
  final Dio _dio = Dio();

  Future postAPIData({
    required Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.post(
        APIEndpointConstants.POST_MANAGE_NEW_FOLDER_DATA,
        data: queryparams,
      );

      if (response.data != null && response.data['success'] != null ||
          response.data['success'] == true) {
        return true;
      }

      return false;
    } catch (err, stacktrace) {
      print("Error: $err");
      print("Stacktrace: $stacktrace");

      return false;
    }
  }

  Future<NoteModel> getAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_CREATE_FOLDER_DATA,
        queryParameters: queryparams ?? {},
      );

      var result = NoteModel.fromJson(response.data);

      return result;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace");
      print("Error: $err");

      return Future.error(err);
    }
  }
}
