import 'package:hr_management/data/models/employee_profile_models/employee_profile_response.dart';
import 'package:hr_management/data/repositories/employee_profile_repo.dart/abstract_employee_profile_repo.dart';
import 'package:rxdart/rxdart.dart';

class EmployeeProfileBloc {
  final EmployeeProfileRepository _employeeProfileRepository =
      EmployeeProfileRepository();

  final BehaviorSubject<EmployeeProfileResponse> _subjectEmployeeProfile =
      BehaviorSubject<EmployeeProfileResponse>();

  getEmployeeProfileData() async {
    EmployeeProfileResponse response =
        await _employeeProfileRepository.getEmployeeProfileData();
    _subjectEmployeeProfile.sink.add(response);
  }

  dispose() {
    _subjectEmployeeProfile.close();
  }

  BehaviorSubject<EmployeeProfileResponse> get subjectEmployeeProfile =>
      _subjectEmployeeProfile;
}


final employeeProfileBloc = EmployeeProfileBloc();