import 'package:hr_management/data/models/hr_policy_document_model/hr_policy_abstract_model.dart';
import 'package:hr_management/data/repositories/leave_temp_repo/leave_temp_repo.dart';
import 'package:rxdart/rxdart.dart';

class LeaveBloc {
  final LeaveTempRepository _leaveTempRepository = LeaveTempRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<HrPolicyDocumentResponse?> _subjectHrPolicyDocument =
      BehaviorSubject<HrPolicyDocumentResponse?>();

  getHrPolicyDocument({
    Map<String, dynamic>? queryparams,
  }) async {
    HrPolicyDocumentResponse response =
        await _leaveTempRepository.getHrPolicyDocuments(
      queryparams: queryparams,
    );
    _subjectHrPolicyDocument.sink.add(response);
  }

  dispose() {
    _subjectHrPolicyDocument.close();
  }

  BehaviorSubject<HrPolicyDocumentResponse?> get subjectHrPolicyDocument =>
      _subjectHrPolicyDocument;
}

final leaveBloc = LeaveBloc();
