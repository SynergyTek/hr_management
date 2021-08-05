import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import '../../widgets/appbar_widget.dart';
import 'widgets/share_screen_body.dart';

class ShareScreen extends StatelessWidget {
  final NTSType ntsType;
  final String ntsId;

  const ShareScreen({Key key, this.ntsType, this.ntsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: showBack ? null : drawerWidget(context),
      appBar: AppbarWidget(
        title: "Share Data",
      ),
      body: SafeArea(
        child: ShareScreenBody(
          ntsType: ntsType,
          ntsId: ntsId,
        ),
      ),
    );
  }
}
