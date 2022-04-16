import './payroll_slip_model.dart';

export './payroll_slip_model.dart';

class PayrollSlipResponse {
  final List<PayrollSlipModel>? data;
  String? error;

  PayrollSlipResponse({
    required this.data,
  });

  PayrollSlipResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => PayrollSlipModel.fromJson(i),
            )
            .toList();

  PayrollSlipResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
