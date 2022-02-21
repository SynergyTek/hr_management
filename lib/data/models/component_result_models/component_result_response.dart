import 'package:meta/meta.dart';

import 'component_result_model.dart';

class ComponentResultResponse {
  final List<ComponentResultModel>? data;
  String? error;

  ComponentResultResponse({
    required this.data,
  });

  ComponentResultResponse.fromJson(List response)
      : data =
            response.map((i) => new ComponentResultModel.fromJson(i)).toList(),
        error = "";

  ComponentResultResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
