import 'package:flutter/material.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widgets/add_edit_note_body.dart';

class AddEditNote extends StatelessWidget {
  final String templateCode;
  final String noteId;
  final String title;

  const AddEditNote({
    Key key,
    this.templateCode,
    this.noteId,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
     
      child: SafeArea(
        child: InternetConnectivityWidget(
          child: AddEditNoteBody(
            templateCode: templateCode,
            noteId: noteId,
            title: title,
          ),
        ),
      ),
   
    );
  }

}
