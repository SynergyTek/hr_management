import 'package:dio/dio.dart';
import 'package:hr_management/data/models/attacment/attachment_model.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/enums/enums.dart';
import '../../../data/models/attachment_nts_models/attachment_nts_response.dart';
import '../../../data/repositories/attachment_nts_repository/attachment_nts_repository.dart';

class AttachmentNTSBloc {
  final AttachmentNTSRepository _apiRepository = AttachmentNTSRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AttachmentNTSResponse> _subject =
      BehaviorSubject<AttachmentNTSResponse>();

  /// Used to fetch new entries.
  getData({
    @required NTSType ntsType,
    @required String ntsId,
    String userid,
  }) async {
    AttachmentNTSResponse response = await _apiRepository.getAPIData(
      ntsType: ntsType,
      ntsId: ntsId,
    );
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  Future<String> postAttachmentDocumentData({
    @required Attachment attachmentData,
  }) async {
    Response<dynamic> response = await _apiRepository.postAttachmentData(
      attachmentData: attachmentData,
    );

    if (response.statusCode == 200) {
      getData(
        userid: attachmentData.userId,
        ntsId: attachmentData.ntsId,
        ntsType: attachmentData.ntsType == 'NTS_Service'
            ? NTSType.service
            : attachmentData.ntsType == 'NTS_Task'
                ? NTSType.task
                : NTSType.note,
      );
      return response.data;
    } else {
      return "";
    }
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getAPI call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData({
    Map<String, dynamic> queryparams,
    @required NTSType ntsType,
    @required String ntsId,
  }) async {
    // Delete here

    bool response = await _apiRepository.deleteAPIData(
      queryparams: queryparams,
    );

    // Update the list (in UI) with the getAPI call.
    if (response)
      getData(
        ntsType: ntsType,
        ntsId: ntsId,
        // userid: queryparams['userid'],
      );
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AttachmentNTSResponse> get subject => _subject;
}

final attachmentNTSBloc = AttachmentNTSBloc();
