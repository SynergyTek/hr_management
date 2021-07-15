import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/nts_comments/nts_comments.dart';
import 'package:hr_management/data/models/nts_comments/nts_comments_response.dart';
import '../../models/api_models/post_response_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'nts_comments_repo.dart';

// Overview of the repository class.
abstract class AbstractNTSCommentsRepository {
  AbstractNTSCommentsRepository();

  Future<CommentListResponse> getCommentsData({
    Map<String, dynamic> queryparams,
  });

  Future<PostResponse> postCommentData({
    PostComment comment,
    NTSType ntsType,
  });

  Future<CommentResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<CommentResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
