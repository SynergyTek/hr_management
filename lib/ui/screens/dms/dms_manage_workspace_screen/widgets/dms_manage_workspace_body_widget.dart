import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/dms_document_type_model/dms_document_type_model.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/dms_manage_workspace_input_model/dms_manage_workspace_input_model.dart';
import 'package:hr_management/data/models/dms/parent_workspace_id_name_list_model/parent_workspace_id_name_list_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/document_template_id_name_list_by_user_bloc/document_template_id_name_list_by_user_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/manage_workspace_bloc/manage_workspace_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/parent_workspace_id_name_list_bloc/parent_workspace_id_name_list_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/widgets/dms_legal_entity_body_widget.dart';
import 'package:hr_management/ui/screens/dms/dms_parent_workspace_id_name_list_screen/widgets/dms_parent_workspace_id_name_list_body_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/multi_select_form_widget/multi_select_form_widget.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

import '../../../../../themes/theme_config.dart';

class DMSManageWorkspaceBodyWidget extends StatefulWidget {
  final DMSManageWorkspaceInputModel dmsManageWorkspaceInputModel;

  DMSManageWorkspaceBodyWidget({
    this.dmsManageWorkspaceInputModel,
  });

  @override
  _DMSManageWorkspaceBodyWidgetState createState() =>
      _DMSManageWorkspaceBodyWidgetState();
}

