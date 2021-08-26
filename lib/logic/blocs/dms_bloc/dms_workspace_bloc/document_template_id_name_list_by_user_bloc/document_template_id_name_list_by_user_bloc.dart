import 'package:hr_management/data/models/dms/dms_document_type_model/dms_document_type_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_workspace_repository/document_template_id_name_list_by_user_repository/document_template_id_name_list_by_user_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSDocumentTemplateIdNameListByUserBloc {
  final DocumentTemplateIdNameListByUserRepository _apiRepository =
      DocumentTemplateIdNameListByUserRepository();

  final BehaviorSubject<DMSDocumentTypeResponse> _subject =
      BehaviorSubject<DMSDocumentTypeResponse>();

  getAPIData() async {
    DMSDocumentTypeResponse response = await _apiRepository.getAPIData();

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DMSDocumentTypeResponse> get subject => _subject;
}

final dmsDocumentTemplateIdNameListByUserBloc =
    DMSDocumentTemplateIdNameListByUserBloc();
