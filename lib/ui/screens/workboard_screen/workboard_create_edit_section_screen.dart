import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/workboard_create_section_body.dart';

class CreateEditSectionWorkBoardScreen extends StatelessWidget {
  final String sectionId;
  final String workboardId;
  final bool? isEdit;

  const CreateEditSectionWorkBoardScreen(
      {Key? key,
      required this.sectionId,
      required this.workboardId,
      this.isEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CreateEditSectionWorkBoardBody(
        isEdit: isEdit,
        sectionId: sectionId,
        workboardId: workboardId,
      ),
      appBar: AppBar(
        title: Text(
          (isEdit == true) ? 'Edit Section' : 'Create Section',
        ),
      ),
    );
  }
}
