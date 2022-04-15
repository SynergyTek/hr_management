import 'package:hr_management/data/models/dms/dms_source_folder_model/dms_source_folder_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_source_folders_repository/dms_source_folders_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSSourceFolderBloc {
  final DMSSourceFolderRepository _apiRepository = DMSSourceFolderRepository();

  final BehaviorSubject<DMSSourceFolderResponse?> _subject =
      BehaviorSubject<DMSSourceFolderResponse?>();

  Future<DMSSourceFolderResponse> getDMSSourceFolderData({
    Map<String, dynamic>? queryparams,
  }) async {
    DMSSourceFolderResponse response =
        await _apiRepository.getDMSSourceFolderData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);

    return response;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DMSSourceFolderResponse?> get subject => _subject;
}

final dmsSourceFolderBloc = DMSSourceFolderBloc();
