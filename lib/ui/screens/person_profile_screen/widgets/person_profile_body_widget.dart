import 'package:flutter/material.dart';
import 'package:hr_management/constants/image_path_constants.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/documents_models/person_profile_models/person_profile_model.dart';
import 'package:hr_management/data/models/documents_models/person_profile_models/person_profile_response.dart';
import 'package:hr_management/logic/blocs/documents_bloc/person_profile_bloc/person_profile_bloc.dart';
import 'package:hr_management/ui/screens/person_profile_screen/widgets/internal_list_widget.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../themes/theme_config.dart';

class PersonProfileBodyWidget extends StatefulWidget {
  PersonProfileBodyWidget();

  @override
  _PersonProfileBodyWidgetState createState() =>
      _PersonProfileBodyWidgetState();
}

class _PersonProfileBodyWidgetState extends State<PersonProfileBodyWidget> {
  @override
  void initState() {
    super.initState();

    personProfileBloc
      ..getData(
        queryparams: _handleQueryParams(),
      );
  }

  /// Helper function to handle query params for the API
  _handleQueryParams() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<PersonProfileResponse>(
        stream: personProfileBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            if (snapshot?.data?.data == null)
              return Center(
                child: Text("No data available."),
              );

            return _listviewWidget(snapshot.data.data.elementAt(0));
          } else {
            return CustomProgressIndicator(
              loadingText: "Fetching data...",
            );
          }
        },
      ),
    );
  }

  Widget _listviewWidget(PersonProfileModel data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.noteTableRows.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Image.asset(
              _handleLeadingIcon(
                templateName: data.noteTableRows.elementAt(index).templateName,
              ),
              width: 32.0,
              height: 32.0,
              fit: BoxFit.fitHeight,
            ),
            title: Text(data.noteTableRows.elementAt(index).templateName),
            trailing: Icon(Icons.chevron_right),
            onTap: () => _handleListTileOnTap(
              context: context,
              listTileData: data.noteTableRows.elementAt(index),
            ),
          ),
        );
      },
    );
  }

  void _handleListTileOnTap({
    NoteTableRows listTileData,
    BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
          // drawer: drawerWidget(context),
          appBar: AppbarWidget(
            title: listTileData.templateName ?? "",
          ),
          body: SafeArea(
            child: InternetConnectivityWidget(
              child: InternalListWidget(
                templateId: listTileData.id,
                templateName: listTileData.templateName,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _handleLeadingIcon({
    @required String templateName,
  }) {
    if (templateName == noteIndexTableMap[NoteIndexTableType.employeeVisa])
      return EMPLOYEE_VISA_ICON;

    if (templateName == noteIndexTableMap[NoteIndexTableType.otherDocument])
      return OTHER_DOCUMENT_ICON;

    if (templateName == noteIndexTableMap[NoteIndexTableType.employeeId])
      return EMPLOYEE_ID_ICON;

    if (templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeTrainingCourses])
      return EMPLOYEE_TRAINING_COURSES_ICON;

    if (templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeWorkExperience])
      return EMPLOYEE_WORK_EXPERIENCE_ICON;

    if (templateName == noteIndexTableMap[NoteIndexTableType.employeePassport])
      return EMPLOYEE_PASSPORT_ICON;

    if (templateName ==
        noteIndexTableMap[NoteIndexTableType.employeeEducationalQualification])
      return EMPLOYEE_EDUCATION_QUALIFICATION_ICON;

    return '';
  }
}