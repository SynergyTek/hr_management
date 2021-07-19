import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/nts_comments/nts_comments.dart';
import 'package:hr_management/data/models/nts_comments/nts_comments_response.dart';
import 'package:hr_management/data/repositories/nts_comments/abstract_nts_comments_repo.dart';
import 'package:rxdart/rxdart.dart';

class NtsCommentBloc {
  final NTSCommentsRepository _ntsRepository = NTSCommentsRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<PostResponse> _subject =
      BehaviorSubject<PostResponse>();

  final BehaviorSubject<CommentListResponse> _subjectGetComments =
      BehaviorSubject<CommentListResponse>();

  getCommentsData({String ntsId, NTSType ntsType}) async {
    Map<String, dynamic> queryparams = Map();
    if (ntsType == NTSType.service) {
      queryparams["serviceId"] = ntsId ?? '';
    } else if (ntsType == NTSType.note) {
      queryparams["noteId"] = ntsId ?? '';
    } else if (ntsType == NTSType.task) {
      queryparams["taskId"] = ntsId ?? '';
    }

    CommentListResponse response = await _ntsRepository.getCommentsData(
        queryparams: queryparams, ntsType: ntsType);

    print(response);

    _subjectGetComments.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postCommentData(
      {PostComment comment, String ntsId, NTSType ntsType}) async {
    // PostComment comment=new PostComment();
    // comment.comment = comment ?? '';
    // comment.ntsTaskId = ntsId ?? '';
    // comment.commentToUserId = commentToUserId ?? null;
    // comment.commentedByUserId = '45bba746-3309-49b7-9c03-b5793369d73c';

    PostResponse response = await _ntsRepository.postCommentData(
        comment: comment, ntsType: ntsType);
    // String ntsId = '';
    // if (ntsType == NTSType.service) {
    //   ntsId = response.item["NtsServiceId"] ?? '';
    // } else if (ntsType == NTSType.note) {
    //   ntsId = response.item["NtsNoteId"] ?? '';
    // } else if (ntsType == NTSType.task) {
    //   ntsId = response.item["NtsTaskId"] ?? '';
    // }
    getCommentsData(ntsType: ntsType, ntsId: ntsId);

    return response;
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getComment call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getComment call.
    // getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PostResponse> get subject => _subject;
  BehaviorSubject<CommentListResponse> get subjectGetComments =>
      _subjectGetComments;
}

final ntsCommentBloc = NtsCommentBloc();
