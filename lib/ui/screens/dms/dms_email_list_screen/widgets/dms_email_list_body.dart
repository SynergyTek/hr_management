import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:hr_management/data/models/email_model/email_model.dart';
import 'package:hr_management/logic/blocs/work_book_bloc/work_book_bloc.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';

import '../../../../../data/models/work_book_models/get_note_book_report_model.dart';
import '../../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../../themes/theme_config.dart';
import '../../../../widgets/dotted_divider_widget.dart';
import '../../../../widgets/progress_indicator.dart';

class DMSEmailListBody extends StatefulWidget {
  final List<NtsItem>? workbookList;
  final bool isAddBelow;
  final int index;
  DMSEmailListBody({
    Key? key,
    required this.workbookList,
    this.isAddBelow = false,
    required this.index,
  }) : super(key: key);

  @override
  State<DMSEmailListBody> createState() => _DMSEmailListBodyState();
}

class _DMSEmailListBodyState extends State<DMSEmailListBody> {
  bool isAddBelow = false;
  bool isVisible = false;

  @override
  void initState() {
    isAddBelow = widget.isAddBelow;
    getReadEmailTasksAPICall();

    super.initState();
  }

  getReadEmailTasksAPICall() async {
    workBookBloc.subjectEmailTaskReport.sink.add(null);
    workBookBloc.getReadEmailTasks(queryparams: {
      'userId':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? ''
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder(
          stream: workBookBloc.subjectEmailTaskReport.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.mapdata?.data == null) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('No Data'),
                ));
              }
              List<EmailData>? list = snapshot.data?.mapdata?.data;
              return ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, index) {
                  return _emailCard(data: list![index]);
                },
              );
            } else {
              return Center(child: CustomProgressIndicator());
            }
          },
        ),
        Visibility(
          visible: isVisible,
          child: Center(
            child: CustomProgressIndicator(),
          ),
        ),
      ],
    );
  }

  _emailCard({required EmailData data}) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.blue,
              width: 1.5.w,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.subject ?? '',
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
            ),
            const DottedDividerWidget(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _rowWidget(tag: 'From: ', value: data.from),
                      _rowWidget(tag: 'To: ', value: data.to),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => _handleMoreOnPressed(
                    context: context,
                    data: data,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _rowWidget({String? tag, String? value}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          tag ?? '',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          value ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  _handleMoreOnPressed({
    required BuildContext context,
    required EmailData data,
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
              ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(Icons.save),
                title: Text("Save"),
                onTap: () => _handleSaveButtonOnPressed(data),
              ),
              ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(Icons.add_task),
                title: Text("Add Task"),
                onTap: () {
                  Navigator.pop(context);
                  displaySnackBar(
                      context: context, text: 'Feature Not Implemented');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _handleSaveButtonOnPressed(EmailData data) async {
    bool result;
    String? notePlusId = widget.workbookList?[0].id;
    String? parentNoteId = isAddBelow
        ? widget.workbookList![widget.index].parentId
        : widget.workbookList?[widget.index].id!;
    int? sequenceOrder = isAddBelow
        ? (widget.workbookList?[widget.index].sequenceOrder ?? 0) + 1
        : (widget.workbookList?[widget.index].maxChildSequence ?? 0) + 1;

    Navigator.of(context).pop(); //Pop bottom sheet in email screen

    setState(() {
      isVisible = true;
    });

    result = await workBookBloc.saveEmailToNtsType(
      queryparams: {
        'NtsType': 'Note',
        'Id': data.messageId,
        'templateCode': 'EMAIL_COPY',
        'prms':
            'notePlusId=$notePlusId&amp;sequenceOrder=$sequenceOrder&amp;parentNoteId=$parentNoteId',
      },
    );

    if (result) {
      displaySnackBar(text: 'Email added successfully', context: context);
      workBookBloc.subjectNoteBookReport.sink.add(null);
      workBookBloc.getNoteBookReport(queryparams: {
        "noteId": widget.workbookList?[0].id,
      });
      setState(() {
        isVisible = false;
      });
      Navigator.of(context).pop(); //Pop from email screen
      Navigator.of(context).pop(); //Pop bottom sheet in list screen
    } else {
      displaySnackBar(text: 'Unable to add email', context: context);
      setState(() {
        isVisible = false;
      });
    }
  }
}
