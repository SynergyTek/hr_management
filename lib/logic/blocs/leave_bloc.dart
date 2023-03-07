import 'package:hr_management/data/models/attendance_details_model/attendance_details_response.dart';
import 'package:hr_management/data/models/business_trip_model/business_trip_response_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/models/hr_policy_document_model/hr_policy_response_model.dart';
import '../../data/models/reimbursement_model/reimbursement_response.dart';
import '../../data/models/service_models/service_response.dart';
import '../../data/models/time_permission_model/time_permission_response.dart';
import '../../data/repositories/leave/abstract_leave_repo.dart';

export '../../data/models/hr_policy_document_model/hr_policy_response_model.dart';
export '../../data/models/reimbursement_model/reimbursement_response.dart';
export '../../data/models/service_models/service_response.dart';
export '../../data/models/time_permission_model/time_permission_response.dart';
export '../../data/repositories/leave/abstract_leave_repo.dart';

class LeaveBloc {
  final LeaveRepository _leaveRepository = LeaveRepository();

  final BehaviorSubject<BusinessTripResponse> _subjectBusinessTripList =
      BehaviorSubject<BusinessTripResponse>();

  final BehaviorSubject<HrPolicyDocumentResponse?> _subjectHrPolicyDocument =
      BehaviorSubject<HrPolicyDocumentResponse?>();

  final BehaviorSubject<ServiceListResponse> _subjectServiceList =
      BehaviorSubject<ServiceListResponse>();

  final BehaviorSubject<AttendanceDetailsListResponse>
      _subjectGetEmployeeAttendanceList =
      BehaviorSubject<AttendanceDetailsListResponse>();

  final BehaviorSubject<TimePermissionResponse> _subjectTimePermissionList =
      BehaviorSubject<TimePermissionResponse>();

  final BehaviorSubject<ReimbursementResponse?> _subjectReimbursementList =
      BehaviorSubject<ReimbursementResponse?>();

  getBusinessTripDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    BusinessTripResponse response =
        await _leaveRepository.getBusinessTripDetails(
      queryparams: queryparams,
    );

    _subjectBusinessTripList.sink.add(response);
  }

  getHrPolicyDocument({
    Map<String, dynamic>? queryparams,
  }) async {
    HrPolicyDocumentResponse response =
        await _leaveRepository.getHrPolicyDocuments(
      queryparams: queryparams,
    );
    _subjectHrPolicyDocument.sink.add(response);
  }

  getEmployeeAttendanceList({
    Map<String, dynamic>? queryparams,
  }) async {
    AttendanceDetailsListResponse response =
        await _leaveRepository.getEmployeeAttendanceList(
      queryparams: queryparams,
    );
    _subjectGetEmployeeAttendanceList.sink.add(response);
  }

  readLeaveDetailData({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse response;
    response = await _leaveRepository.readLeaveDetailData(
      queryparams: queryparams,
    );

    _subjectServiceList.sink.add(response);
  }

  getTimePermissionData({
    Map<String, dynamic>? queryparams,
  }) async {
    TimePermissionResponse response =
        await _leaveRepository.getTimePermissionData(
      queryparams: queryparams,
    );

    _subjectTimePermissionList.sink.add(response);
  }

  getTravelReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _leaveRepository.getTravelReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getMedicalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _leaveRepository.getMedicalReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getEducationalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _leaveRepository.getEducationalReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getOtherReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _leaveRepository.getOtherReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  dispose() {
    _subjectBusinessTripList.close();
    _subjectHrPolicyDocument.close();
    _subjectServiceList.close();
    _subjectTimePermissionList.close();
    _subjectReimbursementList.close();
    _subjectGetEmployeeAttendanceList.close();
  }

  BehaviorSubject<BusinessTripResponse> get subjectBusinessTripList =>
      _subjectBusinessTripList;
  BehaviorSubject<HrPolicyDocumentResponse?> get subjectHrPolicyDocument =>
      _subjectHrPolicyDocument;
  BehaviorSubject<ServiceListResponse> get subjectServiceList =>
      _subjectServiceList;
  BehaviorSubject<TimePermissionResponse> get subjectTimePermissionList =>
      _subjectTimePermissionList;
  BehaviorSubject<ReimbursementResponse?> get subjectReimbursementList =>
      _subjectReimbursementList;
  BehaviorSubject<AttendanceDetailsListResponse?>
      get subjectGetEmployeeAttendanceList => _subjectGetEmployeeAttendanceList;
}

final leaveBloc = LeaveBloc();
