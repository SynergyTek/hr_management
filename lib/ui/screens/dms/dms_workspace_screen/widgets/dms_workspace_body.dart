import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_model.dart';
import 'package:hr_management/data/models/dms/workspace_view_model/workspace_view_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_workspace_bloc/manage_workspace_bloc/manage_workspace_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class DMSWorkspaceBody extends StatefulWidget {
  @override
  _DMSWorkspaceBodyState createState() => _DMSWorkspaceBodyState();
}

class _DMSWorkspaceBodyState extends State<DMSWorkspaceBody> {
  List<WorkspaceViewModel> _itemList = [];
  List<WorkspaceViewModel> _filteredItemList = [];

  @override
  void initState() {
    dmsManageWorkspaceBloc..getWorkspaceData(queryparams: {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<WorkspaceViewResponse>(
          // stream: dmsManageWorkspaceBloc.getWorkspaceSubject.stream,
          builder: (BuildContext context,
              AsyncSnapshot<WorkspaceViewResponse> snapshot) {
            print("Snapshot data: ${snapshot.data.data}");
            if (snapshot.hasData) {
              if (snapshot.data.data == null ||
                  snapshot.data.data.length == 0) {
                return EmptyListWidget();
              }
              _itemList = snapshot.data.data;
              return Listizer(
                listItems: _itemList,
                filteredSearchList: _filteredItemList,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      tileColor: Theme.of(context).notInvertedColor,
                      title: Text(_itemList[index].createdBy),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(),
              );
            }
          }
          //   if (snapshot.data.list == null || snapshot.data.list.length == 0) {
          //     return EmptyListWidget();
          //   }
          // _itemList = snapshot.data.list;
          // return Listizer(
          //   listItems: _itemList,
          //   filteredSearchList: _filteredItemList,
          //     itemBuilder: (context, index) {
          // //   return Card(
          // //   elevation: 4,
          // //   child: ListTile(
          // //     tileColor: Theme.of(context).notInvertedColor,

          // //   ),
          // // );
          // );
          // } else {
          //   return Center(
          //     child: CustomProgressIndicator(),
          //   );
          // }
          // },
          ),
    );
  }
}
