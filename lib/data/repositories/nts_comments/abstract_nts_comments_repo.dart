import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../constants/api_endpoints.dart';
import '../../enums/enums.dart';
import '../../models/api_models/post_response_model.dart';
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
    NTSType? ntsType,
  });

  Future<CommentResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<bool?> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
    NTSType? ntsType,
  });
}
