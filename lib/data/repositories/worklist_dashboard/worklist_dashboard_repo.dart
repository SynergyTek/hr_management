part of 'abstract_worklist_dashboard_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class WorklistDashboardRepository extends AbstractWorklistDashboardRepository {
  final Dio _dio = Dio();

  Future<WorkboardResponse> getWorklistDashboardCount({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.WORKLIST_DASHBOARD_COUNT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return WorkboardResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return WorkboardResponse.withError("$err");
    }
  }

  Future<NoteWorklistDashboardResponse> getWorklistDashboardNoteCount({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.WORKLIST_DASHBOARD_NOTE_COUNT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return NoteWorklistDashboardResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return NoteWorklistDashboardResponse.withError("$err");
    }
  }

  @override
  Future<WorkboardResponse> deleteAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<WorkboardResponse> putAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<PostResponse> postAPIData({Map<String, dynamic>? queryparams}) {
    // TODO: implement postAPIData
    throw UnimplementedError();
  }
}
