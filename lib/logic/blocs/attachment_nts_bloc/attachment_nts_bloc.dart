import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hr_management/data/models/attacment/attachment_model.dart';
import 'package:hr_management/data/models/note/note_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/enums/enums.dart';
import '../../../data/models/attachment_nts_models/attachment_nts_response.dart';
import '../../../data/models/uploaded_content_model/uploaded_content_model.dart';
import '../../../data/repositories/attachment_nts_repository/attachment_nts_repository.dart';

class AttachmentNTSBloc {
  final AttachmentNTSRepository _apiRepository = AttachmentNTSRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AttachmentNTSResponse> _subject =
      BehaviorSubject<AttachmentNTSResponse>();
  final BehaviorSubject _subjectPostManageUploadedFile = BehaviorSubject();
  final BehaviorSubject _subjectPostAddUploadedFile = BehaviorSubject();

  /// Used to fetch new entries.
  getData({
    required NTSType? ntsType,
    required String? ntsId,
    String? userid,
  }) async {
    AttachmentNTSResponse response = await _apiRepository.getAPIData(
      ntsType: ntsType,
      ntsId: ntsId,
    );
    _subject.sink.add(response);
    return response;
  }

  /// Used to create new entries.
  Future<String> postAttachmentDocumentData({
    required Attachment attachmentData,
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

  Future<bool> postManageUploadedFile({
    required UploadedContentModel model,
  }) async {
    dynamic response = await _apiRepository.postManageUploadedFile(
      model: model,
    );

    _subjectPostManageUploadedFile.sink.add(response);
    return response;
  }

  Future<bool> postAddUploadedFile({
    required NoteModel model,
  }) async {
    dynamic response = await _apiRepository.postAddUploadedFile(
      model: model,
    );

    _subjectPostAddUploadedFile.sink.add(response);
    return response;
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
    Map<String, dynamic>? queryparams,
    required NTSType ntsType,
    required String ntsId,
  }) async {
    bool response = await (_apiRepository.deleteAPIData(
      queryparams: queryparams,
    ) as FutureOr<bool>);

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
    _subjectPostManageUploadedFile.close();
    _subjectPostAddUploadedFile.close();
  }

  BehaviorSubject<AttachmentNTSResponse> get subject => _subject;
  BehaviorSubject get subjectPostManageUploadedFile =>
      _subjectPostManageUploadedFile;
  BehaviorSubject get subjectPostAddUploadedFile => _subjectPostAddUploadedFile;
}

final attachmentNTSBloc = AttachmentNTSBloc();
