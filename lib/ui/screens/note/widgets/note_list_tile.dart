import 'package:flutter/material.dart';
import '../../../../data/models/note/note_list_model.dart';
import '../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';

class NoteListCard extends StatelessWidget {
  final bool onTap;
  final List<NoteListModel> noteList;
  final int index;
  const NoteListCard(
      {Key key, @required this.index, @required this.noteList, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: Row(
                children: <Widget>[
                  Text("From: "),
                  Text(
                    ownerUserName(index),
                    style: TextStyle(color: Colors.deepPurple[900]),
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
        onTap: onTap
            ? () {
                noteBloc.subjectNoteList.sink.add(null);
                noteBloc.subjectNoteDetails.sink.add(null);
                Navigator.pushNamed(
                  context,
                  ADD_EDIT_NOTE_ROUTE,
                  arguments: ScreenArguments(
                      arg1: '',
                      arg2: noteList[index].id,
                      arg3: noteList[index].noteSubject),
                );
              }
            : () {},
      ),
    );
  }

  String noteSubject(int index) {
    return noteList[index].noteSubject ?? "-";
  }

  String noteNoValue(int index) {
    return noteList[index].noteNo ?? "-";
  }

  String ownerUserName(int index) {
    return noteList[index].ownerUserName ?? "-";
  }

  String assigneeDisplayName(int index) {
    return noteList[index].assigneeDisplayName ?? "-";
  }

  String noteStatusName(int index) {
    return noteList[index].noteStatusName ?? "-";
  }

  String expiryDate(int index) {
    return noteList[index].expiryDateDisplay ?? "-";
  }
}
