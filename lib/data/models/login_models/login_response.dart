import 'package:flutter/foundation.dart';

import 'login_response_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class LoginAPIResponse {
  final LoginResponseModel? data;
  String? error;

  LoginAPIResponse({
    required this.data,
  });

  LoginAPIResponse.fromJson(Map<String, dynamic> response)
      : data = LoginResponseModel.fromJson(response);

  LoginAPIResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}


// class LoginResponse {
//   String token;
//   String expiration;
//   //final LoginResponseModel data;
//   String error;

//   LoginResponse({@required this.token, @required this.expiration});

//   LoginResponse.fromJson(Map<String, dynamic> response) {
//     token = response['token'];
//     expiration = response['expiration'];
//   }

//   LoginResponse.withError(String errorValue)
//       : token = null,
//         expiration = null,
//         error = errorValue;
// }
