import 'package:meta/meta.dart';

import 'dms_document_type_model.dart';

class DMSDocumentTypeResponse {
  final List<DMSDocumentTypeModel> data;
  String error;

  DMSDocumentTypeResponse({
    @required this.data,
  });

  DMSDocumentTypeResponse.fromJson(List response)
      : data =
            response.map((i) => new DMSDocumentTypeModel.fromJson(i)).toList(),
        error = "";

  DMSDocumentTypeResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
