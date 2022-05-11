import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/cut_copy_paste_model/cut_copy_paste_model.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/dms_source_folder_model/dms_source_folder_model.dart';
import 'package:hr_management/data/models/dms/permission/permission_model.dart';
import 'package:hr_management/data/models/note/note_model.dart';
import 'package:hr_management/data/models/uploaded_content_model/uploaded_content_model.dart';
import 'package:hr_management/logic/blocs/attachment_nts_bloc/attachment_nts_bloc.dart';
import 'package:hr_management/logic/blocs/cut_copy_paste_bloc/cut_copy_paste_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_crud_note_bloc/dms_crud_note_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_doc_api_bloc.dart';
import 'package:hr_management/logic/blocs/dms_bloc/permission_bloc/permission_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/manage_document/document/widgets/document_bottom_sheet_widget.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../data/helpers/download_helper/downloader_screen/downloader.dart';
import '../../../widgets/snack_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../../../themes/theme_config.dart';
import '../../../../data/models/dms/dms_source_folder_model/dms_source_folder_response.dart';
import '../../../../logic/blocs/dms_bloc/dms_source_folders_bloc/dms_source_folders_bloc.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../listizer/listizer.dart';
import '../../../widgets/custom_controls/archive.dart';

class DMSChildBody extends StatefulWidget {
  final DMSSourceFolderModel? parentModel;
  final String? parentPath;
  final OnTapPressedCallBack? callBack;
  final List<String?>? path;
  final List<String>? parentPathList;
  final List<DMSSourceFolderModel>? parentModelList;
  final String? parentName;
  final String? sourceId;
  final bool? isCopy;
  final bool? isCut;
  const DMSChildBody({
    Key? key,
    this.parentModel,
    this.parentPath,
    this.callBack,
    this.path,
    this.parentPathList,
    this.parentModelList,
    this.parentName,
    this.sourceId,
    this.isCopy,
    this.isCut,
  }) : super(key: key);

  @override
  _DMSChildBodyState createState() => _DMSChildBodyState();
}

class _DMSChildBodyState extends State<DMSChildBody> {
  List<DMSSourceFolderModel>? childList = [];
  List<DMSSourceFolderModel> filterChildList = [];
  List<String?>? childPath = [];
  List<String>? parentPathList = [];
  List<DMSSourceFolderModel>? parentModelList = [];
  bool isVisible = false;
  String? sourceId;
  bool? isCopy = false;
  bool? isCut = false;
  TextEditingController fileAttachmentController = TextEditingController();

  @override
  void initState() {
    apiCall();
    super.initState();

    print(widget.isCopy);
    isCopy = widget.isCopy;
    isCut = widget.isCut;
    childPath = widget.path;
    print(childPath);
    parentPathList = widget.parentPathList;
    parentModelList = widget.parentModelList;
    sourceId = widget.sourceId;
  }

