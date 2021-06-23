import '../ui/screens/attendance/mark_attendance.dart';
import 'package:flutter/material.dart';

import '../ui/screens/home_screen/home_screen.dart';
import '../ui/screens/onboarding_screen/onboarding_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';
import 'route_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SPLASH_ROUTE:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(
            titleText: "Title",
            subtitleText: "Subtitle.",
          ),
        );
        break;

      case ONBOARDING_ROUTE:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );
        break;

      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;

        case MARK_ATTENDANCE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => MarkAttendance(),
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
