import 'package:hr_management/data/models/service_models/service_summary_model.dart';

class ServiceSummaryResponse {
  bool? isSuccess;
  final Map? data;
  String? error;

  ServiceSummaryResponse({
    required this.data,
  });

  ServiceSummaryResponse.fromJson(Map<String, dynamic> response)
      : data = response;

  ServiceSummaryResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
