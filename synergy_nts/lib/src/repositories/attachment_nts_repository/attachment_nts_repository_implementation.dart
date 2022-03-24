part of 'attachment_nts_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class AttachmentNTSRepository extends AbstractAttachmentNTSRepository {
  final Dio _dio = Dio();

  @override
  Future<AttachmentNTSResponse> getAPIData({
    required NTSType ntsType,
    required String ntsId,
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

      return AttachmentNTSResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return AttachmentNTSResponse.withError("$err");
    }
  }

  @override
  Future<bool> deleteAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    const String endpoint = APIEndpointConstants.DELETE_NTS_ATTACHMENT;

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
    Map<String, dynamic>? queryparams,
    required AttachmentModel attachmentData,
  }) async {
    const String endpoint = APIEndpointConstants.FILE_UPLOAD_ATTACHMENT;
    try {
      Response response = await _dio.post(
        endpoint,
        queryParameters: queryparams ?? {},
        data: jsonEncode(attachmentData.toJson()),
      );

      return response;
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return Future.error(err);
    }
  }

  @override
  Future<AttachmentNTSResponse> downloadAttachmentData(
      {required String fileValue, required BuildContext context}) async {
    try {
      Map<String, String> queryparams = {
        'fileId': fileValue,
      };

      Response response = await Dio().get(
        APIEndpointConstants.DOWNLOAD_ATTACHMENT,
        queryParameters: queryparams,
      );

      String fileName = response.headers['content-disposition']![0]
          .split(';')[1]
          .split('=')[1]
          .trim();
      if (fileName == null || fileName.isEmpty) {
        fileName = fileValue;
      }

      NewDownloadHelper().unbindPortToMainIsolate();
      showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        builder: (BuildContext context) {
          return Downloader(
            filename: fileName,
            url:
                // 'https://webapidev.aitalkx.com/CHR/query/DownloadAttachment?fileId=${data?.udfValue ?? ''}',
                APIEndpointConstants.DOWNLOAD_ATTACHMENT + "?fileId=$fileValue",
          );
        },
      );

      return AttachmentNTSResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return AttachmentNTSResponse.withError("$err");
    }
  }

  @override
  Future<AttachmentNTSResponse> putAPIData({
    Map<String, dynamic>? queryparams,
  }) {
    throw UnimplementedError();
  }
}
