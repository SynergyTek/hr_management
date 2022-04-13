import 'time_permission_model.dart';

class TimePermissionResponse {
  final List<TimePermission> data;
  String? error;

  TimePermissionResponse({
    required this.data,
  });

  TimePermissionResponse.fromJson(List response)
      : data = (response).map((i) => new TimePermission.fromJson(i)).toList();

// LeaveTempResponse.fromJson(Map<String, dynamic> json)
//       : data = (json["Data"] as List)
//             .map((i) => new LeaveTemplateModel.fromJson(i))
  // .toList();

  TimePermissionResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
