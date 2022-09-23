import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/note/note_list_model.dart';
import 'package:hr_management/data/models/note/note_response.dart';
import 'package:hr_management/data/models/task_models/task_list_model.dart';
import 'package:hr_management/data/models/task_models/task_list_resp_model.dart';
import 'package:hr_management/logic/blocs/note_bloc/note_bloc.dart';
import 'package:hr_management/logic/blocs/task_bloc/task_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/note/widgets/note_list_tile.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_list_tile.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import '../../../themes/light_theme.dart';
import '../../../themes/theme_config.dart';
import '../../widgets/dotted_divider_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../nts_charts/widget/charts_widget.dart';
import 'package:sizer/sizer.dart';

import '../service/widget/service_list_tile.dart';
import 'package:synergy_nts/synergy_nts.dart';

import 'my_task_inforgraphics_widget.dart';

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
    apiCall();

    _widgetOptions = <Widget?>[
      (widget.ntsType == NTSType.note)
          ? Container()
          : (widget.ntsType == NTSType.task)
              ? taskListScreen()
              : workListMyServiceScreenChart(widget.ntsType),
      (widget.ntsType == NTSType.task)
          ? MyTaskInfographicsWidget()
          : WorkListMyServiceScreenData(ntsType: widget.ntsType),
    ];

    super.initState();
  }

  Widget taskListScreen() {
    return Stack(
      children: [
        workListMyTaskScreenChart(widget.ntsType),
        WorkListMyTaskScreenData(ntsType: widget.ntsType)
      ],
    );
  }

  apiCall() {
    if (widget.ntsType == NTSType.service) {
      serviceBloc.getReadServiceListCount(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
          "categoryCodes": "CHR",
        },
      );
    } else if (widget.ntsType == NTSType.task) {
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
    } else {
      noteBloc.getNoteList(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
          "categoryCodes": "CHR",
        },
      );
    }
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
          //
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listview',
          ),

          //
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined),
            label: 'Infographics',
          ),
        ],
        // items: const <BottomNavigationBarItem>[
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.data_usage_rounded),
        //     label: 'Charts',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.list_alt_outlined),
        //     label: 'Details',
        //   ),
        // ],
        currentIndex: (widget.ntsType == NTSType.note) ? 1 : _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
          title: (widget.ntsType == NTSType.service)
              ? Text('My Services')
              : (widget.ntsType == NTSType.task)
                  ? Text('My Task')
                  : Text('My Note')),
      drawer: DrawerWidget(),
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
          (ntsType == NTSType.service)
              ? 'My Services'
              : (ntsType == NTSType.task)
                  ? 'My Tasks'
                  : 'My Note',
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
          : (ntsType == NTSType.task)
              ? StreamBuilder<TaskListDynamicResponse?>(
                  stream: taskBloc.subjectReadTaskListCount.stream,
                  builder: (context,
                      AsyncSnapshot<TaskListDynamicResponse?> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data?.data == null &&
                          snapshot.data!.data!.isEmpty) {
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
              : SizedBox(),
    ],
  );
}

Widget workListMyTaskScreenChart(NTSType ntsType) {
  return StreamBuilder<TaskListDynamicResponse?>(
    stream: taskBloc.subjectReadTaskListCount.stream,
    builder: (context, AsyncSnapshot<TaskListDynamicResponse?> snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data?.data == null && snapshot.data!.data!.isEmpty) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('No Data'),
          ));
        }

        return _horzontalListViewWidget(
          context,
          data: snapshot.data!.data!,
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: LightTheme().lightThemeData().primaryColor,
          ),
        );
      }
    },
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
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
          "categoryCodes": "CHR",
        },
      );
    } else if (widget.ntsType == NTSType.task) {
      taskBloc.subjectReadTaskData.sink.add(null);
      taskBloc.getReadTaskData(
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
    } else {
      noteBloc.getNoteList(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
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
          : (widget.ntsType == NTSType.task)
              ? StreamBuilder<TaskListResponseModel?>(
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
                )
              : StreamBuilder<NoteListResponse?>(
                  stream: noteBloc.subjectNoteList.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<NoteListResponse?> snapshot) {
                    if (snapshot.hasData) {
                      List<NoteListModel>? list = snapshot.data?.list;
                      return ListView.builder(
                        itemCount: list?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NoteListCard(
                            index: index,
                            noteList: list,
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

class WorkListMyTaskScreenData extends StatefulWidget {
  final NTSType ntsType;
  WorkListMyTaskScreenData({Key? key, required this.ntsType}) : super(key: key);

  @override
  State<WorkListMyTaskScreenData> createState() =>
      _WorkListMyTaskScreenDataState();
}

class _WorkListMyTaskScreenDataState extends State<WorkListMyTaskScreenData> {
  @override
  void initState() {
    taskBloc.subjectReadTaskData.sink.add(null);
    taskBloc.getReadTaskData(
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
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.70,
      minChildSize: 0.70,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController controller) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36.0),
            topRight: Radius.circular(36.0),
          ),
          child: Container(
              color: Colors.white,
              padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
              child: StreamBuilder<TaskListResponseModel?>(
                stream: taskBloc.subjectReadTaskData.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<TaskListResponseModel?> snapshot) {
                  if (snapshot.hasData) {
                    List<TaskListModel>? list = snapshot.data?.data;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              taskBloc.subjectReadTaskData.sink.add(null);
                              return taskBloc.getReadTaskData(
                                queryparams: {
                                  "userId":
                                      BlocProvider.of<UserModelBloc>(context)
                                              .state
                                              .userModel
                                              ?.id ??
                                          '',
                                  "portalName":
                                      BlocProvider.of<UserModelBloc>(context)
                                              .state
                                              .extraUserInformation
                                              ?.portalType ??
                                          "HR",
                                  // "categoryCodes": "CHR",
                                  "showAllTaskForAdmin": "False",
                                },
                              );
                            },
                            child: const Text("Reset"),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: list?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TaskListCard(
                                index: index,
                                taskList: list,
                                onTap: true,
                                isWorklist: true,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: CustomProgressIndicator());
                  }
                },
              )),
        );
      },
    );
  }
}

