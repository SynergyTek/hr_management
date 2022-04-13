import 'package:hr_management/data/models/business_trip_model/business_trip_response_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/reimbursement_model/reimbursement_response.dart';
import '../../data/models/service_models/service_response.dart';
import '../../data/models/time_permission_model/time_permission_response.dart';
import '../../data/repositories/leave/abstract_leave_repo.dart';

class LeaveBloc {
  final LeaveRepository _leaveRepository = LeaveRepository();

  final BehaviorSubject<BusinessTripResponse> _subjectBusinessTripList =
      BehaviorSubject<BusinessTripResponse>();

  final BehaviorSubject<ServiceListResponse> _subjectServiceList =
      BehaviorSubject<ServiceListResponse>();

  final BehaviorSubject<TimePermissionResponse> _subjectTimePermissionList =
      BehaviorSubject<TimePermissionResponse>();

  final BehaviorSubject<ReimbursementResponse> _subjectReimbursementList =
      BehaviorSubject<ReimbursementResponse>();

  getBusinessTripDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    BusinessTripResponse response =
        await _leaveRepository.getBusinessTripDetails(
      queryparams: queryparams,
    );

    _subjectBusinessTripList.sink.add(response);
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
    ReimbursementResponse response =
        await _leaveRepository.getTravelReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getMedicalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    ReimbursementResponse response =
        await _leaveRepository.getMedicalReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getEducationalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    ReimbursementResponse response =
        await _leaveRepository.getEducationalReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getOtherReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    ReimbursementResponse response =
        await _leaveRepository.getOtherReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  dispose() {
    _subjectBusinessTripList.close();
    _subjectServiceList.close();
    _subjectTimePermissionList.close();
    _subjectReimbursementList.close();
  }

  BehaviorSubject<BusinessTripResponse> get subjectBusinessTripList =>
      _subjectBusinessTripList;
  BehaviorSubject<ServiceListResponse> get subjectServiceList =>
      _subjectServiceList;
  BehaviorSubject<TimePermissionResponse> get subjectTimePermissionList =>
      _subjectTimePermissionList;
  BehaviorSubject<ReimbursementResponse> get subjectReimbursementList =>
      _subjectReimbursementList;
}

final leaveBloc = LeaveBloc();
