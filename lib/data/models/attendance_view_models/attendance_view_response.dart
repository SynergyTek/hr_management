import 'package:meta/meta.dart';

import 'attendance_view_models.dart';

class AttendanceViewResponse {
  String? error;
  List<AttendanceViewModel> data;

  AttendanceViewResponse({
    required this.data,
  });

  AttendanceViewResponse.fromJson(List response)
      : data =
            response.map((i) => new AttendanceViewModel.fromJson(i)).toList(),
        error = "";

  AttendanceViewResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
