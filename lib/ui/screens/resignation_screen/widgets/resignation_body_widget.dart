import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/resignation_models/resignation_termination_response.dart';
import 'package:hr_management/logic/blocs/resignation_termination_bloc/resignation_termination_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/resignation_screen/widgets/resignation_list_tile_widget.dart';

import '../../../../themes/light_theme.dart';
import '../../../widgets/empty_list_widget.dart';

class ResignationBodyWidget extends StatefulWidget {
  const ResignationBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ResignationBodyWidget> createState() => _ResignationBodyWidgetState();
}

class _ResignationBodyWidgetState extends State<ResignationBodyWidget> {
  @override
  void initState() {
    //
    handleAPI();

    super.initState();
  }

  handleAPI() async {
    await resignationTerminationBloc
        .getResignationTerminationData(queryparams: {
      "userId":
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResignationTerminationResponse?>(
      stream: resignationTerminationBloc.subjectResignationTermination.stream,
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
    );
  }

  Widget _listViewBuilderWidget({
    List<ResignationTerminationModel> data =
        const <ResignationTerminationModel>[],
  }) {
    if (data.isEmpty) {
      return EmptyListWidget();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ResignationListTileWidget(
          data: data.elementAt(index),
        );
      },
    );
  }
}
