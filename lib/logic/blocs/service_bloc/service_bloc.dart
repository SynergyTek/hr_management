import 'package:flutter/cupertino.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/service_models/service_response_model.dart';

import '../../../data/models/service_models/service_response.dart';
import '../../../data/repositories/service_repository/service_repository.dart';
import 'package:rxdart/rxdart.dart';

class ServiceBloc {
  final ServiceRepository _serviceRepository = ServiceRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ServiceResponse> _subject =
      BehaviorSubject<ServiceResponse>();

  /// Used to fetch new entries.
  getServiceDetail(templateCode) async {
    ServiceResponse response = await _serviceRepository.getServiceDetail(templateCode);
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postData({
    @required ServiceResponseModel serviceResponseModel,
  }) async {
    PostResponse response = await _serviceRepository.postAPIData(
      serviceResponseModel: serviceResponseModel,
    );

    return response;

    // print("Hulululu: ${response.data.toJson()} ${response.error}");
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
}

final serviceBloc = ServiceBloc();
