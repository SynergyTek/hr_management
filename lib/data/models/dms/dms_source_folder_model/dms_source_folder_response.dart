import 'dms_source_folder_model.dart';

class DMSSourceFolderResponse {
  final List<DMSSourceFolderModel>? list;
  String? error;

  DMSSourceFolderResponse({
    required this.list,
  });

  // DMSSourceFolderResponse.fromJson(Map<String, dynamic> response)
  DMSSourceFolderResponse.fromJson(List response)
      : list = (response)
            .map((i) => new DMSSourceFolderModel.fromJson(i))
            .toList();
  // : data = DMSSourceFolderModel.fromJson(response);

  DMSSourceFolderResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
