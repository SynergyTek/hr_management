import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/blocs/internet_bloc/internet_bloc.dart';
import '../../../logic/blocs/location_bloc/location_bloc.dart';
import '../../../logic/blocs/profile_settings_bloc/profile_settings_bloc.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/routes.dart';
import '../../../themes/app_theme.dart';

class InitScreen extends StatelessWidget {
  const InitScreen();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // Since we are instantiating (creating) the InternetBloc inside the BlocProvider,
          // BlocProvider will take care of the Bloc's dispose and other such stuff.
          BlocProvider<InternetBloc>(
            create: (context) => InternetBloc(
              connectivity: Connectivity(),
            ),
          ),

          BlocProvider<LocationBloc>(
            create: (context) => LocationBloc()
              ..add(
                LocationStartedEvent(),
              ),
          ),

          BlocProvider<UserModelBloc>(
            create: (context) => UserModelBloc(),
          ),

          BlocProvider<ProfileSettingsBloc>(
            create: (context) => ProfileSettingsBloc(),
          ),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return Builder(
            builder: (context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                // Light Theme:
                theme: AppTheme.lightTheme,
                // Dark Theme:
                darkTheme: AppTheme.darkTheme,
                // ThemeMode:
                themeMode: context.select(
                  (ProfileSettingsBloc profileSettingsBloc) {
                    if (profileSettingsBloc
                            ?.state?.profileSettingsModel?.isDarkModeEnabled ==
                        null) return ThemeMode.light;
                    return profileSettingsBloc
                            .state.profileSettingsModel.isDarkModeEnabled
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                ),

                // Defining the named routes and declaring the initial route of the application.
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: SPLASH_ROUTE,
              );
            },
          );
        }));
  }
}
