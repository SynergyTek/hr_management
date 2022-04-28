import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../listizer/listizer.dart';
import '../../../../widgets/custom_icons.dart';
import '../../../manage_document/document/widgets/document_bottom_sheet_widget.dart';

class DMSWorkspaceBody extends StatefulWidget {
  @override
  _DMSWorkspaceBodyState createState() => _DMSWorkspaceBodyState();
}

class _DMSWorkspaceBodyState extends State<DMSWorkspaceBody> {
  List<WorkspaceViewModel>? _itemList = [];
  List<WorkspaceViewModel> _filteredItemList = [];
  SlidableController? _slidableController;
  bool isVisible = false;

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  apiCall() {
    dmsManageWorkspaceBloc
      ..getWorkspaceData(
        queryparams: {
          'userid':
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR"
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: DEFAULT_PADDING,
          child: StreamBuilder<WorkspaceViewResponse?>(
            stream: dmsManageWorkspaceBloc.getWorkspaceSubject.stream,
            builder: (BuildContext context,
                AsyncSnapshot<WorkspaceViewResponse?> snapshot) {
              if (snapshot.hasData) {
                // print("Snapshot data: ${snapshot.data.data}");
                if (snapshot.data!.data == null ||
                    snapshot.data!.data!.length == 0) {
                  return EmptyListWidget();
                }
                _itemList = snapshot.data!.data;
                return Listizer(
                  listItems: _itemList,
                  filteredSearchList: _filteredItemList,
                  itemBuilder: (context, index) {
                    return
                        // Slidable(
                        //   actionPane: SlidableStrechActionPane(),
                        //   key: Key(_itemList![index].workspaceName!),
                        //   controller: _slidableController,
                        //   direction: Axis.horizontal,
                        //   actionExtentRatio: 0.20,
                        //   actions: <Widget>[
                        //     IconSlideAction(
                        //       caption: 'Permission',
                        //       color: Colors.blue,
                        //       icon: Icons.share,
                        //       onTap: () => permissionScreen(),
                        //     ),
                        //     IconSlideAction(
                        //         caption: 'Delete',
                        //         color: Colors.red[300],
                        //         icon: Icons.delete,
                        //         onTap: () {
                        //           deleteDialog(_itemList![index].noteId);
                        //           if (dmsManageWorkspaceBloc
                        //               .getAPISubject.stream.hasValue) {
                        //             if (dmsManageWorkspaceBloc
                        //                 .getAPISubject.stream.value) {
                        //               displaySnackBar(
                        //                   text: 'File deleted successfully',
                        //                   context: context);
                        //               dmsManageWorkspaceBloc
                        //                   .getWorkspaceSubject.sink
                        //                   .add(null);
                        //               apiCall();
                        //               setState(() {
                        //                 isVisible = false;
                        //               });
                        //             } else {
                        //               displaySnackBar(
                        //                   text: 'Unable to delete file',
                        //                   context: context);
                        //               setState(() {
                        //                 isVisible = false;
                        //               });
                        //             }
                        //           }
                        //         }),
                        //   ],
                        //   child:
                        Card(
                      elevation: 4,
                      child: ListTile(
                        tileColor: Theme.of(context).notInvertedColor,
                        title: Text(
                          _itemList![index].workspaceName != null
                              ? _itemList![index].workspaceName!
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
                                      Text(_itemList![index].parentName != null
                                          ? _itemList![index].parentName!
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
                                      Text(_itemList![index].legalEntityName !=
                                              null
                                          ? _itemList![index].legalEntityName!
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
                                      Text(_itemList![index].createdbyName !=
                                              null
                                          ? _itemList![index].createdbyName!
                                          : "-"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () => bottomSheet(_itemList![index]
                            // _itemList![index].workspaceName,
                            // _itemList![index].workspaceId
                            // snapshot.data!.list[0].fileId,
                            // filterChildList[index].name,
                            // filterChildList[index].id,
                            // snapshot.data!.data!.cwd!.id,
                            // data: filterChildList[index],
                            ),
                      ),
                      // ),
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

  bottomSheet(
    WorkspaceViewModel? model,
    // String? path,
  ) {
    showDocumentBottomSheet(
      bottomSheetDataList: [
        ListTile(
          leading: Icon(CustomIcons.folder_upload),
          title: Text('Permission'),
          onTap: () => permissionScreen(model),
          // onTap: () => deleteDialog(id),
        ),
        ListTile(
          leading: Icon(CustomIcons.copy),
          title: Text('Edit'),
          onTap: () => _handleEditWorkspaceOnTap(id: model?.noteId),
        ),
        ListTile(
          leading: Icon(CustomIcons.trash),
          title: Text('Delete'),
          onTap: () => deleteDialog(model?.noteId),
        ),
      ],
    );
  }

  showDocumentBottomSheet({required List<Widget> bottomSheetDataList}) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DocumentBottomSheetWidget(
          bottomSheetDataList: bottomSheetDataList,
        );
      },
    );
  }

  _handleEditWorkspaceOnTap({
    String? id,
    String? parentNoteId,
  }) {
    Navigator.of(context)
        .pushNamed(
          DMS_MANAGE_WORKSPACE_ROUTE,
          arguments: ScreenArguments(
            arg1: id ?? "",
          ),
        )
        .then((value) => apiCall());
  }

  permissionScreen(WorkspaceViewModel? model) {
    print('permission----');
    Navigator.pushNamed(
      context,
      DMS_VIEW_PERMISSION_ROUTE,
      arguments: ScreenArguments(
          arg1: model?.noteId,
          arg2: model?.parentNoteId,
          arg3: model?.workspaceId,
          val1: false),
      // DMS_ADD_EDIT_PERMISSION_ROUTE,
    );
    // return Container();
  }

  deleteDialog(String? id) {
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
                Navigator.of(context).pop(); //Pop dialog box

                dmsManageWorkspaceBloc
                  ..deleteWorkspace(queryparams: {"noteId": '$id'});
                setState(() {
                  isVisible = true;
                });

                if (dmsManageWorkspaceBloc.getAPISubject.stream.hasValue) {
                  if (dmsManageWorkspaceBloc.getAPISubject.stream.value !=
                      null) {
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
