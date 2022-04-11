import 'package:flutter/material.dart';
import 'widgets/create_edit_workboard_screen_body.dart';

class CreateEditWorkBoardScreen extends StatelessWidget {
  final bool isEdit;
  final String? workBoardId;

  const CreateEditWorkBoardScreen({
    Key? key,
    required this.isEdit,
    this.workBoardId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CreateEditWorkBoardScreenBody(
        isEdit: isEdit,
        workBoardId: workBoardId,
      ),
      appBar: AppBar(
        title: Text(
          (isEdit == true) ? 'Edit WorkBoard' : 'Create WorkBoard',
        ),
      ),
    );
  }
}
