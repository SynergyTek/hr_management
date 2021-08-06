import 'package:flutter/material.dart';
import 'package:hr_management/data/models/case_management_model/case_management_model.dart';
import 'package:hr_management/data/models/case_management_model/case_management_response.dart';
import 'package:hr_management/logic/blocs/case_management_bloc/pending_task_count_bloc/pending_task_count_bloc.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/gauge_chart_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';

class OpenRequestsWidget extends StatefulWidget {
  OpenRequestsWidget();

  @override
  _OpenRequestsWidgetState createState() => _OpenRequestsWidgetState();
}

class _OpenRequestsWidgetState extends State<OpenRequestsWidget> {
  @override
  void initState() {
    super.initState();

    // pendingTaskCountBloc
    //   ..getData(
    //     queryparams: _handleQueryparams(),
    //   );
  }

  // _handleQueryparams() => null;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: DEFAULT_PADDING,
    //   child: StreamBuilder<CaseManagementResponse>(
    //     stream: pendingTaskCountBloc.subject.stream,
    //     builder: (context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasData) {
    //         if (snapshot.data.error != null && snapshot.data.error.length > 0) {
    //           return Center(
    //             child: Text(snapshot.data.error),
    //           );
    //         }

    return _bodyWidget();
    //       } else {
    //         return CustomProgressIndicator();
    //       }
    //     },
    //   ),
    // );
  }

  Widget _bodyWidget() {
    // if (data == null || data.isEmpty)
    //   return Center(
    //     child: Text(
    //       "No data found.",
    //       style: Theme.of(context).textTheme.bodyText1.copyWith(
    //             color: Theme.of(context).textHeadingColor,
    //           ),
    //     ),
    //   );

    return GaugeChartWidget(
      gaugeValue: 20,
      child: _childWidget(),
    );
  }

  Widget _childWidget() {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "20",
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Theme.of(context).textHeadingColor,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Open Requests",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
