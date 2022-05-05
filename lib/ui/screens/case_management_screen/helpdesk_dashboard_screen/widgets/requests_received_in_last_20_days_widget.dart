import 'package:flutter/material.dart';
import 'package:hr_management/data/models/case_management_model/case_management_model.dart';
import 'package:hr_management/data/models/case_management_model/case_management_response.dart';
import 'package:hr_management/logic/blocs/case_management_bloc/helpdesk_request_received_bloc/helpdesk_request_received_bloc.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/chart_widgets/bar_chart_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';

class RequestsReceivedInLast20DaysWidget extends StatefulWidget {
  RequestsReceivedInLast20DaysWidget();

  @override
  _RequestsReceivedInLast20DaysWidgetState createState() =>
      _RequestsReceivedInLast20DaysWidgetState();
}

class _RequestsReceivedInLast20DaysWidgetState
    extends State<RequestsReceivedInLast20DaysWidget> {
  @override
  void initState() {
    super.initState();

    helpdeskRequestReceivedBloc
      ..getData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<CaseManagementResponse>(
        stream: helpdeskRequestReceivedBloc.subject.stream,
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

  Widget _bodyWidget(List<CaseManagementModel>? data) {
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
          BarSeries<CaseManagementModel, String>(
            name: 'Violated',
            width: 0.25,
            color: Colors.orangeAccent,
            dataSource: data ,
            yValueMapper: (CaseManagementModel model, _) => model.violated,
            xValueMapper: (CaseManagementModel model, _) => model.day,
          ),
        )
        ..add(
          BarSeries<CaseManagementModel, String>(
            name: 'Non-violated',
            width: 0.25,
            color: Colors.blueAccent,
            dataSource: data,
            yValueMapper: (CaseManagementModel model, _) => model.nonViolated,
            xValueMapper: (CaseManagementModel model, _) => model.day,
          ),
        ),
    );
  }
}
