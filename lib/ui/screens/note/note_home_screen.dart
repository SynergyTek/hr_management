import 'package:flutter/material.dart';

// import '../../../data/enums/enums.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import '../../../themes/light_theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'widgets/note_home_body.dart';
import 'package:synergy_nts/synergy_nts.dart';

class NoteHomeScreen extends StatelessWidget {
  final String? mode;
  final String? noteStatus;
  final String? moduleId;
  final bool? showBack;
  const NoteHomeScreen({
    Key? key,
    this.noteStatus,
    this.moduleId,
    this.mode,
    this.showBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showBack! ? null : DrawerWidget(),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          NTS_TEMPLATE_REQUEST,
          arguments: ScreenArguments(
            ntstype: NTSType.note,
            arg4: '',
          ),
        ),
      ),
    );
  }
}
