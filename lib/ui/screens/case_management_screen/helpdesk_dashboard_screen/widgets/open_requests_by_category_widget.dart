import 'package:flutter/material.dart';

import 'package:hr_management/data/models/help_desk_models/open_requests_by_category_model.dart';
import 'package:hr_management/data/models/help_desk_models/open_requests_by_category_response.dart';

import 'package:hr_management/logic/blocs/case_management_bloc/request_chart_status_bloc/request_chart_status_bloc.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/case_management_filter_bottom_modal_sheet_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';
import 'chart_widgets/pie_chart_widget.dart';

class OpenRequestsByCategoryWidget extends StatefulWidget {
  OpenRequestsByCategoryWidget();

  @override
  _OpenRequestsByCategoryWidgetState createState() =>
      _OpenRequestsByCategoryWidgetState();
}

class _OpenRequestsByCategoryWidgetState
    extends State<OpenRequestsByCategoryWidget> {
  List<FilterListModel> data = [
    FilterListModel(
      filterDisplayTitle: 'Category',
      filterValue: 'Category',
      isChecked: true,
    ),
    FilterListModel(
      filterDisplayTitle: 'Priority',
      filterValue: 'Priority',
      isChecked: false,
    ),
    FilterListModel(
      filterDisplayTitle: 'Service',
      filterValue: 'Service',
      isChecked: false,
    ),
  ];

  List<PieChartData> pieChartData = [];

  @override
  void initState() {
    super.initState();

    requestChartStatusBloc
      ..getData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams({FilterListModel? model}) {
    if (model == null)
      return {
        'type': 'Category',
      };

    return {
      'type': model.filterValue,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<OpenRequestsByCategoryResponse>(
        stream: requestChartStatusBloc.subject.stream,
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

  Widget _bodyWidget(List<OpenRequestsByCategoryModel>? data) {
    if (data == null)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    pieChartData = [];
    data.forEach((element) {
      pieChartData
        ..add(
          PieChartData(
            x: element.type,
            y: element.value!.toDouble(),
          ),
        );
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _filterWidget(),
        Expanded(
          child: PieChartWidget(
            series: []..add(
                PieSeries<PieChartData, String>(
                    dataSource: pieChartData ,
                    pointColorMapper: (PieChartData model, _) => model.color,
                    yValueMapper: (PieChartData model, _) => model.y,
                    xValueMapper: (PieChartData model, _) => model.x,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                    )),
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
    ).then((List<FilterListModel>? value) {
      if (value != null) {
        data = value;
      }

      value!.forEach((element) {
        if (element.isChecked == true) {
          requestChartStatusBloc
            ..getData(
              queryparams: _handleQueryparams(model: element),
            );
        }
      });
    });
  }
}

class PieChartData {
  final String? x;
  final double? y;
  final Color? color;

  PieChartData({
    this.x,
    this.y,
    this.color,
  });
}
