import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/document_template_id_name_list_by_user_repository/document_template_id_name_list_by_user_repository.dart';
import 'package:rxdart/rxdart.dart';

class DocumentTemplateIdNameListByUserBloc {
  final DocumentTemplateIdNameListByUserRepository _apiRepository =
      DocumentTemplateIdNameListByUserRepository();

  final BehaviorSubject _subject = BehaviorSubject();

  getAPIData() async {
    dynamic response = await _apiRepository.getAPIData();

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final documentTemplateIdNameListByUserBloc =
    DocumentTemplateIdNameListByUserBloc();
