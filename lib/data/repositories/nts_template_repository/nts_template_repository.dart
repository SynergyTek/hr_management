import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/nts_template_models/nts_template_response.dart';

part 'nts_template_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractNTSTemplateRepository {
  AbstractNTSTemplateRepository();

  Future<NTSTemplateResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<NTSTemplateResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<NTSTemplateResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<NTSTemplateResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
