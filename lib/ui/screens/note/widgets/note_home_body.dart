import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/note/note_list_model.dart';
import '../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

typedef FilterListTapCallBack = void Function(dynamic key);

class NoteHomeBody extends StatefulWidget {
  final String mode;
  final String noteStatus;
  final String moduleId;

  const NoteHomeBody({Key key, this.mode, this.noteStatus, this.moduleId})
      : super(key: key);
  @override
  _NoteHomeBodyState createState() => _NoteHomeBodyState();
}

class _NoteHomeBodyState extends State<NoteHomeBody> {
  List<NoteListModel> _noteList = [];
  List<NoteListModel> _filteredNoteList = [];

  FilterListTapCallBack filterData;

  String noteStatus;
  String text;
  String userId;
  String moduleId;
  String mode;

  @override
  void initState() {
    noteStatus = widget.noteStatus;
    mode = widget.mode;
    moduleId = widget.moduleId;
    super.initState();
    apiCall();
  }

  apiCall() {
    noteBloc.subjectNoteList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (noteStatus != null) queryparams['noteStatus'] = noteStatus;
    if (text != null) queryparams['text'] = text;
    if (userId != null) queryparams['userId'] = userId;
    if (moduleId != null) queryparams['moduleId'] = moduleId;
    if (mode != null) queryparams['mode'] = mode;

    noteBloc.getNoteList(queryparams: queryparams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          collapsedBackgroundColor: Colors.grey[200],
          backgroundColor: Colors.grey[200],
          trailing: Icon(Icons.filter_list),
          title: Text("Filter"),
          children: [wrappedButtons()],
        ),
        Expanded(
          child: StreamBuilder(
            stream: noteBloc.subjectNoteList.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return Center(
                    child: Text(snapshot.data.error),
                  );
                }
                if (snapshot.data.list == null ||
                    snapshot.data.list.length == 0) {
                  return EmptyListWidget();
                }
                _noteList = snapshot.data.list;
                return Listizer(
                  listItems: _noteList,
                  filteredSearchList: _filteredNoteList,
                  itemBuilder: (context, index) {
                    print("Snapshot data: ${snapshot.data}");
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          noteSubject(index),
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
                                      Text("Note No: "),
                                      Text(noteNoValue(index)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: Row(
                                children: <Widget>[
                                  Text("From: "),
                                  Text(
                                    ownerUserName(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    noteStatusName(index),
                                    style: TextStyle(color: Colors.green[800]),
                                  ),
                                ),
                                Text(
                                  expiryDate(index),
                                  style: TextStyle(color: Colors.red[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          noteBloc.subjectNoteDetails.sink.add(null);
                          Navigator.pushNamed(
                            context,
                            ADD_EDIT_NOTE_ROUTE,
                            arguments: ScreenArguments(
                                arg1: '',
                                arg2: _noteList[index].id,
                                arg3: _noteList[index].noteSubject),
                          );
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
        ),
      ],
    );
  }

  Widget wrappedButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: double.infinity,
      child: Wrap(
        children: [
          customButton(
            buttonText: 'Home',
            handleOnPressed: () => _homeFilter(),
          ),
          customButton(
            buttonText: 'Pending Till Today',
            handleOnPressed: () => _pendingTillTodayFilter(),
          ),
          customButton(
            buttonText: 'Ending in Next 7 Days',
            handleOnPressed: () => _endingInWeekFilter(),
          ),
          customButton(
            buttonText: 'More...',
            handleOnPressed: () => _moreFilter(),
          ),
        ],
      ),
    );
  }

  String noteSubject(int index) {
    return _noteList[index].noteSubject ?? "-";
  }

  String noteNoValue(int index) {
    return _noteList[index].noteNo ?? "-";
  }

  String ownerUserName(int index) {
    return _noteList[index].ownerUserName ?? "-";
  }

  String assigneeDisplayName(int index) {
    return _noteList[index].assigneeDisplayName ?? "-";
  }

  String noteStatusName(int index) {
    return _noteList[index].noteStatusName ?? "-";
  }

  String expiryDate(int index) {
    return _noteList[index].expiryDateDisplay ?? "-";
  }

  customButton({
    String buttonText,
    Function handleOnPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
          // MaterialStateProperty.all(Theme.of(context).textHeadingColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        onPressed: () => handleOnPressed(),
        child: Text(buttonText),
      ),
    );
  }

  _homeFilter() {
    _setParamsToNull();
    apiCall();
  }

  _pendingTillTodayFilter() {
    _setParamsToNull();

    text = 'Today';
    apiCall();
  }

  _endingInWeekFilter() {
    _setParamsToNull();

    text = 'Week';
    apiCall();
  }

  _moreFilter() {
    filterData(dynamic value) {
      _setParamsToNull();
      noteStatus = value;
      apiCall();
      print(noteStatus);
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.note,
        val1: false,
        val2: false,
      ),
    );
  }

  _setParamsToNull() {
    noteStatus = null;
    text = null;
    userId = null;
    moduleId = null;
    mode = null;
  }
}
