part of 'abstract_service_bloc.dart';

class ServiceBloc extends AbstractServiceBloc {
  final ServiceRepository? _serviceRepository = ServiceRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ServiceResponse?> _subject =
      BehaviorSubject<ServiceResponse?>();

  final BehaviorSubject<ServiceListResponse?> _subjectServiceList =
      BehaviorSubject<ServiceListResponse?>();

  final BehaviorSubject<PaginationMyRequestsResponse?> _subjectMyRequestList =
      BehaviorSubject<PaginationMyRequestsResponse?>();

  final BehaviorSubject<ServiceResponse?> _subjectDeleteService =
      BehaviorSubject<ServiceResponse?>();

  final BehaviorSubject<ServiceMapResponse?> _subjectReadServiceListCount =
      BehaviorSubject<ServiceMapResponse?>();

  final BehaviorSubject<ServiceListResponse?> _subjectReadServiceData =
      BehaviorSubject<ServiceListResponse?>();

  final BehaviorSubject<BusinessTripResponse?> _subjectBusinessTripList =
      BehaviorSubject<BusinessTripResponse?>();

  final BehaviorSubject<TimePermissionResponse?> _subjectTimePermissionList =
      BehaviorSubject<TimePermissionResponse?>();

  final BehaviorSubject<ReimbursementResponse?> _subjectReimbursementList =
      BehaviorSubject<ReimbursementResponse?>();

  //
  @override
  Future<ServiceResponse?> getServiceDetail({
    Map<String, dynamic>? queryparams,
  }) async {
    _subject.sink.add(null);
    ServiceResponse? response = await _serviceRepository!.getServiceDetail(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
    return response;
  }

  /// Used to create new entries.
  @override
  Future<PostResponse> postServiceData({
    // bool? isleave,
    String? userId,
    String? categoryCode,
    required Service? service,
  }) async {
    PostResponse response = await _serviceRepository!.postServiceAPIData(
      service: service!,
    );
    Map<String, dynamic> queryparams = {};
    if (userId != null && userId.isNotEmpty) queryparams["userId"] = userId;

    if (response.isSuccess!) {
      if (categoryCode == "Leave") {
        subjectServiceList.sink.add(null);
        readLeaveDetailData(queryparams: queryparams);
      } else if (categoryCode == "BuisnessTrip") {
        subjectBusinessTripList.sink.add(null);
        getBusinessTripDetails(queryparams: queryparams);
      } else if (categoryCode == "TimePermissionBusiness") {
        subjectTimePermissionList.sink.add(null);
        getTimePermissionData(queryparams: queryparams);
      } else if (categoryCode == "REIMB_TRAVEL") {
        subjectReimbursementList.sink.add(null);
        getTravelReimbursementData(queryparams: queryparams);
      } else if (categoryCode == "REIMB_MDECIAL") {
        subjectReimbursementList.sink.add(null);
        getMedicalReimbursementData(queryparams: queryparams);
      } else if (categoryCode == "REIMB_EDUCATIONAL") {
        subjectReimbursementList.sink.add(null);
        getEducationalReimbursementData(queryparams: queryparams);
      } else if (categoryCode == "REIMB_OTHERS") {
        subjectReimbursementList.sink.add(null);
        getOtherReimbursementData(queryparams: queryparams);
      } else {
        subjectServiceList.sink.add(null);
        getServiceHomeListData(queryparams: queryparams);
      }
    }

    return response;
  }

  @override
  Future<ServiceResponse?> deleteService({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceResponse? response =
        await _serviceRepository?.deleteService(queryparams: queryparams);
    _subjectDeleteService.sink.add(response);

    return response;
  }

  /// Used to fetch new entries.
  @override
  Future<ServiceListResponse?> getServiceHomeListData({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse? response =
        await _serviceRepository!.getServiceHomeListData(
      queryparams: queryparams,
    );
    _subjectServiceList.sink.add(response);
    return response;
  }

  @override
  // Future <PaginationMyRequestsResponse?> getMyRequestList({
  getMyRequestList({
    Map<String, dynamic>? queryparams,
  }) async {
    PaginationMyRequestsResponse? response =
        await _serviceRepository!.getMyRequestList(
      queryparams: queryparams,
    );
    _subjectMyRequestList.sink.add(response);

    // return response;
  }

  getReadServiceListCount({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceMapResponse response =
        await _serviceRepository!.getReadServiceListCount(
      queryparams: queryparams,
    );
    _subjectReadServiceListCount.sink.add(response);
  }

  getReadServiceData({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse response = await _serviceRepository!.getReadServiceData(
      queryparams: queryparams,
    );
    _subjectReadServiceData.sink.add(response);
  }

  getServiceDashBoardData({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse response =
        await _serviceRepository!.getServiceDashBoardData(
      queryparams: queryparams,
    );
    _subjectServiceList.sink.add(response);
  }

  readLeaveDetailData({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse response;
    response = await _serviceRepository!.readLeaveDetailData(
      queryparams: queryparams,
    );

    _subjectServiceList.sink.add(response);
  }

  getBusinessTripDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    BusinessTripResponse response =
        await _serviceRepository!.getBusinessTripDetails(
      queryparams: queryparams,
    );

    _subjectBusinessTripList.sink.add(response);
  }

  getTimePermissionData({
    Map<String, dynamic>? queryparams,
  }) async {
    TimePermissionResponse response =
        await _serviceRepository!.getTimePermissionData(
      queryparams: queryparams,
    );

    _subjectTimePermissionList.sink.add(response);
  }

  getTravelReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _serviceRepository!.getTravelReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getMedicalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _serviceRepository!.getMedicalReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getEducationalReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _serviceRepository!.getEducationalReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  getOtherReimbursementData({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectReimbursementList.sink.add(null);

    ReimbursementResponse response =
        await _serviceRepository!.getOtherReimbursementData(
      queryparams: queryparams,
    );

    _subjectReimbursementList.sink.add(response);
  }

  dispose() {
    _subject.close();
    _subjectServiceList.close();
    _subjectMyRequestList.close();
    _subjectDeleteService.close();
    _subjectReadServiceListCount.close();
    _subjectReadServiceData.close();
    _subjectBusinessTripList.close();
    _subjectTimePermissionList.close();
    _subjectReimbursementList.close();
  }

  BehaviorSubject<ServiceResponse?> get subject => _subject;
  BehaviorSubject<ServiceListResponse?> get subjectServiceList =>
      _subjectServiceList;
  BehaviorSubject<ServiceResponse?> get subjectDeleteService =>
      _subjectDeleteService;
  BehaviorSubject<PaginationMyRequestsResponse?> get subjectMyRequestList =>
      _subjectMyRequestList;
  BehaviorSubject<ServiceMapResponse?> get subjectReadServiceListCount =>
      _subjectReadServiceListCount;
  BehaviorSubject<ServiceListResponse?> get subjectReadServiceData =>
      _subjectReadServiceData;
  BehaviorSubject<BusinessTripResponse?> get subjectBusinessTripList =>
      _subjectBusinessTripList;
  BehaviorSubject<TimePermissionResponse?> get subjectTimePermissionList =>
      _subjectTimePermissionList;
  BehaviorSubject<ReimbursementResponse?> get subjectReimbursementList =>
      _subjectReimbursementList;
}

final serviceBloc = ServiceBloc();
