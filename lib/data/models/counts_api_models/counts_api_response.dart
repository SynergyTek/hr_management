import 'package:flutter/foundation.dart';

import 'counts_api_response_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class CountsAPIResponse {
  final CountsAPIModel data;
  String error;

  CountsAPIResponse({
    @required this.data,
  });

  CountsAPIResponse.fromJson(Map<String, dynamic> response)
      : data = CountsAPIModel.fromJson(response);

  CountsAPIResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
