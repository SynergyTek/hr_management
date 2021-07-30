import 'package:dio/dio.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../models/documents_models/person_document_models/person_document_response.dart';

part './person_documents_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractPersonDocumentsRepository {
  AbstractPersonDocumentsRepository();

  Future<PersonDocumentsResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<PersonDocumentsResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<PersonDocumentsResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<PersonDocumentsResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
