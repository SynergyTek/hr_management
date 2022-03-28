import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/duplicate_workboard_body.dart';

class DuplicateWorkBoardScreen extends StatelessWidget {
  final String workBoardId;
  const DuplicateWorkBoardScreen({Key? key, required this.workBoardId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DuplicateWorkboardBody(workBoardId: workBoardId),
      appBar: AppBar(title: Text('Duplicate WorkBoard')),
    );
  }
}
