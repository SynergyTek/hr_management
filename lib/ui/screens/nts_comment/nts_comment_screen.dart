import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

import 'nts_comment screen/nts_comments_body.dart';

class NTSCommentScreen extends StatelessWidget {
  NTSCommentScreen({Key key}) : super(key: key);
  // final NTSType ntsType;
  // final String ntsId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: drawerWidget(context),
        appBar: AppbarWidget(title: "Comments"),
        body: NTSCommentsBody(
          // ntsId: ntsId,
          // ntsType: ntsType,
        ));
  }
}
