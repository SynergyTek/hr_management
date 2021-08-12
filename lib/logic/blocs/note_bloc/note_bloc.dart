import 'package:flutter/material.dart';
import 'package:hr_management/data/models/attacment/attachment_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/note/note_model.dart';
import '../../../data/models/note/note_response.dart';
import '../../../data/repositories/note_repository/abstract_note_repo.dart';

class NoteBloc {
  final NoteRepository _noteRepository = NoteRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NoteResponse> _subjectNoteDetails =
      BehaviorSubject<NoteResponse>();
  final BehaviorSubject<NoteListResponse> _subjectNoteList =
      BehaviorSubject<NoteListResponse>();

  /// Used to fetch new entries.
  getNoteDetails({templateCode, noteId, userId}) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["templatecode"] = templateCode ?? '';
    queryparams["noteId"] = noteId ?? '';
    // queryparams["userid"] = userId ?? '';
    NoteResponse response =
        await _noteRepository.getNoteDetail(queryparams: queryparams);
    _subjectNoteDetails.sink.add(response);
  }

  getNoteList({
    Map<String, dynamic> queryparams,
  }) async {
    NoteListResponse response =
        await _noteRepository.getNoteList(queryparams: queryparams);
    _subjectNoteList.sink.add(response);
  }

  getNoteDashBoardData({
    Map<String, dynamic> queryparams,
  }) async {
    NoteListResponse response =
        await _noteRepository.getNoteDashBoardData(queryparams: queryparams);
    _subjectNoteList.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postNoteData({
    @required NoteModel noteModel,
  }) async {
    PostResponse response = await _noteRepository.postNoteAPIData(
      note: noteModel,
    );

    if (response.isSuccess) {
      subjectNoteList.sink.add(null);
      getNoteDetails();
    }

    return response;
  }

  /// Used to create new entries.
  Future<PostResponse> postNoteAttachmentDocumentData({
    @required Attachment attachmentData,
  }) async {
    PostResponse response = await _noteRepository.postNoteAttachmentData(
      attachmentData: attachmentData,
    );

    if (response.isSuccess) {
      subjectNoteList.sink.add(null);
      getNoteDetails();
    }

    return response;
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getAPI call.
    getNoteDetails()();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getAPI call.
    getNoteDetails()();
  }

  dispose() {
    _subjectNoteDetails.close();
    _subjectNoteList.close();
  }

  BehaviorSubject<NoteResponse> get subjectNoteDetails => _subjectNoteDetails;
  BehaviorSubject<NoteListResponse> get subjectNoteList => _subjectNoteList;
}

final noteBloc = NoteBloc();
