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

class NoteWorklist extends StatefulWidget {
  const NoteWorklist({Key? key}) : super(key: key);

  @override
  _NoteWorklistState createState() => _NoteWorklistState();
}

class _NoteWorklistState extends State<NoteWorklist> {
  NoteWorklistDashboardCount? dashboardCount = new NoteWorklistDashboardCount();
  void initState() {
    super.initState();
    worklistDashboardBloc
      ..getWorklistDashboardNoteData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() {
    return {
      'userid':
          BlocProvider.of<UserModelBloc>(context).state.userModel!.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NoteWorklistDashboardResponse>(
        stream: worklistDashboardBloc.subjectWorklistNoteDashboardList.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != null && snapshot.data!.error!.length > 0) {
              return Center(
                child: Text(snapshot.data!.error!),
              );
            }
            dashboardCount = snapshot.data!.data;
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
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      children: <Widget>[
        buildTile(
          isTile: false,
          status: 'Created by Me',
          value: dashboardCount!.createdByMe,
          context: context,
        ),
        buildTile(
          isTile: true,
          status: 'Expired',
          bgColor: Colors.redAccent,
          context: context,
          tabName: "userDetails",
          mode: 'REQ_BY',
          value: dashboardCount!.createdByMeExpired,
          ntsType: NTSType.note,
          image: Image(
            image: AssetImage('assets/images/notes-overdue.png'),
          ),
        ),
        buildTile(
            isTile: true,
            status: 'Complete',
            bgColor: Colors.green,
            context: context,
            value: dashboardCount!.createdByMeActive,
            image:
                Image(image: AssetImage('assets/images/notes-completed.png')),
            tabName: "userDetails",
            ntsType: NTSType.note,
            mode: 'REQ_BY'),
        buildTile(
            isTile: true,
            status: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount!.createdByMeDraft,
            image: Image(image: AssetImage('assets/images/notes-draft.png')),
            tabName: "userDetails",
            ntsType: NTSType.note,
            mode: 'REQ_BY'),
        buildTile(
          isTile: false,
          status: 'Shared by Me',
          context: context,
          value: dashboardCount!.sharedByMe,
        ),
        buildTile(
            isTile: true,
            status: 'Expired',
            bgColor: Colors.redAccent,
            context: context,
            value: dashboardCount!.sharedByMeExpired,
            image: Image(image: AssetImage('assets/images/notes-overdue.png')),
            tabName: "NoteSharedBy",
            ntsType: NTSType.note,
            mode: 'ASSIGN_BY'),
        buildTile(
            isTile: true,
            status: 'Complete',
            bgColor: Colors.green,
            context: context,
            value: dashboardCount!.sharedByMeActive,
            ntsType: NTSType.note,
            image:
                Image(image: AssetImage('assets/images/notes-completed.png')),
            tabName: "NoteSharedBy",
            mode: 'ASSIGN_BY'),
        buildTile(
            isTile: true,
            status: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount!.sharedByMeDraft,
            image: Image(image: AssetImage('assets/images/notes-draft.png')),
            tabName: "NoteSharedBy",
            ntsType: NTSType.note,
            mode: 'ASSIGN_BY'),
        buildTile(
            isTile: false,
            value: null, // dashboardCount.sharedwi,
            status: 'Shared with Me/Team',
            context: context),
        buildTile(
            isTile: true,
            status: 'Expired',
            bgColor: Colors.redAccent,
            context: context,
            value: dashboardCount!.sharedWithMeExpired,
            image: Image(image: AssetImage('assets/images/notes-overdue.png')),
            ntsType: NTSType.note,
            tabName: "NoteSharedWith",
            mode: 'SHARE_TO'),
        buildTile(
            isTile: true,
            status: 'Complete',
            bgColor: Colors.green,
            context: context,
            value: dashboardCount!.sharedWithMeActive,
            ntsType: NTSType.note,
            image:
                Image(image: AssetImage('assets/images/notes-completed.png')),
            tabName: "NoteSharedWith",
            mode: 'SHARE_TO'),
        buildTile(
            isTile: true,
            status: 'Draft',
            bgColor: Colors.lightBlue,
            context: context,
            value: dashboardCount!.sharedWithMeDraft,
            image: Image(image: AssetImage('assets/images/notes-draft.png')),
            ntsType: NTSType.note,
            tabName: "NoteSharedWith",
            mode: 'SHARE_TO'),
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
        StaggeredTile.extent(3, 60.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
      ],
    );
  }
}
