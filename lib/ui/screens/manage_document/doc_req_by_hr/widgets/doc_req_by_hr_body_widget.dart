import 'package:flutter/material.dart';
import 'package:hr_management/data/models/documents_models/doc_req_by_hr/doc_req_by_hr_model.dart';
import 'package:hr_management/data/models/documents_models/doc_req_by_hr/doc_req_by_hr_response.dart';
import 'package:hr_management/logic/blocs/documents_bloc/doc_req_by_hr_bloc/doc_req_by_hr_bloc.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';
import 'doc_req_by_hr_bottom_sheet_widget.dart';

class DocReqByHrBodyWidget extends StatefulWidget {
  DocReqByHrBodyWidget();

  @override
  _DocReqByHrBodyWidgetState createState() => _DocReqByHrBodyWidgetState();
}

class _DocReqByHrBodyWidgetState extends State<DocReqByHrBodyWidget> {
  @override
  void initState() {
    super.initState();

    docReqByHrBloc
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
      child: StreamBuilder<DocReqByHrResponse>(
        stream: docReqByHrBloc.subject.stream,
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

  Widget _listviewWidget(List<DocReqByHrModel> data) {
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

  _handleListTileOnTap(DocReqByHrModel data) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => DocReqByHrBottomSheetWidget(
        data: data,
      ),
    );
  }

  /// Helper function to handle color of the status.
  Color _handleListTileColor(
    BuildContext context,
    DocReqByHrModel data,
  ) {
    // Guard clause
    if (data?.status == null || data.status.isEmpty) return Colors.white54;

    if (data.status == 'In Progress') return Colors.green;
    if (data.status == 'Draft') return Colors.orangeAccent;
    if (data.status == 'Overdue') return Colors.redAccent;

    return Theme.of(context).invertedColor;
  }
}
