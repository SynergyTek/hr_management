import 'package:rxdart/rxdart.dart';

import '../../../synergy_nts.dart';
import '../../models/note_models/note_model.dart';
import '../../models/note_models/note_response.dart';
import '../../repositories/note_repository/abstract_note_repository.dart';

export '../../models/note_models/note_model.dart';
export '../../models/note_models/note_response.dart';
export '../../repositories/note_repository/abstract_note_repository.dart';

class NoteBloc {
  final NoteRepository _noteRepository = NoteRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NoteResponse?> _subjectNoteDetails =
      BehaviorSubject<NoteResponse?>();
  final BehaviorSubject<NoteListResponse?> _subjectNoteList =
      BehaviorSubject<NoteListResponse?>();

  /// Used to fetch new entries.
  getNoteDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    noteBloc.subjectNoteDetails.sink.add(null);

    NoteResponse response = await _noteRepository.getNoteDetail(
      queryparams: queryparams,
    );
    _subjectNoteDetails.sink.add(response);
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

  dispose() {
    _subjectNoteDetails.close();
    _subjectNoteList.close();
  }

  BehaviorSubject<NoteResponse?> get subjectNoteDetails => _subjectNoteDetails;
  BehaviorSubject<NoteListResponse?> get subjectNoteList => _subjectNoteList;
}

final noteBloc = NoteBloc();
