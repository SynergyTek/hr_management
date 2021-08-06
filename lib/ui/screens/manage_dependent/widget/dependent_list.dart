import 'package:flutter/material.dart';
import '../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../../data/models/dependent/dependent_list_model.dart';
import '../../../../logic/blocs/dependent_bloc/dependent_api_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class DependentList extends StatefulWidget {
  @override
  _DependentListState createState() => _DependentListState();
}

class _DependentListState extends State<DependentList> {
  List<DependentListModel> _dependentList = [];
  List<DependentListModel> _filteredDependentList = [];

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> queryparams = Map();
    queryparams['ntsstatus'] = 'NOTE_STATUS_INPROGRESS';

    dependentBloc..getReadDependantList(queryparams: queryparams);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dependentBloc.subjectReadDependnetResponse.stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Center(
              child: Text(snapshot.data.error),
            );
          }
          if (snapshot.data.data == null || snapshot.data.data.length == 0) {
            return EmptyListWidget();
          }
          _dependentList = snapshot.data.data;
          return Listizer(
            listItems: _dependentList,
            filteredSearchList: _filteredDependentList,
            itemBuilder: (context, index) {
              return _dependentListCard(index: index);
            },
          );
        } else {
          return Center(
            child: CustomProgressIndicator(),
          );
        }
      },
    );
  }

  _dependentListCard({int index}) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(_dependentList[index].firstName),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Relationship type: "),
                      Text(_dependentList[index].relationshipTypeName),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Iqamah Nationality: "),
                      Text(_dependentList[index].iqamahIdNationalityId),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("DOB: "),
                      Text(_dependentList[index]
                          .dateOfBirth
                          .toString()
                          .split(' ')[0]),
                    ],
                  )
                ],
              ),
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
              arg2: _dependentList[index].noteId,
              arg3: '',
            ),
          );
        },
      ),
    );
  }
}
