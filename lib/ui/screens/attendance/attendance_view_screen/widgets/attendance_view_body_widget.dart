import 'package:flutter/material.dart';

import '../../../../listizer/listizer.dart';

import '../../../../../data/models/attendance_view_models/attendance_view_models.dart';
import '../../../../../data/models/attendance_view_models/attendance_view_response.dart';
import '../../../../../logic/blocs/attendance_view_bloc/attendance_view_bloc.dart';
import '../../../../../themes/theme_config.dart';
import '../../../../widgets/empty_list_widget.dart';
import '../../../../widgets/progress_indicator.dart';
import 'attendance_view_list_tile_widget.dart';

class AttendanceViewBodyWidget extends StatefulWidget {
  AttendanceViewBodyWidget();

  @override
  _AttendanceViewBodyWidgetState createState() =>
      _AttendanceViewBodyWidgetState();
}

class _AttendanceViewBodyWidgetState extends State<AttendanceViewBodyWidget> {
  List<AttendanceViewModel> _attendanceViewList = [];
  List<AttendanceViewModel> _filteredAttendanceViewList = [];

  @override
  void initState() {
    // Initialising the stream with default data.
    attendanceViewBloc..getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<AttendanceViewResponse>(
          stream: attendanceViewBloc.subject.stream,
          builder: (context, AsyncSnapshot<AttendanceViewResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.data == null ||
                  snapshot.data!.data.length == 0) {
                return EmptyListWidget();
              }
              _attendanceViewList = snapshot.data!.data;
              return Listizer(
                showSearchBar: true,
                listItems: _attendanceViewList,
                filteredSearchList: _filteredAttendanceViewList,
                itemBuilder: (context, index) {
                  return AttendanceViewListTileWidget(
                    eachAttendanceViewModelElement:
                        _attendanceViewList.elementAt(index),
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(
                  loadingText: 'Fetching data',
                ),
              );
            }
          }),
    );
  }

  @override
  void dispose() {
    _attendanceViewList = [];
    _filteredAttendanceViewList = [];
    super.dispose();
  }
}
