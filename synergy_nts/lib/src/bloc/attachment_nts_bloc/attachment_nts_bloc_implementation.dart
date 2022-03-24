part of 'abstract_attachment_nts_bloc.dart';

class AttachmentNTSBloc extends AbstractAttachmentNTSBloc {
  final AttachmentNTSRepository _apiRepository = AttachmentNTSRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AttachmentNTSResponse> _subject =
      BehaviorSubject<AttachmentNTSResponse>();

  /// Used to fetch new entries.
  @override
  Future<AttachmentNTSResponse> getData({
    required NTSType ntsType,
    required String ntsId,
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
  @override
  Future<String> postAttachmentDocumentData({
    required AttachmentModel attachmentData,
  }) async {
    Response<dynamic> response = await _apiRepository.postAttachmentData(
      attachmentData: attachmentData,
    );

    if (response.statusCode == 200) {
      getData(
        userid: attachmentData.userId,
        ntsId: attachmentData.ntsId ?? "",
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

  /// Used to delete a particular entry.
  @override
  Future<bool> deleteData({
    Map<String, dynamic>? queryparams,
    required NTSType ntsType,
    required String ntsId,
  }) async {
    bool response = await _apiRepository.deleteAPIData(
      queryparams: queryparams,
    );

    // Update the list (in UI) with the getAPI call.
    if (response) {
      getData(
        ntsType: ntsType,
        ntsId: ntsId,
        // userid: queryparams['userid'],
      );
    }

    return response;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AttachmentNTSResponse> get subject => _subject;
}

final attachmentNTSBloc = AttachmentNTSBloc();
