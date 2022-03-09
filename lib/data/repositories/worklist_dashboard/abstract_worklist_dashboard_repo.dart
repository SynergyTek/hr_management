import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/api_models/post_response_model.dart';
import '../../models/worklist_dashboard/worklist_dashboard_response.dart';

part 'worklist_dashboard_repo.dart';

// Overview of the repository class.
abstract class AbstractWorklistDashboardRepository {
  AbstractWorklistDashboardRepository();

  Future<WorkboardResponse> getWorklistDashboardCount();

  Future<NoteWorklistDashboardResponse> getWorklistDashboardNoteCount();

  Future<PostResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<WorkboardResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<WorkboardResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
