import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/nts_comment/nts_comment%20screen/add_edit_comment_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

class AddEditCommentScreen extends StatefulWidget {
  AddEditCommentScreen({Key key}) : super(key: key);

  @override
  _AddEditCommentScreenState createState() => _AddEditCommentScreenState();
}

class _AddEditCommentScreenState extends State<AddEditCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerWidget(context),
        appBar: AppbarWidget(title: "Comments"),
        body: AddEditCommentBody());
  }
}
