import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/worklist_dashboard/worklist_dashboard_count.dart';
import '../../../../data/models/worklist_dashboard/worklist_dashboard_response.dart';
import '../../../../logic/blocs/worklist_dashboard_bloc/worklist_dashboard_bloc.dart';
import '../../../widgets/progress_indicator.dart';

import 'tile_block.dart';

class TaskWorklist extends StatefulWidget {
  TaskWorklist({Key key, this.ntsType}) : super(key: key);
  final NTSType ntsType;

  @override
  _TaskWorklistState createState() => _TaskWorklistState();
}

class _TaskWorklistState extends State<TaskWorklist> {
  WorklistDashboardCount dashboardCount = new WorklistDashboardCount();
  @override
  void initState() {
    super.initState();
    worklistDashboardBloc..getWorklistDashboardData();
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
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        buildTile(
          isTile: false,
          title: 'Assigned To Me',
          value: dashboardCount.tAssignedToMe,
          context: context,
        ),
        buildTile(
            isTile: true,
            title: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.tAssignOverdue,
            tabName: "TaskAssigned",
            image: Image(image: AssetImage('assets/images/task-overdue.png')),
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Pending',
            bgColor: Colors.orange,
            context: context,
            value: dashboardCount.tAssignPending,
            tabName: "TaskAssigned",
            image: Image(image: AssetImage('assets/images/task-pending.png')),
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Completed',
            bgColor: Colors.green,
            context: context,
            tabName: "TaskAssigned",
            image: Image(image: AssetImage('assets/images/task-completed.png')),
            value: dashboardCount.tAssignCompleted,
            ntsType: NTSType.task),
        buildTile(
            isTile: false,
            title: 'Requested By Me',
            context: context,
            value: dashboardCount.tRequestedByMe,
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.tRequestOverdue,
            image: Image(image: AssetImage('assets/images/task-overdue.png')),
            tabName: "TaskRequested",
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Pending',
            bgColor: Colors.orange,
            context: context,
            value: dashboardCount.tRequestPending,
            image: Image(image: AssetImage('assets/images/task-pending.png')),
            tabName: "TaskRequested",
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Completed',
            context: context,
            bgColor: Colors.green,
            value: dashboardCount.tRequestCompleted,
            image: Image(image: AssetImage('assets/images/task-completed.png')),
            tabName: "TaskRequested",
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount.tRequestDraft,
            image: Image(image: AssetImage('assets/images/task-draft.png')),
            tabName: "TaskRequested",
            ntsType: NTSType.task),
        buildTile(
            isTile: false,
            value: dashboardCount.tSharedWithMe,
            title: 'Shared With Me/Team',
            context: context,
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.tShareWithOverdue,
            image: Image(image: AssetImage('assets/images/task-overdue.png')),
            tabName: "TaskShared",
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Pending',
            bgColor: Colors.orange,
            value: dashboardCount.tShareWithPending,
            image: Image(image: AssetImage('assets/images/task-pending.png')),
            context: context,
            tabName: "TaskShared",
            ntsType: NTSType.task),
        buildTile(
            isTile: true,
            title: 'Completed',
            bgColor: Colors.green,
            value: dashboardCount.tShareWithCompleted,
            image: Image(image: AssetImage('assets/images/task-completed.png')),
            context: context,
            tabName: "TaskShared",
            ntsType: NTSType.task),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
      ],
    );
  }

  Widget serviceWorklistGrid() {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        buildTile(
          isTile: false,
          title: 'Requested By Me',
          context: context,
          value: dashboardCount.sRequestedByMe,
        ),
        buildTile(
            isTile: true,
            title: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.sRequestOverdue,
            tabName: "ServiceRequested",
            image:
                Image(image: AssetImage('assets/images/service-overdue.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            title: 'Pending',
            bgColor: Colors.orange,
            context: context,
            value: dashboardCount.sRequestPending,
            tabName: "ServiceRequested",
            image:
                Image(image: AssetImage('assets/images/service-overdue.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            title: 'Completed',
            context: context,
            bgColor: Colors.green,
            value: dashboardCount.sRequestCompleted,
            tabName: "ServiceRequested",
            image:
                Image(image: AssetImage('assets/images/service-completed.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            title: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount.sRequestDraft,
            tabName: "ServiceRequested",
            image: Image(image: AssetImage('assets/images/service-draft.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: false,
            value: dashboardCount.sSharedWithMe,
            title: 'Shared With Me/Team',
            context: context,
            image:
                Image(image: AssetImage('assets/images/notes-completed.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            title: 'Overdue',
            bgColor: Colors.red,
            context: context,
            value: dashboardCount.sShareWithOverdue,
            tabName: "ServiceShared",
            image:
                Image(image: AssetImage('assets/images/service-overdue.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            title: 'Pending',
            bgColor: Colors.orange,
            value: dashboardCount.sShareWithPending,
            context: context,
            tabName: "ServiceShared",
            image:
                Image(image: AssetImage('assets/images/service-pending.png')),
            ntsType: NTSType.service),
        buildTile(
            isTile: true,
            title: 'Completed',
            bgColor: Colors.green,
            value: dashboardCount.sShareWithCompleted,
            context: context,
            tabName: "ServiceShared",
            image:
                Image(image: AssetImage('assets/images/service-completed.png')),
            ntsType: NTSType.service),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
      ],
    );
  }

  Widget noteWorklistGrid() {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        buildTile(
          isTile: false,
          title: 'Created By Me',
          // value:dashboardCount.,
          context: context,
        ),
        buildTile(
          isTile: true,
          title: 'Draft',
          bgColor: Colors.lightBlue,
          context: context,
          // value: '10',
          tabName: "userDetails",
        ),
        buildTile(
            isTile: true,
            title: 'Active',
            bgColor: Colors.green,
            context: context,
            // value: '10',
            tabName: "userDetails"),
        buildTile(
          isTile: true,
          title: 'Expired',
          bgColor: Colors.redAccent,
          context: context,
          tabName: "userDetails",
          // value: '10',
        ),
        buildTile(
          isTile: false,
          title: 'Shared By Me',
          context: context,
          // value: '10',
        ),
        buildTile(
          isTile: true,
          title: 'Active',
          bgColor: Colors.green,
          context: context,
          // value: '10',
          tabName: "NoteSharedBy",
        ),
        buildTile(
            isTile: true,
            title: 'Expired',
            bgColor: Colors.redAccent,
            context: context,
            // value: '10',
            tabName: "NoteSharedBy"),
        // buildTile(
        //     isTile: true,
        //     title: 'Completed',
        //     context: context,
        //     bgColor: Colors.green,
        //    // value: '10',
        //     tabName: "NoteSharedBy"),
        // buildTile(
        //     isTile: true,
        //     title: 'Draft',
        //     bgColor: Colors.lightBlue,
        //     context: context,
        //    // value: '10',
        //     tabName: "NoteSharedBy"),
        buildTile(
            isTile: false,
            // value: '10',
            title: 'Shared With Me/Team',
            context: context),
        buildTile(
          isTile: true,
          title: 'Active',
          bgColor: Colors.green,
          context: context,
          // value: '10',
          tabName: "NoteSharedBy",
        ),
        buildTile(
            isTile: true,
            title: 'Expired',
            bgColor: Colors.redAccent,
            context: context,
            // value: '10',
            tabName: "NoteSharedBy"),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        // StaggeredTile.extent(1, 130.0),
        // StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        // StaggeredTile.extent(1, 130.0),
      ],
    );
  }
}
