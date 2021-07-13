
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/repositories/nts_comments/abstract_nts_comments_repo.dart';
import 'package:rxdart/rxdart.dart';

class NtsCommentBloc {
  final NTSCommentsRepository _ntsRepository = NTSCommentsRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<PostResponse> _subject =
      BehaviorSubject<PostResponse>();

  // getServiceDetail({templateCode, serviceId, userId}) async {
  //   Map<String, dynamic> queryparams = Map();
  //   queryparams["templatecode"] = templateCode ?? '';
  //   queryparams["serviceId"] = serviceId ?? '';
  //   queryparams["userid"] = userId ?? '';
  //   ServiceResponse response =
  //       await _serviceRepository.getServiceDetail(queryparams: queryparams);
  //   _subject.sink.add(response);
  // }

  /// Used to create new entries.
  Future<PostResponse> postCommentData(
      {String comment,
      String ntsId,
      String commentToUserId,
      NTSType ntsType}) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["comment"] = comment ?? '';
    queryparams["ntsId"] = ntsId ?? '';
    queryparams["commentToUserId"] = commentToUserId ?? '';
    PostResponse response = await _ntsRepository.postCommentData(
        queryparams: queryparams, ntsType: ntsType);

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

  BehaviorSubject<PostResponse> get subject => _subject;
}

final ntsCommentBloc = NtsCommentBloc();
