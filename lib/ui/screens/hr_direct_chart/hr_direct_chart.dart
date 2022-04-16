import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/service_models/service_summary_response_model.dart';
import 'package:hr_management/data/models/task_models/task_summary_response_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/widgets/dotted_divider_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import '../../../data/enums/enums.dart';
import '../nts_charts/widget/charts_widget.dart';
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
                    var list = [];
                    snapshot.data?.data?.forEach(
                      (k, v) => list.add(
                        ChartData(
                          k,
                          v,
                        ),
                      ),
                    );
                    print(list);

                    return Charts(
                      chartDataLIst: list,
                      chartType: 'donut',
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
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
                  var list = [];
                  snapshot.data?.data?.forEach(
                    (k, v) => list.add(
                      ChartData(
                        k,
                        v,
                      ),
                    ),
                  );
                  return Charts(
                    chartDataLIst: list,
                    chartType: 'pie',
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  String type;
  int value;

  ChartData(
    this.type,
    this.value,
  );
  @override
  String toString() {
    return '{ ${this.type}, ${this.value} }';
  }
}
