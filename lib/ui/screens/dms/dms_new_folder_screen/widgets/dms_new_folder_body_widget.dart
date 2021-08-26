import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";
import 'package:hr_management/data/models/dms/manage_new_folder_payload_model/manage_new_folder_payload_model.dart';
import "package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/manage_new_folder_bloc/manage_new_folder_bloc.dart";
import "package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart";

import "package:hr_management/ui/widgets/primary_button.dart";

import "../../../../../themes/theme_config.dart";

class DMSNewFolderBodyWidget extends StatefulWidget {
  DMSNewFolderBodyWidget();

  @override
  _DMSNewFolderBodyWidgetState createState() => _DMSNewFolderBodyWidgetState();
}

class _DMSNewFolderBodyWidgetState extends State<DMSNewFolderBodyWidget> {
  //
  TextEditingController _newFolderNameTextEditingController =
      TextEditingController();

  TextEditingController _sequenceOrderTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _handleQueryParams() {
    return ManageNewFolderPayloadModel(
      activeUserId:
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? "",
      dataAction: "Create",
      noteSubject: _newFolderNameTextEditingController?.text.toString() ?? "",
      ownerUserId:
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? "",
      parentNoteId: "f7c7d31e-bc19-49ee-8236-227a507382c5",
      sequenceOrder: _sequenceOrderTextEditingController?.text.toString() ?? "",
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
                _newFolderNameWidget(),
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

  Widget _newFolderNameWidget() {
    return ListTile(
      minVerticalPadding: 8.0,
      title: Text("New Folder Name"),
      subtitle: _textField(
        controller: _newFolderNameTextEditingController,
      ),
    );
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
    if (_newFolderNameTextEditingController?.text == null ||
        _newFolderNameTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("New Folder Name cannot be null or empty.")),
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

    dmsManageNewFolderBloc
      ..postAPIData(
        queryparams: _handleQueryParams(),
      );

    String message = "Folder couldn't be created, pl try again later.";
    if (dmsManageNewFolderBloc.subject.stream.valueOrNull) {
      message =
          "Folder '${_newFolderNameTextEditingController.text}' created successfully.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    // if the folder has been created successfully, pop,
    // else do nothing
    if (dmsManageNewFolderBloc.subject.stream.valueOrNull)
      Navigator.of(context).pop();
  }

  /// Cancel everything and
  _handleCancelOnPressed() {
    _newFolderNameTextEditingController.clear();
    _sequenceOrderTextEditingController.clear();

    Navigator.of(context).pop();
  }
}
