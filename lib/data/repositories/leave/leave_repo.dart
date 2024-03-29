part of 'abstract_leave_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class LeaveRepository extends AbstractLeaveRepository {
  final Dio _dio = Dio();

  Future<BusinessTripResponse> getBusinessTripDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_BUSINESS_TRIP_DATA;

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

  Future<HrPolicyDocumentResponse> getHrPolicyDocuments({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_HR_POLICY_DOCUMENTS;
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      print("DIO Response: ${response.data} ${response.data.runtimeType}");
      return HrPolicyDocumentResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: ${endpoint}.");

      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return HrPolicyDocumentResponse.withError("$err");
    }
  }

  Future<AttendanceDetailsListResponse> getEmployeeAttendanceList({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_EMPLOYEE_ATTENDANCE_LIST;
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      json.encode(queryparams);
      print("DIO Response: ${response.data} ${response.data.runtimeType}");
      return AttendanceDetailsListResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: ${endpoint}.");

      print("Stack: \n\n\n $stacktrace");
      print("Err: \n\n\n $err");

      return AttendanceDetailsListResponse.withError("$err");
    }
  }

  Future<ServiceListResponse> readLeaveDetailData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.READ_LEAVE_DETAIL_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return ServiceListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ServiceListResponse.withError("$err");
    }
  }

  Future<TimePermissionResponse> getTimePermissionData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_TIME_PERMISSION_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return TimePermissionResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return TimePermissionResponse.withError("$err");
    }
  }

  Future<ReimbursementResponse> getTravelReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_TRAVEL_REIMBURSEMENT_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return ReimbursementResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ReimbursementResponse.withError("$err");
    }
  }

  Future<ReimbursementResponse> getMedicalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_MEDICAL_REIMBURSEMENT_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return ReimbursementResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ReimbursementResponse.withError("$err");
    }
  }

  Future<ReimbursementResponse> getEducationalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint =
        APIEndpointConstants.GET_EDUCATIONAL_REIMBURSEMENT_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return ReimbursementResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ReimbursementResponse.withError("$err");
    }
  }

  Future<ReimbursementResponse> getOtherReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_OTHER_REIMBURSEMENT_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return ReimbursementResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return ReimbursementResponse.withError("$err");
    }
  }
}
