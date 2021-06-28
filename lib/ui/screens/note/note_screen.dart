import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

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
