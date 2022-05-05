import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/work_book_models/work_book_response_model.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/logic/blocs/work_book_bloc/work_book_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../data/models/work_book_models/get_note_book_report_model.dart';
import '../../../../data/models/work_book_models/work_book_count_model.dart';
import '../../../../themes/theme_config.dart';
import 'widget/dms_workbook_list_tile.dart';

class DMSWorkbookScreen extends StatefulWidget {
  final String workbookName;
  final String bookId;

  const DMSWorkbookScreen({
    Key? key,
    required this.workbookName,
    required this.bookId,
  }) : super(key: key);

  @override
  _DMSWorkbookScreenCountState createState() => _DMSWorkbookScreenCountState();
}

class _DMSWorkbookScreenCountState extends State<DMSWorkbookScreen> {
  int _selectedIndex = 0;

  List<Widget?>? _widgetOptions = [];

  @override
  void initState() {
    workBookBloc.subjectWorkBookCount.sink.add(null);
    workBookBloc.getWorkBookCount(queryparams: {
      "userId":
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      "bookId": widget.bookId,
    });

    _widgetOptions = <Widget?>[
      workbookCountScreen(context),
      WorkbookListData(
        noteId: widget.bookId,
      ),
    ];

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.workbookName)),
        body: _widgetOptions!.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.data_usage_rounded),
              label: 'Summary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: 'Details',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class WorkbookListData extends StatefulWidget {
  final String noteId;
  WorkbookListData({Key? key, required this.noteId}) : super(key: key);

  @override
  State<WorkbookListData> createState() => _WorkbookListDataState();
}

class _WorkbookListDataState extends State<WorkbookListData> {
  @override
  void initState() {
    workBookBloc.subjectNoteBookReport.sink.add(null);
    workBookBloc.getNoteBookReport(queryparams: {
      "noteId": widget.noteId,
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<GetNoteBookReportResponseModel?>(
      stream: workBookBloc.subjectNoteBookReport.stream,
      builder: (BuildContext context,
          AsyncSnapshot<GetNoteBookReportResponseModel?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.mapdata?.ntsItems == null) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No Data'),
            ));
          }
          List<NtsItem>? list = snapshot.data?.mapdata?.ntsItems;

          //Code block to sort the list into tree view starts here
          List<NtsItem>? sortedList = [];
          for (var i = 0; i < list!.length; i++) {
            bool isPresent = false;
            if (list[i].level == 0) {
              sortedList.add(list[i]);
            } else if (i == list.length - 1) {
              sortedList.forEach((element) {
                if (element.id == list[i].id) {
                  isPresent = true;
                }
              });
              if (!isPresent) sortedList.add(list[i]);
            } else {
              for (var j = i + 1; j < list.length; j++) {
                if (list[j].itemNo!.contains('${list[i].itemNo}')) {
                  sortedList.forEach((element) {
                    if (element.id == list[i].id) {
                      isPresent = true;
                    }
                  });
                  if (!isPresent)
                    sortedList
                      ..add(list[i])
                      ..add(list[j]);
                  else
                    sortedList.add(list[j]);
                } else {
                  sortedList.forEach((element) {
                    if (element.id == list[i].id) {
                      isPresent = true;
                    }
                  });
                  if (!isPresent) sortedList.add(list[i]);
                }
              }
            }
          }
          //Code block to sort the list into tree view ends here

          return ListView.builder(
            itemCount: sortedList.length,
            itemBuilder: (BuildContext context, int index) {
              return DmsWorkbookListCard(
                index: index,
                workbookList: sortedList,
                onTap: false,
                noteId: widget.noteId,
              );
            },
          );
        } else {
          return Center(child: CustomProgressIndicator());
        }
      },
    ));
  }
}

Widget workbookCountScreen(BuildContext context) {
  WorkBookCountModel workBookCountModel = WorkBookCountModel();
  return StreamBuilder(
    stream: workBookBloc.subjectWorkBookCount,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data?.mapdata == null) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('No Data'),
          ));
        }
        workBookCountModel = snapshot.data?.mapdata;
        return summaryCards(workBookCountModel);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget summaryCards(WorkBookCountModel workBookCountModel) {
  return Column(
    children: [
      SizedBox(height: 8),
      card(
        title: 'My Tasks',
        list: [
          tagAndValue(
              tag: 'Pending', value: workBookCountModel.tAssignPending ?? 0),
          tagAndValue(
              tag: 'Complete', value: workBookCountModel.tAssignCompleted ?? 0),
          tagAndValue(
              tag: 'Overdue', value: workBookCountModel.tAssignOverdue ?? 0),
          tagAndValue(
              tag: 'Rejected', value: workBookCountModel.tAssignReject ?? 0),
        ],
      ),
      card(
        title: 'Notifications',
        list: [
          tagAndValue(tag: 'Read', value: workBookCountModel.readCount ?? 0),
          tagAndValue(
              tag: 'Unread', value: workBookCountModel.uUnReadCount ?? 0),
          tagAndValue(
              tag: 'Archived', value: workBookCountModel.archivedCount ?? 0),
        ],
      ),
    ],
  );
}

Widget card({String? title, List<Widget>? list}) {
  return Card(
    margin: DEFAULT_LARGE_PADDING,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: DEFAULT_PADDING,
            child: Text(title!),
          ),
        ),
        Padding(
          padding: DEFAULT_PADDING,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: list!,
          ),
        ),
      ],
    ),
  );
}

Widget tagAndValue({String tag = '', int value = 0}) {
  return Column(
    children: [
      Text(tag),
      Text(value.toString()),
    ],
  );
}
