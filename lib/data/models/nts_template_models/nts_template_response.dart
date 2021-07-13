import 'package:flutter/foundation.dart';
import 'nts_template_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class NTSTemplateResponse {
  final List<NTSTemplateModel> data;
  String error;

  NTSTemplateResponse({
    @required this.data,
  });

  NTSTemplateResponse.fromJson(List response)
      : data = response.map((i) => new NTSTemplateModel.fromJson(i)).toList();

  NTSTemplateResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
