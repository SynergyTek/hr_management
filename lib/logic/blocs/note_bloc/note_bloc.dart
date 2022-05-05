import 'package:rxdart/rxdart.dart';

import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/note/note_model.dart';
import '../../../data/models/note/note_response.dart';
import '../../../data/repositories/note_repository/abstract_note_repo.dart';

class NoteBloc {
  final NoteRepository _noteRepository = NoteRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NoteResponse?> _subjectNoteDetails =
      BehaviorSubject<NoteResponse?>();
  final BehaviorSubject<NoteListResponse?> _subjectNoteList =
      BehaviorSubject<NoteListResponse?>();

  /// Used to fetch new entries.
  Future<NoteModel> getNoteDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    NoteResponse response = await _noteRepository.getNoteDetail(
      queryparams: queryparams,
    );
    _subjectNoteDetails.sink.add(response);
    return response.data ?? NoteModel();
  }

  getNoteList({
    Map<String, dynamic>? queryparams,
  }) async {
    NoteListResponse response = await _noteRepository.getNoteList(
      queryparams: queryparams,
    );
    _subjectNoteList.sink.add(response);
  }

  getNoteDashBoardData({
    Map<String, dynamic>? queryparams,
  }) async {
    NoteListResponse response =
        await _noteRepository.getNoteDashBoardData(queryparams: queryparams);
    _subjectNoteList.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postNoteData({
    required NoteModel noteModel,
    Map<String, dynamic>? queryparams,
  }) async {
    PostResponse response = await _noteRepository.postNoteAPIData(
      note: noteModel,
    );

    if (response.isSuccess!) {
      subjectNoteList.sink.add(null);
      getNoteList();
    }

    return response;
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getAPI call.
    // getNoteDetails();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getAPI call.
    // getNoteDetails();
  }

  dispose() {
    _subjectNoteDetails.close();
    _subjectNoteList.close();
  }

  BehaviorSubject<NoteResponse?> get subjectNoteDetails => _subjectNoteDetails;
  BehaviorSubject<NoteListResponse?> get subjectNoteList => _subjectNoteList;
}

final noteBloc = NoteBloc();
