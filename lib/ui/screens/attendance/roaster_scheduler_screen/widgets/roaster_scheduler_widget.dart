import 'package:flutter/material.dart';
import 'package:hr_management/data/models/roaster_scheduler_list_model/roaster_scheduler_list_response.dart';
import 'package:hr_management/logic/blocs/attendance_view_bloc/attendance_view_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/widgets.dart';

import '../../../../../data/models/roaster_scheduler_list_model/roaster_scheduler_list_model.dart';
import '../../../../widgets/empty_list_widget.dart';
import '../../../../widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../tasks/add_edit_task_screen.dart';
import 'roaster_task_screen.dart';

class RosterScheduleWidget extends StatefulWidget {
  RosterScheduleWidget();

  @override
  _RosterScheduleWidget createState() => _RosterScheduleWidget();
}

class _RosterScheduleWidget extends State<RosterScheduleWidget> {
  List<RoasterSchedulerListModel>? _roasterSchedulerList;

  String totalHours = "";
  List<dynamic> totalHoursList = [];

  @override
  void initState() {
    attendanceViewBloc.getRoasterSchedulerList(
      queryparams: _handleQueryparams(),
    );

    super.initState();
  }

  _handleQueryparams() {
    return {
      'userId':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      "start": DateTime.now()
          .add(
            Duration(
              days: -1,
            ),
          )
          .toString(),
      "end": DateTime.now()
          .add(
            Duration(
              days: 6,
            ),
          )
          .toString()
    };
  }

  @override
  Widget build(BuildContext context) {
    return streambuilder();
  }

  Widget streambuilder() {
    return StreamBuilder<RoasterSchedulerListResponse?>(
      stream: attendanceViewBloc.subjectRoasterScheduler.stream,
      builder:
          (context, AsyncSnapshot<RoasterSchedulerListResponse?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.data == null || snapshot.data!.data?.length == 0) {
            return EmptyListWidget();
          }

          _roasterSchedulerList = snapshot.data?.data;

          _roasterSchedulerList!.sort(
            (a, b) => a.rosterDate!.compareTo(b.rosterDate!),
          );

          int hr = 0;
          int min = 0;
          int sec = 0;
          for (var element in _roasterSchedulerList!) {
            if (element.totalHours != "00:00:00" &&
                element.draftTotalHours != "00:00:00") {
              hr = hr + (int.parse(element.totalHours?.split(":")[0]));
              min = min + (int.parse(element.totalHours?.split(":")[1]));
              sec = sec + (int.parse(element.totalHours?.split(":")[2]));
            }
          }
          min = min + (sec / 60).floor();
          hr = hr + (min / 60).floor();
          min = min % 60;
          sec = sec % 60;

          totalHours =
              "$hr:${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";

          return Column(
            children: [
              Container(
                margin: DEFAULT_PADDING,
                padding: DEFAULT_PADDING * 2,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: subtitleWidget(
                              context: context,
                              caption: 'Employee Name',
                              title: _roasterSchedulerList?[0]
                                      .employeeName
                                      ?.toString() ??
                                  ''),
                        ),
                        Expanded(
                          child: subtitleWidget(
                              context: context,
                              caption: 'Employee No',
                              title: _roasterSchedulerList?[0]
                                      .personNo
                                      ?.toString() ??
                                  ''),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: subtitleWidget(
                              context: context,
                              caption: 'Job Title',
                              title: _roasterSchedulerList?[0]
                                      .jobName
                                      ?.toString() ??
                                  ''),
                        ),
                        Expanded(
                          child: subtitleWidget(
                              context: context,
                              caption: 'Organisation',
                              title: _roasterSchedulerList?[0]
                                      .organizationName
                                      ?.toString() ??
                                  ''),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: _listBuilder(
                  list: _roasterSchedulerList,
                ),
              ),
              Container(
                padding: DEFAULT_PADDING,
                margin: DEFAULT_PADDING,
                child: Text(
                  'Total Hours: $totalHours',
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
              )
            ],
          );
        } else {
          return Center(
            child: CustomProgressIndicator(
              loadingText: 'Fetching data',
            ),
          );
        }
      },
    );
  }

  Widget _listBuilder({
    required List<RoasterSchedulerListModel>? list,
  }) {
    return ListView.builder(
      padding: DEFAULT_PADDING,
      itemCount: list?.length,
      itemBuilder: (BuildContext context, int index) {
        return elementCard(element: list?[index]);
      },
    );
  }

  Widget elementCard({
    required RoasterSchedulerListModel? element,
  }) {
    return Card(
      margin: DEFAULT_PADDING,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: Container(
        padding: DEFAULT_PADDING,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subtitleWidget(
                context: context,
                title: formatDate(
                        date: element?.rosterDate?.toIso8601String(),
                        format: 'EEEE, dd-MM-yyyy') ??
                    ''),
            element?.draftTotalHours != "00:00:00" &&
                    element?.totalHours != "00:00:00" &&
                    element?.dutyText != null
                ? Text(
                    'Total Hours:${element?.totalHours?.toString() ?? element?.draftTotalHours?.toString()}',
                  )
                : Text('OFF'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                element?.totalHours != "00:00:00" &&
                        element?.dutyText != null &&
                        element?.dutyText?.trim() != ""
                    ? Text(
                        '${element?.dutyText?.replaceAll("<br/>", "\n") ?? 'NA'}',
                        style: TextStyle(color: Colors.blue),
                      )
                    : element?.draftDuty1StartTime != null
                        ? Text(
                            '${element?.draftDuty1StartTime?.toString() ?? 'NA'}-${element?.draftDuty1EndTime?.toString() ?? 'NA'}',
                            style: TextStyle(color: Colors.blue),
                          )
                        : SizedBox(),
                element!.taskList!.isEmpty
                    ? Container(
                        padding: DEFAULT_PADDING,
                        margin: DEFAULT_PADDING,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue.shade600,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          'No Task',
                        ))
                    : GestureDetector(
                        onTap: () => handleCardOnTap(data: element),
                        child: Container(
                            padding: DEFAULT_PADDING,
                            margin: DEFAULT_PADDING,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade600,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'View Task',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }

  handleCardOnTap({RoasterSchedulerListModel? data}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return RoasterTaskScreen(
            taskList: data!.taskList!,
            onTap: true,
          );
        },
      ),
    );
  }
}
