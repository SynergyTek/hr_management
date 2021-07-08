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
    ServiceResponse response =
        await _serviceRepository.getServiceDetail(queryparams: queryparams);
    _subject.sink.add(response);
  }

  getLeavesDetails() async {
    ServiceListResponse response = await _serviceRepository.getLeavesDetails();
    _subjectServiceList.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postData({
    @required Service service,
  }) async {
    PostResponse response = await _serviceRepository.postAPIData(
      service: service,
    );

    return response;
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
  }

  BehaviorSubject<ServiceResponse> get subject => _subject;
  BehaviorSubject<ServiceListResponse> get subjectServiceList =>
      _subjectServiceList;
}

final serviceBloc = ServiceBloc();
