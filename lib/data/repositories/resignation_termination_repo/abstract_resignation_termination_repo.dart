import 'package:dio/dio.dart';
import 'package:hr_management/data/models/hr_direct_contract_model/hr_direct_contract_response_model.dart';

import '../../../constants/api_endpoints.dart';

part 'resignation_termination_repo.dart';

// Overview of the repository class.
abstract class AbstractResignationTerminationRepository {
  AbstractResignationTerminationRepository();
  Future<HrDirectContractResponseModel> getHrDirectContractList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
