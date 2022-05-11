import 'package:hr_management/data/models/salary_info_model/salary_info_response.dart';
import 'package:hr_management/data/repositories/salary_info_repository/abstract_salary_info_repository.dart';
import 'package:rxdart/rxdart.dart';

class SalaryInfoBloc {
  final SalaryInfoRepository _salaryInfoRepository = SalaryInfoRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<SalaryInfoResponse?> _subjectSalaryInfo =
      BehaviorSubject<SalaryInfoResponse?>();

  Future<SalaryInfoResponse?> getSalaryInfo({
    Map<String, dynamic>? queryparams, // String userId,
  }) async {
    SalaryInfoResponse response = await _salaryInfoRepository.getSalaryInfo(
      queryparams: queryparams,
    );
    _subjectSalaryInfo.sink.add(response);
    return response;
  }

  dispose() {
    _subjectSalaryInfo.close();
  }

  BehaviorSubject<SalaryInfoResponse?> get subjectSalaryInfo =>
      _subjectSalaryInfo;
}

final salaryInfoBloc = SalaryInfoBloc();
