import 'package:flutter/material.dart';
import '../../screens/workboard_screen/widgets/create_workboard_screen_body.dart';

class CreateWorkBoardScreen extends StatelessWidget {
  final bool? isEdit;
  final String? workBoardId;

  const CreateWorkBoardScreen({
    Key? key,
    this.isEdit,
    this.workBoardId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CreateWorkBoardScreenBody(
        isEdit: isEdit,
        workBoardId: workBoardId,
      ),
      appBar: AppBar(
          title:
              Text((isEdit == true) ? 'Edit WorkBoard' : 'Create WorkBoard')),
    );
  }
}
