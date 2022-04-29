import 'get_note_book_report_model.dart';
import 'work_book_count_model.dart';

class WorkBookCountResponseModel {
  final WorkBookCountModel? mapdata;
  String? error;

  WorkBookCountResponseModel({
    this.mapdata,
  });

  WorkBookCountResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = WorkBookCountModel.fromJson(response);

  WorkBookCountResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}

class GetNoteBookReportResponseModel {
  final GetNoteBookReportModel? mapdata;
  String? error;

  GetNoteBookReportResponseModel({
    this.mapdata,
  });

  GetNoteBookReportResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = GetNoteBookReportModel.fromJson(response);

  GetNoteBookReportResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}
