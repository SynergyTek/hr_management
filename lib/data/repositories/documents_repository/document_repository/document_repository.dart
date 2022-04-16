import 'package:dio/dio.dart';
import 'package:hr_management/data/models/documents_models/document_models/document_response.dart';

import '../../../../constants/api_endpoints.dart';

part 'document_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDocumentRepository {
  AbstractDocumentRepository();

  Future<DocumentResponse> getPersonProfileData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
