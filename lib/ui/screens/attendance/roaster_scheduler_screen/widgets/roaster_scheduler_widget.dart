import 'package:flutter/material.dart';
import 'package:hr_management/data/models/roaster_scheduler_list_model/roaster_scheduler_list_response.dart';
import 'package:hr_management/logic/blocs/attendance_view_bloc/attendance_view_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/widgets.dart';

import '../../../../../data/models/roaster_scheduler_list_model/roaster_scheduler_list_model.dart';
import '../../../../widgets/empty_list_widget.dart';
import '../../../../widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

class RosterScheduleWidget extends StatefulWidget {
  RosterScheduleWidget();

  @override
  _RosterScheduleWidget createState() => _RosterScheduleWidget();
}

class _RosterScheduleWidget extends State<RosterScheduleWidget> {
  List<RoasterSchedulerListModel>? _roasterSchedulerList;

  dynamic totalHours;
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
      //  'userId':
      // BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      "userId": "45bba746-3309-49b7-9c03-b5793369d73c",
      "start": DateTime.now().toString(),
      // "2023-02-26",
      "end": DateTime.now()
          .add(Duration(
            days: 7,
          ))
          .toString()
      // "2023-03-4",
    };
  }

  @override
  Widget build(BuildContext context) {
    return streambuilder();
  }

  _handleOnListTap() {}

  Widget streambuilder() {
    return StreamBuilder<RoasterSchedulerListResponse?>(
        stream: attendanceViewBloc.subjectRoasterScheduler.stream,
        builder:
            (context, AsyncSnapshot<RoasterSchedulerListResponse?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.data == null ||
                snapshot.data!.data?.length == 0) {
              return EmptyListWidget();
            }

            _roasterSchedulerList = snapshot.data?.data;

            _roasterSchedulerList!.sort(
              (a, b) => a.rosterDate!.compareTo(b.rosterDate!),
            );
            for (var element in _roasterSchedulerList!) {
              if (element.totalHours != "00:00:00" &&
                  element.draftTotalHours != "00:00:00") {
                //     var duration = Duration(
                //         hours: element.totalHours
                //             .split(':')[0]
                //             .replaceAll(RegExp(r'[^\w\s]+'), ''),
                //         minutes: element.totalHours
                //             .split(':')[1]
                //             .replaceAll(RegExp(r'[^\w\s]+'), ''),
                //         seconds: element.totalHours
                //             .split(':')[2]
                //             .replaceAll(RegExp(r'[^\w\s]+'), ''));
                totalHoursList
                    .add(element.totalHours ?? element.draftTotalHours);
              }
            }
            totalHours = totalHoursList[0];
            // totalHoursList.reduce((a, b) => a + b);

            return Column(
              children: [
                Container(
                  margin: DEFAULT_PADDING,
                  padding: DEFAULT_PADDING,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
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
                      'Total Hours: ${totalHours}',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ))
              ],
            );
          } else {
            return Center(
              child: CustomProgressIndicator(
                loadingText: 'Fetching data',
              ),
            );
          }
        });
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
    // return ListView.builder(
    //   itemCount: list?.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return elementCard(element: list?[0]);
    //   },
    // );
  }

  Widget elementCard({
    required RoasterSchedulerListModel? element,
  }) {
    return Card(
      margin: DEFAULT_PADDING,
      elevation: 6,
      child: Container(
        padding: DEFAULT_PADDING,
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
            // Text('Sunday:${element?.sunday?.toString() ?? 'OFF'}'),
            // Text('Monday:${element?.monday?.toString() ?? 'OFF'}'),
            // Text('Tuesday:${element?.tuesday?.toString() ?? 'OFF'}'),
            // Text('Wednesday:${element?.wednesday?.toString() ?? 'OFF'}'),
            // Text('Thursday:${element?.thursday?.toString() ?? 'OFF'}'),
            // Text('Friday:${element?.friday?.toString() ?? 'OFF'}'),
            // Text('Saturaday:${element?.saturday?.toString() ?? 'OFF'}'),
            // Text('Total Hours:${}'),
            element?.totalHours != "00:00:00" &&
                    element?.dutyText != null &&
                    element?.dutyText?.trim() != ""
                ? Text('${element?.dutyText?.toString() ?? 'NA'}')
                : element?.draftDuty1StartTime != null
                    ? Text(
                        '${element?.draftDuty1StartTime?.toString() ?? 'NA'}-${element?.draftDuty1EndTime?.toString() ?? 'NA'}',
                        style: TextStyle(color: Colors.blue),
                      )
                    : SizedBox(),

            // Row(
            //   children: [
            //     subtitleWidget(
            //         context: context,
            //         caption: 'Employee Name',
            //         title: element?.employeeName?.toString() ?? ''),
            //     subtitleWidget(
            //         context: context,
            //         caption: 'Job Title',
            //         title: element?.jobName?.toString() ?? ''),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
