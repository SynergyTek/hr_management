import 'package:flutter/material.dart';
import '../../../../data/models/note/note_list_model.dart';
import '../../../../logic/blocs/note_bloc/note_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/dotted_divider_widget.dart';
import '../../../widgets/widgets.dart';

class NoteListCard extends StatelessWidget {
  final bool? onTap;
  final List<NoteListModel>? noteList;
  final int index;
  const NoteListCard(
      {Key? key, required this.index, required this.noteList, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: GestureDetector(
        onTap: onTap!
            ? () {
                noteBloc.subjectNoteDetails.sink.add(null);
                Navigator.pushNamed(
                  context,
                  ADD_EDIT_NOTE_ROUTE,
                  arguments: ScreenArguments(
                      arg1: '',
                      arg2: noteList![index].id,
                      arg3: noteList![index].noteSubject),
                );
              }
            : () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: statusToColorMap[noteStatusName(index)] ??
                    Colors.transparent,
                width: MediaQuery.of(context).size.width * 0.015,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: titleWidget(
                      context: context,
                      caption: noteNoValue(index),
                      title: noteSubject(index),
                    ),
                  ),
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Status",
                      customChild: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            noteStatusName(index),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          statusContainerWidget(
                            statusColor:
                                statusToColorMap[noteStatusName(index)] ??
                                    Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DottedDividerWidget(),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: subtitleWidget(
                      context: context,
                      caption: 'Requested By',
                      title: ownerUserName(index),
                    ),
                  ),
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Exxpiry Date",
                      title: expiryDate(index),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String noteSubject(int index) {
    return noteList![index].noteSubject ?? "-";
  }

  String noteNoValue(int index) {
    return noteList![index].noteNo ?? "-";
  }

  String ownerUserName(int index) {
    return noteList![index].ownerUserName ?? "-";
  }

  String assigneeDisplayName(int index) {
    return noteList![index].assigneeDisplayName ?? "-";
  }

  String noteStatusName(int index) {
    return noteList![index].noteStatusName ?? "-";
  }

  String expiryDate(int index) {
    return noteList![index].expiryDateDisplay ?? "-";
  }
}
