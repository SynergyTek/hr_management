import 'package:flutter/foundation.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';

class DMSFilesResponse {
  final DMSFilesModel? data;
  String? error;

  DMSFilesResponse({
    required this.data,
  });

  DMSFilesResponse.fromJson(Map<String, dynamic> response)
      : data = DMSFilesModel.fromJson(response);

  DMSFilesResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
