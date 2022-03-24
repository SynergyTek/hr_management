import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../synergy_nts.dart';
import '../../constants/api_endpoints.dart';
import '../../models/nts_comments/nts_comments.dart';
import '../../models/nts_comments/nts_comments_response.dart';

part 'nts_comments_repo.dart';

// Overview of the repository class.
abstract class AbstractNTSCommentsRepository {
  AbstractNTSCommentsRepository();

  Future<CommentListResponse> getCommentsData({
    Map<String, dynamic>? queryparams,
  });

  Future<PostResponse> postCommentData({
    PostComment? comment,
  });

  Future<bool?> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
