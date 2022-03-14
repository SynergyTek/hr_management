import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/workboard_task_list_body.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

class WorkBoardTaskListScreen extends StatelessWidget {
  const WorkBoardTaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Workboard Task List'),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: WorkboardTaskListBody(),
        ),
      ),
    );
  }
}
