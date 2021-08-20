import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/manage_uploaded_file_repository/manage_uploaded_file_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class ManageUploadedFileBloc {
  final ManageUploadedFileRepository _apiRepository =
      ManageUploadedFileRepository();

  final BehaviorSubject _subject = BehaviorSubject();

  postAPIData({
    @required NoteTemplateViewModel model,
  }) async {
    dynamic response = await _apiRepository.postAPIData(
      model: model,
    );

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final manageUploadedFileBloc = ManageUploadedFileBloc();
