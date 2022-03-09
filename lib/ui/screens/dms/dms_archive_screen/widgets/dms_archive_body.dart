import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_model.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_document_action_bloc/dms_document_action_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../listizer/listizer.dart';

class DMSArchiveBody extends StatefulWidget {
  const DMSArchiveBody({Key? key}) : super(key: key);

  @override
  _DMSArchiveBodyState createState() => _DMSArchiveBodyState();
}

class _DMSArchiveBodyState extends State<DMSArchiveBody> {
  List<DMSDocumentActionModel> _archiveList = [];
  List<DMSDocumentActionModel> _filteredArchiveList = [];

  @override
  void initState() {
    super.initState();

    //   dmsDocumentActionBloc
    //     ..getAPIData(
    //       queryparams: _handleQueryParams(),
    //     );
  }

  _handleQueryParams() {
    return {
      'userId':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: Column(
        children: [
          Expanded(
              child: StreamBuilder<DMSDocumentActionResponse>(
            stream: dmsDocumentActionBloc.subject.stream,
            builder:
                (context, AsyncSnapshot<DMSDocumentActionResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.data == null ||
                    snapshot.data!.data!.length == 0) {
                  return EmptyListWidget();
                }
                _archiveList = snapshot.data!.data!.reversed.toList();
                return Listizer(
                  listItems: _archiveList,
                  filteredSearchList: _filteredArchiveList,
                  itemBuilder: (context, index) {
                    var item = _archiveList[index];
                    return ListTile(
                      title: Text(item.documentName!),
                      leading: Icon(
                        item.templatecode == 'WORKSPACE_GENERAL' ||
                                item.templatecode == 'GENERAL_FOLDER'
                            ? CustomIcons.folder
                            : CustomIcons.file_alt,
                        color: item.templatecode == 'WORKSPACE_GENERAL'
                            ? Colors.blue
                            : item.templatecode == 'GENERAL_FOLDER'
                                ? Colors.yellow
                                : Colors.cyan,
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
            },
          ))
        ],
      ),
    );
  }
}
