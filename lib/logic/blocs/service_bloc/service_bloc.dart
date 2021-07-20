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

  getServiceDetail({templateCode, serviceId, userId}) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["templatecode"] = templateCode ?? '';
    queryparams["serviceId"] = serviceId ?? '';
    queryparams["userid"] = userId ?? '';

    print("Queryparams: ${queryparams.entries}");

    ServiceResponse response =
        await _serviceRepository.getServiceDetail(queryparams: queryparams);
    _subject.sink.add(response);
  }

  getLeavesDetails() async {
    ServiceListResponse response = await _serviceRepository.getLeavesDetails();
    _subjectServiceList.sink.add(response);
  }

  getServiceDashBoardData({templateCode, serviceId, userId}) async {
    ServiceListResponse response =
        await _serviceRepository.getServiceDashBoardData();
    _subjectServiceList.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postData({
    bool isLeaves,
    @required Service service,
  }) async {
    PostResponse response = await _serviceRepository.postAPIData(
      service: service,
    );
    if (isLeaves != null && response.isSuccess) {
      if (isLeaves) {
        subjectServiceList.sink.add(null);
        getLeavesDetails();
      } else {
        subjectServiceList.sink.add(null);
        getServiceHomeListData();
      }
    }

    return response;
  }

  /// Used to fetch new entries.
  getServiceHomeListData({
    Map<String, dynamic> queryparams, // String userId,
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
