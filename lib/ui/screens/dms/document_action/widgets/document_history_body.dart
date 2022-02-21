import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/constants/formats.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_model.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_document_action_bloc/dms_document_action_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import '../../../../listizer/listizer.dart';

class DocumentHistoryBody extends StatefulWidget {
  DocumentHistoryBody({Key? key}) : super(key: key);

  @override
  _DocumentHistoryBodyState createState() => _DocumentHistoryBodyState();
}

class _DocumentHistoryBodyState extends State<DocumentHistoryBody> {
  List<DMSDocumentActionModel> _documentList = [];
  List<DMSDocumentActionModel> _filteredDocumentList = [];

  @override
  void initState() {
    dmsDocumentActionBloc
      ..getDocumentHistoryData(
        queryparams: {
          'userId':
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ??
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
              if (snapshot.data!.data == null ||
                  snapshot.data!.data!.length == 0) {
                return EmptyListWidget();
              }
              _documentList = snapshot.data!.data!.reversed.toList();
              return Listizer(
                listItems: _documentList,
                filteredSearchList: _filteredDocumentList,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        _filteredDocumentList[index].documentName!,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Row(
                              children: <Widget>[
                                Text("Document Type: "),
                                Text(_filteredDocumentList[index].documentType!),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("Updated By: "),
                              Flexible(
                                child: Text(
                                  _filteredDocumentList[index].updatedByUser!,
                                  style:
                                      TextStyle(color: Colors.deepPurple[900]),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Status: "),
                              Flexible(
                                child: Text(
                                  _filteredDocumentList[index].statusName!,
                                  style: TextStyle(color: Colors.green[800]),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Created On: '),
                              Text(
                                dateformatter.format(DateTime.parse(
                                    _filteredDocumentList[index].createdDate!)),
                                style: TextStyle(color: Colors.red[700]),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Modified On: '),
                              Text(
                                dateformatter.format(DateTime.parse(
                                    _filteredDocumentList[index].updatedDate!)),
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
                child: CustomProgressIndicator(
                  loadingText: 'Fetching data',
                ),
              );
            }
          }),
    );
  }
}
