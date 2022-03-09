import 'package:flutter/material.dart';
import 'payslip_model.dart';

class PayslipResponse {
  bool? isSuccess;
  final List<PayslipModel>? data;
  String? error;

  PayslipResponse({
    required this.data,
  });

  PayslipResponse.fromJson(List response)
      : data = (response).map((i) => new PayslipModel.fromJson(i)).toList();

  PayslipResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
