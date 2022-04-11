import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/workboard_content_screen_body_widget.dart';

class WorkBoardContentScreen extends StatelessWidget {
  const WorkBoardContentScreen({
    Key? key,
    required this.id,
    required this.workBoardId,
    required this.workBoardSectionId,
    required this.parentId,
    this.itemType,
    required this.isEdit,
  }) : super(key: key);
  final String id;
  final String workBoardId;
  final String workBoardSectionId;
  final String parentId;
  final int? itemType;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WorkBoard Content'),
        ),
        body: WorkBoardContentScreenBodyWidget(
          isEdit: isEdit,
          id: id,
          parentId: parentId,
          workBoardId: workBoardId,
          workBoardSectionId: workBoardSectionId,
          itemType: itemType,
        ));
  }
}
