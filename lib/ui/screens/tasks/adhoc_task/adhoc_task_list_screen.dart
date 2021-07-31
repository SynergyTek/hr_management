import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import 'widget/adhoc_task_list_body.dart';

class AdhocTaskListScreen extends StatelessWidget {
  const AdhocTaskListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Adhoc Task List'),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: AdhocTaskListBody(),
        ),
      ),
    );
  }
}
