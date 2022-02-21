import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../listizer/listizer.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/note/note_list_model.dart';
import '../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/progress_indicator.dart';
import 'note_list_tile.dart';

class NoteDashboardList extends StatefulWidget {
  @override
  _NoteDashboardListState createState() => _NoteDashboardListState();
}

class _NoteDashboardListState extends State<NoteDashboardList> {
  List<NoteListModel>? _noteList = [];
  List<NoteListModel> _filteredNoteList = [];
  TextEditingController subjectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    noteBloc
      ..getNoteDashBoardData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() {
    return {
      'userid':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ExpansionTile(
        //   collapsedBackgroundColor: Colors.grey[200],
        //   backgroundColor: Colors.grey[200],
        //   trailing: Icon(Icons.filter_list),
        //   title: _searchField(),
        //   children: [
        //     wrappedButtons(),
        //   ],
        // ),
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
                _noteList = snapshot.data.list;
                return Listizer(
                  listItems: _noteList,
                  filteredSearchList: _filteredNoteList,
                  itemBuilder: (context, index) {
                    return NoteListCard(
                      index: index,
                      noteList: _noteList,
                      onTap: false,
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

  Widget _searchField() {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(100),
        // color: Colors.white,
      ),
      child: TextField(
        controller: subjectController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onPressed: () => _searchSubject(),
          ),
        ),
      ),
    );
  }

  _searchSubject() {
    if (subjectController.text != null && subjectController.text.isNotEmpty) {
      _setParamsToNull();
      // subject = subjectController.text;
      apiCall();
    }
  }

  _setParamsToNull() {}

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
            buttonText: 'More...',
            handleOnPressed: () => _moreFilter(),
          ),
        ],
      ),
    );
  }

  _homeFilter() {
    subjectController.text = '';
    _setParamsToNull();
    apiCall();
  }

  _moreFilter() {
    filterData(dynamic value, FilterType filterType) {
      _setParamsToNull();
      apiCall();
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.note,
        val2: true,
      ),
    );
  }

  customButton({
    required String buttonText,
    Function? handleOnPressed,
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
        onPressed: () => handleOnPressed!(),
        child: Text(buttonText),
      ),
    );
  }
}
