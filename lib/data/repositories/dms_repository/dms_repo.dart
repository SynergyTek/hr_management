part of 'abstract_dms_repo.dart';

class DMSRepository extends AbstractDMSRepository {
  final Dio _dio = Dio();

  Future<DMSFilesResponse> getDMSFilesData({
    Map<String, dynamic> queryparams,
    @required DmsPostModel dmsPostModel,
  }) async {
    final String endpoint = APIEndpointConstants.GETDMSFILES;

    try {
      Response response = await _dio.post(endpoint,
          queryParameters: queryparams ?? {},
          data: jsonEncode(dmsPostModel.toJson()));

      return DMSFilesResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Err: \n $err");
      print("Stack: \n $stacktrace");
      return DMSFilesResponse.withError("$err");
    }
  }

  Future<DMSFilesResponse> getDMSFilesChildData({
    Map<String, dynamic> queryparams,
    @required DmsPostModel dmsPostModel,
  }) async {
    final String endpoint = APIEndpointConstants.GETDMSFILES;

    try {
      Response response = await _dio.post(endpoint,
          queryParameters: queryparams ?? {},
          data: jsonEncode(dmsPostModel.toJson()));

      return DMSFilesResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Err: \n $err");
      print("Stack: \n $stacktrace");
      return DMSFilesResponse.withError("$err");
    }
  }
}
