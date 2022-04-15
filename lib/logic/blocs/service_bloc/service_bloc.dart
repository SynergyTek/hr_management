import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/service_models/service.dart';

import '../../../data/models/service_models/service_response.dart';
import '../../../data/models/service_models/service_summary_response_model.dart';
import '../../../data/repositories/service_repository/abstract_service_repo.dart';
import 'package:rxdart/rxdart.dart';

class ServiceBloc {
  final ServiceRepository _serviceRepository = ServiceRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ServiceResponse?> _subject =
      BehaviorSubject<ServiceResponse?>();

  final BehaviorSubject<ServiceListResponse?> _subjectServiceList =
      BehaviorSubject<ServiceListResponse?>();
  final BehaviorSubject<ServiceSummaryResponse?> _subjectServiceSummaryList =
      BehaviorSubject<ServiceSummaryResponse?>();

  getServiceDetail({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceResponse response = await _serviceRepository.getServiceDetail(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  getServiceSummary({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceSummaryResponse response =
        await _serviceRepository.getServiceSummaryData(
      queryparams: queryparams,
    );
    _subjectServiceSummaryList.sink.add(response);
  }

  // getLeavesDetails({
  //   Map<String, dynamic>? queryparams,
  // }) async {
  //   ServiceListResponse response = await _serviceRepository.getLeavesDetails(
  //     queryparams: queryparams,
  //   );

  //   _subjectServiceList.sink.add(response);
  // }

  getServiceDashBoardData({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse response =
        await _serviceRepository.getServiceDashBoardData(
      queryparams: queryparams,
    );
    _subjectServiceList.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postData({
    bool? isLeaves,
    String? userId,
    required Service service,
  }) async {
    PostResponse response = await _serviceRepository.postAPIData(
      service: service,
    );
    Map<String, dynamic> queryparams = Map();
    if (userId != null && userId.isNotEmpty) queryparams["userId"] = userId;
    if (isLeaves != null && response.isSuccess!) {
      if (isLeaves) {
        //TODO: add the correct bloc for leave
        // subjectServiceList.sink.add(null);
        // getLeavesDetails(queryparams: queryparams);
      } else {
        subjectServiceList.sink.add(null);
        getServiceHomeListData(queryparams: queryparams);
      }
    }

    return response;
  }

  /// Used to fetch new entries.
  getServiceHomeListData({
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse response =
        await _serviceRepository.getServiceHomeListData(
      queryparams: queryparams,
    );
    _subjectServiceList.sink.add(response);
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getService call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getService call.
    // getData();
  }

  dispose() {
    _subject.close();
    _subjectServiceList.close();
    _subjectServiceSummaryList.close();
  }

  BehaviorSubject<ServiceResponse?> get subject => _subject;
  BehaviorSubject<ServiceListResponse?> get subjectServiceList =>
      _subjectServiceList;
  BehaviorSubject<ServiceSummaryResponse?> get subjectServiceSummaryList =>
      _subjectServiceSummaryList;
}

final serviceBloc = ServiceBloc();
