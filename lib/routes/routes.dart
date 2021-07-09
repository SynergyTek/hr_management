

import 'package:hr_management/ui/screens/counts_screen/counts_screen.dart';

// import 'package:hr_management/ui/screens/login/login_screen.dart';

import 'package:hr_management/ui/screens/tasks/task_home_screen.dart';

import 'package:hr_management/ui/widgets/custom_controls/default_dropdown_list.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';

import 'package:hr_management/ui/screens/service/add_edit_service_screen.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_home_filter_widget.dart';

import '../ui/screens/attendance/show_access_logs/display_access_log_screen.dart';
import '../ui/screens/counts_screen/counts_screen.dart';
import '../ui/screens/leaves/display_leaves/display_leaves_screen.dart';
import '../ui/screens/tasks/task_home_screen.dart';
import '../ui/widgets/custom_controls/default_dropdown_list.dart';


import '../ui/screens/attendance/mark_attendance.dart';
import 'package:flutter/material.dart';
import '../ui/screens/leaves/leave_template.dart';
import '../ui/screens/note/note_screen.dart';
import '../ui/screens/registration/registration_screen.dart';

import '../ui/screens/onboarding_screen/onboarding_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';
import 'route_constants.dart';
import 'screen_arguments.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SPLASH_ROUTE:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(
            titleText: "HR Management",
            subtitleText: "Synergy",
          ),
        );
        break;

      // case LOGIN_ROUTE:
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      //   break;

      case ONBOARDING_ROUTE:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );
        break;

      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CountsScreen(),
        );
        break;

      case COUNTS_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CountsScreen(),
        );
        break;

      case MARK_ATTENDANCE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => MarkAttendance(),
        );
        break;

      case LEAVE_REQUEST:
        return MaterialPageRoute(
          builder: (_) => LeaveTemplate(),
        );
        break;

      case REGISTRATION_ROUTE:
        return MaterialPageRoute(
          builder: (_) => RegistrationScreen(),
        );
        break;

      case CREATE_SERVICE_ROUTE:
        final args = routeSettings.arguments as ScreenArguments;
        print("args: $args");

        // if (args?.arg1 == null || args.arg1.isEmpty)
        //   throw Exception("Template Code cannot be empty or null.");

        return MaterialPageRoute(
          builder: (_) => CreateServiceScreen(
            templateCode: args.arg1,
            serviceId: args.arg2,
          ),
        );
        break;

      case NOTE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => NoteScreen(),
        );
        break;

      case NTS_DROPDOWN:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DropDownDefaultList(
            url: args.arg1,
            idKey: args.arg2,
            nameKey: args.arg3,
            ddName: args.arg4,
            onListTap: args.arg5,
          ),
        );
      case TASK_HOME:
        return MaterialPageRoute(
          builder: (_) => TaskHomeScreen(),


        );
        break;

      case TASK_FILTER:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => TaskHomeFilterWidget(
            onListTap: args.arg5,
          ),
        );
        break;

      case DISPLAY_LEAVES:
        return MaterialPageRoute(
          builder: (_) => DisplayLeaves(),
        );
        break;
      case DISPLAY_ACCESS_LOG:
        return MaterialPageRoute(
          builder: (_) => DisplayAccessLog(),

        );
        break;

      // 404 route.
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                "Error 404: No route defined with this name: ${routeSettings.name}.",
              ),
            ),
          ),
        );
    }
  }
}
