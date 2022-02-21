import 'package:flutter/material.dart';
import 'package:hr_management/data/models/help_desk_models/help_desk_dashboard_model.dart';
import 'package:hr_management/data/models/help_desk_models/help_desk_dashboard_response.dart';
import 'package:hr_management/logic/blocs/case_management_bloc/help_desk_bloc/help_desk_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';
import 'chart_widgets/gauge_chart_widget.dart';

class OpenRequestsWidget extends StatefulWidget {
  OpenRequestsWidget();

  @override
  _OpenRequestsWidgetState createState() => _OpenRequestsWidgetState();
}

class _OpenRequestsWidgetState extends State<OpenRequestsWidget> {
  @override
  void initState() {
    super.initState();

    helpDeskBloc
      ..getHelpdeskDashboardData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<HelpDeskDashboardResponse>(
        stream: helpDeskBloc.subjectHelpDeskDashboard.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _bodyWidget(snapshot.data?.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _bodyWidget(HelpDeskDashboardModel? data) {
    if (data == null)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return GaugeChartWidget(
      gaugeValueList: [
        data.openRequestCount!.toDouble(),
      ],
      child: _childWidget(data),
    );
  }

  Widget _childWidget(HelpDeskDashboardModel data) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${data.openRequestCount ?? "-"}",
            style: Theme.of(context).textTheme.headline5!.copyWith(
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
