import '../../constants/api_endpoints.dart';
import '../models/api_models/api_response_model.dart';
import 'package:dio/dio.dart';

part 'api_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractAPIRepository {
  AbstractAPIRepository();

  Future<APIResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<APIResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<APIResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<APIResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
