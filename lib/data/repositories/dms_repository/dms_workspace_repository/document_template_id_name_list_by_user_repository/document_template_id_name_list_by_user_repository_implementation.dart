part of 'document_template_id_name_list_by_user_repository.dart';

class DocumentTemplateIdNameListByUserRepository
    extends AbstractDocumentTemplateIdNameListByUserRepository {
  final Dio _dio = Dio();

  Future<DMSDocumentTypeResponse> getDocumentTemplate() async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_DOCUMENT_TEMPLATE_DATA,
        queryParameters: {},
      );
      return DMSDocumentTypeResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return DMSDocumentTypeResponse.withError("$err");
    }
  }
}
