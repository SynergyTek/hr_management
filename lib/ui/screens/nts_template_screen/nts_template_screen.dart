import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/logic/blocs/leave_temp_bloc/leave_temp_api_bloc.dart';
import 'package:hr_management/logic/blocs/nts_template_bloc/nts_template_bloc.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import 'widgets/nts_template_body_widget.dart';

class NTSTemplateScreen extends StatefulWidget {
  final NTSType ntsType;

  const NTSTemplateScreen({
    @required this.ntsType,
  });

  @override
  _NTSTemplateScreenState createState() => _NTSTemplateScreenState();
}

class _NTSTemplateScreenState extends State<NTSTemplateScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.ntsType == NTSType.service)
      leaveTempBloc.getAllowedTemplateData();
    else if (widget.ntsType == NTSType.task)
      ntsTemplateBloc.getData();
    else {
      // TODO: for the NTSType.note type
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: (widget.ntsType == NTSType.service)
            ? "Leave Request"
            : "Task Request",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: NTSTemplateBodyWidget(
            ntsType: widget.ntsType,
            stream: (widget.ntsType == NTSType.service)
                ? leaveTempBloc.subject.stream
                : ntsTemplateBloc.subject.stream,
          ),
        ),
      ),
    );
  }
}
