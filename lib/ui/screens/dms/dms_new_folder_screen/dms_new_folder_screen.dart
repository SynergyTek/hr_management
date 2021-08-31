import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'widgets/dms_new_folder_body_widget.dart';

class DMSNewFolderScreen extends StatelessWidget {
  final String parentId;
  final String folderName;
  final String sequenceOrder;

  const DMSNewFolderScreen({
    @required this.parentId,
    this.folderName,
    this.sequenceOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: folderName == null || folderName.isEmpty
            ? "Create new folder"
            : 'Edit Folder',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSNewFolderBodyWidget(
            parentId: parentId,
            folderName: folderName,
            sequenceOrder: sequenceOrder,
          ),
        ),
      ),
    );
  }
}
