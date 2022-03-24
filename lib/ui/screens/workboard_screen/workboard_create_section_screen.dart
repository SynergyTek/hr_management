import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/users/workboard_create_section_body.dart';

class CreateSectionWorkBoardScreen extends StatelessWidget {
  const CreateSectionWorkBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CreateSectionWorkBoardBody(),
      appBar: AppBar(title: Text('Create Section')),
    );
  }
}