class _DMSManageWorkspaceBodyWidgetState
    extends State<DMSManageWorkspaceBodyWidget> {
  //
  DMSLegalEntityModel _selectedLegalEntityData;

  TextEditingController _workspaceNameTextEditingController =
      TextEditingController();

  TextEditingController _sequenceOrderTextEditingController =
      TextEditingController();

  @override
  void initState() {
     var queryparams = {
        "workspaceId": "f7c7d31e-bc19-49ee-8236-227a507382c5",
      };
    dmsManageWorkspaceBloc.getAPIData(queryparams: queryparams);
    super.initState();

    // If the input model is not null
    // that means the user is in the
    // * edit mode,
    // and the UI needs to pre-fill all the existing values.
    if (widget.dmsManageWorkspaceInputModel != null) {
      // _selectedLegalEntityData =
      //     widget.dmsManageWorkspaceInputModel.legalEntityModel;

      // dmsParentWorkspaceIdNameListBloc..getAPIData();
      // if (dmsParentWorkspaceIdNameListBloc.subject.stream.valueOrNull != null) {
      //   dmsParentWorkspaceIdNameListBloc.subject.stream.valueOrNull.data
      //       .forEach((element) {
      //     if (widget.dmsManageWorkspaceInputModel.parentWorkspaceModel ==
      //         element.id) {
      //       _selectedParentWorkspace = element;
      //     }

      //     print(_selectedParentWorkspace);
      //   });
      // }

      _selectedParentWorkspace = DMSParentWorkspaceIdNameListModel(
        id: widget.dmsManageWorkspaceInputModel.parentWorkspaceModel,
      );

      _workspaceNameTextEditingController.text =
          widget.dmsManageWorkspaceInputModel.workspaceName;

      // // TODO:
      // // _selectedDocumentTypeMap =
      // //     widget.dmsManageWorkspaceInputModel.documentTypeModelList;

      // _sequenceOrderTextEditingController.text =
      //     widget.dmsManageWorkspaceInputModel.sequenceOrder;
    }
  }

  _handleQueryParams() {
    return WorkspaceViewModel(
      activeUserId:
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? "",
      dataAction:
          widget.dmsManageWorkspaceInputModel != null ? "Edit" : "Create",
      documentTypeId: _getDocumentTypeIdList(),
      legalEntityId: _selectedLegalEntityData?.id ?? "",
      ownerUserId:
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? "",
      parentNoteId: _selectedParentWorkspace?.id ?? "",
      sequenceOrder: _sequenceOrderTextEditingController?.text ?? "",
      workspaceName:
          _workspaceNameTextEditingController?.text ?? "Default Workspace Name",
    ).toJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                _legalEntityWidget(),
                _parentWorkspaceWidget(),
                _workspaceNameWidget(),
                _documentTypeWidget(),
                _sequenceOrderWidget(),
              ],
            ),
          ),
          Container(
            // height: 96.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: PrimaryButton(
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.black87,
                    buttonText: "Cancel",
                    handleOnPressed: () => _handleCancelOnPressed(),
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    buttonText: "Save",
                    handleOnPressed: () => _handleSaveOnPressed(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _legalEntityWidget() {
    return ListTile(
      minVerticalPadding: 8.0,
      title: Text("Legal Entity"),
      trailing: Text(
        _selectedLegalEntityData?.name ?? "Select",
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Theme.of(context).textHeadingColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
      ),
      onTap: () => _handleLegalEntityOnTap(),
    );
  }

  void _handleLegalEntityOnTap() async {
    _selectedLegalEntityData = await showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: false,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SafeArea(
          child: InternetConnectivityWidget(
            child: DMSLegalEntityBodyWidget(
              modelName: _selectedLegalEntityData?.name ?? null,
            ),
          ),
        );
      },
    );

    setState(() {});
  }

  Widget _parentWorkspaceWidget() {
    return ListTile(
      minVerticalPadding: 8.0,
      title: Text("Parent Workspace"),
      trailing: Icon(
        Icons.chevron_right,
      ),
      subtitle: _selectedParentWorkspace?.name == null
          ? Container()
          : Text(_selectedParentWorkspace.name),
      onTap: () => _handleParentWorkspaceOnTap(),
    );
  }

  DMSParentWorkspaceIdNameListModel _selectedParentWorkspace =
      DMSParentWorkspaceIdNameListModel();
  void _handleParentWorkspaceOnTap() async {
    _selectedParentWorkspace = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Select Parent Workspace"),
            ),
            body: SafeArea(
              child: InternetConnectivityWidget(
                child: ParentWorkspaceIdNameListBodyWidget(
                  data: _selectedParentWorkspace,
                ),
              ),
            ),
          );
        },
      ),
    );

    setState(() {});
  }

  Widget _workspaceNameWidget() {
    return ListTile(
      minVerticalPadding: 8.0,
      title: Text("Workspace Name"),
      subtitle: _textField(
        controller: _workspaceNameTextEditingController,
      ),
    );
  }

  Widget _documentTypeWidget() {
    return ListTile(
      minVerticalPadding: 8.0,
      title: Text("Document Type"),
      trailing: _selectedDocumentTypeMap != null &&
              _selectedDocumentTypeMap.keys.length > 0
          ? CircleAvatar(
              backgroundColor: Theme.of(context).textHeadingColor,
              foregroundColor: Colors.white,
              child: Text(
                  _selectedDocumentTypeMap?.keys?.length.toString() ?? '-'),
            )
          : Icon(
              Icons.chevron_right,
            ),
      onTap: () => _handleDocumentTypeOnTap(),
    );
  }

  Map<String, DMSDocumentTypeModel> _selectedDocumentTypeMap;

  void _handleDocumentTypeOnTap() async {
    _selectedDocumentTypeMap = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Document Type"),
            ),
            body: MultiSelectFormWidget<DMSDocumentTypeModel>(
              initCallback: dmsDocumentTemplateIdNameListByUserBloc.getAPIData,
              stream: dmsDocumentTemplateIdNameListByUserBloc.subject.stream,
              titleKey: 'DisplayName',
              selectedDataMap: _selectedDocumentTypeMap,
            ),
          );
        },
      ),
    );

    setState(() {});
  }

  Widget _sequenceOrderWidget() {
    return ListTile(
      minVerticalPadding: 8.0,
      title: Text("Sequence Order"),
      subtitle: _textField(
        controller: _sequenceOrderTextEditingController,
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _textField({
    @required TextEditingController controller,
    bool obscureText = false,
    keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
    );
  }

  _handleSaveOnPressed() {
    if (_selectedLegalEntityData?.name == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Legal Entity cannot be null or empty.")),
      );
      return;
    }

    if (_selectedParentWorkspace?.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Parent Workspace cannot be null or empty.")),
      );
      return;
    }

    if (_workspaceNameTextEditingController?.text == null ||
        _workspaceNameTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Workspace Name cannot be null or empty.")),
      );
      return;
    }

    if (_selectedDocumentTypeMap == null ||
        _selectedDocumentTypeMap.keys.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Document type cannot be null or empty.")),
      );
      return;
    }

    if (_sequenceOrderTextEditingController?.text == null ||
        _sequenceOrderTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sequence Order cannot be null or empty.")),
      );
      return;
    }

    dmsManageWorkspaceBloc
      ..postAPIData(
        queryparams: _handleQueryParams(),
      );

    String message = "Workspace couldn't be created, try again later.";

    if (dmsManageWorkspaceBloc.subject.stream.valueOrNull != null) {
      if (dmsManageWorkspaceBloc.subject.stream.valueOrNull['success'] ==
          true) {
        message =
            "Workspace '${_workspaceNameTextEditingController.text}' created successfully.";
      } else if (dmsManageWorkspaceBloc.subject.stream.valueOrNull['error'] !=
              null ||
          dmsManageWorkspaceBloc.subject.stream.valueOrNull['error'] != '') {
        message = dmsManageWorkspaceBloc.subject.stream.valueOrNull['error'];
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    // if the folder has been created successfully, pop,
    // else do nothing
    if (dmsManageWorkspaceBloc.subject.stream.valueOrNull != null &&
        dmsManageWorkspaceBloc.subject.stream.valueOrNull['success'] == true)
      Navigator.of(context).pop();
  }

  /// Cancel everything and
  _handleCancelOnPressed() {
    _selectedLegalEntityData = null;
    _workspaceNameTextEditingController.clear();
    _selectedDocumentTypeMap = null;
    _sequenceOrderTextEditingController.clear();

    Navigator.of(context).pop();
  }

  // Helper function to handle all document type list for queryparams.
  List<String> _getDocumentTypeIdList() {
    if (_selectedDocumentTypeMap == null ||
        _selectedDocumentTypeMap.values.isEmpty) return [];

    List<String> _list = [];

    _selectedDocumentTypeMap.values.forEach((element) {
      _list.add(element.id);
    });

    return _list;
  }
}
