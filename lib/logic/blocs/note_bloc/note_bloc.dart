import '../../../data/repositories/note_repository.dart';
import '../../../data/models/api_models/api_response_model.dart';
import 'package:rxdart/rxdart.dart';

class NoteBloc {
  final NoteRepository _noteRepository = NoteRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<APIResponse> _subject = BehaviorSubject<APIResponse>();

  /// Used to fetch new entries.
  getData() async {
    APIResponse response = await _noteRepository.getAPIData();
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

  BehaviorSubject<APIResponse> get subject => _subject;
}

final noteBloc = NoteBloc();
