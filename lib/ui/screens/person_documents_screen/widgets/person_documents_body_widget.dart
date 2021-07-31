import 'package:flutter/material.dart';
import '../../../../data/models/documents_models/person_document_models/person_document_model.dart';
import '../../../../data/models/documents_models/person_document_models/person_document_response.dart';
import '../../../../logic/blocs/documents_bloc/person_documents_bloc/person_documents_bloc.dart';
import 'person_documents_bottom_sheet_widget.dart';
import '../../../widgets/progress_indicator.dart';

import '../../../../themes/theme_config.dart';

class PersonDocumentsBodyWidget extends StatefulWidget {
  PersonDocumentsBodyWidget();

  @override
  _PersonDocumentsBodyWidgetState createState() =>
      _PersonDocumentsBodyWidgetState();
}

class _PersonDocumentsBodyWidgetState extends State<PersonDocumentsBodyWidget> {
  @override
  void initState() {
    super.initState();

    personDocumentsBloc
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
      child: StreamBuilder<PersonDocumentsResponse>(
        stream: personDocumentsBloc.subject.stream,
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

  Widget _listviewWidget(List<PersonDocumentsModel> data) {
    return ListView.builder(
      itemCount: data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(data?.elementAt(index)?.documentType ?? "NA"),
          subtitle: Text(data?.elementAt(index)?.serviceNo ?? "NA"),
          trailing: Text(
            data?.elementAt(index)?.status ?? "NA",
            style: TextStyle(
              color: _handleListTileColor(
                context,
                data.elementAt(index),
              ),
            ),
          ),
          onTap: () => _handleListTileOnTap(data?.elementAt(index)),
        );
      },
    );
  }

  _handleListTileOnTap(PersonDocumentsModel data) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => PersonDocumentsBottomSheetWidget(
        data: data,
      ),
    );
  }

  /// Helper function to handle color of the status.
  Color _handleListTileColor(
    BuildContext context,
    PersonDocumentsModel data,
  ) {
    // Guard clause
    if (data?.status == null || data.status.isEmpty) return Colors.white54;

    if (data.status == 'In Progress') return Colors.green;
    if (data.status == 'Draft') return Colors.orangeAccent;
    if (data.status == 'Overdue') return Colors.redAccent;

    return Theme.of(context).invertedColor;
  }
}
