import 'package:hr_management/data/models/hr_direct_contract_model/hr_direct_contract_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class HrDirectContractResponseModel {
  final List<HrDirectContractModel> list;
  String? error;
  HrDirectContractResponseModel({
    required this.list,
  });

  HrDirectContractResponseModel.fromJson(List response)
      : list = response.map((e) => HrDirectContractModel.fromJson(e)).toList();
  HrDirectContractResponseModel.withError(String errorValue)
      : list = [],
        error = errorValue;
}
