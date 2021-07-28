import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../widgets/appbar_widget.dart';
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
    return Scaffold(
      appBar: AppbarWidget(
        title: noteId == null || noteId.isEmpty
            ? "Create " + templateCode
            : title != null
                ? "Edit $title"
                : "Edit",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: AddEditNoteBody(
            templateCode: templateCode,
            noteId: noteId,
          ),
        ),
      ),
      //   floatingActionButton: buildSpeedDial(),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        backgroundColor: Colors.blue[900],
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          SpeedDialChild(
            child:
                Icon(Icons.notifications_active_outlined, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => print('Pressed Read Later'),
            label: 'Notification',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: Icon(Icons.comment, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => print('Pressed Write'),
            label: 'Comment',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: Icon(Icons.share, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => print('Pressed Code'),
            label: 'Share',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: Icon(Icons.email, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => print('Pressed Code'),
            label: 'Email',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: Icon(Icons.attachment, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => print('Pressed Code'),
            label: 'Attachment',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: Icon(Icons.tag, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () => print('Pressed Code'),
            label: 'Tags',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
        ]);
  }
}
