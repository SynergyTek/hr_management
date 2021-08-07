import 'package:flutter/material.dart';
import 'package:hr_management/data/models/case_management_model/case_management_model.dart';
import 'package:hr_management/data/models/case_management_model/case_management_response.dart';

import 'package:hr_management/logic/blocs/case_management_bloc/helpdesk_box_2_bloc/helpdesk_box_2_bloc.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/chart_widgets/bar_chart_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';
import 'case_management_filter_bottom_modal_sheet_widget.dart';

class RequestsSummaryWidget extends StatefulWidget {
  RequestsSummaryWidget();

  @override
  _RequestsSummaryWidgetState createState() => _RequestsSummaryWidgetState();
}

class _RequestsSummaryWidgetState extends State<RequestsSummaryWidget> {
  List<FilterListModel> data = [
    FilterListModel(
      filterDisplayTitle: 'This Week',
      filterValue: 'thisweek',
      isChecked: true,
    ),
    FilterListModel(
      filterDisplayTitle: 'This Month',
      filterValue: 'thismonth',
      isChecked: false,
    ),
    FilterListModel(
      filterDisplayTitle: 'Last Week',
      filterValue: 'lastweek',
      isChecked: false,
    ),
    FilterListModel(
      filterDisplayTitle: 'Last Month',
      filterValue: 'lastMonth',
      isChecked: false,
    ),
  ];

  @override
  void initState() {
    super.initState();

    helpdeskBox2Bloc
      ..getData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams({FilterListModel model}) {
    if (model == null)
      return {
        'type': 'thisweek',
      };

    return {
      'type': model.filterValue,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<CaseManagementResponse>(
        stream: helpdeskBox2Bloc.subject.stream,
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

  Widget _bodyWidget(List<CaseManagementModel> data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return Column(
      children: [
        _filterWidget(),
        Expanded(
          child: BarChartWidget(
            series: []
              ..add(
                BarSeries<CaseManagementModel, String>(
                  color: Colors.blueAccent,
                  name: 'Draft',
                  width: 0.25,
                  dataSource: data ?? [],
                  yValueMapper: (CaseManagementModel model, _) => model?.draft,
                  xValueMapper: (CaseManagementModel model, _) => model?.day,
                ),
              )
              ..add(
                BarSeries<CaseManagementModel, String>(
                  color: Colors.orangeAccent,
                  name: 'In Progress',
                  width: 0.25,
                  dataSource: data ?? [],
                  yValueMapper: (CaseManagementModel model, _) =>
                      model?.inProgress,
                  xValueMapper: (CaseManagementModel model, _) => model?.day,
                ),
              )
              ..add(
                BarSeries<CaseManagementModel, String>(
                  color: Colors.red,
                  name: 'Overdue',
                  width: 0.25,
                  dataSource: data ?? [],
                  yValueMapper: (CaseManagementModel model, _) =>
                      model?.overDue,
                  xValueMapper: (CaseManagementModel model, _) => model?.day,
                ),
              )
              ..add(
                BarSeries<CaseManagementModel, String>(
                  color: Colors.greenAccent,
                  name: 'Completed',
                  width: 0.25,
                  dataSource: data ?? [],
                  yValueMapper: (CaseManagementModel model, _) =>
                      model?.completed,
                  xValueMapper: (CaseManagementModel model, _) => model?.day,
                ),
              ),
          ),
        ),
      ],
    );
  }

  Widget _filterWidget() {
    return ListTile(
      title: Text("Filter"),
      trailing: Icon(
        Icons.filter_list,
      ),
      onTap: () => _handleFilterWidgetOnTap(),
    );
  }

  void _handleFilterWidgetOnTap() async {
    showModalBottomSheet<List<FilterListModel>>(
      context: context,
      enableDrag: false,
      isScrollControlled: false,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) =>
          CaseManagementFilterBottomModalSheetWidget(
        data: data,
      ),
    ).then((List<FilterListModel> value) {
      if (value != null) {
        data = value;
      }

      value.forEach((element) {
        if (element.isChecked == true) {
          helpdeskBox2Bloc
            ..getData(
              queryparams: _handleQueryparams(model: element),
            );
        }
      });
    });
  }
}
