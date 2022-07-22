import 'package:flutter/material.dart';

import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

import 'widgets/dms_move_workbook_body.dart';

class DMSMoveWorkbookScreen extends StatelessWidget {
  final String noteId;
  const DMSMoveWorkbookScreen({
    required this.noteId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Move Item',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSMoveWorkbookBodyWidget(
            noteId: noteId,
          ),
        ),
      ),
    );
  }
}
