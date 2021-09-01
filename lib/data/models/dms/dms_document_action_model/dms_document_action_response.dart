import 'package:meta/meta.dart';

import 'dms_document_action_model.dart';




class DMSDocumentActionResponse {
  final List<DMSDocumentActionModel> data;
  String error;

  DMSDocumentActionResponse({
    @required this.data,
  });

  DMSDocumentActionResponse.fromJson(List response)
      : data =
            response.map((i) => new DMSDocumentActionModel.fromJson(i)).toList(),
        error = "";

  DMSDocumentActionResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
