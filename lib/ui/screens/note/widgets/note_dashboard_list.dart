import 'package:flutter/material.dart';
import '../../../../data/models/note/note_list_model.dart';
import '../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class NoteDashboardList extends StatefulWidget {
  @override
  _NoteDashboardListState createState() => _NoteDashboardListState();
}

class _NoteDashboardListState extends State<NoteDashboardList> {
  List<NoteListModel> _noteList = [];
  List<NoteListModel> _filteredNoteList = [];

  @override
  void initState() {
    super.initState();
    noteBloc..getNoteDashBoardData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        onTap: () {},
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
}
