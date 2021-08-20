part of 'manage_new_folder_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class ManageNewFolderRepository extends AbstractManageNewFolderRepository {
  final Dio _dio = Dio();

  Future postAPIData({
    @required NoteModel model,
  }) async {
    try {
      Response response = await _dio.post(
        APIEndpointConstants.POST_MANAGE_NEW_FOLDER_DATA,
        queryParameters: {
          'model': model,
        },
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }
}
