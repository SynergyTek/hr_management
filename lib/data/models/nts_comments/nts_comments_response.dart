import 'package:flutter/foundation.dart';

import 'nts_comments.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class CommentResponse {
  bool isSuccess;
  final Comment data;
  String error;

  CommentResponse({
    @required this.data,
  });

  // CommentResponse.fromJson(Map<String, dynamic> response)
  //     : data = Comment.fromJson(response);

  CommentResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}

class CommentListResponse {
  bool isSuccess;
  List<Comment> list;
  String error;

  CommentListResponse({
    @required this.list,
  });

  // CommentListResponse.fromJson(List response)
  //     : list = (response).map((i) => new Comment.fromJson(i)).toList();

  CommentListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}


