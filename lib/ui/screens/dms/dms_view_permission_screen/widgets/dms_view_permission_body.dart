import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hr_management/data/models/dms/permission/permission_model.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:listizer/listizer.dart';

import 'package:hr_management/data/models/dms/permission/permission_response_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/permission_bloc/permission_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class DMSViewPermissionBody extends StatefulWidget {
  final String noteId;
  final String parentId;
  final String workspaceId;
  final bool isManagePermission;

  const DMSViewPermissionBody({
    @required this.noteId,
    this.parentId,
    this.workspaceId,
    @required this.isManagePermission,
  });

  @override
  _DMSViewPermissionBodyState createState() => _DMSViewPermissionBodyState();
}

class _DMSViewPermissionBodyState extends State<DMSViewPermissionBody> {
  List<Permission> _permission = [];
  List<Permission> _filteredPermissionList = [];
  SlidableController _slidableController;

  List<String> type = ['Allow', 'Deny'];
  List<String> access = ['Read Only', 'Modify', 'Full Access'];
  List<String> appliesTo = [
    'Only This Folder',
    'This Folder And Files',
    'This Folder Subfolders And Files',
    'Only This Document',
    'All Documents',
  ];

  @override
  void initState() {
    permissionBloc.subject.sink.add(null);
    permissionBloc
      ..getPermissionDetails(queryparams: {
        'NoteId': widget.noteId,
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<PermissionResponse>(
        stream: permissionBloc.subject.stream,
        builder: (context, AsyncSnapshot<PermissionResponse> snapshot) {
          print("Snapshot data: ${snapshot.data}");
          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data.data.length == 0) {
              return EmptyListWidget();
            }
            _permission = snapshot.data.data;
            return Listizer(
              listItems: _permission,
              filteredSearchList: _filteredPermissionList,
              itemBuilder: (context, index) {
                return widget.isManagePermission
                    ? _slidablePermissionCard(index)
                    : _permissionCard(index: index, onTap: () {});
              },
            );
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _slidablePermissionCard(int index) {
    return Slidable(
      key: Key(_permission[index].permittedUserId),
      controller: _slidableController,
      actionPane: SlidableStrechActionPane(),
      direction: Axis.horizontal,
      actionExtentRatio: 0.20,
      actions: <Widget>[
        // IconSlideAction(
        //   caption: 'Permission',
        //   color: Colors.blue,
        //   icon: Icons.share,
        // ),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red[300],
            icon: Icons.delete,
            onTap: () {
              deleteDialog(index);
            }),
      ],
      child: _permissionCard(index: index, onTap: () {}),
    );
  }

  _permissionCard({int index, Function onTap}) {
    return Card(
      elevation: 4,
      child: ListTile(
        tileColor: Theme.of(context).notInvertedColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User/Permission Group"),
            Text(
              _permission[index].permittedUserId != null
                  ? _permission[index].permittedUserId
                  : "",
              maxLines: 2,
              style: Theme.of(context).textTheme.headline6,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        subtitle: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text("Type: "),
                      Text(_permission[index].permissionType != null
                          ? type[_permission[index].permissionType]
                          : "-"),
                    ])
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text("Access: "),
                      Text(_permission[index].access != null
                          ? access[_permission[index].access]
                          : "-"),
                    ])
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text("Applies To: "),
                      Text(_permission[index].appliesTo != null
                          ? appliesTo[_permission[index].appliesTo]
                          : "-"),
                    ])
                  ]),
            ),
            Row(
              children: <Widget>[
                // Text(
                //   _serviceList[index].leaveStatus ?? '-',
                //   style: TextStyle(color: Colors.green),
                // ),
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  deleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete document?"),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(); //Pop dialog box
                permissionBloc
                  ..deletePermission(
                      queryparams: {"Id": "${_permission[index].id}"},
                      noteId: _permission[index].noteId);
              },
            ),
          ],
        );
      },
    );
  }
}
