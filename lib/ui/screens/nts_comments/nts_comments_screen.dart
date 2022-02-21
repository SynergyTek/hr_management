import 'package:flutter/material.dart';

import '../../../data/enums/enums.dart';
import '../../widgets/appbar_widget.dart';
import 'widget/nts_comments_body.dart';

class NTSCommentsScreen extends StatelessWidget {
  const NTSCommentsScreen({Key? key, this.ntsType, this.ntsId})
      : super(key: key);
  final NTSType? ntsType;
  final String? ntsId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Comments',),
      body: SafeArea(
          child: NTSCommentsBody(
        ntsId: ntsId,
        ntsType: ntsType,
      )),
    );
  }
}
