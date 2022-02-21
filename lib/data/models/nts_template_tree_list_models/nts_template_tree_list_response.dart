import 'package:flutter/foundation.dart';

import 'nts_template_tree_list_model.dart';

class NTSTemplateTreeListResponse {
  final List<NTSTemplateTreeListModel> data;
  String? error;

  NTSTemplateTreeListResponse({
    required this.data,
  });

  NTSTemplateTreeListResponse.fromJson(List response)
      : data = (response)
            .map((i) => new NTSTemplateTreeListModel.fromJson(i))
            .toList();

  NTSTemplateTreeListResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
