import 'employee_profile_model.dart';

class EmployeeProfileResponse {
  bool isSuccess;
  EmployeeProfileModel data;
  String error;

  EmployeeProfileResponse({this.data});

  EmployeeProfileResponse.fromJson(Map<String, dynamic> response)
      : data = EmployeeProfileModel.fromJson(response);

  EmployeeProfileResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
