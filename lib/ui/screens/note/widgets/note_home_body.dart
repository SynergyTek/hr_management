import 'package:flutter/material.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/note/note_list_model.dart';
import '../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

import 'note_list_tile.dart';

typedef FilterListTapCallBack = void Function(dynamic key1, FilterType key2);

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
                    return NoteListCard(
                      index: index,
                      noteList: _noteList,
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

  assignValues(dynamic value, FilterType filterType) {
    switch (filterType) {
      case FilterType.status:
        noteStatus = value;
        break;
      case FilterType.module:
        moduleId = value;
        break;
      case FilterType.role:
        mode = value;
        break;
      default:
        break;
    }
  }

  _moreFilter() {
    _setParamsToNull();
    filterData(dynamic value, FilterType filterType) {
      assignValues(value, filterType);
      apiCall();
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.note,
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
