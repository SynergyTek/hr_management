import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/note/widgets/note_home_body.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

class NoteHomeScreen extends StatelessWidget {
  const NoteHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Note Home",
      ),
      body: SafeArea(
        // child: InternetConnectivityWidget(
        child: NoteHomeBody(),
      ),
      // ),
    );
  }
}
