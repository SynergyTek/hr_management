import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:synergy_nts/synergy_nts.dart';

class TestScreenWidget extends StatelessWidget {
  const TestScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: NTSWrapperWidget(
        ntsType: NTSType.note,
        userID:
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
      ),
    );
  }
}
