import 'package:hr_management/data/models/hr_direct_contract_model/hr_direct_contract_response_model.dart';
import 'package:hr_management/data/repositories/resignation_termination_repo/abstract_resignation_termination_repo.dart';
import 'package:rxdart/rxdart.dart';

class ResignationTerminationBloc {
  final ResignationTerminationRepository _resignationTerminationRepository =
      ResignationTerminationRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<HrDirectContractResponseModel?>
      _subjectHrDirectContract =
      BehaviorSubject<HrDirectContractResponseModel?>();

  getHrDirectContractList({
    Map<String, dynamic>? queryparams,
  }) async {
    HrDirectContractResponseModel response =
        await _resignationTerminationRepository.getHrDirectContractList(
      queryparams: queryparams,
    );
    _subjectHrDirectContract.sink.add(response);
  }

  dispose() {
    _subjectHrDirectContract.close();
  }

  BehaviorSubject<HrDirectContractResponseModel?> get subjectHrDirectContract =>
      _subjectHrDirectContract;
}

final resignationTerminationBloc = ResignationTerminationBloc();
