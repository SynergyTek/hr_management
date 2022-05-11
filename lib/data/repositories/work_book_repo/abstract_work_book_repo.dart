import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/email_model/email_response_model.dart';
import '../../models/note/note_model.dart';
import '../../models/work_book_models/work_book_response_model.dart';
import '../../models/workboard_model/workboard_response_model.dart';

part 'work_book_repo.dart';

// Overview of the repository class.
abstract class AbstractWorkBookRepository {
  AbstractWorkBookRepository();

  Future<WorkBookCountResponseModel> getWorkBookCount({
    Map<String, dynamic>? queryparams,
  });

  Future<AddContentWorkBoardMapResponseModel> getNoteBookHTML({
    Map<String, dynamic>? queryparams,
  });

  Future<GetNoteBookReportResponseModel> getNoteBookReport({
    Map<String, dynamic>? queryparams,
  });

  Future<bool> postManageMoveToParent({
    required NoteModel note,
    Map<String, dynamic>? queryparams,
  });

  Future<bool> deleteNoteBookItems({
    Map<String, dynamic>? queryparams,
  });

  Future<bool> deleteServiceBookItems({
    Map<String, dynamic>? queryparams,
  });

  Future<EmailTasksResponseModel> getReadEmailTasks({
    Map<String, dynamic>? queryparams,
  });

  Future<bool> saveEmailToNtsType({
    // required Map data,
    Map<String, dynamic>? queryparams,
  });
}
