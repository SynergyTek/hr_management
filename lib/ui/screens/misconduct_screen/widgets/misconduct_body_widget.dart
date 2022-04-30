import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/resignation_termination_bloc/resignation_termination_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../../themes/light_theme.dart';
import '../../../widgets/empty_list_widget.dart';
import 'misconduct_list_tile_widget.dart';

class MisconductBodyWidget extends StatefulWidget {
  const MisconductBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MisconductBodyWidget> createState() => _MisconductBodyWidgetState();
}

class _MisconductBodyWidgetState extends State<MisconductBodyWidget> {
  @override
  void initState() {
    //
    handleAPI();

    super.initState();
  }

  handleAPI() async {
    await resignationTerminationBloc.getMisconductData(queryparams: {
      "userId":
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MisconductResponse?>(
      stream: resignationTerminationBloc.subjectMisconduct.stream,
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
    List<MisconductModel> data = const <MisconductModel>[],
  }) {
    if (data.isEmpty) {
      return EmptyListWidget();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return MisconductListTileWidget(
          data: data.elementAt(index),
        );
      },
    );
  }
}
