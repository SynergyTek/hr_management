import 'package:flutter/material.dart';
import 'package:hr_management/data/models/manage_accural/manage_accrual_model.dart';

class ManageAccrualResponse {
  bool isSuccess;
  final ManageAccrualModel data;
  String error;

  ManageAccrualResponse({
    @required this.data,
  });

  ManageAccrualResponse.fromJson(Map<String, dynamic> response)
      : data = ManageAccrualModel.fromJson(response);

  ManageAccrualResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
