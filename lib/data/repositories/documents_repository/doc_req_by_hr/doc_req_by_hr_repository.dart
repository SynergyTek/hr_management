import 'package:dio/dio.dart';
import 'package:hr_management/data/models/documents_models/doc_req_by_hr/doc_req_by_hr_response.dart';

import '../../../../constants/api_endpoints.dart';

part 'doc_req_by_hr_implementation.dart';

// Overview of the repository class.
abstract class AbstractDocReqByHrRepository {
  AbstractDocReqByHrRepository();

  Future<DocReqByHrResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<DocReqByHrResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<DocReqByHrResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<DocReqByHrResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
