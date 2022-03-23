import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/dms_files_response.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_crud_note_bloc/dms_crud_note_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/manage_document/document/widgets/document_bottom_sheet_widget.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../../../themes/theme_config.dart';

class DMSParentBody extends StatefulWidget {
  final String? sourceId;
  final bool? isCopy;
  final bool? isCut;

  const DMSParentBody({Key? key, this.sourceId, this.isCopy, this.isCut})
      : super(key: key);

  @override
  _DMSParentBodyState createState() => _DMSParentBodyState();
}

class _DMSParentBodyState extends State<DMSParentBody> {
  List<Cwd>? childList = [];
  List<Cwd> filterChildList = [];
  TextEditingController searchWorkspaceTextController = TextEditingController();
  bool isSearch = false;
  List<String?> pathList = [];
  List<String> parentPathList = [];
  List<Cwd> parentModelList = [];
  String? sourceId;
  bool? isCopy = false;
  bool? isCut = false;

  @override
  void initState() {
    apiCall();
    isCopy = widget.isCopy;
    isCut = widget.isCut;
    sourceId = widget.sourceId;
    super.initState();
  }

  apiCall() {
    dmsBloc.postGetDMSFilesData(
        dmsPostModel: DmsPostModel(
      action: "read",
      path: "/",
      showHiddenItems: false,
      data: [],
      userId: BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h),
      child: StreamBuilder<DMSFilesResponse>(
        stream: dmsBloc.subjectDMSGetFilesResponse.stream,
        builder: (context, AsyncSnapshot<DMSFilesResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != null &&
                snapshot.data!.error!.length > 0) {
              return Center(
                child: Text(snapshot.data!.error!),
              );
            }
            childList = snapshot.data!.data!.files;
            if (!isSearch) {
              filterChildList.clear();
              filterChildList.addAll(childList!);
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  _searchBarBuilder(context),
                  Card(
                    elevation: 4,
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      leading: Icon(CustomIcons.user),
                      title: Text('Administrator'),
                      children: [
                        Container(
                          height: 75.h,
                          child: ListView.builder(
                            itemCount: filterChildList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: Icon(
                                    CustomIcons.folder,
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                    filterChildList[index].name!,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      filterChildList[index].count != null
                                          ? CircleAvatar(
                                              radius: 11,
                                              child: Text(
                                                filterChildList[index].count!,
                                                style: TextStyle(fontSize: 12),
                                              ))
                                          : SizedBox(),
                                      IconButton(
                                        onPressed: () => bottomSheet(
                                          filterChildList[index].name,
                                          filterChildList[index].id,
                                          snapshot.data!.data!.cwd!.id,
                                          data: filterChildList[index],
                                        ),
                                        icon: Icon(Icons.more_vert_rounded),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    pathList
                                      ..clear()
                                      ..add('Administrator')
                                      ..add(filterChildList[index].name);

                                    parentModelList
                                      ..clear()
                                      ..add(filterChildList[index]);

                                    String parentPath =
                                        snapshot.data!.data!.cwd!.id! +
                                            '/' +
                                            filterChildList[index].id! +
                                            '/';

                                    parentPathList
                                      ..clear()
                                      ..add(parentPath);

                                    dmsBloc.subjectDMSGetFilesChildResponse.sink
                                        .add(null);
                                    Navigator.pushNamed(
                                      context,
                                      DMS_CHILD,
                                      arguments: ScreenArguments(
                                          dmsParentModelList: parentModelList,
                                          list1: pathList,
                                          list2: parentPathList,
                                          arg1: filterChildList[index].name,
                                          arg2: parentPath,
                                          dmsParentModel:
                                              filterChildList[index],
                                          callBack: (dynamic value,
                                              dynamic value2, dynamic value3) {
                                            dmsBloc
                                                .subjectDMSGetFilesChildResponse
                                                .sink
                                                .add(null);
                                          }),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

  bottomSheet(
    String? title,
    String? id,
    String? path, {
    Cwd? data,
  }) {
    showDocumentBottomSheet(
      bottomSheetDataList: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: title,
                subtitle: '',
                isHeading: true,
              ),
            )
          ],
        ),
        ListTile(
          leading: Icon(
            CustomIcons.folder,
            color: Colors.blue,
          ),
          title: Text('Create Workspace'),
          onTap: () => _handleCreateWorkspaceOnTap(),
        ),
        ListTile(
          leading: Icon(
            CustomIcons.folder,
            color: Colors.blue,
          ),
          title: Text('Edit Workspace'),
          onTap: () => _handleEditWorkspaceOnTap(
            id,
            data: data!,
          ),
        ),
        ListTile(
          leading: Icon(
            CustomIcons.folder,
            color: Colors.yellow,
          ),
          title: Text('Create Folder'),
          onTap: () => _handleCreateNewFolderOnTap(id),
        ),
        ListTile(
          leading: Icon(CustomIcons.folder_upload),
          title: Text('Upload Folder'),
          // onTap: () => deleteDialog(id),
        ),

        // ListTile(
        //   leading: Icon(CustomIcons.trash),
        //   title: Text('Delete'),
        //   onTap: () => deleteDialog(id),
        // ),
        // ListTile(
        //   leading: Icon(CustomIcons.copy),
        //   title: Text('Copy'),
        //   // onTap: () => dmsCrudNoteBloc..getCopyNoteAPIData(sourceId: sourceId, targetId: targetId, userId: userId),
        // ),
        // ListTile(
        //   leading: Icon(CustomIcons.expand_arrows),
        //   title: Text('Move'),
        //   // onTap: () => dmsCrudNoteBloc..getMoveNoteAPIData(sourceId: sourceId, targetId: targetId),
        // ),
        // ListTile(
        //   leading: Icon(CustomIcons.archive),
        //   title: Text('Archive'),
        //   onTap: () => archiveDialog(id),
        // ),
        // ListTile(
        //   leading: Icon(CustomIcons.edit),
        //   title: Text('Rename'),
        //   onTap: () => renameDialog(title),
        // ),
        ListTile(
          leading: Icon(CustomIcons.sticky_note),
          title: Text('View Details'),
          onTap: () {
            Navigator.pushNamed(
              context,
              ADD_EDIT_NOTE_ROUTE,
              arguments: ScreenArguments(
                arg1: '',
                arg2: id,
                // arg3: filterChildList[index].noteSubject
              ),
            );
          },
        ),
      ],
    );
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
                Navigator.of(context).pop(); //Pop bottom sheet
                // setState(() {
                //   isVisible = true;
                // });
                dmsCrudNoteBloc..getDeleteNoteAPIData(id: id);

                if (dmsCrudNoteBloc.deleteNoteSubject.stream.hasValue) {
                  if (dmsCrudNoteBloc.deleteNoteSubject.stream.value) {
                    displaySnackBar(
                        text: 'File deleted successfully', context: context);
                    dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
                    apiCall();
                  } else {
                    displaySnackBar(
                        text: 'Unable to delete file', context: context);
                  }
                }
                // setState(() {
                //   isVisible = false;
                // });
              },
            ),
          ],
        );
      },
    );
  }

