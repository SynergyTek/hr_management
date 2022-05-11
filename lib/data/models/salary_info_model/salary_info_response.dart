import 'package:hr_management/data/models/salary_info_model/salary_info_model.dart';
export 'package:hr_management/data/models/salary_info_model/salary_info_model.dart';

class SalaryInfoResponse {
  final List<SalaryInfoModel>? data;
  String? error;

  SalaryInfoResponse({
    required this.data,
  });

  SalaryInfoResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => SalaryInfoModel.fromJson(i),
            )
            .toList();

  SalaryInfoResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
