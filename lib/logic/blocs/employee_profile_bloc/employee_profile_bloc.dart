import 'package:rxdart/rxdart.dart';

import '../../../data/models/employee_profile_models/employee_profile_response.dart';
import '../../../data/repositories/employee_profile_repo.dart/abstract_employee_profile_repo.dart';

class EmployeeProfileBloc {
  final EmployeeProfileRepository _employeeProfileRepository =
      EmployeeProfileRepository();

  final BehaviorSubject<EmployeeProfileResponse> _subjectEmployeeProfile =
      BehaviorSubject<EmployeeProfileResponse>();

  getEmployeeProfileData({
    Map<String, dynamic>? queryparams,
  }) async {
    EmployeeProfileResponse response =
        await _employeeProfileRepository.getEmployeeProfileData(
      queryparams: queryparams,
    );
    _subjectEmployeeProfile.sink.add(response);
  }

  dispose() {
    _subjectEmployeeProfile.close();
  }

  BehaviorSubject<EmployeeProfileResponse> get subjectEmployeeProfile =>
      _subjectEmployeeProfile;
}

final employeeProfileBloc = EmployeeProfileBloc();
