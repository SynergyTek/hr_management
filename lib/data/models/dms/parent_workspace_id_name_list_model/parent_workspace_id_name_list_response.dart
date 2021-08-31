import 'package:meta/meta.dart';

import 'parent_workspace_id_name_list_model.dart';

class ParentWorkspaceIdNameListResponse {
  String error;
  List<DMSParentWorkspaceIdNameListModel> data;

  ParentWorkspaceIdNameListResponse({
    @required this.data,
  });

  ParentWorkspaceIdNameListResponse.fromJson(List response)
      : data = response
            .map((i) => new DMSParentWorkspaceIdNameListModel.fromJson(i))
            .toList(),
        error = "";

  ParentWorkspaceIdNameListResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
