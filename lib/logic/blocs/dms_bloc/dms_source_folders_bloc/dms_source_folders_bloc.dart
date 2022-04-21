import 'package:hr_management/data/models/dms/dms_source_folder_model/dms_source_folder_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_source_folders_repository/dms_source_folders_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSSourceFolderBloc {
  final DMSSourceFolderRepository _apiRepository = DMSSourceFolderRepository();

  final BehaviorSubject<DMSSourceFolderResponse?> _subject =
      BehaviorSubject<DMSSourceFolderResponse?>();

  final BehaviorSubject<DMSSourceFolderResponse?> _subjectChildData =
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

  Future<DMSSourceFolderResponse> getDMSChildFolderData({
    Map<String, dynamic>? queryparams,
  }) async {
    DMSSourceFolderResponse response =
        await _apiRepository.getDMSChildFolderData(
      queryparams: queryparams,
    );

    _subjectChildData.sink.add(response);

    return response;
  }

  Future<DMSSourceFolderResponse> getDMSChildFolderAndDocumentsData({
    Map<String, dynamic>? queryparams,
  }) async {
    DMSSourceFolderResponse response =
        await _apiRepository.getDMSChildFolderAndDocumentsData(
      queryparams: queryparams,
    );

    _subjectChildData.sink.add(response);

    return response;
  }

  dispose() {
    _subject.close();
    _subjectChildData.close();
  }

  BehaviorSubject<DMSSourceFolderResponse?> get subject => _subject;
  BehaviorSubject<DMSSourceFolderResponse?> get subjectChildData => _subjectChildData;
}

final dmsSourceFolderBloc = DMSSourceFolderBloc();
