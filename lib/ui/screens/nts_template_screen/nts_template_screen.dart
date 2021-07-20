import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/logic/blocs/nts_template_bloc/nts_template_bloc.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widgets/nts_template_body_widget.dart';

class NTSTemplateScreen extends StatefulWidget {
  final NTSType ntsType;
  final String categoryCode;

  const NTSTemplateScreen({
    @required this.ntsType,
    @required this.categoryCode,
  });

  @override
  _NTSTemplateScreenState createState() => _NTSTemplateScreenState();
}

class _NTSTemplateScreenState extends State<NTSTemplateScreen> {
  @override
  void initState() {
    super.initState();

    ntsTemplateBloc.getData(
        ntsType: widget.ntsType, categoryCode: widget.categoryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: titleText(),
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: NTSTemplateBodyWidget(
            ntsType: widget.ntsType,
            stream: ntsTemplateBloc.subject.stream,
          ),
        ),
      ),
    );
  }

  String titleText() {
    String title;
    if (widget.categoryCode == 'Leave')
      title = 'Leave Request';
    else if (widget.categoryCode == 'STEP_TASK_CATEGORY')
      title = 'Task Request';
    else
      title = 'Service Request';
    return title;
  }
}
