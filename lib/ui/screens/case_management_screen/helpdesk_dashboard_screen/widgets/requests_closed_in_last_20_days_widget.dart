import 'package:flutter/material.dart';
import 'package:hr_management/data/models/case_management_model/case_management_model.dart';
import 'package:hr_management/data/models/case_management_model/case_management_response.dart';
import 'package:hr_management/data/models/help_desk_models/read_help_desk_request_closed_model.dart';
import 'package:hr_management/data/models/help_desk_models/read_help_desk_request_closed_response.dart';
import 'package:hr_management/logic/blocs/case_management_bloc/help_desk_bloc/help_desk_bloc.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/chart_widgets/bar_chart_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';

class RequestsClosedInLast20DaysWidget extends StatefulWidget {
  RequestsClosedInLast20DaysWidget();

  @override
  _RequestsClosedInLast20DaysWidgetState createState() =>
      _RequestsClosedInLast20DaysWidgetState();
}

class _RequestsClosedInLast20DaysWidgetState
    extends State<RequestsClosedInLast20DaysWidget> {
  @override
  void initState() {
    super.initState();

    helpDeskBloc
      ..getHelpDeskRequestClosedData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ReadHelpDeskRequestClosedResponse>(
        stream: helpDeskBloc.subjectReadHelpDeskRequestClosed.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _bodyWidget(snapshot?.data?.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _bodyWidget(List<ReadHelpDeskRequestClosedModel>? data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return BarChartWidget(
      series: []
        ..add(
          BarSeries<ReadHelpDeskRequestClosedModel, String>(
            name: 'Violated',
            width: 0.25,
            color: Colors.orangeAccent,
            dataSource: data ?? [],
            yValueMapper: (ReadHelpDeskRequestClosedModel model, _) =>
                model?.violated,
            xValueMapper: (ReadHelpDeskRequestClosedModel model, _) =>
                model?.day,
          ),
        )
        ..add(
          BarSeries<ReadHelpDeskRequestClosedModel, String>(
            name: 'Non-violated',
            width: 0.25,
            color: Colors.blueAccent,
            dataSource: data ?? [],
            yValueMapper: (ReadHelpDeskRequestClosedModel model, _) =>
                model?.nonViolated,
            xValueMapper: (ReadHelpDeskRequestClosedModel model, _) =>
                model?.day,
          ),
        ),
    );
  }
}
