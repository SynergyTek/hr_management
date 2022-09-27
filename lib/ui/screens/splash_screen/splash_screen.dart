import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/login_models/login_response_model.dart';
import 'package:hr_management/data/repositories/permission_repository/user_permission_repository/abstract_user_permission_repository.dart.dart';
import 'package:hr_management/logic/blocs/permission_bloc/user_permission_bloc/user_permission_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/api_endpoints.dart';
import '../../../data/models/login_models/extra_user_information_model.dart';
import '../../../routes/route_constants.dart';
import 'widgets/splash_screen_body_widget.dart';

class SplashScreen extends StatelessWidget {
  /// Text to be displayed below the Circular ProgressIndicator.
  final String titleText;
  final String? subtitleText;

  /// Default text is "Loading".
  final String? loadingText;

  const SplashScreen({
    required this.titleText,
    this.subtitleText,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: FutureBuilder<Object>(
          future: Future.delayed(
            const Duration(
              seconds: 2,
            ),
            () {
              return checkLoggedIn(context);
            },
          ),
          builder: (context, snapshot) {
            return SplashScreenBodyWidget(
              titleText: titleText,
              subtitleText: subtitleText,
              loadingText: loadingText,
            );
          },
        ),
      ),
    );
  }

  checkLoggedIn(
    BuildContext context,
  ) async {
    WidgetsFlutterBinding.ensureInitialized();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var username = prefs.getString('username');
    // var id = prefs.getString('id');
    // print(id);

    LoginResponseModel? model =
        BlocProvider.of<UserModelBloc>(context).state.userModel;

    // Setting up the portal type and
    // saving up the saved portal to the hydrated bloc.
    BlocProvider.of<UserModelBloc>(context).add(
      UserModelChangeEvent(
        userModel: model,
        extraUserInformation: ExtraUserInformationModel(
          isSignedIn: BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.isSignedIn ??
              false,
          portalType: APIEndpointConstants.PORTAL_NAME,
          userPermissionResponse: null,
        ),
      ),
    );

    if (model?.email == null) {
      Navigator.pushReplacementNamed(
        context, LOGIN_ROUTE,
        // WORKBOARD_SCREEN,
      );
    } else {
      print(
        BlocProvider.of<UserModelBloc>(context)
            .state
            .extraUserInformation
            ?.isSignedIn,
      );

      print(
        BlocProvider.of<UserModelBloc>(context)
            .state
            .extraUserInformation
            ?.portalType,
      );

      // user is already logged in, use this function to send device token to the backend.
      Navigator.pushReplacementNamed(
        context,
        EMPLOYE_DASHBOARD,
        // WORKBOARD_SCREEN,
      );
    }
  }
}
