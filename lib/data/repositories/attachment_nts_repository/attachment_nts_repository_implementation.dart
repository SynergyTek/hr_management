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

    if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.GET_NOTE_ATTACHMENT + '?noteId=' + ntsId;
    }
    if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.GET_TASK_ATTACHMENT + '?taskId=' + ntsId;
    }
    if (ntsType == NTSType.service) {
      endpoint =
          APIEndpointConstants.GET_SERVICE_ATTACHMENT + '?serviceId=' + ntsId;
    }

    try {
      Response response = await _dio.get(
        endpoint,
      );

      print(
          "Attachment response: ${response.data}, $ntsId, $ntsType, $endpoint");

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
  Future<Response<dynamic>> postAttachmentData({
    Map<String, dynamic> queryparams,
    @required Attachment attachmentData,
  }) async {
    final String endpoint = APIEndpointConstants.FILE_UPLOAD_ATTACHMENT;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(attachmentData.toJson()) ?? {},
      );

      print("response: ${response.data}");

      return response;

      // if (response.statusCode==200) {
      //   return response.data;
      // }

    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return err;
    }
  }


  @override
  Future<AttachmentNTSResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
