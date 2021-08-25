part of 'document_template_id_name_list_by_user_repository.dart';

class DocumentTemplateIdNameListByUserRepository
    extends AbstractDocumentTemplateIdNameListByUserRepository {
  final Dio _dio = Dio();

  Future getAPIData() async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DOCUMENT_TEMPLATE_ID_NAME_LIST_BY_USER_DATA,
        queryParameters: {},
      );
      return true;
      // return AttachmentNTSResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return false;

      // return AttachmentNTSResponse.withError("$err");
    }
  }
}