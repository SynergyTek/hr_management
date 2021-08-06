
import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/login_models/login_request_model.dart';
import '../../models/login_models/login_response.dart';

part 'login_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractLoginRepository {
  AbstractLoginRepository();

  Future<LoginAPIResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
