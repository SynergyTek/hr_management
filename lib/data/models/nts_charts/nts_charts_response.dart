
import 'package:flutter/material.dart';

import 'chart_model.dart';

class ChartResponse {
  bool isSuccess;
  List<ChartModel> list;
  String error;

  ChartResponse({
    @required this.list,
  });

  ChartResponse.fromJson(List response)
      : list = (response).map((i) => new ChartModel.fromJson(i)).toList();

  ChartResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
