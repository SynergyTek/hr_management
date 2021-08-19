import 'package:flutter/cupertino.dart';
import '../../../data/models/api_models/post_response_model.dart';
import '../../../data/models/service_models/service.dart';

import '../../../data/models/service_models/service_response.dart';
import '../../../data/repositories/service_repository/abstract_service_repo.dart';
import 'package:rxdart/rxdart.dart';

class ServiceBloc {
  final ServiceRepository _serviceRepository = ServiceRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ServiceResponse> _subject =
      BehaviorSubject<ServiceResponse>();

  final BehaviorSubject<ServiceListResponse> _subjectServiceList =
      BehaviorSubject<ServiceListResponse>();

  getServiceDetail({
    Map<String, dynamic> queryparams,
  }) async {
    ServiceResponse response = await _serviceRepository.getServiceDetail(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  getLeavesDetails({
    Map<String, dynamic> queryparams,
  }) async {
    ServiceListResponse response = await _serviceRepository.getLeavesDetails(
      queryparams: queryparams,
    );

    _subjectServiceList.sink.add(response);
  }

  getServiceDashBoardData({
    Map<String, dynamic> queryparams,
  }) async {
    ServiceListResponse response =
        await _serviceRepository.getServiceDashBoardData(
      queryparams: queryparams,
    );
    _subjectServiceList.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postData({
    bool isLeaves,
    String userId,
    @required Service service,
  }) async {
    PostResponse response = await _serviceRepository.postAPIData(
      service: service,
    );
    if (isLeaves != null && response.isSuccess) {
      if (isLeaves) {
        subjectServiceList.sink.add(null);
        Map<String, dynamic> queryparams = Map();
        if (userId != null && userId.isNotEmpty) queryparams["userId"] = userId;
        getLeavesDetails(queryparams: queryparams);
      } else {
        subjectServiceList.sink.add(null);
        getServiceHomeListData();
      }
    }

    return response;
  }

  /// Used to fetch new entries.
  getServiceHomeListData({
    Map<String, dynamic> queryparams,
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
  }

  BehaviorSubject<ServiceResponse> get subject => _subject;
  BehaviorSubject<ServiceListResponse> get subjectServiceList =>
      _subjectServiceList;
}

final serviceBloc = ServiceBloc();
