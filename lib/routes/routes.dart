import 'package:hr_management/ui/screens/login/login_screen.dart';
import 'package:hr_management/ui/screens/manage_dependent/manage_dependent_screen.dart';
import 'package:hr_management/ui/screens/my_profile/my_profile_screen.dart';

import 'package:hr_management/ui/screens/person_documents_screen/person_documents_screen.dart';
import 'package:hr_management/ui/screens/person_profile_screen/person_profile_screen.dart';
import 'package:hr_management/ui/screens/share/share_screen.dart';
import 'package:hr_management/ui/screens/tasks/adhoc_task/adhoc_task_list_screen.dart';

import 'package:hr_management/ui/screens/tasks/task_list_screen.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';
import 'package:hr_management/ui/widgets/custom_controls/team_dropdown_list.dart';
import 'package:hr_management/ui/widgets/custom_controls/user_dropdown_list.dart';

import '../ui/screens/payroll/manage_accrual_screen.dart';
import '../ui/screens/payroll/payslip_screen.dart';

import '../data/enums/enums.dart';
import '../ui/screens/counts_screen/counts_screen.dart';
import '../ui/screens/note/note_home_screen.dart';
import '../ui/screens/nts_comments/nts_comments_screen.dart';
import '../ui/screens/home_screen/home_screen.dart';

import 'package:flutter/material.dart';
import '../ui/screens/attachment_nts_screen/attachment_nts_screen.dart';
import '../ui/screens/attendance/attendance_view_screen/attendance_view_screen.dart';
import '../ui/screens/nts_charts/nts_dashboard.dart';
// import 'package:hr_management/ui/screens/login/login_screen.dart';

import 'package:hr_management/ui/screens/nts_template_screen/nts_template_screen.dart';
import 'package:hr_management/ui/screens/service/add_edit_service_screen.dart';
import 'package:hr_management/ui/screens/service/service_home.dart';
import 'package:hr_management/ui/screens/tasks/add_edit_task_screen.dart';
import 'package:hr_management/ui/screens/tasks/task_home_screen.dart';
import 'package:hr_management/ui/screens/worklist_dashboard/worklist_dashboard_screen.dart';
import 'package:hr_management/ui/widgets/custom_controls/default_dropdown_list.dart';
import 'package:hr_management/ui/widgets/filter/nts_filter_widget.dart';

