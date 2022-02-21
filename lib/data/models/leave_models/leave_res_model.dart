import 'package:flutter/foundation.dart';

import 'leave_temp_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class LeaveTempResponse {
  final List<LeaveTemplateModel> data;
  String? error;

  LeaveTempResponse({
    required this.data,
  });

  LeaveTempResponse.fromJson(List response)
      : data =
            (response).map((i) => new LeaveTemplateModel.fromJson(i)).toList();

// LeaveTempResponse.fromJson(Map<String, dynamic> json)
//       : data = (json["Data"] as List)
//             .map((i) => new LeaveTemplateModel.fromJson(i))
  // .toList();

  LeaveTempResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
