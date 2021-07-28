import 'package:flutter/material.dart';
import 'person_document_model.dart';

class PersonDocumentsResponse {
  final List<PersonDocumentsModel> data;
  String error;

  PersonDocumentsResponse({
    @required this.data,
  });

  PersonDocumentsResponse.fromJson(List response)
      : data =
            (response).map((i) => new PersonDocumentsModel.fromJson(i)).toList();

  PersonDocumentsResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
