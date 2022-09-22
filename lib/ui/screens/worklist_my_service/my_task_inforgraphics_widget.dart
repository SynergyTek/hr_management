import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/task_models/task_list_resp_model.dart';
import '../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../themes/theme_config.dart';
import '../../widgets/dotted_divider_widget.dart';
import '../../widgets/empty_list_widget.dart';
import '../case_management_screen/helpdesk_dashboard_screen/widgets/chart_widgets/pie_chart_widget.dart';
import '../case_management_screen/helpdesk_dashboard_screen/widgets/open_requests_by_category_widget.dart';

class MyTaskInfographicsWidget extends StatefulWidget {
  MyTaskInfographicsWidget({Key? key}) : super(key: key);

  @override
  State<MyTaskInfographicsWidget> createState() =>
      MyTaskdInfographicsWidgetState();
}

class MyTaskdInfographicsWidgetState extends State<MyTaskInfographicsWidget> {
  //
  List<PieChartData> pieChartData = [];
  @override
  void initState() {
    taskBloc.subjectReadTaskListCount.sink.add(null);
    taskBloc.getReadTaskListCount(
      queryparams: {
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            "HR",
        // "categoryCodes": "CHR",
        "showAllTaskForAdmin": "False",
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
      child: _streambuilderWidget(),
    );
  }

  Widget _streambuilderWidget() {
    return StreamBuilder<TaskListDynamicResponse?>(
      stream: taskBloc.subjectReadTaskListCount.stream,
      builder: (context, AsyncSnapshot<TaskListDynamicResponse?> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("An error occured, please try again later."),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data?.error != null &&
              snapshot.data!.error!.isNotEmpty) {
            return const Center(
              child: Text("An error occured, please try again later."),
            );
          }

          if (snapshot.data?.data == null) {
            return EmptyListWidget();
          }

          return _listViewWidget(
            data: snapshot.data!.data!,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _listViewWidget({
    required List<dynamic> data,
  }) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: data.length,
      separatorBuilder: (BuildContext context, int index) {
        return const DottedDividerWidget(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return _eachFilterListItem(data.elementAt(index));
      },
    );
  }

  Widget _eachFilterListItem(dynamic data) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: _chartWidget(data),
            ),
          ),
          const SizedBox(height: 8.0),

          //
          Text(
            data["DisplayName"] ?? "",
            // style: Theme.of(context).textTheme.bodyText1!.copyWith(
            //       color: AppThemeColor.textHeadingColor,
            //     ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _chartWidget(dynamic data) {
    // Guard clause
    if (data == null) {
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );
    }

    // Clearing the data:
    pieChartData = [];

    pieChartData.add(
      PieChartData(
        x: "Pending",
        y: data["AssignedToMeInProgreessOverDueCount"].toDouble() ?? 0.0,
        color: const Color.fromRGBO(75, 135, 185, 1),
      ),
    );

    pieChartData.add(
      PieChartData(
        x: "Completed",
        y: data["AssignedToMeCompleteCount"].toDouble() ?? 0.0,
        color: const Color.fromRGBO(116, 180, 155, 1),
      ),
    );

    pieChartData.add(
      PieChartData(
        x: "Rejected",
        y: data["AssignedToMeRejectCancelCloseCount"].toDouble() ?? 0.0,
        color: const Color.fromRGBO(246, 114, 128, 1),
      ),
    );

    return PieChartWidget(
      series: [
        PieSeries<PieChartData, String>(
          dataSource: pieChartData,
          pointColorMapper: (PieChartData model, _) => model.color,
          yValueMapper: (PieChartData model, _) => model.y,
          xValueMapper: (PieChartData model, _) => model.x,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
        )
      ],
    );
  }
}
