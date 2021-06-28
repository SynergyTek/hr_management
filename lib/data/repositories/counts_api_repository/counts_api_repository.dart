import 'package:dio/dio.dart';
import 'package:hr_management/data/models/counts_api_models/counts_api_response.dart';

import '../../../constants/api_endpoints.dart';

part 'counts_api_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractCountsAPIRepository {
  AbstractCountsAPIRepository();

  Future<CountsAPIResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<CountsAPIResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<CountsAPIResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<CountsAPIResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
