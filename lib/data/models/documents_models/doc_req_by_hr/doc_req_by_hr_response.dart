import 'package:flutter/material.dart';

import 'doc_req_by_hr_model.dart';

class DocReqByHrResponse {
  final List<DocReqByHrModel>? data;
  String? error;

  DocReqByHrResponse({
    required this.data,
  });

  DocReqByHrResponse.fromJson(List response)
      : data =
            (response).map((i) => new DocReqByHrModel.fromJson(i)).toList();

  DocReqByHrResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
