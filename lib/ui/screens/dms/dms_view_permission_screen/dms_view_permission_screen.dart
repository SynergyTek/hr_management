import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/dms/dms_view_permission_screen/widgets/dms_view_permission_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class DMSViewPermissionScreen extends StatelessWidget {
  final String parentId;

  const DMSViewPermissionScreen({Key key, this.parentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'View Permission',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          // child: Container(),
          child: DMSViewPermissionBody(
            parentId: parentId,
          ),
        ),
      ),
    );
  }
}
