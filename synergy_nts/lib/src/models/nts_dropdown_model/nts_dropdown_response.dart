import 'package:flutter/foundation.dart';

import 'nts_dropdown_model.dart';

class NTSDropdownResponse {
  final List<NTSDropdownModel>? data;
  String? error;

  NTSDropdownResponse({
    @required this.data,
  });

  NTSDropdownResponse.fromJson(List response, String idKey, String nameKey)
      : data = (response)
            .map((i) => NTSDropdownModel.fromJson(i, idKey, nameKey))
            .toList();

  NTSDropdownResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
