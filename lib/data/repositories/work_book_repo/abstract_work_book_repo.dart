import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/work_book_models/work_book_response_model.dart';
import '../../models/workboard_model/workboard_response_model.dart';

part 'work_book_repo.dart';

// Overview of the repository class.
abstract class AbstractWorkBoardRepository {
  AbstractWorkBoardRepository();

  Future<WorkBookCountResponseModel> getWorkBookCount({
    Map<String, dynamic>? queryparams,
  });

  Future<AddContentWorkBoardMapResponseModel> getNoteBookHTML({
    Map<String, dynamic>? queryparams,
  });

  Future<GetNoteBookReportResponseModel> getNoteBookReport({
    Map<String, dynamic>? queryparams,
  });
}
