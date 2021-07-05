import 'package:hr_management/data/models/access_log/access_log_response.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'access_log_repo.dart';

// Overview of the repository class.
abstract class AbstractAccessLogRepository {
  AbstractAccessLogRepository();

  Future<AccessLogResponse> getInsertAccessLog({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AccessLogResponse> getAccessLogs({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AccessLogResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AccessLogResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AccessLogResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
