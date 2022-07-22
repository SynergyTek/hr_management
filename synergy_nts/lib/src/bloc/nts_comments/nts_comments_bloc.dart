import 'package:rxdart/rxdart.dart';
import '../../../synergy_nts.dart';
import '../../models/nts_comments/nts_comments.dart';
import '../../models/nts_comments/nts_comments_response.dart';
import '../../repositories/nts_comments/abstract_nts_comments_repo.dart';

class NtsCommentBloc {
  final NTSCommentsRepository _ntsRepository = NTSCommentsRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<PostResponse> _subject =
      BehaviorSubject<PostResponse>();

  final BehaviorSubject<CommentListResponse> _subjectGetComments =
      BehaviorSubject<CommentListResponse>();

  getCommentsData({
    String? ntsId,
  }) async {
    Map<String, dynamic> queryparams = {};

    queryparams["taskId"] = ntsId ?? '';

    CommentListResponse response = await _ntsRepository.getCommentsData(
      queryparams: queryparams,
    );

    print(response);

    _subjectGetComments.sink.add(response);
  }

  /// Used to create new entries.
  Future<PostResponse> postCommentData({
    required PostComment comment,
    String? ntsId,
    String? userid,
  }) async {
    PostResponse response = await _ntsRepository.postCommentData(
      comment: comment,
      userid: userid,
    );

    getCommentsData(ntsId: ntsId);

    return response;
  }

  /// Used to delete a particular entry.
  deleteData({
    required Map<String, dynamic> queryparams,
    required String ntsId,
  }) async {
    // Delete here
    await _ntsRepository.deleteAPIData(
      queryparams: queryparams,
    );

    // Update the list (in UI) with the getComment call.
    getCommentsData(
      ntsId: ntsId,
    );
  }

  dispose() {
    _subject.close();
    _subjectGetComments.close();
  }

  BehaviorSubject<PostResponse> get subject => _subject;
  BehaviorSubject<CommentListResponse> get subjectGetComments =>
      _subjectGetComments;
}

final ntsCommentBloc = NtsCommentBloc();
