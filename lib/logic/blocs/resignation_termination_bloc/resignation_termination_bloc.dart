import 'package:rxdart/rxdart.dart';

import '../../../data/models/hr_direct_contract_model/hr_direct_contract_response_model.dart';
import '../../../data/models/misconduct_model/misconduct_response.dart';
import '../../../data/models/resignation_models/resignation_termination_response.dart';
import '../../../data/models/termination_model/termination_response.dart';
import '../../../data/repositories/resignation_termination_repository/abstract_resignation_termination_repository.dart';

export '../../../data/models/hr_direct_contract_model/hr_direct_contract_response_model.dart';
export '../../../data/models/misconduct_model/misconduct_response.dart';
export '../../../data/models/resignation_models/resignation_termination_response.dart';
export '../../../data/models/termination_model/termination_response.dart';
export '../../../data/repositories/resignation_termination_repository/abstract_resignation_termination_repository.dart';

class ResignationTerminationBloc {
  final ResignationTerminationRepository _resignationTerminationRepository =
      ResignationTerminationRepository();

  final BehaviorSubject<HrDirectContractResponseModel?>
      _subjectHrDirectContract =
      BehaviorSubject<HrDirectContractResponseModel?>();

  final BehaviorSubject<ResignationTerminationResponse?>
      _subjectResignationTermination =
      BehaviorSubject<ResignationTerminationResponse?>();

  final BehaviorSubject<TerminationResponse?> _subjectTermination =
      BehaviorSubject<TerminationResponse?>();

  final BehaviorSubject<MisconductResponse?> _subjectMisconduct =
      BehaviorSubject<MisconductResponse?>();

  getHrDirectContractList({
    Map<String, dynamic>? queryparams,
  }) async {
    HrDirectContractResponseModel response =
        await _resignationTerminationRepository.getHrDirectContractList(
      queryparams: queryparams,
    );
    _subjectHrDirectContract.sink.add(response);
  }

  Future<ResignationTerminationResponse?> getResignationTerminationData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectResignationTermination.sink.add(null);

    ResignationTerminationResponse? response =
        await _resignationTerminationRepository.getResignationTerminationData(
      queryparams: queryparams,
    );
    _subjectResignationTermination.sink.add(response);

    return response;
  }

  Future<TerminationResponse?> getTerminationData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectTermination.sink.add(null);

    TerminationResponse? response =
        await _resignationTerminationRepository.getTerminationData(
      queryparams: queryparams,
    );
    _subjectTermination.sink.add(response);

    return response;
  }

  Future<MisconductResponse?> getMisconductData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectMisconduct.sink.add(null);

    MisconductResponse? response =
        await _resignationTerminationRepository.getMisconductData(
      queryparams: queryparams,
    );
    _subjectMisconduct.sink.add(response);

    return response;
  }

  dispose() {
    _subjectHrDirectContract.close();
    _subjectResignationTermination.close();
    _subjectTermination.close();
    _subjectMisconduct.close();
  }

  BehaviorSubject<HrDirectContractResponseModel?> get subjectHrDirectContract =>
      _subjectHrDirectContract;

  BehaviorSubject<ResignationTerminationResponse?>
      get subjectResignationTermination => _subjectResignationTermination;

  BehaviorSubject<TerminationResponse?> get subjectTermination =>
      _subjectTermination;

  BehaviorSubject<MisconductResponse?> get subjectMisconduct =>
      _subjectMisconduct;
}

final resignationTerminationBloc = ResignationTerminationBloc();
