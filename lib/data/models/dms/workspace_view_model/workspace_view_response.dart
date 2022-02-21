import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:meta/meta.dart';

class WorkspaceViewResponse {
  final List<WorkspaceViewModel>? data;
  String? error;

  WorkspaceViewResponse({
    required this.data,
  });

  WorkspaceViewResponse.fromJson(List response)
      : data = response.map((i) => new WorkspaceViewModel.fromJson(i)).toList(),
        error = "";

  WorkspaceViewResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
