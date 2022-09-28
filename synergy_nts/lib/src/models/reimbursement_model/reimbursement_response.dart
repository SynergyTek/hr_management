import 'reimbursement_model.dart';

export 'reimbursement_model.dart';

class ReimbursementResponse {
  final List<ReimbursementModel> data;
  String? error;

  ReimbursementResponse({
    required this.data,
  });

  ReimbursementResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => ReimbursementModel.fromJson(i),
            )
            .toList();

  ReimbursementResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
