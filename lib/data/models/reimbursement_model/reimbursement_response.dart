import 'reimbursement_model.dart';

class ReimbursementResponse {
  final List<Reimbursement> data;
  String? error;

  ReimbursementResponse({
    required this.data,
  });

  ReimbursementResponse.fromJson(List response)
      : data = (response).map((i) => new Reimbursement.fromJson(i)).toList();

// LeaveTempResponse.fromJson(Map<String, dynamic> json)
//       : data = (json["Data"] as List)
//             .map((i) => new LeaveTemplateModel.fromJson(i))
  // .toList();

  ReimbursementResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
