import 'package:flutter/material.dart';

import '../../../../../data/models/work_book_models/get_note_book_report_model.dart';
import '../../../../../logic/blocs/work_book_bloc/work_book_bloc.dart';
import '../../../../../routes/route_constants.dart';
import '../../../../../routes/screen_arguments.dart';
import '../../../../../themes/theme_config.dart';
import '../../../../widgets/dotted_divider_widget.dart';
import '../../../../widgets/snack_bar.dart';

class DmsWorkbookListCard extends StatefulWidget {
  final bool? onTap;
  final List<NtsItem>? workbookList;
  final int index;
  final String noteId;
  const DmsWorkbookListCard({
    Key? key,
    required this.workbookList,
    required this.index,
    required this.noteId,
    this.onTap,
  }) : super(key: key);

  @override
  State<DmsWorkbookListCard> createState() => _DmsWorkbookListCardState();
}

class _DmsWorkbookListCardState extends State<DmsWorkbookListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      color: Colors.blue[tileColor(widget.workbookList![widget.index].level)],
      elevation: 4,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget(
                context: context,
                caption: widget.workbookList![widget.index].itemNo ?? '',
                title: widget.workbookList![widget.index].subject ?? '-',
              ),
              const DottedDividerWidget(),
              subtitleRowWidget(
                context: context,
                caption: "Category : ",
                title: widget.workbookList![widget.index].templateName ?? '',
              ),
              subtitleRowWidget(
                context: context,
                caption: "Reference No : ",
                title: widget.workbookList![widget.index].ntsNo ?? '',
              ),
              Row(
                children: [
                  Expanded(
                    child: subtitleRowWidget(
                      context: context,
                      caption: "Status : ",
                      title:
                          widget.workbookList![widget.index].statusName ?? '',
                    ),
                  ),
                  IconButton(
                    onPressed: () => _handleMoreOnPressed(
                        context: context, noteId: widget.noteId),
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () => Navigator.pushNamed(
          context,
          ADD_EDIT_NOTE_ROUTE,
          arguments: ScreenArguments(
            arg1: '',
            arg2: widget.workbookList![widget.index].id,
          ),
        ),
      ),
    );
  }

  Widget titleWidget({
    required BuildContext context,
    String caption = "",
    String title = "-",
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 16,
                color: Colors.blue,
              ),
        ),
      ],
    );
  }

  Widget subtitleRowWidget({
    required BuildContext context,
    String caption = "",
    String title = "-",
    Widget? customChild,
    bool? isCentered = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: const Color(0xFF757575),
              ),
        ),
        customChild ??
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
      ],
    );
  }

  _handleMoreOnPressed({
    required BuildContext context,
    required String noteId,
  }) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          padding: DEFAULT_LARGE_PADDING,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (widget.workbookList![widget.index].parentId != null &&
                      widget.workbookList![widget.index].parentId!.isNotEmpty)
                  ? ExpansionTile(
                      leading: Icon(Icons.add),
                      backgroundColor: Colors.grey[200],
                      trailing: Icon(Icons.filter_list),
                      title: Text("Add Below"),
                      children: actionList(context),
                    )
                  : SizedBox(),
              ExpansionTile(
                leading: Icon(Icons.add),
                backgroundColor: Colors.grey[200],
                trailing: Icon(Icons.filter_list),
                title: Text("Add Child"),
                children: actionList(context),
              ),
              ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(Icons.edit),
                title: Text("Edit"),
                onTap: () => Navigator.pushNamed(
                  context,
                  ADD_EDIT_NOTE_ROUTE,
                  arguments: ScreenArguments(
                    arg1: '',
                    arg2: widget.workbookList![widget.index].id,
                  ),
                ),
              ),
              (widget.workbookList![widget.index].parentId != null &&
                      widget.workbookList![widget.index].parentId!.isNotEmpty)
                  ? ListTile(
                      tileColor: Colors.grey[200],
                      leading: Icon(Icons.arrow_downward_sharp),
                      title: Text("Move"),
                      onTap: () => Navigator.pushNamed(
                        context,
                        DMS_MOVE_WORBOOK_SCREEN,
                        arguments: ScreenArguments(
                            arg2: widget.workbookList![widget.index].id),
                      ),
                    )
                  : SizedBox(),
              ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(Icons.delete),
                title: Text("Delete"),
                onTap: () => _handleDeleteOnPressed(
                    id: widget.workbookList![widget.index].id,
                    parentId: widget.workbookList![widget.index].parentId,
                    parentType:
                        widget.workbookList![widget.index].parentNtsType),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> actionList(BuildContext context) {
    return [
      expansionTileAction(icon: Icons.note, title: 'Note', context: context),
      expansionTileAction(icon: Icons.task, title: 'Task', context: context),
      expansionTileAction(
          icon: Icons.design_services, title: 'Service', context: context),
      expansionTileAction(icon: Icons.email, title: 'Email', context: context),
    ];
  }

  Widget expansionTileAction(
      {IconData? icon, String? title, BuildContext? context}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ListTile(
        dense: true,
        leading: Icon(icon),
        title: Text(title!),
        onTap: () {
          if (title == 'Note') {
            // Navigator.pushNamed(
            //   context!,
            //   ADD_EDIT_NOTE_ROUTE,
            //   arguments: ScreenArguments(
            //     arg1: workbookList![index].templateCode ?? '',
            //     arg2: '',
            //     portalType: PortalType.hr,
            //   ),
            // );
          } else if (title == 'Task') {
            // Navigator.pushNamed(
            //   context!,
            //   CREATE_EDIT_TASK_ROUTE,
            //   arguments: ScreenArguments(
            //     arg1: workbookList![index].templateCode ?? '',
            //     arg2: '',
            //     portalType: PortalType.hr,
            //   ),
            // );
          } else if (title == 'Service') {
            // Navigator.pushNamed(
            //   context!,
            //   CREATE_SERVICE_ROUTE,
            //   arguments: ScreenArguments(
            //     arg1: workbookList![index].templateCode ?? '',
            //     arg2: '',
            //     portalType: PortalType.hr,
            //   ),
            // );
          } else if (title == 'Email') {}
        },
      ),
    );
  }

  int tileColor(int? level) {
    switch (level) {
      case 0:
        return 300;
      case 1:
        return 200;
      case 2:
        return 100;
      default:
        return 50;
    }
  }

  _handleDeleteOnPressed({String? id, String? parentId, int? parentType}) {
    bool result;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete workbook?"),
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
              onPressed: () async {
                Navigator.of(context).pop(); //Pop dialog box
                Navigator.of(context).pop(); //Pop bottom sheet

                if (parentType == 2) {
                  //Parent type SERVICE
                  result = await workBookBloc.deleteServiceBookItems(
                    queryparams: _handleServiceDetailsQueryparams(
                      serviceId: id,
                      parentId: parentId ?? '',
                      parentType: parentType,
                    ),
                  );
                } else {
                  //Parent type NOTE
                  result = await workBookBloc.deleteNoteBookItems(
                    queryparams: _handleNoteDetailsQueryparams(
                      noteId: id,
                      parentId: parentId ?? '',
                      parentType: parentType,
                    ),
                  );
                }

                if (result) {
                  displaySnackBar(
                      text: 'Workbook deleted successfully', context: context);
                  workBookBloc.subjectNoteBookReport.sink.add(null);
                  workBookBloc.getNoteBookReport(queryparams: {
                    "noteId": widget.noteId,
                  });
                } else
                  displaySnackBar(
                      text: 'Unable to delete workbook successfully',
                      context: context);
              },
            ),
          ],
        );
      },
    );
  }

  _handleServiceDetailsQueryparams({
    int? parentType,
    String? parentId,
    String? serviceId,
  }) {
    return {
      'parentId': parentId,
      'serviceId': serviceId,
      'parentType': parentType == 0
          ? 'Note'
          : parentType == 1
              ? 'Task'
              : 'Service',
    };
  }

  _handleNoteDetailsQueryparams({
    int? parentType,
    String? parentId,
    String? noteId,
  }) {
    return {
      'parentId': parentId,
      'noteId': noteId,
      'parentType': parentType == 0
          ? 'Note'
          : parentType == 1
              ? 'Task'
              : 'Service',
    };
  }
}
