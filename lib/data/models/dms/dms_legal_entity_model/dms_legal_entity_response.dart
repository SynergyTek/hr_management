import 'package:meta/meta.dart';

import 'dms_legal_entity_model.dart';


class DMSLegalEntityResponse {
  final List<DMSLegalEntityModel> data;
  String error;

  DMSLegalEntityResponse({
    @required this.data,
  });

  DMSLegalEntityResponse.fromJson(List response)
      : data =
            response.map((i) => new DMSLegalEntityModel.fromJson(i)).toList(),
        error = "";

  DMSLegalEntityResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
