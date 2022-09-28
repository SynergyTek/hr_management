import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/time_permission/widget/time_permission_list_tile_widget.dart';

import '../../../../themes/light_theme.dart';
import '../../../widgets/empty_list_widget.dart';
import 'package:synergy_nts/synergy_nts.dart';

class TimePermissionListViewWidget extends StatefulWidget {
  const TimePermissionListViewWidget({
    Key? key,

    //
  }) : super(key: key);

  @override
  State<TimePermissionListViewWidget> createState() =>
      _TimePermissionListViewWidgetState();
}

class _TimePermissionListViewWidgetState
    extends State<TimePermissionListViewWidget> {
  @override
  void initState() {
    //
    _handleAPI();

    super.initState();
  }

  Future<void> _handleAPI() async {
    // Travel
    await serviceBloc.getTimePermissionData(
      queryparams: {
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            "HR",
      },
    );

    return;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleAPI,
      child: StreamBuilder<TimePermissionResponse?>(
        stream: serviceBloc.subjectTimePermissionList.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _listViewBuilderWidget(
              data: snapshot.data?.data,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: LightTheme().lightThemeData().primaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _listViewBuilderWidget({
    List<TimePermission> data = const <TimePermission>[],
  }) {
    if (data.isEmpty) {
      return EmptyListWidget();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return TimePermissionListTileWidget(
          data: data.elementAt(index),
        );
      },
    );
  }
}
