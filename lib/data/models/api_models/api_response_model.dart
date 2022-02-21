import 'package:flutter/foundation.dart';

import 'api_data_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class APIResponse {
  final List<APIDataModel> data;
  final String error;

  APIResponse({
    required this.data,
    required this.error,
  });

  APIResponse.fromJson(Map<String, dynamic> json)
      : data = (json["results"] as List)
            .map((i) => new APIDataModel.fromJson(i))
            .toList(),
        error = "";

  APIResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
