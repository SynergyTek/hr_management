import 'package:flutter/material.dart';

import 'worklist_dashboard_count.dart';

class WorkboardResponse {
  final WorklistDashboardCount? data;
  String? error;

  WorkboardResponse({
    required this.data,
  });

  WorkboardResponse.fromJson(Map<String, dynamic> response)
      : data = WorklistDashboardCount.fromJson(response);

  WorkboardResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}

class NoteWorklistDashboardResponse {
  final NoteWorklistDashboardCount? data;
  String? error;

  NoteWorklistDashboardResponse({
    required this.data,
  });

  NoteWorklistDashboardResponse.fromJson(Map<String, dynamic> response)
      : data = NoteWorklistDashboardCount.fromJson(response);

  NoteWorklistDashboardResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}