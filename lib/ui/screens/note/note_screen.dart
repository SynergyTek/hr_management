import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import 'widgets/note_screen_body_widget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen();
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Notes",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: NoteScreenBodyWidget(),
        ),
      ),
    );
  }
}
