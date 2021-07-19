import 'package:flutter/material.dart';

import 'worklist_dashboard_count.dart';

class WorklistDashboardResponse {
  final WorklistDashboardCount data;
  String error;

  WorklistDashboardResponse({
    @required this.data,
  });

  WorklistDashboardResponse.fromJson(Map<String, dynamic> response)
      : data = WorklistDashboardCount.fromJson(response);

  WorklistDashboardResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
