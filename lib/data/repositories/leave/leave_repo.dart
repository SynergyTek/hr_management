part of 'abstract_leave_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class LeaveRepository extends AbstractLeaveRepository {
  final Dio _dio = Dio();

  Future<BusinessTripResponse> getBusinessTripDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.BUSINESS_TRIP_DETAILS;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return BusinessTripResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return BusinessTripResponse.withError("$err");
    }
  }
}
