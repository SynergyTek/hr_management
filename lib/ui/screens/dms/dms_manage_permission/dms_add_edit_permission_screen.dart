import 'package:flutter/material.dart';

import 'package:hr_management/ui/screens/dms/dms_manage_permission/widgets/dms_add_edit_permission_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

class DmsAddEditPermissionScreen extends StatelessWidget {
  final String noteId;
  const DmsAddEditPermissionScreen({
    @required this.noteId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Add Permission'),
      body: DmsAddEditPermissionBody(
        isCreatePermission: true,
        noteId: noteId,
      ),
    );
  }
}
