part of 'manage_new_folder_repository.dart';

class DMSManageNewFolderRepository extends AbstractManageNewFolderRepository {
  final Dio _dio = Dio();

  Future postAPIData({
    @required Map<String, dynamic> queryparams,
  }) async {
    try {
      Response response = await _dio.post(
        APIEndpointConstants.POST_MANAGE_NEW_FOLDER_DATA,
        data: queryparams ?? {},
      );

      if (response?.data == null ||
          response.data['success'] == null ||
          response.data['success'] == false) return false;

      return true;
    } catch (err, stacktrace) {
      print("Error: $err");
      print("Stacktrace: $stacktrace");

      return false;
    }
  }
}
