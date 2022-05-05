import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_list_tile.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import '../../../themes/light_theme.dart';
import '../nts_charts/widget/charts_widget.dart';
import 'package:sizer/sizer.dart';

import '../service/widget/service_list_tile.dart';

class WorkListMyServiceScreenCount extends StatefulWidget {
  final NTSType ntsType;
  const WorkListMyServiceScreenCount({
    Key? key,
    required this.ntsType,
  }) : super(key: key);

  @override
  _WorkListMyServiceScreenCountState createState() =>
      _WorkListMyServiceScreenCountState();
}

class _WorkListMyServiceScreenCountState
    extends State<WorkListMyServiceScreenCount> {
  int _selectedIndex = 0;

  List<Widget?>? _widgetOptions = [];

  @override
  void initState() {
    if (widget.ntsType == NTSType.service) {
      serviceBloc.getReadServiceListCount(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
          "categoryCodes": "CHR",
        },
      );
    } else if (widget.ntsType == NTSType.task) {
      taskBloc.getReadTaskListCount(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
          "categoryCodes": "CHR",
        },
      );
    }
    _widgetOptions = <Widget?>[
      workListMyServiceScreenChart(widget.ntsType),
      WorkListMyServiceScreenData(ntsType: widget.ntsType),
    ];

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_rounded),
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Details',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
          title: (widget.ntsType == NTSType.service)
              ? Text('WorkList My Services')
              : Text('WorkList My Task')),
      body: _widgetOptions!.elementAt(_selectedIndex),
    );
  }

  Widget chartCard({Widget? child}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 1.w),
        child: Card(
          elevation: 6,
          child: child,
        ));
  }
}

Widget workListMyServiceScreenChart(NTSType ntsType) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 4.h,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.blue.shade200,
        child: Text(
          (ntsType == NTSType.service) ? 'My Services' : 'My Tasks',
          style: TextStyle(fontSize: 14),
        ),
      ),
      SizedBox(
        height: 6.h,
      ),
      (ntsType == NTSType.service)
          ? StreamBuilder<ServiceMapResponse?>(
              stream: serviceBloc.subjectReadServiceListCount.stream,
              builder: (context, AsyncSnapshot<ServiceMapResponse?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.data == null) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No Data'),
                    ));
                  }
                  var list = [];
                  Map<String, dynamic>? map = snapshot.data?.data?.first;
                  map?.forEach(
                    (k, v) {
                      if (v != null && v is int) {
                        list.add(
                          ChartData(
                            k,
                            v,
                          ),
                        );
                      }
                    },
                  );

                  print(list);

                  return Charts(
                    chartDataLIst: list,
                    chartType: "donut",
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor:
                          LightTheme().lightThemeData().primaryColor,
                    ),
                  );
                }
              },
            )
          : StreamBuilder<TaskListDynamicResponse?>(
              stream: taskBloc.subjectReadTaskListCount.stream,
              builder:
                  (context, AsyncSnapshot<TaskListDynamicResponse?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.data == null) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No Data'),
                    ));
                  }
                  var list = [];
                  Map<String, dynamic>? map = snapshot.data?.data?.first;
                  map?.forEach(
                    (k, v) {
                      if (v != null && v is int) {
                        list.add(
                          ChartData(
                            k,
                            v,
                          ),
                        );
                      }
                    },
                  );

                  print(list);

                  return Charts(
                    chartDataLIst: list,
                    chartType: "donut",
                  );
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
    ],
  );
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

class WorkListMyServiceScreenData extends StatefulWidget {
  final NTSType ntsType;
  WorkListMyServiceScreenData({Key? key, required this.ntsType})
      : super(key: key);

  @override
  State<WorkListMyServiceScreenData> createState() =>
      _WorkListMyServiceScreenDataState();
}

class _WorkListMyServiceScreenDataState
    extends State<WorkListMyServiceScreenData> {
  @override
  void initState() {
    super.initState();
    if (widget.ntsType == NTSType.service) {
      serviceBloc.getReadServiceData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
          "categoryCodes": "CHR",
        },
      );
    } else if (widget.ntsType == NTSType.task) {
      taskBloc.getReadTaskData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
          "categoryCodes": "CHR",
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (widget.ntsType == NTSType.service)
          ? StreamBuilder<ServiceListResponse?>(
              stream: serviceBloc.subjectReadServiceData.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<ServiceListResponse?> snapshot) {
                if (snapshot.hasData) {
                  List<Service>? list = snapshot.data?.list;
                  return ListView.builder(
                    itemCount: list?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceListCard(
                        index: index,
                        serviceList: list,
                        onTap: false,
                      );
                    },
                  );
                } else {
                  return Center(child: CustomProgressIndicator());
                }
              },
            )
          : StreamBuilder<TaskListResponseModel?>(
              stream: taskBloc.subjectReadTaskData.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<TaskListResponseModel?> snapshot) {
                if (snapshot.hasData) {
                  List<TaskListModel>? list = snapshot.data?.data;
                  return ListView.builder(
                    itemCount: list?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskListCard(
                        index: index,
                        taskList: list,
                        onTap: false,
                      );
                    },
                  );
                } else {
                  return Center(child: CustomProgressIndicator());
                }
              },
            ),
    );
  }
}
