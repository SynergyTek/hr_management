import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hr_management/data/models/attacment/attachment_model.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/api_models/post_response_model.dart';
import '../../models/note/note_model.dart';
import '../../models/note/note_response.dart';

part 'note_repo.dart';

// Overview of the repository class.
abstract class AbstractNoteRepository {
  AbstractNoteRepository();

  Future<NoteResponse> getNoteDetail({
    Map<String, dynamic> queryparams,
  }); //{
  // Optional Params to be added to the request if required.
  //  Map<String, dynamic> queryparams,});

  Future<NoteListResponse> getNoteList();

  Future<NoteListResponse> getNoteDashBoardData({
    Map<String, dynamic> queryparams,
  });

  Future<PostResponse> postNoteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<Response<dynamic>> postNoteAttachmentData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NoteResponse> putNoteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NoteResponse> deleteNoteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
