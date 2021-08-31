import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_document_action_repository/dms_document_action_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSDocumentActionBloc {
  final DMSDocumentActionRepository _apiRepository = DMSDocumentActionRepository();

  final BehaviorSubject<DMSDocumentActionResponse> _subject = BehaviorSubject();

  getAPIData({
    Map<String, dynamic> queryparams,
  }) async {
    DMSDocumentActionResponse response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DMSDocumentActionResponse> get subject => _subject;
}

final dmsDocumentActionBloc = DMSDocumentActionBloc();
