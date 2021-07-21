import 'package:flutter/material.dart';
import 'widgets/note_home_body.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

class NoteHomeScreen extends StatelessWidget {
  final String mode;
  final String noteStatus;
  final String moduleId;
  const NoteHomeScreen({
    Key key,
    this.noteStatus,
    this.moduleId,
    this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Note Home",
      ),
      body: SafeArea(
        child: NoteHomeBody(
          mode: mode,
          noteStatus: noteStatus,
          moduleId: moduleId,
        ),
      ),
      // ),
    );
  }
}
