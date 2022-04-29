import 'package:hr_management/data/models/work_book_models/work_book_response_model.dart';

import 'package:rxdart/rxdart.dart';

import '../../../data/models/workboard_model/workboard_response_model.dart';
import '../../../data/repositories/work_book_repo/abstract_work_book_repo.dart';

class WorkBookBloc {
  final WorkBoardRepository _workBoardRepository = WorkBoardRepository();

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
        await _workBoardRepository.getWorkBookCount(queryparams: queryparams);
    _subjectWorkBookCount.sink.add(response);
  }

  getNoteBookHTML({
    Map<String, dynamic>? queryparams,
  }) async {
    AddContentWorkBoardMapResponseModel response =
        await _workBoardRepository.getNoteBookHTML(queryparams: queryparams);
    _subjectNoteBookHTML.sink.add(response);
  }

  getNoteBookReport({
    Map<String, dynamic>? queryparams,
  }) async {
    GetNoteBookReportResponseModel response =
        await _workBoardRepository.getNoteBookReport(queryparams: queryparams);
    _subjectNoteBookReport.sink.add(response);
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
