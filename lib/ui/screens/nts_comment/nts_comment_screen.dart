import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/ui/screens/nts_comment/nts_comment%20screen/nts_comment_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

class NTSCommentScreen extends StatelessWidget {
  NTSCommentScreen({Key key, this.ntsType, this.ntsId}) : super(key: key);
  final NTSType ntsType;
  final String ntsId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: drawerWidget(context),
        appBar: AppbarWidget(title: "Comments"),
        body: NTSCommentBody(
          ntsId: ntsId,
          ntsType: ntsType,
        ));
  }
}
