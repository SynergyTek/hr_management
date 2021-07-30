import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/employee_profile_models/employee_profile_response.dart';

part 'employee_profile_repo.dart';

abstract class AbstractEmployeeProfileRepository {
  AbstractEmployeeProfileRepository();

  Future<EmployeeProfileResponse> getEmployeeProfileData();
}
