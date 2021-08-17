import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/note_bloc/note_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/widgets/synergy_divider_widget.dart';

import '../../../../../data/enums/enums.dart';
import '../../../../../data/models/documents_models/note_index_models/note_index_model.dart';
import '../../../../../data/models/documents_models/note_index_models/note_index_response.dart';
import '../../../../../logic/blocs/documents_bloc/note_index_bloc/note_index_bloc.dart';
import '../../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../../routes/route_constants.dart';
import '../../../../../routes/screen_arguments.dart';
import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';
import 'document_bottom_sheet_widget.dart';

class DocumentListWidget extends StatefulWidget {
  final String templateId;
  final String templateName;

  DocumentListWidget({
    @required this.templateId,
    @required this.templateName,
  });

  @override
  _DocumentListWidgetState createState() => _DocumentListWidgetState();
}

class _DocumentListWidgetState extends State<DocumentListWidget> {
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
      'userid':
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? '',
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
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data.noteNo,
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
                subtitle: Text(
                  "Visa Number: ${data?.visaNumber ?? '-'}",
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.expireDate?.split(' ')?.elementAt(0) ?? '-',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    Text('Expire Date'),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            // open bottom sheet

            showDocumentBottomSheet(
              bottomSheetDataList: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.noteNo,
                        subtitle: 'Document ID',
                        isHeading: true,
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.jobTitle,
                        subtitle: 'Visa Job Title',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.visaNumber,
                        subtitle: 'Visa Number',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.entryTypeIdName,
                        subtitle: 'Entry Type',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.visaTypeIdName,
                        subtitle: 'Visa Type',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.durationOfStay,
                        subtitle: 'Duration of Stay',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title:
                            data.expireDate?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'Expire Date',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.sponsorName,
                        subtitle: 'Sponsor Name',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.uidNo,
                        subtitle: 'UID Number',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.purpose,
                        subtitle: 'Purpose',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.visaAttachmentId,
                        subtitle: 'Visa Attachment',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.placeOfIssue,
                        subtitle: 'Place of Issue',
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.otherDocument])
      return Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data?.documentName ?? '-',
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
                subtitle: Text(
                  "${data?.noteNo ?? '-'}",
                ),
                trailing: Icon(
                  Icons.chevron_right,
                ),
              ),
            ],
          ),
          onTap: () {
            // open bottom sheet
            showDocumentBottomSheet(
              bottomSheetDataList: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.noteNo,
                        subtitle: 'Document ID',
                        isHeading: true,
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.documentName,
                        subtitle: 'Document Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.documentDescription,
                        subtitle: 'Document Description',
                      ),
                    ),
                    // Expanded(
                    //   child: _statisticWidget(
                    //     context: context,
                    //     title: data.attachment,
                    //     subtitle: 'Attachment',
                    //   ),
                    // ),
                  ],
                ),
              ],
            );
          },
        ),
      );

    if (widget.templateName == noteIndexTableMap[NoteIndexTableType.employeeId])
      return Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data.noteNo,
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
                subtitle: Text(
                  "Employee ID: ${data?.idCardNumber ?? '-'}",
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.documentExpiryDate?.split(' ')?.elementAt(0) ?? '-',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    Text('Expiry Date'),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            showDocumentBottomSheet(
              bottomSheetDataList: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.noteNo,
                        subtitle: 'Document ID',
                        isHeading: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.idCardNumber,
                        subtitle: 'ID Number',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.idCardJobTitle,
                        subtitle: 'ID Card Job Title',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.placeOfIssue,
                        subtitle: 'Place of Issue',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data?.issueDate?.split(' ')?.elementAt(0) ?? '-',
                        subtitle: 'Issue Date',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data?.documentExpiryDate
                                ?.split(' ')
                                ?.elementAt(0) ??
                            '-',
                        subtitle: 'Expiry Date',
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeTrainingCourses])
      return Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data.noteNo,
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
                subtitle: Text(
                  "Training: ${data?.trainingSubject ?? '-'}",
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data?.endDate?.split(' ')?.elementAt(0) ?? '-',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    Text('Completion Date'),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            showDocumentBottomSheet(
              bottomSheetDataList: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.noteNo,
                        subtitle: 'Document ID',
                        isHeading: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.trainingSubject,
                        subtitle: 'Training Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.instituteUniversityName,
                        subtitle: 'Institute/University Name',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.location,
                        subtitle: 'Location',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data?.endDate?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'Training Completion Date',
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeWorkExperience])
      return Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data.noteNo,
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
                subtitle: Text(
                  "${data?.employeeIdPersonFullName ?? '-'}",
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data?.endDate?.split(' ')?.elementAt(0) ?? '-',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    Text('End Date'),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            showDocumentBottomSheet(
              bottomSheetDataList: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.noteNo,
                        subtitle: 'Document ID',
                        isHeading: true,
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.currentEmployee,
                        subtitle: 'Current Employer',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.employeeIdPersonFullName,
                        subtitle: 'Employee Person Full Name',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.jobTitle,
                        subtitle: 'Employee Job Title',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.lastManagerName,
                        subtitle: 'Last Manager Name',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.reasonForLeaving,
                        subtitle: 'Reason For Leaving',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title:
                            data?.startDate?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'Start Date',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.endDate?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'End Date',
                      ),
                    ),
                  ],
                ),
                _statisticWidget(
                  context: context,
                  title: data.employeeAddress,
                  subtitle: 'Employee Address',
                ),
              ],
            );
          },
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeePassport])
      return Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data.noteNo,
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
                subtitle: Text(
                  "Passport: ${data?.passportNumber ?? '-'}",
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data?.expireDate?.split(' ')?.elementAt(0) ?? '-',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    Text('Expire Date'),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            showDocumentBottomSheet(
              bottomSheetDataList: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.noteNo,
                        subtitle: 'Document No',
                        isHeading: true,
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.nationalityIdNationalityName,
                        subtitle: 'Nationality Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.passportNumber,
                        subtitle: 'Passport Number',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.passportAttachmentId,
                        subtitle: 'Passport Attachment ID',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title:
                            data?.dateOfIssue?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'Issue Date',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title:
                            data?.expireDate?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'Expire Date',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title:
                            data?.dateOfBirth?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'Date of Birth',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.countryOfBirthIdCountryName,
                        subtitle: 'Birth Country',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.placeOfBirth,
                        subtitle: 'Place of Birth',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.placeOfIssue,
                        subtitle: 'Place of Issue',
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

    if (widget.templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeEducationalQualification])
      return Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data.noteNo,
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
                subtitle: Text(
                  "Qualification: ${data?.qualificationName ?? '-'}",
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data?.completedDate?.split(' ')?.elementAt(0) ?? '-',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    Text('Completed Date'),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            showDocumentBottomSheet(
              bottomSheetDataList: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.noteNo,
                        subtitle: 'Document No',
                        isHeading: true,
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.qualificationName,
                        subtitle: 'Qualification Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.attachment,
                        subtitle: 'Attachment',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.attested,
                        subtitle: 'Attested',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data.startDate?.split(' ')?.elementAt(0) ?? null,
                        subtitle: 'Start Date',
                      ),
                    ),
                    Expanded(
                      child: _statisticWidget(
                        context: context,
                        title: data?.completedDate?.split(' ')?.elementAt(0) ??
                            null,
                        subtitle: 'Completed Date',
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
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

  showDocumentBottomSheet({@required List<Widget> bottomSheetDataList}) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DocumentBottomSheetWidget(
          bottomSheetDataList: bottomSheetDataList ?? [],
        );
      },
    );
  }

  Widget _statisticWidget({
    @required BuildContext context,
    String title,
    String subtitle,
    bool isHeading = false,
  }) {
    return ListTile(
      title: Text(
        title ?? '-',
        style: TextStyle(
          color:
              isHeading ? Theme.of(context).textHeadingColor : Colors.black87,
        ),
      ),
      subtitle: Text(subtitle ?? '-'),
    );
  }
}
