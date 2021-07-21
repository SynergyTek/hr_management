import 'dart:convert';

import 'package:flutter/widgets.dart';
import '../../models/common/common_list_response.dart';
import '../../models/note/note_model.dart';
import '../../models/note/note_response.dart';
import '../../models/api_models/post_response_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'common_repo.dart';

// Overview of the repository class.
abstract class AbstractCommonRepository {
  AbstractCommonRepository();

  // Future<NoteResponse> getNoteDetail({
  //   Map<String, dynamic> queryparams,
  // }); //{
  // Optional Params to be added to the request if required.
  //  Map<String, dynamic> queryparams,});

  Future<CommonListResponse> getLOVList();

  // Future<NoteListResponse> getNoteDashBoardData({
  //   Map<String, dynamic> queryparams,
  // });

  // Future<PostResponse> postNoteAPIData({
  //   // Optional Params to be added to the request if required.
  //   Map<String, dynamic> queryparams,
  // });

  // Future<NoteResponse> putNoteAPIData({
  //   // Optional Params to be added to the request if required.
  //   Map<String, dynamic> queryparams,
  // });

  // Future<NoteResponse> deleteNoteAPIData({
  //   // Optional Params to be added to the request if required.
  //   Map<String, dynamic> queryparams,
  // });
}
