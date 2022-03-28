import 'package:flutter/material.dart';

import 'widget/adhoc_task_list_body.dart';

class AdhocTaskListScreen extends StatelessWidget {
  final String userId;
  const AdhocTaskListScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adhoc Task List'),
      ),
      body: SafeArea(
        child: AdhocTaskListBody(userId: userId,),
      ),
    );
  }
}
