import 'package:meta/meta.dart';

import 'document_model.dart';

class DocumentResponse {
  final List<DocumentModel> data;
  String error;

  DocumentResponse({
    @required this.data,
  });

  DocumentResponse.fromJson(Map<String, dynamic> response)
      : data = []..add(DocumentModel.fromJson(response));

  DocumentResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
