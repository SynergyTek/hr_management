import 'package:flutter/material.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/documents_models/note_index_models/note_index_model.dart';
import '../../../../data/models/documents_models/note_index_models/note_index_response.dart';
import '../../../../logic/blocs/documents_bloc/note_index_bloc/note_index_bloc.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class InternalListWidget extends StatefulWidget {
  final String templateId;
  final String templateName;

  InternalListWidget({
    @required this.templateId,
    @required this.templateName,
  });

  @override
  _InternalListWidgetState createState() => _InternalListWidgetState();
}

class _InternalListWidgetState extends State<InternalListWidget> {
  @override
  void initState() {
    super.initState();

    noteIndexBloc.subject.sink.add(null);

    noteIndexBloc
      ..getData(
        queryparams: _handleQueryParams(),
      );
  }

  /// Helper function to handle query params for the API
  _handleQueryParams() {
    return {
      'indexPageTemplateId': widget?.templateId ?? '',
      'ownerType': 'owner',
      // 'userId': '45bba746-3309-49b7-9c03-b5793369d73c',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<NoteIndexResponse>(
        stream: noteIndexBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _listviewWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator(
              loadingText: "Fetching data...",
            );
          }
        },
      ),
    );
  }

  Widget _listviewWidget(List<NoteIndexModel> data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data available.",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      );

    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(),
          background: slideRightBackground(),
          child: _eachListTile(
            data.elementAt(index),
          ),
          confirmDismiss: (DismissDirection direction) async {
            final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("Are you sure you want to edit this entry?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();

                        serviceBloc.subject.sink.add(null);
                        Navigator.pushNamed(
                          context,
                          ADD_EDIT_NOTE_ROUTE,
                          arguments: ScreenArguments(
                            arg1: '',
                            arg2: data.elementAt(index).noteId ?? '',
                            arg3:
                                data.elementAt(index).templateDisplayName ?? '',
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
            return res;
          },
        );
      },
    );
  }

  Widget _eachListTile(NoteIndexModel data) {
    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeVisa])
      return Card(
        child: ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formatText(
                key: 'Duration of Stay',
                value: data.durationOfStay,
              ),
              _formatText(
                key: 'Entry Type',
                value: data.entryTypeIdName,
              ),
              _formatText(
                key: 'Expire Date',
                value: data.expireDate,
              ),
              _formatText(
                key: 'Visa Job Title',
                value: data.jobTitle,
              ),
              _formatText(
                key: 'Document No',
                value: data.noteNo,
              ),
              _formatText(
                key: 'Place of Issue',
                value: data.placeOfIssue,
              ),
              _formatText(
                key: 'Purpose',
                value: data.purpose,
              ),
              _formatText(
                key: 'Sponsor Name',
                value: data.sponsorName,
              ),
              _formatText(
                key: 'UID Number',
                value: data.uidNo,
              ),
              _formatText(
                key: 'Visa Attachment',
                value: data.visaAttachmentId,
              ),
              _formatText(
                key: 'Visa Number',
                value: data.visaNumber,
              ),
              _formatText(
                key: 'Visa Type',
                value: data.visaTypeIdName,
              ),
            ],
          ),
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.otherDocument])
      return Card(
        child: ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formatText(
                key: 'Document Name',
                value: data.documentName,
              ),
              _formatText(
                key: 'Document Description',
                value: data.documentDescription,
              ),
              _formatText(
                key: 'Attachment',
                value: data.attachment,
              ),
            ],
          ),
        ),
      );

    if (widget.templateName == noteIndexTableMap[NoteIndexTableType.employeeId])
      return Card(
        child: ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formatText(
                key: 'Expiry Date',
                value: data.documentExpiryDate,
              ),
              _formatText(
                key: 'Issue Date',
                value: data.issueDate,
              ),
              _formatText(
                key: 'ID Card Job Title',
                value: data.idCardJobTitle,
              ),
              _formatText(
                key: 'ID Number',
                value: data.idCardNumber,
              ),
              _formatText(
                key: 'Document No',
                value: data.noteNo,
              ),
              _formatText(
                key: 'Place of Issue',
                value: data.placeOfIssue,
              ),
            ],
          ),
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeTrainingCourses])
      return Card(
        child: ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formatText(
                key: 'Training Completion Date',
                value: data.endDate,
              ),
              _formatText(
                key: 'Institute/University Name',
                value: data.instituteUniversityName,
              ),
              _formatText(
                key: 'Location',
                value: data.location,
              ),
              _formatText(
                key: 'Document No',
                value: data.noteNo,
              ),
              _formatText(
                key: 'Training Name',
                value: data.trainingSubject,
              ),
            ],
          ),
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeWorkExperience])
      return Card(
        child: ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formatText(
                key: 'Employee Job Title',
                value: data.jobTitle,
              ),
              _formatText(
                key: 'Last Manager Name',
                value: data.lastManagerName,
              ),
              _formatText(
                key: 'Document No',
                value: data.noteNo,
              ),
              _formatText(
                key: 'Reason For Leaving',
                value: data.reasonForLeaving,
              ),
              _formatText(
                key: 'Start Date',
                value: data.startDate,
              ),
              _formatText(
                key: 'Employee Person Full Name',
                value: data.employeeIdPersonFullName,
              ),
              _formatText(
                key: 'Current Employer',
                value: data.currentEmployee,
              ),
              _formatText(
                key: 'Employee Address',
                value: data.employeeAddress,
              ),
              _formatText(
                key: 'End Date',
                value: data.endDate,
              ),
            ],
          ),
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeePassport])
      return Card(
        child: ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formatText(
                key: 'Nationality Name',
                value: data.nationalityIdNationalityName,
              ),
              _formatText(
                key: 'Document No',
                value: data.noteNo,
              ),
              _formatText(
                key: 'Date of Birth',
                value: data.dateOfBirth,
              ),
              _formatText(
                key: 'Issue Date',
                value: data.dateOfIssue,
              ),
              _formatText(
                key: 'Expire Date',
                value: data.expireDate,
              ),
              _formatText(
                key: 'Birth Country',
                value: data.countryOfBirthIdCountryName,
              ),
              _formatText(
                key: 'Passport Attachment ID',
                value: data.passportAttachmentId,
              ),
              _formatText(
                key: 'Passport Number',
                value: data.passportNumber,
              ),
              _formatText(
                key: 'Place of Birth',
                value: data.placeOfBirth,
              ),
              _formatText(
                key: 'Place of Issue',
                value: data.placeOfIssue,
              ),
            ],
          ),
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeEducationalQualification])
      return Card(
        child: ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formatText(
                key: 'Attachment',
                value: data.attachment,
              ),
              _formatText(
                key: 'Attested',
                value: data.attested,
              ),
              _formatText(
                key: 'Completed Date',
                value: data.completedDate,
              ),
              _formatText(
                key: 'Document No',
                value: data.noteNo,
              ),
              _formatText(
                key: 'Qualification Name',
                value: data.qualificationName,
              ),
              _formatText(
                key: 'Start Date',
                value: data.startDate,
              ),
            ],
          ),
        ),
      );

    /// Default 404 message to display.
    return Center(
      child: Container(
        padding: DEFAULT_PADDING,
        child: Text(
            "The template id is unrecognised, pl contact the developer for further assistance."),
      ),
    );
  }

  /// Helper function to Format the list tile text according to the key-value format.
  RichText _formatText({
    String key,
    String value,
  }) {
    if (key == null || key.isEmpty) key = '-';
    if (value == null || value.isEmpty) value = '-';

    return RichText(
      text: TextSpan(
        text: key + ': \t',
        style: Theme.of(context).textTheme.subtitle2,
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              "\t Edit \t",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
