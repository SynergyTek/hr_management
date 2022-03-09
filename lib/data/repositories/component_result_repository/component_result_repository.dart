import 'package:dio/dio.dart';
import '../../../constants/api_endpoints.dart';
import '../../models/component_result_models/component_result_response.dart';

part 'component_result_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractComponentResultRepository {
  AbstractComponentResultRepository();

  Future<ComponentResultResponse> getAPIData({
    Map<String, dynamic>? queryparams,
  });

  Future<ComponentResultResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<ComponentResultResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<bool> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
