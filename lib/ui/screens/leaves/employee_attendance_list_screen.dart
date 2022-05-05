import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

class EmployeeAttendanceListScreen extends StatefulWidget {
  EmployeeAttendanceListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeAttendanceListScreen> createState() =>
      _EmployeeAttendanceListScreenState();
}

class _EmployeeAttendanceListScreenState
    extends State<EmployeeAttendanceListScreen> {
  int? _groupValue = -1;
  bool? isToDate = false;
  bool? isFromDate = false;
  bool? isMonth = false;

  DateTime selectedMonth = DateTime.now();
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();
  DateTime selected = DateTime.now();

  List<Service>? list;

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
        "searchStart": "2022-06-01 00:00:00.000", //TODO
        "searchEnd": "2022-07-30 00:00:00.000", //TODO
        "searchMonth": "April 2022", //TODO
        "searchType": "Monthly",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Attendance List")),
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
            Flexible(
              child: Column(
                children: [
                  (_groupValue == 0)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isMonth = true;
                                    });
                                    _selectDate(context);
                                  },
                                  child: Text('Select Month'),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                DateUi(
                                  dateString:
                                      DateFormat.MMMM().format(selectedMonth),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                //TODO
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
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isFromDate = true;
                                    });
                                    _selectDate(context);
                                  },
                                  child: Text('From date'),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                DateUi(
                                  dateString: "${selectedFromDate.toLocal()}"
                                      .split(' ')[0],
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
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
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isToDate = true;
                                });
                                _selectDate(context);
                              },
                              child: Text('To date'),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            DateUi(
                              dateString:
                                  "${selectedToDate.toLocal()}".split(' ')[0],
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),
            StreamBuilder<ServiceListResponse?>(
              stream: leaveBloc.subjectGetEmployeeAttendanceList.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<ServiceListResponse?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.list == null) {
                    return EmptyListWidget();
                  }
                  list = snapshot.data?.list;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: list?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Text('data'),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CustomProgressIndicator(),
                  );
                }
              },
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
