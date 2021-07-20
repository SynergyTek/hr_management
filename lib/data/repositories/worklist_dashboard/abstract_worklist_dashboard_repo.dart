import 'dart:convert';

import 'package:flutter/widgets.dart';
import '../../models/worklist_dashboard/worklist_dashboard_response.dart';
import '../../models/api_models/post_response_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'worklist_dashboard_repo.dart';

// Overview of the repository class.
abstract class AbstractWorklistDashboardRepository {
  AbstractWorklistDashboardRepository();

  Future<WorklistDashboardResponse> getWorklistDashboardCount(); 

  
  Future<NoteWorklistDashboardResponse> getWorklistDashboardNoteCount(); 


  Future<PostResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<WorklistDashboardResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<WorklistDashboardResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
