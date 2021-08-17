import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/worklist_dashboard/worklist_dashboard_count.dart';
import '../../../../data/models/worklist_dashboard/worklist_dashboard_response.dart';
import '../../../../logic/blocs/worklist_dashboard_bloc/worklist_dashboard_bloc.dart';
import '../../../widgets/progress_indicator.dart';
import 'tile_block.dart';

class TaskServiceWorklist extends StatefulWidget {
  final NTSType ntsType;

  TaskServiceWorklist({
    this.ntsType,
  });

  @override
  _TaskServiceWorklistState createState() => _TaskServiceWorklistState();
}

class _TaskServiceWorklistState extends State<TaskServiceWorklist> {
  WorklistDashboardCount dashboardCount = new WorklistDashboardCount();
  @override
  void initState() {
    super.initState();
    worklistDashboardBloc
      ..getWorklistDashboardData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() {
    return {
      'userid':
          BlocProvider.of<UserModelBloc>(context).state.userModel.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WorklistDashboardResponse>(
        stream: worklistDashboardBloc.subjectWorklistDashboardList.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            dashboardCount = snapshot.data.data;
            return setNTSWorklist();
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        });
  }

  Widget setNTSWorklist() {
    if (widget.ntsType == NTSType.task) {
      return taskWorklistGrid();
    } else if (widget.ntsType == NTSType.service) {
      return serviceWorklistGrid();
    }
  }

  Widget taskWorklistGrid() {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      children: <Widget>[
        buildTile(
          isTile: false,
          status: 'Assigned To Me',
          value: dashboardCount.tAssignedToMe,
          context: context,
        ),
        buildTile(
            isTile: true,
            status: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.tAssignOverdue,
            tabName: "TaskAssigned",
            image: Image(
                image: AssetImage(
              'assets/images/task-overdue.png',
            )),
            mode: 'ASSIGN_TO',
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Pending',
            bgColor: Colors.orange,
            context: context,
            value: dashboardCount.tAssignPending,
            tabName: "TaskAssigned",
            mode: 'ASSIGN_TO',
            image: Image(image: AssetImage('assets/images/task-pending.png')),
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Completed',
            bgColor: Colors.green,
            context: context,
            tabName: "TaskAssigned",
            mode: 'ASSIGN_TO',
            image: Image(image: AssetImage('assets/images/task-completed.png')),
            value: dashboardCount.tAssignCompleted,
            ntsType: NTSType.task),
        buildTile(
            isTile: false,
            status: 'Requested By Me',
            context: context,
            value: dashboardCount.tRequestedByMe,
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.tRequestOverdue,
            image: Image(image: AssetImage('assets/images/task-overdue.png')),
            tabName: "TaskRequested",
            mode: 'ASSIGN_BY',
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Pending',
            bgColor: Colors.orange,
            context: context,
            value: dashboardCount.tRequestPending,
            image: Image(image: AssetImage('assets/images/task-pending.png')),
            tabName: "TaskRequested",
            mode: 'ASSIGN_BY',
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Completed',
            context: context,
            bgColor: Colors.green,
            value: dashboardCount.tRequestCompleted,
            image: Image(image: AssetImage('assets/images/task-completed.png')),
            tabName: "TaskRequested",
            mode: 'ASSIGN_BY',
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount.tRequestDraft,
            image: Image(image: AssetImage('assets/images/task-draft.png')),
            tabName: "TaskRequested",
            mode: 'ASSIGN_BY',
            ntsType: NTSType.task),
        buildTile(
            isTile: false,
            value: dashboardCount.tSharedWithMe,
            status: 'Shared With Me/Team',
            context: context,
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.tShareWithOverdue,
            image: Image(image: AssetImage('assets/images/task-overdue.png')),
            tabName: "TaskShared",
            mode: 'SHARE_TO',
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Pending',
            bgColor: Colors.orange,
            value: dashboardCount.tShareWithPending,
            image: Image(image: AssetImage('assets/images/task-pending.png')),
            context: context,
            tabName: "TaskShared",
            mode: 'SHARE_TO',
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            status: 'Completed',
            bgColor: Colors.green,
            value: dashboardCount.tShareWithCompleted,
            image: Image(image: AssetImage('assets/images/task-completed.png')),
            context: context,
            tabName: "TaskShared",
            mode: 'SHARE_TO',
            ntsType: NTSType.task),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 60.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 60.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 60.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
      ],
    );
  }

  Widget serviceWorklistGrid() {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      children: <Widget>[
        buildTile(
          isTile: false,
          status: 'Requested By Me',
          context: context,
          value: dashboardCount.sRequestedByMe,
        ),
        buildTile(
            isTile: true,
            status: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.sRequestOverdue,
            tabName: "ServiceRequested",
            mode: 'REQ_BY',
            image:
                Image(image: AssetImage('assets/images/service-overdue.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            status: 'Pending',
            bgColor: Colors.orange,
            context: context,
            value: dashboardCount.sRequestPending,
            tabName: "ServiceRequested",
            mode: 'REQ_BY',
            image:
                Image(image: AssetImage('assets/images/service-pending.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            status: 'Completed',
            context: context,
            bgColor: Colors.green,
            value: dashboardCount.sRequestCompleted,
            tabName: "ServiceRequested",
            mode: 'REQ_BY',
            image:
                Image(image: AssetImage('assets/images/service-completed.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            status: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount.sRequestDraft,
            tabName: "ServiceRequested",
            mode: 'REQ_BY',
            image: Image(image: AssetImage('assets/images/service-draft.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: false,
            value: dashboardCount.sSharedWithMe,
            status: 'Shared With Me/Team',
            context: context,
            image:
                Image(image: AssetImage('assets/images/notes-completed.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            status: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.sShareWithOverdue,
            tabName: "ServiceShared",
            mode: 'SHARE_TO',
            image:
                Image(image: AssetImage('assets/images/service-overdue.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            status: 'Pending',
            bgColor: Colors.orange,
            value: dashboardCount.sShareWithPending,
            context: context,
            tabName: "ServiceShared",
            mode: 'SHARE_TO',
            image:
                Image(image: AssetImage('assets/images/service-pending.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            status: 'Completed',
            bgColor: Colors.green,
            value: dashboardCount.sShareWithCompleted,
            context: context,
            tabName: "ServiceShared",
            mode: 'SHARE_TO',
            image:
                Image(image: AssetImage('assets/images/service-completed.png')),
            ntsType: NTSType.service),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 60.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 60.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
      ],
    );
  }
}
