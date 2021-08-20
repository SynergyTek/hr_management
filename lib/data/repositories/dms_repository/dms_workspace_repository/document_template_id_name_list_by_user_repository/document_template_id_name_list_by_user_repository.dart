import 'package:dio/dio.dart';

import '../../../../../constants/api_endpoints.dart';

part 'document_template_id_name_list_by_user_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDocumentTemplateIdNameListByUserRepository {
  AbstractDocumentTemplateIdNameListByUserRepository();

  Future<dynamic> getAPIData();
}
