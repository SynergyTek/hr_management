import 'dart:convert';

import 'dms_source_folder_model.dart';

class DMSSourceFolderResponse {
  final DMSSourceFolderModel? data;
  // final List<DMSSourceFolderModel>? data;
  String? error;

  DMSSourceFolderResponse({
    required this.data,
  });

  DMSSourceFolderResponse.fromJson(Map<String, dynamic> response)
      // : data = List<DMSSourceFolderModel>.from(json["files"].map((x) => DMSSourceFolderModel.fromJson(x)));
      : data = DMSSourceFolderModel.fromJson(response);
  // files: List<Cwd>.from(json["files"].map((x) => Cwd.fromJson(x))),

  DMSSourceFolderResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
