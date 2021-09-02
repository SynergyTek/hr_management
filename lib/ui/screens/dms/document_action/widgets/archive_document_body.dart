import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_model.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_document_action_bloc/dms_document_action_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class ArchiveDocumentBody extends StatefulWidget {
  ArchiveDocumentBody({Key key}) : super(key: key);

  @override
  _ArchiveDocumentBodyState createState() => _ArchiveDocumentBodyState();
}

class _ArchiveDocumentBodyState extends State<ArchiveDocumentBody> {
  List<DMSDocumentActionModel> _documentList = [];
  List<DMSDocumentActionModel> _filteredDocumentList = [];

  @override
  void initState() {
    dmsDocumentActionBloc
      ..getArchiveDocumentData(
        queryparams: {
          'userId':
              BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ??
                  '',
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<DMSDocumentActionResponse>(
          stream: dmsDocumentActionBloc.subject.stream,
          builder:
              (context, AsyncSnapshot<DMSDocumentActionResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.data == null ||
                  snapshot.data.data.length == 0) {
                return EmptyListWidget();
              }
              _documentList = snapshot.data.data.reversed.toList();
              return Listizer(
                listItems: _documentList,
                filteredSearchList: _filteredDocumentList,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredDocumentList[index].documentName),
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(
                  loadingText: 'Fetching data',
                ),
              );
            }
          }),
    );
  }
}
