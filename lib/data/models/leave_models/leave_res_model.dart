import 'package:flutter/foundation.dart';
import 'package:hr_management/data/models/leave_models/leave_temp_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class LeaveTempResponse {
  final List<LeaveTemplateModel> data;

  LeaveTempResponse({
    @required this.data,
  });

  LeaveTempResponse.fromJson(Map<String, dynamic> json)
      : data = (json["Data"] as List)
            .map((i) => new LeaveTemplateModel.fromJson(i))
            .toList();

  LeaveTempResponse.withError(String errorValue) : data = [];
}
