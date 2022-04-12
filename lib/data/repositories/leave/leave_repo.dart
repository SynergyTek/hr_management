part of 'abstract_leave_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class LeaveRepository extends AbstractLeaveRepository {
  final Dio _dio = Dio();

  @override
  Future<LeaveTempResponse> getAPi({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<LeaveTempResponse> deleteAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<LeaveTempResponse> postAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<LeaveTempResponse> putAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }
}
