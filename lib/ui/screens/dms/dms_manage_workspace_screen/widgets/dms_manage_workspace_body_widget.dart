import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/dms_document_type_model/dms_document_type_model.dart';
import 'package:hr_management/data/models/dms/dms_document_type_model/dms_document_type_response.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_response.dart';
import 'package:hr_management/data/models/dms/parent_workspace_id_name_list_model/parent_workspace_id_name_list_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_legal_entity_bloc/dms_legal_entity_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/document_template_id_name_list_by_user_bloc/document_template_id_name_list_by_user_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/manage_workspace_bloc/manage_workspace_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/widgets/dms_legal_entity_body_widget.dart';
import 'package:hr_management/ui/screens/dms/dms_parent_workspace_id_name_list_screen/widgets/dms_parent_workspace_id_name_list_body_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/multi_select_form_widget/multi_select_form_widget.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../../themes/theme_config.dart';

class DMSManageWorkspaceBodyWidget extends StatefulWidget {
  final String parentWorkspaceId;

  DMSManageWorkspaceBodyWidget({
    this.parentWorkspaceId,
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

  String _workspaceId = "";

  @override
  void initState() {
    super.initState();
  }

  _handleQueryParams() {
    // Use case: Creating a new workspace.
    return WorkspaceViewModel(
      activeUserId:
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? "",
      dataAction: widget.parentWorkspaceId != null ? "Edit" : "Create",
      documentTypeId: _getDocumentTypeIdList(),
      legalEntityId: _selectedLegalEntityData?.id ?? "",
      ownerUserId:
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? "",
      // ! TODO: no data found for parent workspace in the metadata API while editing in use case.
      parentNoteId: _selectedParentWorkspace?.id ?? "",
      sequenceOrder: _sequenceOrderTextEditingController?.text ?? "",
      workspaceName:
          _workspaceNameTextEditingController?.text ?? "Default Workspace Name",

      id: _workspaceId ?? "",
    ).toJson();
  }

  @override
  Widget build(BuildContext context) {
    // Use case: When editing a new workspace
    if (widget?.parentWorkspaceId != null)
      return Container(
        padding: DEFAULT_PADDING,
        child: FutureBuilder(
          future: dmsLegalEntityBloc.getAPIData(),
          builder: (BuildContext context,
              AsyncSnapshot<DMSLegalEntityResponse> legalEntitySnapshot) {
            if (legalEntitySnapshot.hasError) {
              return Center(
                child: Text(
                    "An error occured while fetching Legal Entity metadata."),
              );
            } else if (legalEntitySnapshot.hasData) {
              return FutureBuilder(
                future: dmsDocumentTemplateIdNameListByUserBloc.getAPIData(),
                builder: (BuildContext context,
                    AsyncSnapshot<DMSDocumentTypeResponse>
                        documentTypeSnapshot) {
                  if (documentTypeSnapshot.hasError) {
                    return Center(
                      child: Text(
                          "An error occured while fetching Document Type metadata."),
                    );
                  } else if (documentTypeSnapshot.hasData) {
                    return FutureBuilder(
                      future: dmsManageWorkspaceBloc.getAPIData(
                        queryparams: {
                          "workspaceId": widget.parentWorkspaceId ?? "",
                        },
                      ),
                      builder: (BuildContext context,
                          AsyncSnapshot<WorkspaceViewModel>
                              workspaceViewSnapshot) {
                        if (workspaceViewSnapshot.hasError) {
                          return Center(
                            child: Text(
                                "An error occured while fetching Workspace metadata."),
                          );
                        } else if (workspaceViewSnapshot.hasData) {
                          _handleEditWorkspace(
                            dmsLegalEntityMetadata:
                                legalEntitySnapshot?.data?.data ?? [],
                            dmsDocumentTypeMetadata:
                                documentTypeSnapshot?.data?.data ?? [],
                            dmsWorkspaceMetadata: workspaceViewSnapshot.data,
                          );

                          return _bodyWidget();
                        }

                        return Center(
                          child: CustomProgressIndicator(
                            loadingText: 'Fetching workspace \nmetadata',
                          ),
                        );
                      },
                    );
                  }

                  return Center(
                    child: CustomProgressIndicator(
                      loadingText: 'Fetching document type \nmetadata',
                    ),
                  );
                },
              );
            }

            return Center(
              child: CustomProgressIndicator(
                loadingText: 'Fetching legal entity \nmetadata',
              ),
            );
          },
        ),
      );

    // Use case: When creating a new workspace
    return Container(
      padding: DEFAULT_PADDING,
      child: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Column(
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
              modelId: _selectedLegalEntityData?.name ?? null,
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
      subtitle: _handleDocumentTypeChips(),
      trailing: _selectedDocumentTypeMap != null &&
              _selectedDocumentTypeMap.keys.length > 0
          ? CircleAvatar(
              backgroundColor: Theme.of(context).textHeadingColor,
              foregroundColor: Colors.white,
              child: Text(
                _selectedDocumentTypeMap?.keys?.length.toString() ?? '-',
              ),
            )
          : Icon(
              Icons.chevron_right,
            ),
      onTap: () => _handleDocumentTypeOnTap(),
    );
  }

  Widget _handleDocumentTypeChips() {
    // Guard clause
    if (_selectedDocumentTypeMap == null ||
        _selectedDocumentTypeMap.keys.length == 0) {
      return Container();
    }

    // List<Widget> _selectedDocumentChipList = [];
    // _selectedDocumentTypeMap.keys.forEach((element) {});

    return Container(
      height: 48.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          _selectedDocumentTypeMap.keys.length,
          (index) => Container(
            padding: const EdgeInsets.only(right: 4.0),
            child: Chip(
              // backgroundColor: Theme.of(context).textHeadingColor,
              label: Text(
                _selectedDocumentTypeMap.keys.elementAt(index) ?? "",
                style: TextStyle(
                  fontSize: 12,
                  // color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, DMSDocumentTypeModel> _selectedDocumentTypeMap = Map();

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

  _handleSaveOnPressed() async {
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

    var response = await dmsManageWorkspaceBloc.postAPIData(
      queryparams: _handleQueryParams(),
    );

    String message = "Workspace couldn't be created, try again later.";

    if (response != null) {
      if (response['success'] == true) {
        message =
            "Workspace '${_workspaceNameTextEditingController.text}' created successfully.";
      } else if (response['error'] != null || response['error'] != '') {
        message = response['error'];
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    // if the folder has been created successfully, pop,
    // else do nothing
    if (response != null && response['success'] == true) {
      Navigator.of(context).pop();
    }
  }

  /// Cancel everything and
  _handleCancelOnPressed() {
    _selectedLegalEntityData = null;
    _selectedParentWorkspace = null;
    _workspaceNameTextEditingController.clear();
    _selectedDocumentTypeMap = null;
    _sequenceOrderTextEditingController.clear();

    Navigator.of(context).pop();
  }

  /// Helper function to handle all document type list for queryparams.
  List<String> _getDocumentTypeIdList() {
    if (_selectedDocumentTypeMap == null ||
        _selectedDocumentTypeMap.values.isEmpty) return [];

    List<String> _list = [];

    _selectedDocumentTypeMap.values.forEach((element) {
      _list.add(element.id);
    });

    return _list;
  }

  /// If the input model is not null
  /// that means the user is in the
  /// * edit mode,
  /// and the UI needs to pre-fill all the existing values.
  void _handleEditWorkspace({
    List<DMSLegalEntityModel> dmsLegalEntityMetadata,
    List<DMSDocumentTypeModel> dmsDocumentTypeMetadata,
    WorkspaceViewModel dmsWorkspaceMetadata,
  }) {
    if (widget.parentWorkspaceId != null) {
      if (dmsWorkspaceMetadata != null) {
        //
        // Legal entity
        if (dmsLegalEntityMetadata != null) {
          dmsLegalEntityMetadata.forEach((element) {
            if (element.id == dmsWorkspaceMetadata?.legalEntityId) {
              _selectedLegalEntityData = element;
            }
          });
        }

        // ! Selected parent workspace data is not available.
        // Parent Workspace
        // _selectedParentWorkspace = DMSParentWorkspaceIdNameListModel(
        //   id: widget.parentWorkspaceId,
        // );

        // Document Type:
        if (dmsDocumentTypeMetadata != null &&
            dmsWorkspaceMetadata?.documentTypeId != null &&
            dmsWorkspaceMetadata.documentTypeId.isNotEmpty) {
          dmsDocumentTypeMetadata.forEach((element) {
            dmsWorkspaceMetadata.documentTypeId
                .forEach((eachMetadataDocumentId) {
              if (element.id == eachMetadataDocumentId) {
                _selectedDocumentTypeMap[element.displayName] = element;
              }
            });
          });
        }

        // Workspace name:
        _workspaceNameTextEditingController.text =
            dmsWorkspaceMetadata?.workspaceName ?? "";

        // Sequence Order:
        _sequenceOrderTextEditingController.text =
            dmsWorkspaceMetadata?.sequenceOrder ?? "";

        _workspaceId = dmsWorkspaceMetadata?.id ?? "";
      }
    }
  }
}
