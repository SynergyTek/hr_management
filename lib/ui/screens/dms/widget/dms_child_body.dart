import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_files_response.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/doc_files_model.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_crud_note_bloc/dms_crud_note_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/manage_document/document/widgets/document_bottom_sheet_widget.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../../../themes/theme_config.dart';
import 'package:listizer/listizer.dart';

class DMSChildBody extends StatefulWidget {
  final Cwd parentModel;
  final String parentPath;
  final OnTapPressedCallBack callBack;
  const DMSChildBody(
      {Key key, this.parentModel, this.parentPath, this.callBack})
      : super(key: key);

  @override
  _DMSChildBodyState createState() => _DMSChildBodyState();
}

class _DMSChildBodyState extends State<DMSChildBody> {
  List<Cwd> childList = [];
  List<Cwd> filterChildList = [];
  @override
  void initState() {
    // TODO: KM Fix id Issue on popback
    dmsBloc.postGetDMSFilesChildData(
        dmsPostModel: DmsPostModel(
      action: "read",
      path: "${widget.parentPath}",
      showHiddenItems: false,
      data: [widget.parentModel],
      userId: "45bba746-3309-49b7-9c03-b5793369d73c",
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h),
      child: StreamBuilder<DMSFilesResponse>(
        stream: dmsBloc.subjectDMSGetFilesChildResponse.stream,
        builder: (context, AsyncSnapshot<DMSFilesResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            childList = snapshot.data.data.files;
            if (childList.isEmpty) {
              return EmptyFolderWidget();
            }
            return Listizer(
              listItems: childList,
              filteredSearchList: filterChildList,
              showSearchBar: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(
                      filterChildList[index].templateCode ==
                                  'WORKSPACE_GENERAL' ||
                              filterChildList[index].templateCode ==
                                  'GENERAL_FOLDER'
                          ? CustomIcons.folder
                          : CustomIcons.file_alt,
                      color: filterChildList[index].templateCode ==
                              'WORKSPACE_GENERAL'
                          ? Colors.blue
                          : filterChildList[index].templateCode ==
                                  'GENERAL_FOLDER'
                              ? Colors.yellow
                              : Colors.cyan,
                    ),
                    title: Text(
                      filterChildList[index].name,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        filterChildList[index].count != null &&
                                filterChildList[index].templateCode != 'FILE'
                            ? CircleAvatar(
                                radius: 11,
                                child: Text(
                                  filterChildList[index].count,
                                  style: TextStyle(fontSize: 12),
                                ))
                            : SizedBox(),
                        IconButton(
                          onPressed: () => bottomSheet(
                            filterChildList[index].name,
                            filterChildList[index].id,
                          ),
                          icon: Icon(Icons.more_vert_rounded),
                        )
                      ],
                    ),
                    onTap: () {
                      if (filterChildList[index].templateCode != 'FILE') {
                        dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
                        String parentPath = widget.parentPath +
                            '/' +
                            filterChildList[index].id +
                            '/';
                        Navigator.pushNamed(
                          context,
                          DMS_CHILD,
                          arguments: ScreenArguments(
                              arg1: filterChildList[index].name,
                              arg2: parentPath,
                              dmsParentModel: filterChildList[index],
                              callBack: (dynamic value, dynamic value2,
                                  dynamic value3) {
                                dmsBloc.postGetDMSFilesChildData(
                                    dmsPostModel: DmsPostModel(
                                  action: "read",
                                  path: "${widget.parentPath}",
                                  showHiddenItems: false,
                                  data: [widget.parentModel],
                                  userId:
                                      "45bba746-3309-49b7-9c03-b5793369d73c",
                                ));
                              }),
                        );
                      }
                    },
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
    );
  }

  bottomSheet(String title, String id) {
    showDocumentBottomSheet(
      bottomSheetDataList: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: title,
                subtitle: 'Folder Name',
                isHeading: true,
              ),
            )
          ],
        ),
        ListTile(
          leading: Icon(CustomIcons.trash),
          title: Text('Delete'),
          onTap: () => deleteDialog(id),
        ),
        ListTile(
          leading: Icon(CustomIcons.copy),
          title: Text('Copy'),
          // onTap: () => dmsCrudNoteBloc..getCopyNoteAPIData(sourceId: sourceId, targetId: targetId, userId: userId),
        ),
        ListTile(
          leading: Icon(CustomIcons.expand_arrows),
          title: Text('Move'),
          // onTap: () => dmsCrudNoteBloc..getMoveNoteAPIData(sourceId: sourceId, targetId: targetId),
        ),
        ListTile(
          leading: Icon(CustomIcons.archive),
          title: Text('Archive'),
          onTap: () => archiveDialog(id),
        ),
        ListTile(
          leading: Icon(CustomIcons.edit),
          title: Text('Rename'),
          onTap: () => renameDialog(title),
        ),
        ListTile(
          leading: Icon(CustomIcons.search),
          title: Text('Search'),
          // onTap: () => dmsCrudNoteBloc..postSearchFilesAPIData(model: model),
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
                Navigator.of(context).pop();
                dmsCrudNoteBloc..getDeleteNoteAPIData(id: id);

                displaySnackBar(
                    text: dmsCrudNoteBloc.deleteNoteSubject.stream.value);
              },
            ),
          ],
        );
      },
    );
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
                Navigator.of(context).pop();
                dmsCrudNoteBloc..getArchiveNoteAPIData(id: id);

                displaySnackBar(
                    text: dmsCrudNoteBloc.archiveNoteSubject.stream.value);
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
                if (form.currentState.validate()) {
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
        validator: validator,
      ),
    );
  }

  showDocumentBottomSheet({@required List<Widget> bottomSheetDataList}) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DocumentBottomSheetWidget(
          bottomSheetDataList: bottomSheetDataList ?? [],
        );
      },
    );
  }

  Widget _statisticWidget({
    @required BuildContext context,
    String title,
    String subtitle,
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
}
