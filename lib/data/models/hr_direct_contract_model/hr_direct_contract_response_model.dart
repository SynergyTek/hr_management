import 'package:hr_management/data/models/hr_direct_contract_model/hr_direct_contract_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.

class HrDirectContractResponseModel {
  final HrDirectContractModel? mapdata;
  String? error;

  HrDirectContractResponseModel({
    this.mapdata,
  });

  HrDirectContractResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = HrDirectContractModel.fromJson(response);

  HrDirectContractResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}
