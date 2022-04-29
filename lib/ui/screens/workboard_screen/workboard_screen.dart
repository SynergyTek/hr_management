import 'package:flutter/material.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/workboard_screen_body_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

import '../../../themes/light_theme.dart';

class WorkBoardScreen extends StatelessWidget {
  const WorkBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, CREATE_WORKBOARD_SCREEN,
              arguments: ScreenArguments(val1: false));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppbarWidget(
        title: "Workboard",
      ),
      drawer: DrawerWidget(),
      body: WorkBoardScreenBodyWidget(),
    );
  }
}
