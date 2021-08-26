import 'package:hr_management/ui/screens/dms/dms_child.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/dms_legal_entity_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_manage_workspace_screen/dms_manage_workspace_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_new_folder_screen/dms_new_folder_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_parent.dart';
import 'package:hr_management/ui/screens/download_screen/download_screen.dart';
import 'package:hr_management/ui/screens/manage_document/doc_req_by_hr/doc_req_by_hr_screen.dart';
import 'package:hr_management/ui/screens/manage_document/document/document_screen.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/helpdesk_dashboard_screen.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/widgets/helpdesk_dashboard_body_widget.dart';
import 'package:hr_management/ui/screens/tag_nts_screen/tag_nts_screen.dart';
import 'package:hr_management/ui/widgets/custom_controls/tag.dart';

import '../ui/screens/case_management_screen/case_management_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/manage_dependent/manage_dependent_screen.dart';
import '../ui/screens/my_profile/my_profile_screen.dart';

import '../ui/screens/share/share_screen.dart';
import '../ui/screens/tasks/adhoc_task/adhoc_task_list_screen.dart';

import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';

import '../ui/screens/tasks/task_list_screen.dart';
import '../ui/widgets/custom_controls/team_dropdown_list.dart';
import '../ui/widgets/custom_controls/user_dropdown_list.dart';

import '../ui/screens/payroll/manage_accrual_screen.dart';
import '../ui/screens/payroll/payslip_screen.dart';

import '../data/enums/enums.dart';
import '../ui/screens/counts_screen/counts_screen.dart';
import '../ui/screens/note/note_home_screen.dart';
import '../ui/screens/nts_comments/nts_comments_screen.dart';
import '../ui/screens/home_screen/home_screen.dart';

import 'package:flutter/material.dart';
import '../ui/screens/component_result_screen/component_result_screen.dart';
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
import '../ui/screens/note/add_edit_note.dart';
import '../ui/screens/onboarding_screen/onboarding_screen.dart';
import '../ui/screens/registration/registration_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';
import '../ui/screens/tasks/task_home_screen.dart';
import '../ui/widgets/custom_controls/default_dropdown_list.dart';
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
            isDependent: args?.val1 ?? false,
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
            ntsId: args.arg1,
            ntstype: args.ntstype,
            onListTap: args.callBack,
          ),
        );
        break;

      case NTS_TAG:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => SelectTag(
            ntsId: args.arg1,
            ntstype: args.ntstype,
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
            ntsType: args.ntstype,
            ntsId: args.arg1,
          ),
        );
        break;

      case TAG_NTS_ROUTE:
        final args = routeSettings.arguments as ScreenArguments;

        return MaterialPageRoute(
          builder: (_) => TagNTSScreen(
            ntsType: args.ntstype,
            ntsId: args.arg1,
          ),
        );
        break;

      case SERVICE_COMPONENT_RESULT_ROUTE:
        final args = routeSettings.arguments as ScreenArguments;

        return MaterialPageRoute(
          builder: (_) => ComponentResultScreen(
            serviceId: args?.arg1,
          ),
        );
        break;

      case PERSON_DOCUMENTS_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DocReqByHrScreen(),
        );
        break;

      case PERSON_PROFILE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DocumentScreen(),
        );
        break;

      case ADD_ADHOC_TASK:
        return MaterialPageRoute(
          builder: (_) => AdhocTaskListScreen(),
        );
        break;

      case CASE_MANAGEMENT_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CaseManagementScreen(),
        );
        break;

      // case CASE_MANAGEMENT_SERVICE_REPORTS_ROUTE:
      //   return MaterialPageRoute(
      //     builder: (_) => CaseManagementServiceReportsScreen(),
      //   );
      //   break;

      case CASE_MANAGEMENT_HELPDESK_DASHBOARD_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CaseManagementHelpdeskDashboardScreen(),
        );
        break;

      case DOWNLOAD_SCREEN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DownloadScreen(),
        );
        break;

      case DMS_PARENT:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DMSParent(
            sourceId: args.arg3,
            isCopy: args.val1,
            isCut: args.val2,),
        );
        break;

      case DMS_CHILD:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DMSChild(
            parentName: args.arg1,
            parentPath: args.arg2,
            parentModel: args.dmsParentModel,
            callBack: args.callBack,
            pathList: args.list1,
            parentPathList: args.list2,
            parentModelList: args.dmsParentModelList,
            sourceId: args.arg3,
            isCopy: args.val1,
            isCut: args.val2,
          ),
        );
        break;

      case DMS_LEGAL_ENTITY:
        return MaterialPageRoute(
          builder: (_) => DMSLegalEntityScreen(),
        );
        break;

      case DMS_MANAGE_WORKSPACE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DMSManageWorkspaceScreen(),
        );
        break;

      case DMS_NEW_FOLDER_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DMSNewFolderScreen(),
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
