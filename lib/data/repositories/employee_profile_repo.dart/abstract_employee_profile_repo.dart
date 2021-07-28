import 'package:dio/dio.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/models/employee_profile_models/employee_profile_response.dart';

part 'employee_profile_repo.dart';

abstract class AbstractEmployeeProfileRepository {
  AbstractEmployeeProfileRepository();

  Future<EmployeeProfileResponse> getEmployeeProfileData();
}
