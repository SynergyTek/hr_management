import 'package:hr_management/data/models/hr_policy_document_model/hr_policy_document_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class HrPolicyDocumentResponse {
  final List<PolicyDocumentsModel> data;
  String? error;

  HrPolicyDocumentResponse({
    required this.data,
  });

  HrPolicyDocumentResponse.fromJson(List response)
      : data = (response).map((i) => PolicyDocumentsModel.fromJson(i)).toList();

  HrPolicyDocumentResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
