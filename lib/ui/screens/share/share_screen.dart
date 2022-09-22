import 'package:flutter/material.dart';

// import '../../../data/enums/enums.dart';
import '../../widgets/appbar_widget.dart';
import 'widgets/share_screen_body.dart';
import 'package:synergy_nts/synergy_nts.dart';

class ShareScreen extends StatelessWidget {
  final NTSType? ntsType;
  final String? ntsId;

  const ShareScreen({Key? key, this.ntsType, this.ntsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: showBack ? null : DrawerWidget(),
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