  copyDialog(String id) {
    Navigator.pop(context);
    sourceId = id;
    setState(() {
      isCopy = true;
      isCut = false;
    });
  }

  cutDialog(String id) {
    Navigator.pop(context);
    sourceId = id;
    setState(() {
      isCut = true;
      isCopy = false;
    });
  }

  pasteDialog(String _path) {
    // String _path;
    // int length = widget.parentPath.split('/').length;
    // _path = widget.parentPath.split('/')[length - 2];
    Navigator.pop(context);
    if (widget.isCopy! || isCopy!) {
      dmsCrudNoteBloc
        ..getCopyNoteAPIData(
            sourceId: sourceId,
            // sourceId: widget.sourceId,
            targetId: _path,
            userId: '45bba746-3309-49b7-9c03-b5793369d73c');
      if (dmsCrudNoteBloc.copyNoteSubject.stream.hasValue) {
        if (dmsCrudNoteBloc.copyNoteSubject.stream.value) {
          displaySnackBar(text: 'File copied successfully', context: context);
          dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
          apiCall();
          isCopy = false;
          isCut = false;
        } else {
          displaySnackBar(text: 'Unable to copy file', context: context);
        }
      }

      sourceId = '';
    } else if (widget.isCut! || isCut!) {
      dmsCrudNoteBloc..getMoveNoteAPIData(sourceId: sourceId, targetId: _path);
      if (dmsCrudNoteBloc.moveNoteSubject.stream.hasValue) {
        if (dmsCrudNoteBloc.moveNoteSubject.stream.value) {
          displaySnackBar(text: 'File moved successfully', context: context);
          dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
          apiCall();
          isCopy = false;
          isCut = false;
        } else {
          displaySnackBar(text: 'Unable to move file', context: context);
        }
      }

      sourceId = '';
    }
  }

