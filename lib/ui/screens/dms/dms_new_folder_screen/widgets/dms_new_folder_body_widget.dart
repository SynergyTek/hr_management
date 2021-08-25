import 'package:flutter/material.dart';

import 'package:hr_management/ui/widgets/primary_button.dart';

import '../../../../../themes/theme_config.dart';

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

  _handleQueryParams() => null;

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

    // dmsNewFolderBloc
    //   ..postAPIData(
    //     queryparams: _handleQueryParams(),
    //   );

    // After everything is successful, pop.
    // _handleCancelOnPressed();
  }

  /// Cancel everything and
  _handleCancelOnPressed() {
    _newFolderNameTextEditingController.clear();
    _sequenceOrderTextEditingController.clear();

    Navigator.of(context).pop();
  }
}
