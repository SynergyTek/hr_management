import 'package:flutter/material.dart';
import '../../screens/workboard_screen/widgets/create_workboard_screen_body.dart';

class CreateWorkBoardScreen extends StatelessWidget {
  const CreateWorkBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CreateWorkBoardScreenBody(),
      appBar: AppBar(title: Text('Create WorkBoard')),
    );
  }
}
