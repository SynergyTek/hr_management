import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_files_response.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/repositories/dms_repository/abstract_dms_repo.dart';
import 'package:rxdart/rxdart.dart';

class DMSDocBloc {
  final DMSRepository _dmsRepository = DMSRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<DMSFilesResponse> _subjectDMSGetFilesResponse =
      BehaviorSubject<DMSFilesResponse>();

  final BehaviorSubject<DMSFilesResponse> _subjectDMSGetFilesChildResponse =
      BehaviorSubject<DMSFilesResponse>();

  /// Used to fetch new entries.
  postGetDMSFilesData(
      {Map<String, dynamic> queryparams,
      @required DmsPostModel dmsPostModel}) async {
    DMSFilesResponse response = await _dmsRepository.getDMSFilesData(
        queryparams: queryparams, dmsPostModel: dmsPostModel);

    _subjectDMSGetFilesResponse.sink.add(response);
  }

  /// Used to fetch new entries.
  postGetDMSFilesChildData(
      {Map<String, dynamic> queryparams,
      @required DmsPostModel dmsPostModel}) async {
    DMSFilesResponse response = await _dmsRepository.getDMSFilesChildData(
        queryparams: queryparams, dmsPostModel: dmsPostModel);

    _subjectDMSGetFilesChildResponse.sink.add(response);
  }

  dispose() {
    _subjectDMSGetFilesResponse.close();
    _subjectDMSGetFilesChildResponse.close();
  }

  BehaviorSubject<DMSFilesResponse> get subjectDMSGetFilesResponse =>
      _subjectDMSGetFilesResponse;
  BehaviorSubject<DMSFilesResponse> get subjectDMSGetFilesChildResponse =>
      _subjectDMSGetFilesChildResponse;
}

final dmsBloc = DMSDocBloc();
