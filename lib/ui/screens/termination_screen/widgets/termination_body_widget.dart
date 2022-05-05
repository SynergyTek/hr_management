import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/termination_screen/widgets/termination_list_tile_widget.dart';

import '../../../../logic/blocs/resignation_termination_bloc/resignation_termination_bloc.dart';
import '../../../widgets/empty_list_widget.dart';

class TerminationBodyWidget extends StatefulWidget {
  const TerminationBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TerminationBodyWidget> createState() => _TerminationBodyWidgetState();
}

class _TerminationBodyWidgetState extends State<TerminationBodyWidget> {
  @override
  void initState() {
    //
    handleAPI();

    super.initState();
  }

  handleAPI() async {
    await resignationTerminationBloc.getTerminationData(queryparams: {
      "userId":
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
      "portalName": BlocProvider.of<UserModelBloc>(context)
              .state
              .extraUserInformation
              ?.portalType ??
          "HR",
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TerminationResponse?>(
      stream: resignationTerminationBloc.subjectTermination.stream,
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
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _listViewBuilderWidget({
    List<TerminationModel> data = const <TerminationModel>[],
  }) {
    if (data.isEmpty) {
      return EmptyListWidget();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return TerminationListTileWidget(
          data: data.elementAt(index),
        );
      },
    );
  }
}
