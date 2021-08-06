import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
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