  archiveDialog(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:
              Text("Are you sure you want to move the document to archive?"),
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
                "Archive",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(); //Pop dialog box
                Navigator.of(context).pop(); //Pop bottom sheet
                // setState(() {
                //   isVisible = true;
                // });
                dmsCrudNoteBloc..getArchiveNoteAPIData(id: id);

                if (dmsCrudNoteBloc.archiveNoteSubject.stream.hasValue) {
                  if (dmsCrudNoteBloc.archiveNoteSubject.stream.value) {
                    displaySnackBar(
                        text: 'File saved to archive successfully',
                        context: context);
                    dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
                    apiCall();
                  } else {
                    displaySnackBar(
                        text: 'Unable to save file to archive',
                        context: context);
                  }
                }
                // setState(() {
                //   isVisible = false;
                // });
                // displaySnackBar(
                //     text: dmsCrudNoteBloc.archiveNoteSubject.stream.value);
              },
            ),
          ],
        );
      },
    );
  }

  renameDialog(String name) {
    TextEditingController _nameController = TextEditingController();
    final form = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Are you sure you want to rename $name?"),
                textField(
                    false,
                    _nameController,
                    'New Name',
                    'Please Enter New Name',
                    (val) => (val == null || val.isEmpty)
                        ? 'Please Enter New Name'
                        : null)
              ],
            ),
          ),
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
                "Rename",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                if (form.currentState!.validate()) {
                  Navigator.of(context).pop();
                  // dmsCrudNoteBloc..getRenameFilesAPIData(model: model);

                  // displaySnackBar(
                  //     text: dmsCrudNoteBloc.archiveNoteSubject.stream.value);
                }
              },
            ),
          ],
        );
      },
    );
  }

  textField(bool obscureText, TextEditingController controller, String label,
      String hint, Function validator) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white70,
          filled: true,
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
        validator: validator as String? Function(String?)?,
      ),
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

  Widget _statisticWidget({
    required BuildContext context,
    String? title,
    String? subtitle,
    bool isHeading = false,
  }) {
    return ListTile(
      title: Text(
        title ?? '-',
        style: TextStyle(
          color:
              isHeading ? Theme.of(context).textHeadingColor : Colors.black87,
        ),
      ),
      subtitle: Text(subtitle ?? '-'),
    );
  }

  Widget _searchBarBuilder(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        onChanged: (value) {
          filterSearchResults(value);
        },
        controller: searchWorkspaceTextController,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
            labelText: "Search",
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[400],
            ),
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.cancel,
                  size: 22.0,
                ),
                onPressed: reset),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
      ),
    );
  }

  void filterSearchResults(String searchText) {
    setState(() {
      filterChildList.clear();
      if (searchText.isNotEmpty) {
        isSearch = true;
        childList!.forEach((item) {
          if (item.searchS != null &&
              item.searchS!.toLowerCase().contains(searchText.toLowerCase())) {
            filterChildList.add(item);
          }
        });
      } else {
        isSearch = false;
      }
    });
  }

  void reset() {
    setState(() {
      isSearch = false;
      searchWorkspaceTextController.clear();
      filterChildList.clear();
      filterChildList.addAll(childList!);
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  _handleCreateNewFolderOnTap(String? id) {
    Navigator.of(context).pushNamed(
      DMS_NEW_FOLDER_ROUTE,
      arguments: ScreenArguments(
        arg1: id,
      ),
    );
  }

  _handleCreateWorkspaceOnTap() {
    Navigator.of(context).pushNamed(
      DMS_MANAGE_WORKSPACE_ROUTE,
    );
  }

  _handleEditWorkspaceOnTap(
    String? id, {
    required Cwd data,
  }) {
    Navigator.of(context).pushNamed(
      DMS_MANAGE_WORKSPACE_ROUTE,
      arguments: ScreenArguments(
        arg1: data.id ?? "",
      ),
    );
  }
}
