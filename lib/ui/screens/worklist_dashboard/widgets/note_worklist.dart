import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../data/models/worklist_dashboard/worklist_dashboard_count.dart';
import '../../../../data/models/worklist_dashboard/worklist_dashboard_response.dart';
import '../../../../logic/blocs/worklist_dashboard_bloc/worklist_dashboard_bloc.dart';
import '../../../widgets/progress_indicator.dart';

import 'tile_block.dart';

class NoteWorklist extends StatefulWidget {
  const NoteWorklist({Key key}) : super(key: key);

  @override
  _NoteWorklistState createState() => _NoteWorklistState();
}

class _NoteWorklistState extends State<NoteWorklist> {
  NoteWorklistDashboardCount dashboardCount = new NoteWorklistDashboardCount();
  void initState() {
    super.initState();
    worklistDashboardBloc..getWorklistDashboardNoteData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NoteWorklistDashboardResponse>(
        stream: worklistDashboardBloc.subjectWorklistNoteDashboardList.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            dashboardCount = snapshot.data.data;
            return noteWorklistGrid();
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        });
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
          value: dashboardCount.createdByMe,
          context: context,
        ),
        buildTile(
          isTile: true,
          title: 'Draft',
          bgColor: Colors.lightBlue,
          context: context,
          value: dashboardCount.createdByMeDraft,
          image: Image(image: AssetImage('assets/images/notes-draft.png')),
          tabName: "userDetails",
        ),
        buildTile(
            isTile: true,
            title: 'Active',
            bgColor: Colors.green,
            context: context,
            value: dashboardCount.createdByMeActive,
            image:
                Image(image: AssetImage('assets/images/notes-completed.png')),
            tabName: "userDetails"),
        buildTile(
          isTile: true,
          title: 'Expired',
          bgColor: Colors.redAccent,
          context: context,
          tabName: "userDetails",
          value: dashboardCount.createdByMeExpired,
          image: Image(image: AssetImage('assets/images/notes-overdue.png')),
        ),
        buildTile(
          isTile: false,
          title: 'Shared By Me',
          context: context,
          value: dashboardCount.sharedByMe,
        ),
        buildTile(
          isTile: true,
          title: 'Active',
          bgColor: Colors.green,
          context: context,
          value: dashboardCount.sharedByMeActive,
          image: Image(image: AssetImage('assets/images/notes-completed.png')),
          tabName: "NoteSharedBy",
        ),
        buildTile(
            isTile: true,
            title: 'Expired',
            bgColor: Colors.redAccent,
            context: context,
            value: dashboardCount.sharedByMeExpired,
            image: Image(image: AssetImage('assets/images/notes-overdue.png')),
            tabName: "NoteSharedBy"),
        buildTile(
            isTile: true,
            title: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount.sharedByMeDraft,
            image: Image(image: AssetImage('assets/images/notes-draft.png')),
            tabName: "NoteSharedBy"),
        buildTile(
            isTile: false,
            value: null, // dashboardCount.sharedwi,
            title: 'Shared With Me/Team',
            context: context),
        buildTile(
          isTile: true,
          title: 'Active',
          bgColor: Colors.green,
          context: context,
          value: dashboardCount.sharedWithMeActive,
          image: Image(image: AssetImage('assets/images/notes-completed.png')),
          tabName: "NoteSharedWith",
        ),
        buildTile(
            isTile: true,
            title: 'Expired',
            bgColor: Colors.redAccent,
            context: context,
            value: dashboardCount.sharedWithMeExpired,
            image: Image(image: AssetImage('assets/images/notes-overdue.png')),
            tabName: "NoteSharedWith"),
        buildTile(
            isTile: true,
            title: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount.sharedWithMeDraft,
            image: Image(image: AssetImage('assets/images/notes-draft.png')),
            tabName: "NoteSharedWith"),
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
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
      ],
    );
  }
}
