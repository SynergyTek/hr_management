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

  /// Used to fetch new entries.
  postGetDMSFilesData({
    Map<String, dynamic> queryparams,
    @required DmsPostModel dmsPostModel,
  }) async {
    DMSFilesResponse response = await _dmsRepository.getDMSFilesData(
      queryparams: queryparams,
      dmsPostModel: dmsPostModel,
    );

    _subjectDMSGetFilesResponse.sink.add(response);
  }

  dispose() {
    _subjectDMSGetFilesResponse.close();
  }

  BehaviorSubject<DMSFilesResponse> get subjectReadDependnetResponse =>
      _subjectDMSGetFilesResponse;
}

final dmsBloc = DMSDocBloc();
