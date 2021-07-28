import '../../../../data/models/documents_models/note_index_models/note_index_response.dart';
import '../../../../data/repositories/documents_repository/note_index_repository/note_index_repository.dart';
import 'package:rxdart/rxdart.dart';

class NoteIndexBloc {
  final NoteIndexRepository _apiRepository = NoteIndexRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NoteIndexResponse> _subject =
      BehaviorSubject<NoteIndexResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic> queryparams,
  }) async {
    NoteIndexResponse response = await _apiRepository.getAPIData(
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

  BehaviorSubject<NoteIndexResponse> get subject => _subject;
}

final noteIndexBloc = NoteIndexBloc();
