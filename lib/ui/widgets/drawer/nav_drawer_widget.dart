import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/maps/maps.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

import 'package:synergy_drawer/synergy_drawer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SynergyDrawer(
      userName:
          BlocProvider.of<UserModelBloc>(context).state.userModel?.userName ??
              'Guest',
      email:
          BlocProvider.of<UserModelBloc>(context).state.userModel?.userName ??
              '',
      data: BlocProvider.of<UserModelBloc>(context)
              .state
              .extraUserInformation
              ?.userPermissionResponse
              ?.data ??
          [],
      mapRoute: drawerMenuRouteMap,
    );
  }
}
