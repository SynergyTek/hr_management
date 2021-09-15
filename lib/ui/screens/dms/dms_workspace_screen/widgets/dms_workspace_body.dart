import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/manage_workspace_bloc/manage_workspace_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import 'package:listizer/listizer.dart';

class DMSWorkspaceBody extends StatefulWidget {
  @override
  _DMSWorkspaceBodyState createState() => _DMSWorkspaceBodyState();
}

class _DMSWorkspaceBodyState extends State<DMSWorkspaceBody> {
  List<WorkspaceViewModel> _itemList = [];
  List<WorkspaceViewModel> _filteredItemList = [];
  SlidableController _slidableController;
  bool isVisible = false;

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  apiCall() {
    dmsManageWorkspaceBloc..getWorkspaceData(queryparams: {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: DEFAULT_PADDING,
          child: StreamBuilder<WorkspaceViewResponse>(
            stream: dmsManageWorkspaceBloc.getWorkspaceSubject.stream,
            builder: (BuildContext context,
                AsyncSnapshot<WorkspaceViewResponse> snapshot) {
              if (snapshot.hasData) {
                // print("Snapshot data: ${snapshot.data.data}");
                if (snapshot.data.data == null ||
                    snapshot.data.data.length == 0) {
                  return EmptyListWidget();
                }
                _itemList = snapshot.data.data;
                return Listizer(
                  listItems: _itemList,
                  filteredSearchList: _filteredItemList,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableStrechActionPane(),
                      key: Key(_itemList[index].workspaceName),
                      controller: _slidableController,
                      direction: Axis.horizontal,
                      actionExtentRatio: 0.20,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Permission',
                          color: Colors.blue,
                          icon: Icons.share,
                          onTap: () => permissionScreen(),
                        ),
                        IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red[300],
                            icon: Icons.delete,
                            onTap: () {
                              deleteDialog(_itemList[index].noteId);
                              if (dmsManageWorkspaceBloc
                                  .getAPISubject.stream.hasValue) {
                                if (dmsManageWorkspaceBloc
                                    .getAPISubject.stream.value) {
                                  displaySnackBar(
                                      text: 'File deleted successfully',
                                      context: context);
                                  dmsManageWorkspaceBloc
                                      .getWorkspaceSubject.sink
                                      .add(null);
                                  apiCall();
                                  setState(() {
                                    isVisible = false;
                                  });
                                } else {
                                  displaySnackBar(
                                      text: 'Unable to delete file',
                                      context: context);
                                  setState(() {
                                    isVisible = false;
                                  });
                                }
                              }
                            }),
                      ],
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          tileColor: Theme.of(context).notInvertedColor,
                          title: Text(
                            _itemList[index].workspaceName != null
                                ? _itemList[index].workspaceName
                                : "-",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text("Parent Name: "),
                                        Text(_itemList[index].parentName != null
                                            ? _itemList[index].parentName
                                            : "-"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text("Legal Entity Name: "),
                                        Text(_itemList[index].legalEntityName !=
                                                null
                                            ? _itemList[index].legalEntityName
                                            : "-"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text("Created By Name: "),
                                        Text(_itemList[index].createdbyName !=
                                                null
                                            ? _itemList[index].createdbyName
                                            : "-"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () => _handleEditWorkspaceOnTap(
                              id: _itemList[index].noteId),
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
        ),
        // Visibility(
        //     visible: isVisible,
        //     child: Center(
        //       child: CustomProgressIndicator(),
        //     ))
      ],
    );
  }

  _handleEditWorkspaceOnTap({
    String id,
  }) {
    Navigator.of(context).pushNamed(
      DMS_MANAGE_WORKSPACE_ROUTE,
      arguments: ScreenArguments(
        arg1: id ?? "",
      ),
    );
  }

  permissionScreen() {
    print('permission----');
    return Container();
  }

  deleteDialog(String id) {
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
                dmsManageWorkspaceBloc
                  ..deleteWorkspace(queryparams: {"NoteId": '$id' ?? ""});
                setState(() {
                  isVisible = true;
                });

                if (dmsManageWorkspaceBloc.getAPISubject.stream.hasValue) {
                  if (dmsManageWorkspaceBloc.getAPISubject.stream.value) {
                    displaySnackBar(
                        text: 'File deleted successfully', context: context);
                    dmsManageWorkspaceBloc.getWorkspaceSubject.sink.add(null);
                    apiCall();
                    setState(() {
                      isVisible = false;
                    });
                  } else {
                    displaySnackBar(
                        text: 'Unable to delete file', context: context);
                    setState(() {
                      isVisible = false;
                    });
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
