import 'package:rxdart/rxdart.dart';

import '../../../../data/models/documents_models/person_document_models/person_document_response.dart';
import '../../../../data/repositories/documents_repository/person_documents_repository/person_documents_repository.dart';

class PersonDocumentsBloc {
  final PersonDocumentsRepository _apiRepository = PersonDocumentsRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<PersonDocumentsResponse> _subject =
      BehaviorSubject<PersonDocumentsResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic> queryparams,
  }) async {
    PersonDocumentsResponse response = await _apiRepository.getAPIData();
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

  BehaviorSubject<PersonDocumentsResponse> get subject => _subject;
}

final personDocumentsBloc = PersonDocumentsBloc();
