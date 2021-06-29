import 'package:flutter/foundation.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class RemoteAttendanceResponse {
  final int isSignIn;
  String error;

  RemoteAttendanceResponse({
    @required this.isSignIn,
  });

  RemoteAttendanceResponse.fromJson(String response)
      : isSignIn = int.parse(response);

  RemoteAttendanceResponse.withError(String errorValue)
      : isSignIn = null,
        error = errorValue;
}
