import 'package:flutter/material.dart';
import 'manage_accrual_model.dart';

class ManageAccrualResponse {
  bool isSuccess;
  final List<ManageAccrualModel> data;
  String error;

  ManageAccrualResponse({
    @required this.data,
  });

  ManageAccrualResponse.fromJson(List response)
      : data =
            (response).map((i) => new ManageAccrualModel.fromJson(i)).toList();

  ManageAccrualResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
