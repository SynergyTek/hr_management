import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/maps/maps.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

import 'package:synergy_drawer/synergy_drawer.dart';

import '../../../routes/route_constants.dart';
import '../primary_button.dart';

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
      logoutFunction: _handleLogoutOnPressed,
    );
  }

  _handleLogoutOnPressed(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade50,
          title: Text('Logout?'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SecondaryButton(
                      buttonText: 'Cancel',
                      handleOnPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: PrimaryButton(
                      buttonText: 'Logout',
                      handleOnPressed: () {
                        BlocProvider.of<UserModelBloc>(context).add(
                          UserModelChangeEvent(
                            userModel: null,
                            extraUserInformation: null,
                          ),
                        );

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LOGIN_ROUTE,
                          ModalRoute.withName('/login'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
