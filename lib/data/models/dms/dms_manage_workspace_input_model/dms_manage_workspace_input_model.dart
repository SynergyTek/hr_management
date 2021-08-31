import 'package:meta/meta.dart';

import 'package:hr_management/data/models/dms/dms_document_type_model/dms_document_type_model.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/parent_workspace_id_name_list_model/parent_workspace_id_name_list_model.dart';

class DMSManageWorkspaceInputModel {
  // DMSLegalEntityModel legalEntityModel;
  // DMSParentWorkspaceIdNameListModel parentWorkspaceModel;
  // String workspaceName;
  // List<DMSDocumentTypeModel> documentTypeModelList;
  // String sequenceOrder;

  String legalEntityModel;
  String parentWorkspaceModel;
  String workspaceName;
  List<String> documentTypeModelList;
  String sequenceOrder;

  DMSManageWorkspaceInputModel({
    @required this.legalEntityModel,
    @required this.parentWorkspaceModel,
    @required this.workspaceName,
    @required this.documentTypeModelList,
    @required this.sequenceOrder,
  });
}