Widget _horzontalListViewWidget(
  context, {
  required List<dynamic> data,
  // required List<DashboardFilterListModel> data,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .22,
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 8);
      },
      itemBuilder: (BuildContext context, int index) {
        return _eachFilterListItem(context, data.elementAt(index));
      },
    ),
  );
}

Widget _eachFilterListItem(context, dynamic data) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .64,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Left side is the image side
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.image,
                              size: 80,
                              color: Colors.blue[800],
                            ),

                            //
                            Text(
                              data["TotalCount"].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.blue,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      // Right side contains clickable buttons to filter data
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: GestureDetector(
                                  onTap: () => _handleOnTap(
                                    'pending',
                                    'CHR',
                                    data,
                                    context,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Pending",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        data["AssignedToMeInProgreessOverDueCount"]
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const DottedDividerWidget(
                              padding: EdgeInsets.all(0),
                            ),

                            //
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: GestureDetector(
                                  onTap: () => _handleOnTap(
                                    'completed',
                                    'Leave',
                                    data,
                                    context,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Completed",
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        data["AssignedToMeCompleteCount"]
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const DottedDividerWidget(
                              padding: EdgeInsets.all(0),
                            ),

                            //
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: GestureDetector(
                                  onTap: () => _handleOnTap(
                                    'rejected',
                                    'CHR_REIMBURSEMENT',
                                    data,
                                    context,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Rejected",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        data["AssignedToMeRejectCancelCloseCount"]
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          data["DisplayName"] ?? "",
          // style: Theme.of(context).textTheme.bodyText1!.copyWith(
          //       color: AppThemeColor.textColor,
          //     ),
        ),
        const SizedBox(height: 8.0),
      ],
    ),
  );
}

void _handleOnTap(String type, String categoryCode, dynamic data, context) {
  String? taskStatus;

  if (type == 'pending') {
    taskStatus = 'TASK_STATUS_INPROGRESS,TASK_STATUS_OVERDUE';
  } else if (type == 'completed') {
    taskStatus = 'TASK_STATUS_COMPLETE';
  } else if (type == 'rejected') {
    taskStatus = 'TASK_STATUS_REJECT,TASK_STATUS_CANCEL';
  }

  taskBloc.subjectReadTaskData.sink.add(null);
  taskBloc.getReadTaskData(
    queryparams: {
      "userId":
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      "portalName": BlocProvider.of<UserModelBloc>(context)
              .state
              .extraUserInformation
              ?.portalType ??
          "HR",
      "taskStatus": taskStatus,
      "categoryCodes": categoryCode,
      "showAllTaskForAdmin": "False",
    },
  );
//   BlocProvider.of<DashboardNotificationBloc>(context).add(
//     DashboardNotificationFilterEvent(
//       data: FilterData(
//         categoryCodes: data.templateCode,
//         taskStatus: taskStatus,
//       ),
//     ),
//   );
// }

// _handleQueryParams(BuildContext context) {
//   return dashboardBloc.getDashboardFilterAPIData(
//     queryparams: {
//       'userId': widget.userId,
//     },
//   );
}
