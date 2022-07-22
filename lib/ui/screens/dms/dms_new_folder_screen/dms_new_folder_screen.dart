import 'package:flutter/material.dart';

import '../../../widgets/appbar_widget.dart';
import '../../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import 'widgets/dms_new_folder_body_widget.dart';

class DMSNewFolderScreen extends StatelessWidget {
  final String? parentId;
  final String? folderId;
  final String? folderName;

  const DMSNewFolderScreen({
    required this.parentId,
    this.folderId,
    this.folderName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: folderName == null || folderName!.isEmpty
            ? "Create new folder"
            : 'Edit Folder',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSNewFolderBodyWidget(
            parentId: parentId,
            folderId: folderId,
            folderName: folderName,
          ),
        ),
      ),
    );
  }
}
