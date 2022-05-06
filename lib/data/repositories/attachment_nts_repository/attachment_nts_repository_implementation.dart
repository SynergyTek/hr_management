part of 'attachment_nts_repository.dart';

class AttachmentNTSRepository extends AbstractAttachmentNTSRepository {
  final Dio _dio = Dio();

  Future<AttachmentNTSResponse> getAPIData({
    required NTSType? ntsType,
    required String? ntsId,
  }) async {
    String endpoint = "";

    if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.GET_NOTE_ATTACHMENT + '?noteId=' + ntsId!;
    }
    if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.GET_TASK_ATTACHMENT + '?taskId=' + ntsId!;
    }
    if (ntsType == NTSType.service) {
      endpoint =
          APIEndpointConstants.GET_SERVICE_ATTACHMENT + '?serviceId=' + ntsId!;
    }

    try {
      Response response = await _dio.get(
        endpoint,
      );

      return AttachmentNTSResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return AttachmentNTSResponse.withError("$err");
    }
  }

  @override
  Future<bool?> deleteAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.DELETE_NTS_ATTACHMENT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams,
      );

      return response.data as bool?;
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  @override
  Future<Response<dynamic>> postAttachmentData({
    Map<String, dynamic>? queryparams,
    required Attachment attachmentData,
  }) async {
    final String endpoint = APIEndpointConstants.FILE_UPLOAD_ATTACHMENT;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(attachmentData.toJson()),
      );

      return response;

      // if (response.statusCode==200) {
      //   return response.data;
      // }

    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return Future.error(err);
    }
  }

  @override
  Future<bool> postManageUploadedFile({
    required UploadedContentModel model,
  }) async {
    final String endpoint = APIEndpointConstants.POST_MANAGE_UPLOADED_FILE_DATA;

    try {
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(model.toJson()),
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }

  @override
  Future<bool> postAddUploadedFile({
    required NoteModel model,
  }) async {
    final String endpoint = APIEndpointConstants.UPLOAD_FILE;

    try {
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(model.toJson()),
      );

      if (response.data == null) return false;
      return true;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return false;
    }
  }
}
