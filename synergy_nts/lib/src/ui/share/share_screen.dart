import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import 'widgets/share_screen_body.dart';

class ShareScreen extends StatelessWidget {
  final NTSType? ntsType;
  final String? ntsId;

  const ShareScreen({Key? key, this.ntsType, this.ntsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: showBack ? null : DrawerWidget(),
      appBar: AppBar(
        title: const Text("Share Data"),
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
