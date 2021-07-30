import '../../../data/enums/enums.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

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
  }) async {
    AttachmentNTSResponse response = await _apiRepository.getAPIData(
      ntsType: ntsType,
      ntsId: ntsId,
    );
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  postData() async {}

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
      );
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AttachmentNTSResponse> get subject => _subject;
}

final attachmentNTSBloc = AttachmentNTSBloc();
