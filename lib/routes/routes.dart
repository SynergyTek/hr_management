import 'package:hr_management/ui/screens/create_service/create_service_screen.dart';
import 'package:hr_management/ui/screens/counts_screen/counts_screen.dart';
import 'package:hr_management/ui/screens/login/login_screen.dart';

import '../ui/screens/attendance/mark_attendance.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/leaves/leave_template.dart';
import 'package:hr_management/ui/screens/note/note_screen.dart';
import 'package:hr_management/ui/screens/registration/registration_screen.dart';
import '../ui/screens/leaves/leave_template.dart';

import '../ui/screens/onboarding_screen/onboarding_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';
import 'route_constants.dart';

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

      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;

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
        return MaterialPageRoute(
          builder: (_) => CreateServiceScreen(),
        );
        break;

      case NOTE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => NoteScreen(),
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
