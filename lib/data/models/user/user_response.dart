
import 'package:flutter/material.dart';

import 'user.dart';

class UserListResponse {
  bool isSuccess;
  List<User> list;
  String error;

  UserListResponse({
    @required this.list,
  });

  UserListResponse.fromJson(List response)
      : list = (response).map((i) => new User.fromJson(i)).toList();

  UserListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
