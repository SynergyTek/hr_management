import 'package:flutter/material.dart';

import 'read_component_data_model.dart';

class ReadComponentResponse {
  bool? isSuccess;
  List<ReadComponentResultDataModel>? list;
  String? error;

  ReadComponentResponse({
    required this.list,
  });

  ReadComponentResponse.fromJson(List response)
      : list = (response)
            .map((i) => new ReadComponentResultDataModel.fromJson(i))
            .toList();

  ReadComponentResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
