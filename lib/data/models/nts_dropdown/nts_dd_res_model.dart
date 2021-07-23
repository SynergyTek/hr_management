import 'package:flutter/foundation.dart';

import 'nts_dropdown_model.dart';

class NTSDdResponse {
  final List<NTSDropdownModel> data;
  String error;

  NTSDdResponse({
    @required this.data,
  });

  NTSDdResponse.fromJson(List response, String idKey, String nameKey)
      : data = (response)
            .map((i) => new NTSDropdownModel.fromJson(i, idKey, nameKey))
            .toList();

  NTSDdResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
