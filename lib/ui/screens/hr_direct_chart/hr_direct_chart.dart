import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/service_models/service_summary_response_model.dart';
import 'package:hr_management/data/models/task_models/task_summary_response_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/dotted_divider_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../data/enums/enums.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import '../../../themes/light_theme.dart';
import '../case_management_screen/helpdesk_dashboard_screen/widgets/chart_widgets/pie_chart_widget.dart';
import '../case_management_screen/helpdesk_dashboard_screen/widgets/open_requests_by_category_widget.dart';
import 'package:sizer/sizer.dart';

class HrDirectChart extends StatefulWidget {
  final NTSType? ntsType;
  const HrDirectChart({Key? key, this.ntsType}) : super(key: key);

  @override
  _HrDirectChartState createState() => _HrDirectChartState();
}

class _HrDirectChartState extends State<HrDirectChart> {
  @override
  void initState() {
    serviceBloc
      ..getServiceSummary(
        queryparams: {
          'userid':
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR"
        },
      );

    taskBloc
      ..getTaskSummary(
        queryparams: {
          'userid':
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR"
        },
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HR Direct Chart'),
      ),
      drawer: DrawerWidget(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //
          Text(
            'My Tasks',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          //
          Expanded(
            child: StreamBuilder<TaskSummaryResponse?>(
                stream: taskBloc.subjectTaskSummaryList.stream,
                builder:
                    (context, AsyncSnapshot<TaskSummaryResponse?> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == null) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No Data'),
                      ));
                    }
                    return _chartWidget(
                        context, snapshot.data?.data, NTSType.task);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor:
                            LightTheme().lightThemeData().primaryColor,
                      ),
                    );
                  }
                }),
          ),
          //
          const DottedDividerWidget(),

          //
          Text(
            'My Services',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          //
          Expanded(
            child: StreamBuilder<ServiceSummaryResponse?>(
              stream: serviceBloc.subjectServiceSummaryList.stream,
              builder:
                  (context, AsyncSnapshot<ServiceSummaryResponse?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.data == null) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No Data'),
                    ));
                  }
                  return _chartWidget(
                      context, snapshot.data?.data, NTSType.service);
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor:
                          LightTheme().lightThemeData().primaryColor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chartWidget(context, dynamic data, NTSType ntsType) {
    List<PieChartData> pieChartData = [];
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
        y: (data["InProgressCount"] ?? 0).toDouble(),
        color: const Color.fromRGBO(75, 135, 185, 1),
      ),
    );

    pieChartData.add(
      PieChartData(
        x: "Completed",
        y: (data["Completed"] ?? 0).toDouble(),
        color: const Color.fromRGBO(116, 180, 155, 1),
      ),
    );

    pieChartData.add(
      PieChartData(
        x: "Rejected",
        y: (data["Rejected"] ?? 0).toDouble(),
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
      child: TextButton(
        onPressed: () {
          (ntsType == NTSType.task)
              ? Navigator.pushNamed(
                  context!,
                  TASK_HOME,
                  arguments: ScreenArguments(
                      arg1: '', arg2: '', arg3: '', showBack: true),
                )
              : Navigator.pushNamed(
                  context!,
                  SERVICE_HOME,
                  arguments: ScreenArguments(
                      arg1: '', arg2: '', arg3: '', showBack: true),
                );
        },
        child: Text("View List"),
      ),
    );
  }
}
