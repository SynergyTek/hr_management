import 'package:dio/dio.dart';
import 'package:hr_management/data/models/hr_direct_contract_model/hr_direct_contract_response_model.dart';
import 'package:hr_management/data/models/misconduct_model/misconduct_response.dart';
import 'package:hr_management/data/models/resignation_models/resignation_termination_response.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/termination_model/termination_response.dart';

part 'resignation_termination_repository.dart';

abstract class AbstractResignationTerminationRepository {
  AbstractResignationTerminationRepository();
  Future<HrDirectContractResponseModel> getHrDirectContractList({
    Map<String, dynamic>? queryparams,
  });

  Future<ResignationTerminationResponse?> getResignationTerminationData({
    Map<String, dynamic>? queryparams,
  });

  Future<TerminationResponse?> getTerminationData({
    Map<String, dynamic>? queryparams,
  });

  Future<MisconductResponse?> getMisconductData({
    Map<String, dynamic>? queryparams,
  });
}