  apiCall() {
    dmsSourceFolderBloc.subjectChildData.sink.add(null);
    dmsSourceFolderBloc.getDMSChildFolderAndDocumentsData(
      queryparams: {
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            'HR',
        "key": widget.parentModel?.key ?? '',
      },
    );

    // TODO: KM Fix id Issue on popback
    // dmsBloc.postGetDMSFilesChildData(
    //     dmsPostModel: DmsPostModel(
    //   action: "read",
    //   path: "${widget.parentPath}",
    //   showHiddenItems: false,
    //   data: [widget.parentModel],
    //   userId: "45bba746-3309-49b7-9c03-b5793369d73c",
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 90.h,
        padding: EdgeInsets.only(top: 2.h),
        // child: StreamBuilder<DMSFilesResponse?>(
        //   stream: dmsBloc.subjectDMSGetFilesChildResponse.stream,
        //   builder: (context, AsyncSnapshot<DMSFilesResponse?> snapshot) {
        child: StreamBuilder<DMSSourceFolderResponse?>(
          stream: dmsSourceFolderBloc.subjectChildData.stream,
          builder: (context, AsyncSnapshot<DMSSourceFolderResponse?> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error != null &&
                  snapshot.data!.error!.length > 0) {
                return Center(
                  child: Text(snapshot.data!.error!),
                );
              }
              childList = snapshot.data!.list;
              // childList = snapshot.data!.data!.files;
              if (childList!.isEmpty) {
                return Column(
                  children: [
                    // _breadCrumb(),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: EmptyFolderWidget(),
                    ),
                  ],
                );
              }
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    _breadCrumb(),
                    _itemList(),
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
      ),
      Visibility(
        visible: isVisible,
        child: Center(
          child: CustomProgressIndicator(),
        ),
      ),
    ]);
  }

  _breadCrumb() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1), blurRadius: 3, color: Colors.black26)
          ]),
      padding: EdgeInsets.all(8),
      child: BreadCrumb.builder(
        itemCount: childPath!.length,
        builder: (index) {
          return BreadCrumbItem(
              content: Text(childPath![index]!),
              borderRadius: BorderRadius.circular(4),
              padding: EdgeInsets.all(4),
              onTap: () {
                if (childPath![index] == 'Administrator') {
                  _preProcess(index);
                  Navigator.pushNamed(
                    context,
                    DMS_PARENT,
                  );
                } else if (index == childPath!.length - 1) {
                  print('Same folder');
                } else {
                  _preProcess(index);
                  Navigator.pushNamed(
                    context,
                    DMS_CHILD,
                    arguments: ScreenArguments(
                      list1: childPath,
                      list2: parentPathList,
                      arg1: childPath![index],
                      arg2: parentPathList![index - 1],
                      dmsParentModel: parentModelList![index - 1],
                      dmsParentModelList: parentModelList,
                      callBack:
                          (dynamic value, dynamic value2, dynamic value3) {
                        dmsBloc.postGetDMSFilesChildData(
                            dmsPostModel: DmsPostModel(
                          action: "read",
                          path: "${widget.parentPath}",
                          showHiddenItems: false,
                          data: [widget.parentModel],
                          userId: BlocProvider.of<UserModelBloc>(context)
                                  .state
                                  .userModel
                                  ?.id ??
                              '',
                        ));
                      },
                    ),
                  );
                }
              });
        },
        divider: Icon(
          Icons.chevron_right,
          color: Colors.black,
        ),
        overflow: ScrollableOverflow(),
      ),
    );
  }

  _preProcess(int index) {
    for (var i = childPath!.length - 2; i > index - 1; i--) {
      parentPathList!.remove(parentPathList![i]);
      parentModelList!.remove(parentModelList![i]);
      Navigator.pop(context);
    }

    for (var i = childPath!.length - 1; i > index; i--) {
      childPath!.remove(childPath![i]);
    }
    dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
  }

  _itemList() {
    return Container(
      height: 75.h,
      child: Listizer(
        listItems: childList,
        filteredSearchList: filterChildList,
        showSearchBar: true,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(
                filterChildList[index].templateCode == 'WORKSPACE_GENERAL' ||
                        filterChildList[index].templateCode == 'GENERAL_FOLDER'
                    ? CustomIcons.folder
                    : CustomIcons.file_alt,
                color: filterChildList[index].templateCode ==
                        'WORKSPACE_GENERAL'
                    ? Colors.blue
                    : filterChildList[index].templateCode == 'GENERAL_FOLDER'
                        ? Colors.yellow
                        : Colors.cyan,
              ),
              title: Text(
                filterChildList[index].title ?? '',
                // filterChildList[index].name!,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  filterChildList[index].count != null &&
                          filterChildList[index].templateCode ==
                              'GENERAL_FOLDER' //||
                      // filterChildList[index].templateCode !='GENERAL_DOCUMENT' &&
                      // filterChildList[index].templateCode !='GENERAL_DOCUMENT' &&
                      // filterChildList[index].templateCode !='GENERAL_DOCUMENT' &&
                      // filterChildList[index].templateCode != 'PROJECT_DOCUMENTS'
                      ? CircleAvatar(
                          radius: 11,
                          child: Text(
                            filterChildList[index].count!,
                            style: TextStyle(fontSize: 12),
                          ))
                      : SizedBox(),
                  IconButton(
                    onPressed: () => bottomSheet(
                      filterChildList[index],
                    ),
                    icon: Icon(Icons.more_vert_rounded),
                  )
                ],
              ),
              onTap: () {
                String? userId =
                    BlocProvider.of<UserModelBloc>(context).state.userModel?.id;
                int _index = index;
                print(filterChildList[index].key);
                if (filterChildList[index].document != true)
                // if (filterChildList[index].templateCode != 'FILE') // &&
                //filterChildList[index].templateCode != 'GENERAL_DOCUMENT' &&
                //filterChildList[index].templateCode != 'PROJECT_DOCUMENTS')
                {
                  // print(filterChildList[index].id);
                  childPath!.add(filterChildList[index].title);
                  // childPath!.add(filterChildList[index].name);
                  parentModelList!.add(filterChildList[index]);
                  dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
                  String parentPath =
                      (filterChildList[index].workspaceId != null &&
                              filterChildList[index].workspaceId!.isNotEmpty)
                          ? (widget.parentPath! +
                              '/' +
                              filterChildList[index].workspaceId! +
                              '/')
                          : (widget.parentPath! + '/');
                  parentPathList!.add(parentPath);
                  Navigator.pushNamed(
                    context,
                    DMS_CHILD,
                    arguments: ScreenArguments(
                        list1: childPath,
                        list2: parentPathList,
                        arg1: filterChildList[index].title,
                        // arg1: filterChildList[index].name,
                        arg2: parentPath,
                        dmsParentModel: filterChildList[index],
                        dmsParentModelList: parentModelList,
                        callBack:
                            (dynamic value, dynamic value2, dynamic value3) {
                          dmsSourceFolderBloc.getDMSChildFolderAndDocumentsData(
                            queryparams: {
                              "userId": userId,
                              "portalName":
                                  BlocProvider.of<UserModelBloc>(context)
                                          .state
                                          .extraUserInformation
                                          ?.portalType ??
                                      "HR",
                              "key": filterChildList[_index].key ?? '',
                            },
                          );
                          // dmsSourceFolderBloc.getDMSSourceFolderData(
                          //   queryparams: {
                          //     "userId": BlocProvider.of<UserModelBloc>(context)
                          //             .state
                          //             .userModel
                          //             ?.id ??
                          //         '',
                          //     "portalName": "HR",
                          //     "key": filterChildList[index].key ?? '',
                          //   },
                          // );
                          // dmsBloc.postGetDMSFilesChildData(
                          //     dmsPostModel: DmsPostModel(
                          //   action: "read",
                          //   path: "${widget.parentPath}",
                          //   showHiddenItems: false,
                          //   data: [widget.parentModel],
                          //   userId: "45bba746-3309-49b7-9c03-b5793369d73c",
                          // ));
                        }),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  // bottomSheet(Cwd item) {
  bottomSheet(DMSSourceFolderModel item) {
    showDocumentBottomSheet(
      bottomSheetDataList: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _statisticWidget(
                context: context,
                title: item.title,
                // title: item.name,
                subtitle: '',
                isHeading: true,
              ),
            )
          ],
        ),
        Visibility(
          visible: (item.workspace ?? false),
          child: ListTile(
            leading: Icon(
              CustomIcons.folder,
              color: Colors.blue,
            ),
            title: Text('Create Workspace'),
            onTap: () => _handleCreateWorkspaceOnTap(),
          ),
        ),
        Visibility(
          visible: (item.workspace ?? false),
          child: ListTile(
            leading: Icon(
              CustomIcons.folder,
              color: Colors.blue,
            ),
            title: Text('Edit Workspace'),
            onTap: () => _handleEditWorkspaceOnTap(
              data: item,
            ),
          ),
        ),
        Visibility(
          visible: (item.folder ?? false) || (item.workspace ?? false),
          child: ListTile(
            leading: Icon(
              CustomIcons.folder,
              color: Colors.yellow,
            ),
            title: Text('Create Folder'),
            onTap: () => _handleCreateFolderOnTap(item),
          ),
        ),
        Visibility(
          visible: (item.folder ?? false),
          child: ListTile(
            leading: Icon(
              CustomIcons.pencil,
            ),
            title: Text('Edit Folder'),
            onTap: () => _handleEditFolderOnTap(item),
          ),
        ),
        Visibility(
          visible: (item.folder ?? false),
          child: ListTile(
            leading: Icon(
              CustomIcons.folder_open,
            ),
            title: Text('Upload File'),
            onTap: () => _handleUploadFilesOnTap(item),
          ),
        ),
        Visibility(
          visible: (item.folder ?? false),
          child: ListTile(
            leading: Icon(
              CustomIcons.plus_square,
            ),
            title: Text('Create Document'),
            onTap: () => Navigator.pushNamed(
              context,
              NTS_TEMPLATE_REQUEST,
              arguments: ScreenArguments(
                ntstype: NTSType.note,
                arg4: 'GENERAL_DOCUMENT',
              ),
            ),
          ),
        ),
        Visibility(
          visible: (item.document ?? false),
          child: ListTile(
            leading: Icon(
              CustomIcons.pencil,
            ),
            title: Text('Edit Document'),
            onTap: () {
              if (!((item.document ?? false) &&
                  (item.fileId == null || item.fileId!.isEmpty))) {
                Navigator.pushNamed(
                  context,
                  ADD_EDIT_NOTE_ROUTE,
                  arguments: ScreenArguments(
                    arg1: '',
                    arg2: item.key,
                  ),
                );
              } else {
                Navigator.pushNamed(context, DMS_WORBOOK_SCREEN,
                    arguments: ScreenArguments(
                      arg1: item.title ?? '',
                      arg2: item.key ?? '',
                    ));
              }
            },
          ),
        ),
        ListTile(
          leading: Icon(CustomIcons.folder_upload),
          title: Text('Manage Permission'),
          onTap: () => _handleManagePermissionOnTap(item),
        ),
        ListTile(
          leading: Icon(CustomIcons.folder_upload),
          title: Text('View Permission'),
          onTap: () => _handleViewPermissionOnTap(item),
        ),
        Visibility(
          visible: (item.folder ?? false) || (item.document ?? false),
          child: ListTile(
            leading: Icon(CustomIcons.expand_arrows),
            title: Text('Cut'),
            onTap: () => cutDialog(item.key),
          ),
        ),
        Visibility(
          visible: (item.folder ?? false) || (item.document ?? false),
          child: ListTile(
            leading: Icon(CustomIcons.copy),
            title: Text('Copy'),
            onTap: () => copyDialog(item.key),
          ),
        ),
        Visibility(
          visible: (BlocProvider.of<CutCopyPasteBloc>(context)
                          .state
                          .cutCopyPasteModel
                          ?.sourceId !=
                      null &&
                  BlocProvider.of<CutCopyPasteBloc>(context)
                      .state
                      .cutCopyPasteModel!
                      .sourceId!
                      .isNotEmpty) &&
              ((item.workspace ?? false) || (item.folder ?? false)),
          child: ListTile(
            leading: Icon(CustomIcons.copy),
            title: Text('Paste'),
            onTap: () => pasteDialog(item.key),
          ),
        ),
        Visibility(
          visible: (item.folder ?? false) || (item.document ?? false),
          child: ListTile(
            leading: Icon(CustomIcons.trash),
            title: Text('Delete'),
            onTap: () => deleteDialog(item.key),
          ),
        ),
        Visibility(
          visible: (item.folder ?? false) || (item.document ?? false),
          child: ListTile(
            leading: Icon(CustomIcons.archive),
            title: Text('Archive'),
            onTap: () => archiveDialog(item.key),
          ),
        ),
        Visibility(
          visible: ((item.workspace ?? false) || (item.folder ?? false)),
          child: ListTile(
            leading: Icon(CustomIcons.archive),
            title: Text('Download All'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => ZipCreater())),

            //   showModalBottomSheet(
            //     context: context,
            //     isDismissible: true,
            //     isScrollControlled: false,
            //     backgroundColor: Colors.transparent,
            //     enableDrag: true,
            //     builder: (BuildContext context) {
            //       return Downloader(
            //         filename: item.title!,
            //         url: APIEndpointConstants.DOWNLOAD_ATTACHMENT +
            //             (item.fileId ?? ''),
            //       );
            //     },
            //   ),
          ),
        ),
        Visibility(
          visible: (item.document ?? false) &&
              (item.fileId != null && item.fileId!.isNotEmpty),
          child: ListTile(
            leading: Icon(CustomIcons.archive),
            title: Text('Download'),
            onTap: () => showModalBottomSheet(
              context: context,
              isDismissible: true,
              isScrollControlled: false,
              backgroundColor: Colors.transparent,
              enableDrag: true,
              builder: (BuildContext context) {
                return Downloader(
                  filename: item.title!,
                  url: APIEndpointConstants.DOWNLOAD_ATTACHMENT +
                      (item.fileId ?? ''),
                );
              },
            ),
          ),
        ),
        ListTile(
          leading: Icon(CustomIcons.sticky_note),
          title: Text('View Details'),
          onTap: () {
            if (!((item.document ?? false) &&
                (item.fileId == null || item.fileId!.isEmpty))) {
              Navigator.pushNamed(
                context,
                ADD_EDIT_NOTE_ROUTE,
                arguments: ScreenArguments(
                  arg1: '',
                  arg2: item.key,
                ),
              );
            } else {
              Navigator.pushNamed(context, DMS_WORBOOK_SCREEN,
                  arguments: ScreenArguments(
                    arg1: item.title ?? '',
                    arg2: item.key ?? '',
                  ));
            }
          },
        ),
        Visibility(
          visible: (item.document ?? false) &&
              (item.fileId != null && item.fileId!.isNotEmpty),
          child: ListTile(
            leading: Icon(CustomIcons.archive),
            title: Text('Preview Attachment'),
            onTap: () => _handleDocumentPreviewOnTap(item),
          ),
        ),
      ],
    );
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
                Navigator.of(context).pop(); //Pop bottom sheet
                setState(() {
                  isVisible = true;
                });
                dmsCrudNoteBloc..getDeleteNoteAPIData(id: id);

                if (dmsCrudNoteBloc.deleteNoteSubject.stream.hasValue) {
                  if (dmsCrudNoteBloc.deleteNoteSubject.stream.value) {
                    displaySnackBar(
                        text: 'File deleted successfully', context: context);
                    dmsSourceFolderBloc.subjectChildData.sink.add(null);
                    apiCall();
                  } else {
                    displaySnackBar(
                        text: 'Unable to delete file', context: context);
                  }
                }
                setState(() {
                  isVisible = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  copyDialog(String? id) {
    Navigator.pop(context);
    setState(() {
      sourceId = id;
      isCopy = true;
      isCut = false;
    });
    cutCopyPasteModelPostRequest(sourceId, isCopy, isCut);
  }

  cutCopyPasteModelPostRequest(
    String? sourceId,
    bool? isCopy,
    bool? isCut,
  ) {
    try {
      BlocProvider.of<CutCopyPasteBloc>(context).add(
        CutCopyPasteChangeEvent(
          cutCopyPasteModel: CutCopyPasteModel(
            sourceId: sourceId,
            isCopy: isCopy,
            isCut: isCut,
          ),
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  cutDialog(String? id) {
    Navigator.pop(context);
    setState(() {
      sourceId = id;
      isCut = true;
      isCopy = false;
    });
    cutCopyPasteModelPostRequest(sourceId, isCopy, isCut);
  }

  pasteDialog(String? id) {
    Navigator.pop(context);
    if (BlocProvider.of<CutCopyPasteBloc>(context)
            .state
            .cutCopyPasteModel!
            .isCopy! ||
        BlocProvider.of<CutCopyPasteBloc>(context)
            .state
            .cutCopyPasteModel!
            .isCopy!) {
      dmsCrudNoteBloc
        ..getCopyNoteAPIData(
          sourceId: BlocProvider.of<CutCopyPasteBloc>(context)
              .state
              .cutCopyPasteModel!
              .sourceId!,
          targetId: id,
          userId:
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        );

      if (dmsCrudNoteBloc.copyNoteSubject.stream.hasValue) {
        if (dmsCrudNoteBloc.copyNoteSubject.stream.value) {
          displaySnackBar(text: 'File copied successfully', context: context);
          dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
          apiCall();
          isCopy = false;
          isCut = false;
          BlocProvider.of<CutCopyPasteBloc>(context).add(
            CutCopyPasteSuccessEvent(),
          );
        } else {
          displaySnackBar(text: 'Unable to copy file', context: context);
        }
      } else {
        return Center(
          child: CustomProgressIndicator(),
        );
      }

      sourceId = '';
    } else if (BlocProvider.of<CutCopyPasteBloc>(context)
            .state
            .cutCopyPasteModel!
            .isCut! ||
        BlocProvider.of<CutCopyPasteBloc>(context)
            .state
            .cutCopyPasteModel!
            .isCut!) {
      dmsCrudNoteBloc
        ..getMoveNoteAPIData(
          sourceId: BlocProvider.of<CutCopyPasteBloc>(context)
              .state
              .cutCopyPasteModel!
              .sourceId!,
          targetId: id,
        );

      if (dmsCrudNoteBloc.moveNoteSubject.stream.hasValue) {
        if (dmsCrudNoteBloc.moveNoteSubject.stream.value) {
          displaySnackBar(text: 'File moved successfully', context: context);
          dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
          apiCall();
          isCopy = false;
          isCut = false;
          BlocProvider.of<CutCopyPasteBloc>(context).add(
            CutCopyPasteSuccessEvent(),
          );
        } else {
          displaySnackBar(text: 'Unable to move file', context: context);
        }
      } else {
        return Center(
          child: CustomProgressIndicator(),
        );
      }

      sourceId = '';
    }
  }

  archiveDialog(String? id) {
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
                setState(() {
                  isVisible = true;
                });
                dmsCrudNoteBloc..getArchiveNoteAPIData(id: id);

                if (dmsCrudNoteBloc.archiveNoteSubject.stream.hasValue) {
                  if (dmsCrudNoteBloc.archiveNoteSubject.stream.value) {
                    displaySnackBar(
                        text: 'File saved to archive successfully',
                        context: context);
                    // dmsBloc.subjectDMSGetFilesChildResponse.sink.add(null);
                    dmsSourceFolderBloc.subjectChildData.sink.add(null);
                    apiCall();
                  } else {
                    displaySnackBar(
                        text: 'Unable to save file to archive',
                        context: context);
                  }
                }
                setState(() {
                  isVisible = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  renameDialog(String? name) {
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

  _handleManagePermissionOnTap(DMSSourceFolderModel item) async {
    Permission _permission =
        await permissionBloc.getViewPermissionData(queryparams: {
      "NoteId": "${item.key}",
      // "NoteId": "${item.id}",
      "WorkspaceId": "${item.workspaceId}",
      "ParentId": "${item.parentId}",
    });

    Navigator.of(context).pushNamed(
      DMS_VIEW_PERMISSION_ROUTE,
      arguments: ScreenArguments(
        arg1: item.key,
        // arg1: item.id,
        arg2: item.parentId,
        arg3: item.workspaceId,
        arg4: _permission.disablePermissionInheritance.toString(),
        val1: true,
        list1: childPath,
      ),
    );
  }

  _handleViewPermissionOnTap(DMSSourceFolderModel item) async {
    Permission _permission =
        await permissionBloc.getViewPermissionData(queryparams: {
      "NoteId": "${item.key}",
      // "NoteId": "${item.id}",
      "WorkspaceId": "${item.workspaceId}",
      "ParentId": "${item.parentId}",
    });

    Navigator.of(context).pushNamed(
      DMS_VIEW_PERMISSION_ROUTE,
      arguments: ScreenArguments(
        arg1: item.key,
        // arg1: item.id,
        arg2: item.parentId,
        arg3: item.workspaceId,
        arg4: _permission.disablePermissionInheritance.toString(),
        val1: false,
        list1: childPath,
      ),
    );
  }

  //TODO: implement preview attachment
  _handleDocumentPreviewOnTap(DMSSourceFolderModel item) {}

  _handleEditFolderOnTap(DMSSourceFolderModel item) {
    Navigator.of(context).pushNamed(
      DMS_NEW_FOLDER_ROUTE,
      arguments: ScreenArguments(
        arg1: item.workspaceId, // Parent id
        arg2: item.key, // Folder id
        arg3: item.title, // Folder Name
        // arg1: item.id, // Parent id
        // arg2: item.id, // Folder id
        // arg3: item.name, // Folder Name
      ),
    );
  }

  // _handleCreateFolderOnTap(Cwd item) {
  _handleCreateFolderOnTap(DMSSourceFolderModel item) {
    Navigator.of(context).pushNamed(
      DMS_NEW_FOLDER_ROUTE,
      arguments: ScreenArguments(
        arg1: item.key,
        // arg1: item.id,
      ),
    );
  }

  _handleCreateWorkspaceOnTap() {
    Navigator.of(context).pushNamed(
      DMS_MANAGE_WORKSPACE_ROUTE,
    );
  }

  _handleEditWorkspaceOnTap({
    required DMSSourceFolderModel data,
    // required Cwd data,
  }) {
    Navigator.of(context).pushNamed(
      DMS_MANAGE_WORKSPACE_ROUTE,
      arguments: ScreenArguments(
        arg1: data.key ?? "",
        // arg1: data.workspaceId ?? "",
        // arg1: data.id ?? "",
      ),
    );
  }

//TODO post api required to upload a file.
  _handleUploadFilesOnTap(DMSSourceFolderModel item) async {
    UploadedContentModel uploadedContentModel = UploadedContentModel();
    UploadedContent uploadedContent = UploadedContent();
    NoteModel noteModel = NoteModel();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SelectAttachment(
            ntsId: 'Note',
            onListTap: (
              dynamic value,
              dynamic value2,
              dynamic value3,
            ) async {
              setState(() {
                fileAttachmentController.text = " (1) File Attached: " + value2;
              });
              // uploadedContent.fileUid = value;
              // uploadedContent.relativePath = '${item.title}/$value2';
              // uploadedContent.fileId = value;
              // uploadedContent.fileIds = value;

              // uploadedContent.folderName = item.title;
              // // uploadedContent.folders = item.folder;
              // uploadedContent.uploaded = item.canCreateDocument;
              // // uploadedContent.parentFolderName=item.
              // uploadedContent.dataAction = "Create";

              // uploadedContentModel.parentId = item.key;
              // uploadedContentModel.uploadedContent =
              //     jsonEncode([uploadedContent.toJson()]);
              noteModel.fileIds = value;
              noteModel.dataAction = "Create";
              noteModel.parentNoteId = item.sourceFolderModelParentId;

              await attachmentNTSBloc.postAddUploadedFile(model: noteModel);
            },
          );
        },
      ),
    );
  }

  // filePreview(
  //   String mediaSrc,
  //   int fileId,
  //   String targetScreen,
  //   BuildContext context,
  // ) async {
  //   String mediaType = '';
  //   String pathPDF;
  //   var mimeType = mediaSrc != null ? mime(mediaSrc) : "";
  //   if (mimeType != null && mimeType != "") {
  //     if (mimeType == "application/pdf") {
  //       mediaType = 'PDF';
  //     } else if (mimeType.contains('image')) {
  //       mediaType = 'PHOTO';
  //     } else if (mimeType.contains('video') || mimeType.contains('audio')) {
  //       mediaType = mimeType.contains('video') ? 'VIDEO' : "AUDIO";
  //     } else {
  //       mediaType = 'DOCFILES';
  //     }
  //   }

  //   try {
  //     if (mediaSrc != null && mediaSrc != "") {
  //       if (mediaType == 'PDF') {
  //         createFileOfPdfUrl(mediaSrc).then((f) {
  //           pathPDF = f!.path;
  //           // pathPDF=ApiEnvironment().getDomainUri(GraphQLConfiguration.synergyClient)+"Account/ExternalLogin?email="+settingInheritedWidget.userDetails.email+"&password=!Welcome123"+"&url=/nts/service/ViewAttachment?fileId="+fileId.toString()+"&canEdit=true";
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => AudioVideoScreen(
  //                       fromScreen: targetScreen, // "DigitalDocuments",
  //                       mediaSrc: pathPDF,
  //                       tag: fileId.toString(),
  //                       mediaType: mediaType)));
  //         });
  //       } else if (mediaType == 'DOCFILES') {
  //         OpenFile.open(mediaSrc);
  //       } else {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => AudioVideoScreen(
  //                     fromScreen: targetScreen, //"DigitalDocuments",
  //                     mediaSrc: mediaSrc,
  //                     tag: fileId.toString(),
  //                     mediaType: mediaType)));
  //       }
  //     }
  //   } catch (exception) {}
  // }

  // Future<File?> createFileOfPdfUrl(String url) async {
  //   try {
  //     Uint8List? bytes;

  //     await _readFileByte(url).then((bytesData) {
  //       bytes = bytesData;
  //     });
  //     var dir = await getApplicationDocumentsDirectory();
  //     // final filename = url.substring(url.lastIndexOf("/") + 1);
  //     File file = File("${dir.path}/filename");
  //     File urlFile = await file.writeAsBytes(bytes!);
  //     return urlFile;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<Uint8List?> _readFileByte(String filePath) async {
  //   Uri myUri = Uri.parse(filePath);
  //   File mediaFile = new File.fromUri(myUri);
  //   Uint8List bytes;
  //   await mediaFile.readAsBytes().then((value) {
  //     bytes = Uint8List.fromList(value);
  //     // print('reading of bytes is completed');
  //     return bytes;
  //   }).catchError((onError) {
  //     print('Exception Error while reading audio from path:' +
  //         onError.toString());
  //   });
  // }
}
