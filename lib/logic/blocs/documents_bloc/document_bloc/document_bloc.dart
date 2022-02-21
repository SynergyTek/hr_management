import 'package:hr_management/data/models/documents_models/document_models/document_response.dart';
import 'package:hr_management/data/repositories/documents_repository/document_repository/document_repository.dart';
import 'package:rxdart/rxdart.dart';

class DocumentBloc {
  final DocumentRepository _apiRepository = DocumentRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<DocumentResponse> _subject =
      BehaviorSubject<DocumentResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic>? queryparams,
  }) async {
    DocumentResponse response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  postData() async {}

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getAPI call.
    getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getAPI call.
    getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DocumentResponse> get subject => _subject;
}

final documentBloc = DocumentBloc();
