import 'package:flutter/foundation.dart';
import 'package:hr_management/data/models/dms_document/doc_flder_str_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class DMSFlderStrResponse {
  final DocFldrStrModel data;
  String error;

  DMSFlderStrResponse({
    @required this.data,
  });

  DMSFlderStrResponse.fromJson(Map<String, dynamic> response)
      : data = DocFldrStrModel.fromJson(response);

  DMSFlderStrResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
