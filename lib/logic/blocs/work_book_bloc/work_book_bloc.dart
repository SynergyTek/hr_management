import 'package:hr_management/data/models/work_book_models/work_book_response_model.dart';

import 'package:rxdart/rxdart.dart';

import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/note/note_model.dart';
import '../../../data/models/workboard_model/workboard_response_model.dart';
import '../../../data/repositories/work_book_repo/abstract_work_book_repo.dart';

class WorkBookBloc {
  final WorkBookRepository _workBookRepository = WorkBookRepository();

  final BehaviorSubject<WorkBookCountResponseModel?> _subjectWorkBookCount =
      BehaviorSubject<WorkBookCountResponseModel?>();

  final BehaviorSubject<AddContentWorkBoardMapResponseModel?>
      _subjectNoteBookHTML =
      BehaviorSubject<AddContentWorkBoardMapResponseModel?>();

  final BehaviorSubject<GetNoteBookReportResponseModel?>
      _subjectNoteBookReport =
      BehaviorSubject<GetNoteBookReportResponseModel?>();

  getWorkBookCount({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBookCountResponseModel response =
        await _workBookRepository.getWorkBookCount(queryparams: queryparams);
    _subjectWorkBookCount.sink.add(response);
  }

  getNoteBookHTML({
    Map<String, dynamic>? queryparams,
  }) async {
    AddContentWorkBoardMapResponseModel response =
        await _workBookRepository.getNoteBookHTML(queryparams: queryparams);
    _subjectNoteBookHTML.sink.add(response);
  }

  getNoteBookReport({
    Map<String, dynamic>? queryparams,
  }) async {
    GetNoteBookReportResponseModel response =
        await _workBookRepository.getNoteBookReport(queryparams: queryparams);
    _subjectNoteBookReport.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postManageMoveToParent({
    required NoteModel noteModel,
    Map<String, dynamic>? queryparams,
  }) async {
    PostResponse response = await _workBookRepository.postManageMoveToParent(
      note: noteModel,
    );

    return response;
  }

  Future<bool> deleteNoteBookItems({
    Map<String, dynamic>? queryparams,
  }) async {
    bool response = await _workBookRepository.deleteNoteBookItems(
      queryparams: queryparams ?? {},
    );

    return response;
  }

  Future<bool> deleteServiceBookItems({
    Map<String, dynamic>? queryparams,
  }) async {
    bool response = await _workBookRepository.deleteServiceBookItems(
      queryparams: queryparams ?? {},
    );

    return response;
  }

  BehaviorSubject<WorkBookCountResponseModel?> get subjectWorkBookCount =>
      _subjectWorkBookCount;
  BehaviorSubject<AddContentWorkBoardMapResponseModel?>
      get subjectNoteBookHTML => _subjectNoteBookHTML;
  BehaviorSubject<GetNoteBookReportResponseModel?> get subjectNoteBookReport =>
      _subjectNoteBookReport;

  dispose() {
    _subjectWorkBookCount.close();
    _subjectNoteBookHTML.close();
    _subjectNoteBookReport.close();
  }
}

final workBookBloc = WorkBookBloc();
