import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/reimbursement_screens/widgets/reimbursement_list_tile_widget.dart';

import '../../../../themes/light_theme.dart';
import '../../../widgets/empty_list_widget.dart';

class ReimbursementListViewWidget extends StatefulWidget {
  final selectedIndex;
  const ReimbursementListViewWidget({
    Key? key,

    //
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<ReimbursementListViewWidget> createState() =>
      _ReimbursementListViewWidgetState();
}

class _ReimbursementListViewWidgetState
    extends State<ReimbursementListViewWidget> {
  @override
  void initState() {
    //
    _handleAPI();

    super.initState();
  }

  Future<void> _handleAPI() async {
    // Travel
    if (widget.selectedIndex == 0) {
      await leaveBloc.getTravelReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
        },
      );
    }

    // Medical
    else if (widget.selectedIndex == 1) {
      await leaveBloc.getMedicalReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
        },
      );
    }

    // Education
    else if (widget.selectedIndex == 2) {
      await leaveBloc.getEducationalReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
        },
      );
    }

    // Other
    else if (widget.selectedIndex == 3) {
      await leaveBloc.getOtherReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
        },
      );
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleAPI,
      child: StreamBuilder<ReimbursementResponse?>(
        stream: leaveBloc.subjectReimbursementList.stream,
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
    List<ReimbursementModel> data = const <ReimbursementModel>[],
  }) {
    if (data.isEmpty) {
      return EmptyListWidget();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ReimbursementListTileWidget(
          data: data.elementAt(index),
        );
      },
    );
  }
}
