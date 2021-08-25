import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/manage_workspace_bloc/manage_workspace_bloc.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/widgets/dms_legal_entity_body_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';

import '../../../../../themes/theme_config.dart';

class DMSManageWorkspaceBodyWidget extends StatefulWidget {
  DMSManageWorkspaceBodyWidget();

  @override
  _DMSManageWorkspaceBodyWidgetState createState() =>
      _DMSManageWorkspaceBodyWidgetState();
}

class _DMSManageWorkspaceBodyWidgetState
    extends State<DMSManageWorkspaceBodyWidget> {
  //
  DMSLegalEntityModel _selectedLegalEntityData;

  //
  int _selectedDocumentTypeIndex;

  TextEditingController _workspaceNameTextEditingController =
      TextEditingController();

  TextEditingController _sequenceOrderTextEditingController =
      TextEditingController();

  List<String> _documentTypeList = [
    'General Document',
    'Engineering sub-contract',
    'Vendor Documents',
    'Request for Inspection Halul',
    'Request for Inspection',
    'Project Documents',
  ];

  @override
  void initState() {
    super.initState();
  }

  _handleQueryParams() {
    return WorkspaceViewModel(
      // legalEntityName: null,
      // TODO
      parentNoteId: 'f7c7d31e-bc19-49ee-8236-227a507382c5',
      // createdbyName: null,
      workspaceName: _workspaceNameTextEditingController?.text ?? "-",
      // parentName: null,
      // noteSubject: null,
      sequenceOrder: _sequenceOrderTextEditingController.text ?? '',
      legalEntityId: _selectedLegalEntityData?.id ?? "",
      // createdBy: null,
      // TODO
      documentTypeId: '6b2ccd42-a79a-4dff-b800-4bbc5a9a744f',
      // workspaceId: null,
      // noteId: null,
      // documentTypeIds: null,
      // documentTypeNoteId: null,
      // id: null,
      // type: null,
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
                // _parentWorkspaceWidget(),
                _workspaceNameWidget(),
                _documentTypeWidget(),
                _sequenceOrderWidget(),
              ],
            ),
          ),
          Container(
            height: 96.0,
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
      subtitle: Container(
        padding: DEFAULT_VERTICAL_PADDING,
        child: Placeholder(
          fallbackHeight: 48.0,
        ),
      ),
    );
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
      trailing: Text(
        _selectedDocumentTypeIndex == null
            ? "Select"
            : _documentTypeList?.elementAt(_selectedDocumentTypeIndex),
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Theme.of(context).textHeadingColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
      ),
      onTap: () => _handleDocumentTypeOnTap(),
    );
  }

  void _handleDocumentTypeOnTap() async {
    _selectedLegalEntityData = await showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: false,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  16.0,
                ),
                topRight: Radius.circular(
                  16.0,
                ),
              ),
            ),
            padding: DEFAULT_PADDING,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _documentTypeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: (_selectedDocumentTypeIndex != null &&
                            _selectedDocumentTypeIndex == index)
                        ? Icon(
                            Icons.check,
                            color: Theme.of(context).textHeadingColor,
                            size: 24.0,
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                    title: Text(
                      _documentTypeList.elementAt(index),
                      style: TextStyle(
                        color: Theme.of(context).textHeadingColor,
                      ),
                    ),
                    onTap: () => _handleListTileOnTap(
                      index,
                    ),
                  );
                }),
          ),
        );
      },
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
    return Container(
      padding: DEFAULT_VERTICAL_PADDING,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white70,
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  _handleListTileOnTap(int index) {
    setState(() {
      _selectedDocumentTypeIndex = index;
    });

    Navigator.of(context).pop();
  }

  _handleSaveOnPressed() {
    // print(_selectedLegalEntityData?.name);
    // print(_workspaceNameTextEditingController.text);
    // print(_documentTypeList.elementAt(_selectedDocumentTypeIndex));
    // print(_sequenceOrderTextEditingController.text);

    if (_selectedLegalEntityData?.name == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Legal Entity cannot be null or empty.")),
      );
      return;
    }

    if (_workspaceNameTextEditingController?.text == null ||
        _workspaceNameTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Legal Entity cannot be null or empty.")),
      );
      return;
    }

    if (_selectedDocumentTypeIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Legal Entity cannot be null or empty.")),
      );
      return;
    }

    if (_sequenceOrderTextEditingController?.text == null ||
        _sequenceOrderTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Legal Entity cannot be null or empty.")),
      );
      return;
    }

    dmsManageWorkspaceBloc
      ..postAPIData(
        queryparams: _handleQueryParams(),
      );

    // After everything is successful, pop.
    // _handleCancelOnPressed();
  }

  /// Cancel everything and
  _handleCancelOnPressed() {
    _selectedLegalEntityData = null;
    _workspaceNameTextEditingController.clear();
    _selectedDocumentTypeIndex = null;
    _sequenceOrderTextEditingController.clear();

    Navigator.of(context).pop();
  }
}
