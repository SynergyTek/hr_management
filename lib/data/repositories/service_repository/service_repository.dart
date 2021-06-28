import '../../models/service_models/service_response.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'service_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractServiceRepository {
  AbstractServiceRepository();

  Future<ServiceResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<ServiceResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<ServiceResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<ServiceResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
