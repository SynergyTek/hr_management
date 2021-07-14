import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/ui/screens/nts_comments/widget/nts_comments_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

class NTSCommentsScreen extends StatelessWidget {
  const NTSCommentsScreen({Key key, this.ntsType, this.ntsId})
      : super(key: key);
  final NTSType ntsType;
  final String ntsId;
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
