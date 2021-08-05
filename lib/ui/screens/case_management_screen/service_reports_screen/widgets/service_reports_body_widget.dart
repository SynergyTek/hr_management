import 'package:flutter/material.dart';

import '../../../../../themes/theme_config.dart';

class CaseManagementServiceReportsBodyWidget extends StatefulWidget {
  CaseManagementServiceReportsBodyWidget();

  @override
  _CaseManagementServiceReportsBodyWidgetState createState() =>
      _CaseManagementServiceReportsBodyWidgetState();
}

class _CaseManagementServiceReportsBodyWidgetState
    extends State<CaseManagementServiceReportsBodyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Container();
  }
}
