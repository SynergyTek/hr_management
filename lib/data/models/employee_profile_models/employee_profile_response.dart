import 'package:hr_management/data/models/employee_profile_models/employee_profile_model.dart';

class EmployeeProfileResponse {
  bool isSuccess;
  List<EmployeeProfileModel> list;
  String error;

  EmployeeProfileResponse({this.list});

  EmployeeProfileResponse.fromJson(List response)
      : list = (response)
            .map((i) => new EmployeeProfileModel.fromJson(i))
            .toList();

  EmployeeProfileResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
