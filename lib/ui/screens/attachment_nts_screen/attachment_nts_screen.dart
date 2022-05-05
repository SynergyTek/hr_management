import 'package:flutter/material.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import '../../../data/enums/enums.dart';
import '../../../themes/light_theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widgets/attachment_nts_body_widget.dart';

class AttachmentNTSScreen extends StatelessWidget {
  final NTSType? ntsType;
  final String? ntsId;

  const AttachmentNTSScreen({
    required this.ntsType,
    required this.ntsId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Attachments",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: AttachmentNTSBodyWidget(
            ntsType: ntsType,
            ntsId: ntsId,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(
          Icons.attach_file,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            NTS_ATTACHMENT,
            arguments: ScreenArguments(
                arg1: ntsId,
                ntstype: ntsType,
                callBack: (dynamic value, dynamic value2, dynamic value3) {}),
          );
        },
      ),
    );
  }
}
