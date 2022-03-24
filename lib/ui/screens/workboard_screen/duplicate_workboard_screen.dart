import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/duplicate_workboard_body.dart';

class DuplicateWorkBoardScreen extends StatelessWidget {
  const DuplicateWorkBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DuplicateWorkboardBody(),
      appBar: AppBar(title: Text('Duplicate WorkBoard')),
    );
  }
}
