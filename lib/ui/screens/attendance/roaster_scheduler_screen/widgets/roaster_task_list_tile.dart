import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hr_management/logic/blocs/attendance_view_bloc/attendance_view_bloc.dart';
import 'package:hr_management/ui/widgets/dotted_divider_widget.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:geolocator/geolocator.dart' as geolocator;

import '../../../../../data/models/task_models/task_list_model.dart';
import '../../../../../logic/blocs/task_bloc/task_bloc.dart';
import '../../../../../routes/route_constants.dart';
import '../../../../../routes/screen_arguments.dart';
import '../../../../widgets/progress_indicator.dart';
import '../../../../widgets/widgets.dart';

class RoasterTaskListCard extends StatefulWidget {
  final bool? onTap;
  final bool isWorklist;
  final int index;
  final List<TaskListModel>? taskList;

  RoasterTaskListCard({
    Key? key,
    required this.index,
    required this.taskList,
    this.onTap,
    this.isWorklist = false,
  }) : super(key: key);

  @override
  State<RoasterTaskListCard> createState() => _RoasterTaskListCardState();

  static _toRadians(double degree) {
    return degree * pi / 180;
  }
}

class _RoasterTaskListCardState extends State<RoasterTaskListCard> {
  double signInLatitude = 0.0;
  double signInLongitude = 0.0;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: GestureDetector(
            onTap: widget.onTap!
                ? () {
                    taskBloc.subjectGetTaskDetails.sink.add(null);
                    Navigator.pushNamed(
                      context,
                      CREATE_EDIT_TASK_ROUTE,
                      arguments: ScreenArguments(
                        arg1: '',
                        arg2: widget.taskList![widget.index].taskActionId ??
                            widget.taskList![widget.index].id,
                        arg3: widget.taskList![widget.index].taskSubject,
                        // arg2: isWorklist
                        //     ? taskList![index].taskActionId
                        //     : taskList![index].id,
                        // arg3: _taskList[index].templateMasterCode),
                      ),
                    );
                  }
                : () {},
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: statusToColorMap[taskStatusName(widget.index)] ??
                        Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: titleWidget(
                          context: context,
                          caption: taskNoValue(widget.index),
                          title: taskSubject(widget.index),
                        ),
                      ),
                      Expanded(
                        child: subtitleWidget(
                          context: context,
                          caption: "Status",
                          customChild: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                taskStatusName(widget.index),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              statusContainerWidget(
                                statusColor: statusToColorMap[
                                        taskStatusName(widget.index)] ??
                                    Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  DottedDividerWidget(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: subtitleWidget(
                          context: context,
                          caption: "Owner",
                          title: ownerUserName(widget.index),
                        ),
                      ),
                      Expanded(
                        child: subtitleWidget(
                          context: context,
                          caption: "Assignee",
                          title: assigneeDisplayName(widget.index),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: subtitleWidget(
                          context: context,
                          caption: "Start Date",
                          title: requestedDate(widget.index),
                        ),
                      ),
                      Expanded(
                        child: subtitleWidget(
                          context: context,
                          caption: "End Date",
                          title: dueDate(widget.index),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  (widget.taskList![widget.index].actualStartDate != null &&
                          widget.taskList![widget.index].actualStartDate!
                              .isNotEmpty)
                      ? Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: subtitleWidget(
                                context: context,
                                caption: "Actual Start Date",
                                title: actualStartDate(widget.index),
                              ),
                            ),
                            Expanded(
                              child: subtitleWidget(
                                context: context,
                                caption: "Actual End Date",
                                title: actualEndDate(widget.index),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: subtitleWidget(
                          context: context,
                          caption: "Address",
                          title: address(widget.index),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ((widget.taskList![widget.index].taskStatusName ?? "") ==
                              "In Progress" ||
                          (widget.taskList![widget.index].taskStatusName ??
                                  "") ==
                              "Overdue")
                      ? _futureBuilderWidget(
                          latitude: widget.taskList![widget.index].latitude,
                          longitude: widget.taskList![widget.index].longitude,
                          radius: widget.taskList![widget.index].meter,
                          udfNoteId: widget.taskList![widget.index].udfNoteId,
                          status:
                              widget.taskList![widget.index].taskStatusName ??
                                  "",
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Center(
            child: CustomProgressIndicator(),
          ),
        ),
      ],
    );
  }

  String taskSubject(int index) {
    return widget.taskList?[index].taskSubject ?? "-";
  }

  String taskNoValue(int index) {
    return widget.taskList?[index].taskNo ?? "-";
  }

  String ownerUserName(int index) {
    return widget.taskList?[index].serviceOwner ??
        widget.taskList?[index].ownerUserName ??
        widget.taskList?[index].taskOwnerFirstLetter ??
        "-";
  }

  String assigneeDisplayName(int index) {
    return widget.taskList?[index].assigneeUserName ??
        widget.taskList?[index].assigneeDisplayName ??
        "-";
  }

  String taskStatusName(int index) {
    return widget.taskList?[index].taskStatusName ?? "-";
  }

  // String dueDateDisplay(int index) {
  String dueDate(int index) {
    if (widget.taskList?[index].dueDate != null &&
        widget.taskList![index].dueDate!.isNotEmpty &&
        widget.taskList![index].dueDate!.contains("T")) {
      var date = widget.taskList![index].createdDate!.replaceAll("T", ' ');
      return DateFormat('yyyy-MM-dd HH:mm:ss')
          .parse(date)
          .toString()
          .split('.')[0];
    } else {
      return widget.taskList?[index].dueDate ?? "-";
    }
  }

  String requestedDate(int index) {
    if (widget.taskList?[index].createdDate != null &&
        widget.taskList![index].createdDate!.isNotEmpty &&
        widget.taskList![index].createdDate!.contains("T")) {
      var date = widget.taskList![index].createdDate!.replaceAll("T", ' ');
      return DateFormat('yyyy-MM-dd HH:mm:ss')
          .parse(date)
          .toString()
          .split('.')[0];
    } else {
      return widget.taskList?[index].createdDate ?? "-";
    }
  }

  String actualStartDate(int index) {
    if (widget.taskList?[index].actualStartDate != null &&
        widget.taskList![index].actualStartDate!.isNotEmpty &&
        widget.taskList![index].actualStartDate!.contains("T")) {
      var date = widget.taskList![index].actualStartDate!.replaceAll("T", ' ');
      return DateFormat('yyyy-MM-dd HH:mm:ss')
          .parse(date)
          .toString()
          .split('.')[0];
    } else {
      return widget.taskList?[index].actualStartDate ?? "-";
    }
  }

  String actualEndDate(int index) {
    if (widget.taskList?[index].actualEndDate != null &&
        widget.taskList![index].actualEndDate!.isNotEmpty &&
        widget.taskList![index].actualEndDate!.contains("T")) {
      var date = widget.taskList![index].actualEndDate!.replaceAll("T", ' ');
      return DateFormat('yyyy-MM-dd HH:mm:ss')
          .parse(date)
          .toString()
          .split('.')[0];
    } else {
      return widget.taskList?[index].actualEndDate ?? "-";
    }
  }

  String address(int index) {
    return widget.taskList?[index].location ?? "-";
  }

  Widget _futureBuilderWidget<T>({
    double latitude = 0.0,
    double longitude = 0.0,
    int radius = 1,
    required String udfNoteId,
    required String status,
  }) {
    return FutureBuilder(
      future: geolocator.Geolocator.getCurrentPosition(
          desiredAccuracy: geolocator.LocationAccuracy.high),
      builder: (
        BuildContext context,
        AsyncSnapshot snapshot,
      ) {
        if (snapshot.hasData) {
          signInLatitude = snapshot.data.latitude;
          signInLongitude = snapshot.data.longitude;

          bool withinRange = calculateDistance(
            latitude: latitude,
            longitude: longitude,
            radius: radius / 1000,
          );

          if (withinRange) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => postTaskTimeEntry(
                      udfNoteId: udfNoteId,
                      isSignedIn: true,
                    ),
                    child: subtitleWidget(
                      context: context,
                      caption: "Sign In",
                      customChild: Icon(
                        Icons.fingerprint,
                        color: Colors.green,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => postTaskTimeEntry(
                      udfNoteId: udfNoteId,
                      isSignedIn: false,
                    ),
                    child: subtitleWidget(
                      context: context,
                      caption: "Sign Out",
                      customChild: Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        }
        return _loadingWidget(text: "Fetching metadata details...");
      },
    );
  }

  Widget _loadingWidget({
    String? text,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: 10.h),
          Text(text ?? "Loading..."),
        ],
      ),
    );
  }

  calculateDistance({
    double? latitude,
    double? longitude,
    double radius = 0.20,
  }) {
    bool result = false;
    // final double radius = 0.20;

    // Fetch current location
    final double distance = distanceBetween(
      signInLatitude,
      signInLongitude,
      latitude ?? 0.0,
      longitude ?? 0.0,
    );

    var distanceInkm = distance / 1000;
    distanceInkm < radius ? result = true : result = false;

    return result;
  }

  /// Calculate distance between 2 co-ordinates
  double distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    var earthRadius = 6378137.0;
    var dLat = RoasterTaskListCard._toRadians(endLatitude - startLatitude);
    var dLon = RoasterTaskListCard._toRadians(endLongitude - startLongitude);

    var a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(RoasterTaskListCard._toRadians(startLatitude)) *
            cos(RoasterTaskListCard._toRadians(endLatitude));
    var c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  postTaskTimeEntry({
    required String udfNoteId,
    required bool isSignedIn,
  }) async {
    setState(() {
      isVisible = true;
    });
    Map<String, dynamic> queryparams = {};

    queryparams['udfNoteId'] = udfNoteId;
    if (isSignedIn == true) {
      queryparams['start'] = DateTime.now().toString();
    } else {
      queryparams['end'] = DateTime.now().toString();
    }
    queryparams['type'] = 'automaticTimeEntry';

    bool response =
        await attendanceViewBloc.getPostTaskTimeEntry(queryparams: queryparams);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          response
              ? isSignedIn
                  ? "Sign in successful!"
                  : "Sign out successful!"
              : "An error occured please try again later.",
        ),
      ),
    );

    setState(() {
      isVisible = false;
    });
  }
}
