import 'package:flutter/material.dart';

import 'team_model.dart';
import 'user.dart';

class UserListResponse {
  bool? isSuccess;
  List<User>? list;
  String? error;

  UserListResponse({
    required this.list,
  });

  UserListResponse.fromJson(List response)
      : list = (response).map((i) => new User.fromJson(i)).toList();

  UserListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}

class ReadTeamDataResponse {
  bool? isSuccess;
  List<ReadTeamDataModel>? list;
  String? error;

  ReadTeamDataResponse({
    required this.list,
  });

  ReadTeamDataResponse.fromJson(List response)
      : list =
            (response).map((i) => new ReadTeamDataModel.fromJson(i)).toList();

  ReadTeamDataResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
