import 'package:meta/meta.dart';

import 'case_management_model.dart';

class CaseManagementResponse {
  final List<CaseManagementModel> data;
  String error;

  CaseManagementResponse({
    @required this.data,
  });

  CaseManagementResponse.fromJson(List response)
      : data =
            response.map((i) => new CaseManagementModel.fromJson(i)).toList(),
        error = "";

  CaseManagementResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
