import 'package:flutter/foundation.dart';
import 'package:hr_management/data/models/access_log/access_log.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class AccessLogResponse {
  final int isSignIn;
  String error;
  List<AccessLog> list;

  AccessLogResponse({
    @required this.isSignIn,
  });

  AccessLogResponse.fromJson(String response)
      : isSignIn = int.parse(response);

  AccessLogResponse.withError(String errorValue)
      : isSignIn = null,
        error = errorValue;
}
