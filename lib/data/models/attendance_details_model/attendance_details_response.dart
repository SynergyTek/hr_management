import 'attendance_details_model.dart';

class AttendanceDetailsListResponse {
  String? error;
  List<AttendanceDetailsListModel> data;

  AttendanceDetailsListResponse({
    required this.data,
  });

  AttendanceDetailsListResponse.fromJson(List response)
      : data = response
            .map((i) => new AttendanceDetailsListModel.fromJson(i))
            .toList(),
        error = "";

  AttendanceDetailsListResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
