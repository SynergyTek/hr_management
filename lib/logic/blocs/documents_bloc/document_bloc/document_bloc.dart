import 'package:hr_management/data/models/documents_models/document_models/document_response.dart';
import 'package:hr_management/data/repositories/documents_repository/document_repository/document_repository.dart';
import 'package:rxdart/rxdart.dart';

class DocumentBloc {
  final DocumentRepository _apiRepository = DocumentRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<DocumentResponse> _subject =
      BehaviorSubject<DocumentResponse>();

  /// Used to fetch new entries.
  getPersonProfileData({
    Map<String, dynamic>? queryparams,
  }) async {
    DocumentResponse response = await _apiRepository.getPersonProfileData(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DocumentResponse> get subject => _subject;
}

final documentBloc = DocumentBloc();
