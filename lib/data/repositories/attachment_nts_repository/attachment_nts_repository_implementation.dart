part of 'attachment_nts_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class AttachmentNTSRepository extends AbstractAttachmentNTSRepository {
  final Dio _dio = Dio();

  Future<AttachmentNTSResponse> getAPIData({
    @required NTSType ntsType,
    @required String ntsId,
  }) async {
    //
    String endpoint = "";
    Map<String, dynamic> queryparams = Map();

    if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.GET_NOTE_ATTACHMENT;
      queryparams = {'noteId': ntsId};
    }
    if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.GET_TASK_ATTACHMENT;
      queryparams = {'taskId': ntsId};
    }
    if (ntsType == NTSType.service) {
      endpoint = APIEndpointConstants.GET_SERVICE_ATTACHMENT;
      queryparams = {'serviceId': ntsId};
    }

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams,
      );

      return AttachmentNTSResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return AttachmentNTSResponse.withError("$err");
    }
  }

  @override
  Future<bool> deleteAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.DELETE_NTS_ATTACHMENT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams,
      );

      return response.data as bool;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  @override
  Future<AttachmentNTSResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<AttachmentNTSResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