import '../ui/screens/attendance/mark_attendance.dart';
import '../ui/screens/attendance/show_access_logs/display_access_log_screen.dart';
import '../ui/screens/leaves/display_leaves/display_leaves_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/manage_dependent/manage_dependent_screen.dart';
import '../ui/screens/my_profile/my_profile_screen.dart';
import '../ui/screens/note/add_edit_note.dart';
import '../ui/screens/onboarding_screen/onboarding_screen.dart';
import '../ui/screens/person_documents_screen/person_documents_screen.dart';
import '../ui/screens/person_profile_screen/person_profile_screen.dart';
import '../ui/screens/registration/registration_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';
import '../ui/screens/tasks/task_home_screen.dart';
import '../ui/screens/tasks/task_list_screen.dart';
import '../ui/widgets/custom_controls/default_dropdown_list.dart';
import '../ui/widgets/custom_controls/user_dropdown_list.dart';
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

      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
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

      case COUNTS_ROUTE:
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

      case NTS_TEMPLATE_REQUEST:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => NTSTemplateScreen(
            categoryCode: args.arg4,
            ntsType: args.ntstype,
          ),
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
            title: args.arg3,
            isLeave: args.val1,
          ),
        );
        break;

      case ADD_EDIT_NOTE_ROUTE:
        final args = routeSettings.arguments as ScreenArguments;
        print("args: $args");
        return MaterialPageRoute(
          builder: (_) => AddEditNote(
            templateCode: args.arg1,
            noteId: args.arg2,
            title: args.arg3,
          ),
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
            onListTap: args.func,
          ),
        );
        break;

      case NTS_ATTACHMENT:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => SelectAttachment(
            ntstype: args.arg1,
            onListTap: args.callBack,
          ),
        );
        break;

      case NTS_USER_DROPDOWN:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => UserDropDownList(
            onListTap: args.func,
          ),
        );
        break;

      case NTS_TEAM_DROPDOWN:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => TeamDropdownList(
            onListTap: args.func,
          ),
        );
        break;

      case TASK_HOME:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => TaskHomeScreen(
            taskStatus: args?.arg1,
            moduleId: args?.arg2,
            mode: args?.arg3,
            showBack: args?.showBack ?? false,
          ),
        );
        break;

      case NTS_FILTER:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => NTSFilterWidget(
            ntsFilter: args.ntstype,
            onListTap: args.func,
            isDashboard: args.val2,
          ),
        );
        break;

      case CREATE_EDIT_TASK_ROUTE:
        final args = routeSettings.arguments as ScreenArguments;
        print("args: $args");

        // if (args?.arg1 == null || args.arg1.isEmpty)
        //   throw Exception("Template Code cannot be empty or null.");

        return MaterialPageRoute(
          builder: (_) => AddEditTaskScreen(
            templateCode: args.arg1,
            taskId: args.arg2,
            title: args.arg3,
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

      case ATTENDANCE_VIEW_ROUTE:
        return MaterialPageRoute(
          builder: (_) => AttendanceViewScreen(),
        );
        break;

      case COMMENT_ROUTE:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => NTSCommentsScreen(
            ntsType: args.ntstype,
            ntsId: args.arg1,
          ),
        );
        break;

      case SERVICE_DASHBOARD:
        return MaterialPageRoute(
            builder: (_) => ServiceDashboard(
                  ntsType: NTSType.service,
                ));
        break;

      case TASK_DASHBOARD:
        return MaterialPageRoute(
            builder: (_) => ServiceDashboard(ntsType: NTSType.task));
        break;

      case NOTE_DASHBOARD:
        return MaterialPageRoute(
            builder: (_) => ServiceDashboard(ntsType: NTSType.note));
        break;

      case NOTE_HOME:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => NoteHomeScreen(
            noteStatus: args?.arg1,
            moduleId: args?.arg2,
            mode: args?.arg3,
            showBack: args?.showBack ?? false,
          ),
        );
        break;

      case SERVICE_HOME:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => ServiceHomeScreen(
            serviceStatus: args?.arg1,
            moduleId: args?.arg2,
            mode: args?.arg3,
            showBack: args?.showBack ?? false,
          ),
        );
        break;

      case NTS_SHARE:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => ShareScreen(
            ntsType: args.ntstype,
            ntsId: args.arg1,
          ),
        );
        break;

      case WORKLIST_DASHBOARD:
        return MaterialPageRoute(builder: (_) => WorklistDashboard());
        break;

      case MANAGE_ACCRUAL:
        return MaterialPageRoute(builder: (_) => ManageAccrualScreen());
        break;

      case PAYSLIP:
        return MaterialPageRoute(builder: (_) => PayslipScreen());
        break;

      case TASKLIST:
        return MaterialPageRoute(builder: (_) => TaskListScreen());
        break;

      case MYPROFILE:
        return MaterialPageRoute(builder: (_) => MyProfileScreen());
        break;

      case MANAGE_DEPENDENTS:
        return MaterialPageRoute(builder: (_) => ManageDependentScreen());
        break;

      case ATTACHMENT_NTS_ROUTE:
        final args = routeSettings.arguments as ScreenArguments;

        return MaterialPageRoute(
          builder: (_) => AttachmentNTSScreen(
            ntsType: args?.ntstype ?? NTSType.service,
            ntsId: args?.arg1 ?? 'af9a75da-ae2e-4d8a-86a0-d55c08a2a2b8',
          ),
        );
        break;

      case PERSON_DOCUMENTS_ROUTE:
        return MaterialPageRoute(
          builder: (_) => PersonDocumentsScreen(),
        );
        break;

      case PERSON_PROFILE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => PersonProfileScreen(),
        );
        break;

      case ADD_ADHOC_TASK:
        return MaterialPageRoute(builder: (_) => AdhocTaskListScreen());
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
