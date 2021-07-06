import 'package:flutter/foundation.dart';

import 'access_log_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class AccessLogResponse {
  final int isSignIn;
  String error;
  // List<AccessLog> data;

  AccessLogResponse({
    @required this.isSignIn,
  });

  AccessLogResponse.fromJson(String response) : isSignIn = int.parse(response);

  AccessLogResponse.withError(String errorValue)
      : isSignIn = null,
        error = errorValue;
}

class AccessLogListDataResponse {
  String error;
  List<AccessLogModel> data;

  AccessLogListDataResponse({
    @required this.data,
  });

  // todo: need to complete this.
  AccessLogListDataResponse.fromJson(dynamic response) : data = [];

  AccessLogListDataResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
