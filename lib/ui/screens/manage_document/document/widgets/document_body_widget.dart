import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/constants/image_path_constants.dart';
import 'package:hr_management/data/models/documents_models/document_models/document_model.dart';
import 'package:hr_management/data/models/documents_models/document_models/document_response.dart';
import 'package:hr_management/logic/blocs/documents_bloc/document_bloc/document_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';

import '../../../../../data/enums/enums.dart';
import '../../../../../logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import 'document_list_widget.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/progress_indicator.dart';

import '../../../../../themes/theme_config.dart';

class DocumentBodyWidget extends StatefulWidget {
  DocumentBodyWidget();

  @override
  _DocumentBodyWidgetState createState() => _DocumentBodyWidgetState();
}

class _DocumentBodyWidgetState extends State<DocumentBodyWidget> {
  @override
  void initState() {
    super.initState();

    documentBloc
      ..getPersonProfileData(
        queryparams: _handleQueryParams(),
      );
  }

  /// Helper function to handle query params for the API
  _handleQueryParams() {
    return {
      'userid':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<DocumentResponse>(
        stream: documentBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            if (snapshot.data?.data == null)
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

  Widget _listviewWidget(DocumentModel data) {
    if (data.noteTableRows != null && data.noteTableRows!.length != 0) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: data.noteTableRows!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                _handleLeadingIcon(
                  templateName:
                      data.noteTableRows!.elementAt(index).templateName,
                ),
                width: 32.0,
                height: 32.0,
                fit: BoxFit.fitHeight,
              ),
              title: Text(data.noteTableRows!.elementAt(index).templateName!),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _handleListTileOnTap(
                context: context,
                listTileData: data.noteTableRows!.elementAt(index),
              ),
            ),
          );
        },
      );
    } else {
      return EmptyListWidget();
    }
  }

  void _handleListTileOnTap({
    NoteTableRows? listTileData,
    required BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
          // drawer: DrawerWidget(),
          appBar: AppbarWidget(
            title: listTileData!.templateName ?? "",
          ),
          body: SafeArea(
            child: InternetConnectivityWidget(
              child: DocumentListWidget(
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
    required String? templateName,
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
