import 'package:flutter/material.dart';

import 'package:hr_management/data/models/dms/parent_workspace_id_name_list_model/parent_workspace_id_name_list_model.dart';
import 'package:hr_management/data/models/dms/parent_workspace_id_name_list_model/parent_workspace_id_name_list_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/parent_workspace_id_name_list_bloc/parent_workspace_id_name_list_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class ParentWorkspaceIdNameListBodyWidget extends StatefulWidget {
  final DMSParentWorkspaceIdNameListModel? data;
  ParentWorkspaceIdNameListBodyWidget({
    required this.data,
  });

  @override
  _ParentWorkspaceIdNameListBodyWidgetState createState() =>
      _ParentWorkspaceIdNameListBodyWidgetState();
}

class _ParentWorkspaceIdNameListBodyWidgetState
    extends State<ParentWorkspaceIdNameListBodyWidget> {
  @override
  void initState() {
    super.initState();

    dmsParentWorkspaceIdNameListBloc.getParentWorkspace(
      id: widget.data?.id, legalEntity: widget.data?.name,
      // queryparams: {
      //   "userId":
      //       BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      //   "portalName": "HR",
      // },
    );
    // dmsParentWorkspaceIdNameListBloc
    //   ..getAPIData(id: widget.data?.id, legalEntity: widget.data?.name);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Container(
        padding: DEFAULT_PADDING,
        child: StreamBuilder<ParentWorkspaceIdNameListResponse>(
          stream: dmsParentWorkspaceIdNameListBloc.subject.stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }

              return _bodyWidget(snapshot.data?.data ?? []);
            } else {
              return CustomProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget _bodyWidget(List<DMSParentWorkspaceIdNameListModel> data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data available.",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      );

    return ListView.separated(
      shrinkWrap: true,
      itemCount: data.length,
      separatorBuilder: (BuildContext context, _) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return _eachListTile(
          data: data.elementAt(index),
        );
        // return _eachBodyItem(
        //   data: data.elementAt(index),
        // );
      },
    );
  }

  // Widget _eachBodyItem({
  //   @required DMSParentWorkspaceIdNameListModel data,
  // }) {
  //   // If there are no children we have reached the last level (child) of the tree.
  //   // else, we need expansion tile to handle it.
  //   if (data?.children == null || data.children.isEmpty) {
  //     return _eachListTile(data: data);
  //   }

  //   return _eachExpansionTile(data: data);
  // }

  // Widget _eachExpansionTile({
  //   @required DMSParentWorkspaceIdNameListModel data,
  // }) {
  //   return ExpansionTile(
  //     title: Text(data?.name ?? ""),
  //     children: List.generate(
  //       data.children.length,
  //       (index) => ListTile(
  //         title: Text(data.children.elementAt(index).id),
  //         subtitle: Text(
  //           data.children.elementAt(index).subjectLabelName ?? '-',
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _eachListTile({
    required DMSParentWorkspaceIdNameListModel data,
  }) {
    return ListTile(
      leading: Icon(Icons.list_outlined),
      trailing: (widget.data?.name != null &&
              data.name != null &&
              widget.data!.name == data.name)
          ? Icon(
              Icons.check_box,
              color: Theme.of(context).textHeadingColor,
              size: 24.0,
            )
          : Container(
              width: 0,
              height: 0,
            ),
      title: Text(
        data.name != null ? data.name! : "NA",
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.black87,
            ),
      ),
      onTap: () => _handleListTileOnTap(data),
    );
  }

  _handleListTileOnTap(DMSParentWorkspaceIdNameListModel data) {
    Navigator.of(context).pop(data);
  }
}
