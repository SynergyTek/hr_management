import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";
import 'package:hr_management/data/models/dms/manage_new_folder_payload_model/manage_new_folder_payload_model.dart';
import 'package:hr_management/data/models/note/note_model.dart';
import "package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/manage_new_folder_bloc/manage_new_folder_bloc.dart";
import "package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart";

import "package:hr_management/ui/widgets/primary_button.dart";
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import "../../../../../themes/theme_config.dart";

class DMSNewFolderBodyWidget extends StatefulWidget {
  final String? parentId;
  final String? folderId;
  final String? folderName;

  DMSNewFolderBodyWidget({
    required this.parentId,
    this.folderId,
    this.folderName,
  });

  @override
  _DMSNewFolderBodyWidgetState createState() => _DMSNewFolderBodyWidgetState();
}

class _DMSNewFolderBodyWidgetState extends State<DMSNewFolderBodyWidget> {
  //
  TextEditingController _newFolderNameTextEditingController =
      TextEditingController();

  TextEditingController _sequenceOrderTextEditingController =
      TextEditingController();

  bool showProgressIndicator = false;

  @override
  void initState() {
    super.initState();
  }

  _handleQueryParams() {
    return ManageNewFolderPayloadModel(
      activeUserId:
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
      dataAction: widget.folderName != null && widget.folderName!.isNotEmpty
          ? "Edit"
          : "Create",
      noteSubject: _newFolderNameTextEditingController.text.toString() ,
      ownerUserId:
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
      parentNoteId: widget.parentId ?? "",
      sequenceOrder: _sequenceOrderTextEditingController.text.toString(),
      id: widget.folderId ?? "",
    ).toJson();
  }

  @override
  Widget build(BuildContext context) {
    // Use case: When editing an existing folder.
    if (widget.folderName != null && widget.folderName!.isNotEmpty) {
      return Container(
        padding: DEFAULT_PADDING,
        child: FutureBuilder<NoteModel>(
          future: dmsManageNewFolderBloc.getCreateFolder(
            queryparams: {
              "id": widget.folderId ?? "",
            },
          ),
          builder: (BuildContext context, AsyncSnapshot<NoteModel> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "An error occurred while fetching Workspace metadata."),
              );
            } else if (snapshot.hasData) {
              _handleEditFolder(
                dmsFolderMetadata: snapshot.data,
              );

              return _bodyWidget();
            }

            return Center(
              child: CustomProgressIndicator(
                loadingText: 'Fetching folder \nmetadata',
              ),
            );
          },
        ),
      );
    }

    // Use case: When creating a new folder.
    return Stack(
      children: [
        Container(
          padding: DEFAULT_PADDING,
          child: _bodyWidget(),
        ),
        Visibility(
          visible: showProgressIndicator,
          child: Center(
            child: CustomProgressIndicator(loadingText: 'Please Wait'),
          ),
        ),
      ],
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
    );
  }

  Widget _newFolderNameWidget() {
    return ListTile(
      minVerticalPadding: 8.0,
      title: Text("Folder Name"),
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
    required TextEditingController controller,
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
    if (_newFolderNameTextEditingController.text == null ||
        _newFolderNameTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("New Folder Name cannot be null or empty.")),
      );
      return;
    }

    if (_sequenceOrderTextEditingController.text == null ||
        _sequenceOrderTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sequence Order cannot be null or empty.")),
      );
      return;
    }
    setState(() {
      showProgressIndicator = true;
    });

    bool response = await dmsManageNewFolderBloc.postManageNewFolder(
      queryparams: _handleQueryParams(),
    );
    setState(() {
      showProgressIndicator = false;
    });

    String message = "Folder couldn't be created, please try again later.";
    if (response != null && response) {
      message = widget.folderName != null && widget.folderName!.isNotEmpty
          ? "Folder '${_newFolderNameTextEditingController.text}' edited successfully."
          : "Folder '${_newFolderNameTextEditingController.text}' created successfully.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    // if the folder has been created successfully, pop,
    // else do nothing
    if (response != null && response) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  }

  /// Cancel everything and
  _handleCancelOnPressed() {
    _newFolderNameTextEditingController.clear();
    _sequenceOrderTextEditingController.clear();

    Navigator.of(context).pop();
  }

  _handleEditFolder({
    required NoteModel? dmsFolderMetadata,
  }) {
    print(dmsFolderMetadata);

    if (dmsFolderMetadata == null) return;

    if (widget.folderName != null && widget.folderName!.isNotEmpty) {
      _newFolderNameTextEditingController.text = widget.folderName!;
    }

    if (dmsFolderMetadata.sequenceOrder != null &&
        dmsFolderMetadata.sequenceOrder.toString().isNotEmpty) {
      _sequenceOrderTextEditingController.text =
          dmsFolderMetadata.sequenceOrder.toString();
    }
  }
}
