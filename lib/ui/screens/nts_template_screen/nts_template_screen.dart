import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../data/enums/enums.dart';
import '../../../logic/blocs/nts_template_bloc/nts_template_bloc.dart';
import '../../widgets/appbar_widget.dart';
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
    ntsTemplateBloc.subject.sink.add(null);
    super.initState();

    ntsTemplateBloc
      ..getData(
        categoryCode: widget.categoryCode,
        ntsType: widget.ntsType,
        userid:
            BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? '',
      );
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
            categoryCode: widget.categoryCode,
          ),
        ),
      ),
    );
  }

  String titleText() {
    String title;
    if (widget.categoryCode == 'Leave' && widget.ntsType == NTSType.service)
      title = 'Leave Templates';
    else if (widget.categoryCode == 'Adhoc Task' &&
        widget.ntsType == NTSType.task)
      title = 'Adhoc Task Templates';
    else if (widget.ntsType == NTSType.service)
      title = 'Service Templates';
    else if (widget.ntsType == NTSType.task)
      title = 'Task Templates';
    else if (widget.ntsType == NTSType.note)
      title = 'Note Templates';
    else if (widget.ntsType == NTSType.note &&
        widget.categoryCode == 'Document') title = 'Document';
    return title;
  }
}
