import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/attendance_details_model/attendance_details_model.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/formats.dart';
import '../../../data/models/attendance_details_model/attendance_details_response.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';

class EmployeeAttendanceListScreen extends StatefulWidget {
  EmployeeAttendanceListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeAttendanceListScreen> createState() =>
      _EmployeeAttendanceListScreenState();
}

class _EmployeeAttendanceListScreenState
    extends State<EmployeeAttendanceListScreen> {
  int? _groupValue = 0;
  bool? isToDate = false;
  bool? isFromDate = false;
  bool? isMonth = false;

  DateTime selectedMonth = DateTime.now();
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();
  DateTime selected = DateTime.now();

  String? selectedMonthString;
  String? selectedFromDateString;
  String? selectedToDateString;
  String? selectedString;

  List<AttendanceDetailsListModel>? list;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selected,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && isMonth == true && picked != selectedToDate) {
      setState(() {
        selectedMonth = picked;
        boolFalse();
      });
    }
    if (picked != null && isFromDate == true && picked != selectedToDate) {
      setState(() {
        selectedFromDate = picked;
        boolFalse();
      });
    }
    if (picked != null && picked != selectedToDate && isToDate == true) {
      setState(() {
        selectedToDate = picked;
        boolFalse();
      });
    }
  }

  boolFalse() {
    isToDate = false;
    isFromDate = false;
    isMonth = false;
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    leaveBloc.getEmployeeAttendanceList(
      queryparams: {
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            "HR",
        "searchStart": dateformatterWithSlash.format(selectedFromDate), //TODO
        "searchEnd": dateformatterWithSlash.format(selectedToDate), //TODO
        "searchMonth": dateformatterWithSlash.format(selectedMonth), //TODO
        "searchType":
            _groupValue == 0 ? "Monthly" : "Manual", //for period =Manual
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance Details")),
      drawer: DrawerWidget(),
      body: Container(
        padding: DEFAULT_LARGE_PADDING,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RadioListTile(
                    title: Text('Month'),
                    value: 0,
                    groupValue: _groupValue,
                    onChanged: (int? v) {
                      setState(() {
                        _groupValue = v;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile(
                    title: Text('Period'),
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (int? v) {
                      setState(() {
                        _groupValue = v;
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                (_groupValue == 0)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Select Month :'),
                              SizedBox(
                                width: 2.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMonth = true;
                                  });
                                  _selectDate(context);
                                },
                                child: DateUi(
                                  dateString:
                                      DateFormat.yMMM().format(selectedMonth),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              //TODO
                              apiCall();
                            },
                            child: Text('Search'),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('From date :'),
                              SizedBox(
                                width: 2.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFromDate = true;
                                  });
                                  _selectDate(context);
                                },
                                child: DateUi(
                                  dateString: DateFormat('d MMM yyyy')
                                      .format(selectedFromDate),

                                  //  "${selectedFromDate.toLocal()}"
                                  //     .split(' ')[0],
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              apiCall();
                              //TODO
                            },
                            child: Text('Search'),
                          ),
                        ],
                      ),
                (_groupValue == 1)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('To date :\t\t\t\t'),
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isToDate = true;
                              });
                              _selectDate(context);
                            },
                            child: DateUi(
                              dateString: DateFormat('d MMM yyyy')
                                  .format(selectedToDate),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
            Flexible(
              child: StreamBuilder<AttendanceDetailsListResponse?>(
                stream: leaveBloc.subjectGetEmployeeAttendanceList.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<AttendanceDetailsListResponse?> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.data == null ||
                        snapshot.data!.data.isEmpty) {
                      return EmptyListWidget();
                    }
                    list = snapshot.data?.data;

                    return ListView.builder(
                      padding: DEFAULT_PADDING,
                      shrinkWrap: true,
                      itemCount: list?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 5,
                          child: Container(
                            padding: DEFAULT_PADDING,
                            margin: DEFAULT_PADDING,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: subtitleWidget(
                                            context: context,
                                            caption: 'Date',
                                            title: formatDate(
                                                    date: list?[index]
                                                        .date
                                                        ?.toString()) ??
                                                '')),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          subtitleWidget(
                                              context: context,
                                              caption: 'Time-In Time-Out',
                                              title: list?[index]
                                                      .roster
                                                      ?.toString() ??
                                                  '-'),
                                          subtitleWidget(
                                              context: context,
                                              title: list?[index]
                                                      .duty2Roster
                                                      ?.toString() ??
                                                  '-'),
                                          subtitleWidget(
                                              context: context,
                                              title: list?[index]
                                                      .duty3Roster
                                                      ?.toString() ??
                                                  '-'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.25.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          subtitleWidget(
                                              context: context,
                                              caption:
                                                  'Actual Time-In Time-Out',
                                              title: list?[index]
                                                      .actual
                                                      ?.toString() ??
                                                  '-'),
                                          subtitleWidget(
                                              context: context,
                                              title: list?[index]
                                                      .duty2Actual
                                                      ?.toString() ??
                                                  '-'),
                                          subtitleWidget(
                                              context: context,
                                              title: list?[index]
                                                      .duty3Actual
                                                      ?.toString() ??
                                                  '-'),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: subtitleWidget(
                                            context: context,
                                            caption: 'Employee Comments',
                                            title: list?[index]
                                                    .employeeComments
                                                    ?.toString() ??
                                                '-'))
                                  ],
                                ),
                                SizedBox(
                                  height: 1.25.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: subtitleWidget(
                                            context: context,
                                            caption: 'Override Comments',
                                            title: list?[index]
                                                    .overrideComments
                                                    ?.toString() ??
                                                '-')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CustomProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateUi extends StatelessWidget {
  const DateUi({
    Key? key,
    required this.dateString,
  }) : super(key: key);

  final String dateString;

  @override
  Widget build(BuildContext context) {
    print(dateString);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 8,
        ),
        child: Text(
          dateString,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
