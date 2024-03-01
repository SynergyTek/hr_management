import 'package:hr_management/ui/screens/dms/dms_child.dart';
import 'package:hr_management/ui/screens/dms/dms_legal_entity_screen/dms_legal_entity_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_manage_permission/dms_add_edit_permission_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_manage_workspace_screen/dms_manage_workspace_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_new_folder_screen/dms_new_folder_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_parent.dart';
import 'package:hr_management/ui/screens/dms/dms_support/dms_support_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_view_permission_screen/dms_view_permission_screen.dart';
import 'package:hr_management/ui/screens/dms/dms_workspace_screen/dms_workspace_screen.dart';
import 'package:hr_management/ui/screens/dms/document_action/document_action_screen.dart';
import 'package:hr_management/ui/screens/face_detection_web/face_detection_webview.dart';
import 'package:hr_management/ui/screens/business_trip/business_trip_screen.dart';
import 'package:hr_management/ui/screens/manage_document/doc_req_by_hr/doc_req_by_hr_screen.dart';
import 'package:hr_management/ui/screens/manage_document/document/document_screen.dart';
import 'package:hr_management/ui/screens/case_management_screen/helpdesk_dashboard_screen/helpdesk_dashboard_screen.dart';
import 'package:hr_management/ui/screens/payroll/salary_details_screen.dart';
import 'package:hr_management/ui/screens/reimbursement_screens/reimbursement_screen.dart';
import 'package:hr_management/ui/screens/resignation_screen/resignation_screen.dart';
import 'package:hr_management/ui/screens/tag_nts_screen/tag_nts_screen.dart';
import 'package:hr_management/ui/screens/termination_screen/termination_screen.dart';
import 'package:hr_management/ui/screens/workboard_screen/duplicate_workboard_screen.dart';
import 'package:hr_management/ui/screens/workboard_screen/workboard_create_edit_section_screen.dart';
import 'package:hr_management/ui/screens/workboard_screen/workboard_task_list_screen.dart';
import 'package:hr_management/ui/screens/workboard_screen/create_edit_workboard.dart';
import 'package:hr_management/ui/screens/workboard_screen/workboard_screen.dart';
import 'package:hr_management/ui/widgets/custom_controls/tag.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';

import '../ui/screens/attendance/roaster_scheduler_screen/roaster_scheduler_screen.dart';
import '../ui/screens/case_management_screen/case_management_screen.dart';

// import '../ui/screens/dms/dms_workbook_screen/dms_workbook_screen.dart';
import '../ui/screens/dms/dms_email_list_screen/dms_email_list_screen.dart';
import '../ui/screens/dms/dms_move_workbook_screen/dms_move_workbook_screen.dart';
import '../ui/screens/dms/dms_workbook_screen/dms_workbook_screen.dart';
import '../ui/screens/hr_direct_chart/hr_direct_chart.dart';
import '../ui/screens/hr_direct_contract_screen/hr_direct_contract_screen.dart';
import '../ui/screens/leaves/employee_attendance_list_screen.dart';
import '../ui/screens/leaves/get_policy_documents_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/manage_dependent/manage_dependent_screen.dart';
import '../ui/screens/map_screen.dart';
import '../ui/screens/misconduct_screen/misconduct_screen.dart';
import '../ui/screens/my_profile/my_profile_screen.dart';
import '../ui/screens/share/share_screen.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';
import '../ui/screens/tasks/task_list_screen.dart';
import '../ui/screens/time_permission/time_permission_screen.dart';
import '../ui/screens/worklist_my_service/worklist_my_service.dart';
import '../ui/widgets/custom_controls/team_dropdown_list.dart';
import '../ui/widgets/custom_controls/user_dropdown_list.dart';
import '../ui/screens/payroll/manage_accrual_screen.dart';
import '../ui/screens/payroll/payslip_screen.dart';
// import '../data/enums/enums.dart';
import '../ui/screens/counts_screen/counts_screen.dart';
import '../ui/screens/note/note_home_screen.dart';
import 'package:flutter/material.dart';
import '../ui/screens/component_result_screen/component_result_screen.dart';
import '../ui/screens/attachment_nts_screen/attachment_nts_screen.dart';
import '../ui/screens/attendance/attendance_view_screen/attendance_view_screen.dart';
import '../ui/screens/nts_charts/nts_dashboard.dart';
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
import 'route_constants.dart';
import 'screen_arguments.dart';
import 'package:synergy_nts/synergy_nts.dart';

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

      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case ONBOARDING_ROUTE:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );

      case COUNTS_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CountsScreen(),
        );

      case COUNTS_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CountsScreen(),
        );

      case MARK_ATTENDANCE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => MarkAttendance(),
        );

      case NTS_TEMPLATE_REQUEST:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => NTSTemplateScreen(
            categoryCode: args!.arg4,
            ntsType: args.ntstype,
          ),
        );

      // case REGISTRATION_ROUTE:
      //   return MaterialPageRoute(
      //     builder: (_) => RegistrationScreen(),
      //   );

      case CREATE_SERVICE_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;
        print("args: $args");

        // if (args?.arg1 == null || args.arg1.isEmpty)
        //   throw Exception("Template Code cannot be empty or null.");

        return MaterialPageRoute(
          builder: (_) => CreateServiceScreen(
            isDelete: args?.val2 ?? false,
            templateCode: args?.arg1,
            serviceId: args?.arg2,
            title: args?.arg3,
            isLeave: args?.val1,
            categoryCode: args?.arg4,
            // portalType: args.portalType,
          ),
        );

      case ADD_EDIT_NOTE_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;
        print("args: $args");
        return MaterialPageRoute(
          builder: (_) => AddEditNote(
            templateCode: args!.arg1,
            noteId: args.arg2,
            title: args.arg3,
            isDependent: args.val1 ?? false,
            // portalType: args.portalType!,
          ),
        );

      case NTS_DROPDOWN:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => DropDownDefaultList(
            url: args!.arg1,
            idKey: args.arg2,
            nameKey: args.arg3,
            ddName: args.arg4,
            onListTap: args.func as void Function(dynamic)?,
            workbookReferenceList: args.workbookReferenceList,
            // stringList: args.list2 ?? [],
          ),
        );

      case NTS_ATTACHMENT:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => SelectAttachment(
            ntsId: args!.arg1,
            ntstype: args.ntstype,
            onListTap: args.callBack,
          ),
        );

      case NTS_TAG:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => SelectTag(
            ntsId: args!.arg1,
            ntstype: args.ntstype,
            onListTap: args.callBack,
          ),
        );

      case NTS_USER_DROPDOWN:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => UserDropDownList(
            onListTap: args!.func as void Function(dynamic)?,
          ),
        );

      case NTS_TEAM_DROPDOWN:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => TeamDropdownList(
            onListTap: args!.func as void Function(dynamic)?,
          ),
        );

      case TASK_HOME:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => TaskHomeScreen(
            taskStatus: args?.arg1,
            moduleId: args?.arg2,
            mode: args?.arg3,
            showBack: args?.showBack ?? false,
          ),
        );

      case NTS_FILTER:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => NTSFilterWidget(
              ntsFilter: args!.ntstype,
              isDashboard: args.val2,
              onListTap: args.func as void Function(dynamic, FilterType)?),
        );

      case CREATE_EDIT_TASK_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;
        print("args: $args");

        return MaterialPageRoute(
          builder: (_) => AddEditTaskScreen(
            templateCode: args!.arg1,
            taskId: args.arg2,
            title: args.arg3,
            // portalType: args.portalType!,
          ),
        );

      case DISPLAY_LEAVES:
        return MaterialPageRoute(
          builder: (_) => DisplayLeaves(),
        );

      case DISPLAY_ACCESS_LOG:
        return MaterialPageRoute(
          builder: (_) => DisplayAccessLog(),
        );

      case ATTENDANCE_VIEW_ROUTE:
        return MaterialPageRoute(
          builder: (_) => AttendanceViewScreen(),
        );

      case ROSTER_SCHEDULE:
        return MaterialPageRoute(
          builder: (_) => RosterScheduleScreen(),
        );

      case SERVICE_DASHBOARD:
        return MaterialPageRoute(
            builder: (_) => ServiceDashboard(
                  ntsType: NTSType.service,
                ));

      case TASK_DASHBOARD:
        return MaterialPageRoute(
            builder: (_) => ServiceDashboard(ntsType: NTSType.task));

      case NOTE_DASHBOARD:
        return MaterialPageRoute(
            builder: (_) => ServiceDashboard(ntsType: NTSType.note));

      case NOTE_HOME:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => NoteHomeScreen(
            noteStatus: args?.arg1,
            moduleId: args?.arg2,
            mode: args?.arg3,
            showBack: args?.showBack ?? false,
          ),
        );

      case SERVICE_HOME:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => ServiceHomeScreen(
            isDelete: args?.val2 ?? false,
            serviceStatus: args?.arg1,
            moduleId: args?.arg2,
            mode: args?.arg3,
            showBack: args?.showBack ?? false,
            templateCode: args?.arg4,
          ),
        );

      case NTS_SHARE:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => ShareScreen(
            ntsType: args!.ntstype,
            ntsId: args.arg1,
          ),
        );

      case WORKLIST_DASHBOARD:
        return MaterialPageRoute(builder: (_) => WorklistDashboard());

      case MANAGE_ACCRUAL:
        return MaterialPageRoute(builder: (_) => ManageAccrualScreen());

      case PAYSLIP:
        return MaterialPageRoute(builder: (_) => PayslipScreen());

      case SALARY_DETAILS:
        return MaterialPageRoute(builder: (_) => SalaryDetailsScreen());

      case TASKLIST:
        return MaterialPageRoute(builder: (_) => TaskListScreen());

      case MYPROFILE:
        return MaterialPageRoute(builder: (_) => MyProfileScreen());

      case MANAGE_DEPENDENTS:
        return MaterialPageRoute(builder: (_) => ManageDependentScreen());

      case ATTACHMENT_NTS_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;

        return MaterialPageRoute(
          builder: (_) => AttachmentNTSScreen(
            ntsType: args!.ntstype,
            ntsId: args.arg1,
          ),
        );

      case TAG_NTS_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;

        return MaterialPageRoute(
          builder: (_) => TagNTSScreen(
            ntsType: args!.ntstype,
            ntsId: args.arg1,
          ),
        );

      case SERVICE_COMPONENT_RESULT_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;

        return MaterialPageRoute(
          builder: (_) => ComponentResultScreen(
            serviceId: args?.arg1,
          ),
        );

      case PERSON_DOCUMENTS_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DocReqByHrScreen(),
        );

      case PERSON_PROFILE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DocumentScreen(),
        );

      case CASE_MANAGEMENT_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CaseManagementScreen(),
        );
      // case CASE_MANAGEMENT_SERVICE_REPORTS_ROUTE:
      //   return MaterialPageRoute(
      //     builder: (_) => CaseManagementServiceReportsScreen(),
      //   );
      //   break;

      case CASE_MANAGEMENT_HELPDESK_DASHBOARD_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CaseManagementHelpdeskDashboardScreen(),
        );

      case DMS_PARENT:
        return MaterialPageRoute(
          builder: (_) => DMSParent(),
        );

      case DMS_SUPPORT:
        return MaterialPageRoute(
          builder: (_) => DMSSupport(),
        );

      case DMS_ADD_EDIT_PERMISSION_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => DmsAddEditPermissionScreen(
            noteId: args?.arg1,
          ),
        );

      case DMS_CHILD:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => DMSChild(
            parentName: args!.arg1,
            parentPath: args.arg2,
            parentModel: args.dmsParentModel,
            callBack: args.callBack,
            pathList: args.list1,
            parentPathList: args.list2,
            parentModelList: args.dmsParentModelList,
          ),
        );

      case DMS_LEGAL_ENTITY:
        return MaterialPageRoute(
          builder: (_) => DMSLegalEntityScreen(),
        );

      case DMS_MANAGE_WORKSPACE_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;

        return MaterialPageRoute(
          builder: (_) => DMSManageWorkspaceScreen(
            parentWorkspaceId: args?.arg1,
            isWorkspace: args?.val1 ?? false,
          ),
        );

      case DMS_NEW_FOLDER_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => DMSNewFolderScreen(
            parentId: args!.arg1,
            folderId: args.arg2,
            folderName: args.arg3,
          ),
        );

      case DMS_ARCHIVE_ROUTE:
        // final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DocumentActionScreen(
            action: 'Archive',
          ),
        );

      case DMS_BIN_ROUTE:
        // final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DocumentActionScreen(
            action: 'Bin',
          ),
        );

      case DMS_HISTORY_ROUTE:
        // final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DocumentActionScreen(
            action: 'History',
          ),
        );

      case DMS_SEARCH_ROUTE:
        // final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DocumentActionScreen(
            action: 'Search',
          ),
        );

      case DMS_VIEW_PERMISSION_ROUTE:
        final args = routeSettings.arguments as ScreenArguments?;
        return MaterialPageRoute(
          builder: (_) => DMSViewPermissionScreen(
            noteId: args!.arg1,
            parentId: args.arg2,
            workspaceId: args.arg3,
            inheritanceType: args.arg4,
            isManagePermission: args.val1,
            path: args.list1,
          ),
        );

      case DMS_WORKSPACE_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DMSWorkspaceScreen(),
        );

      case WORKBOARD_TASK_LIST:
        return MaterialPageRoute(
          builder: (_) => WorkBoardTaskListScreen(),
        );

      case DUPLICATE_WORKBOARD_SCREEN:
        final args = routeSettings.arguments as ScreenArguments?;

        return MaterialPageRoute(
          builder: (_) =>
              DuplicateWorkBoardScreen(workBoardId: args?.arg1 ?? ''),
        );

      case CREATE_EDIT_SECTION_WORKBOARD_SCREEN:
        final args = routeSettings.arguments as ScreenArguments?;

        return MaterialPageRoute(
          builder: (_) => CreateEditSectionWorkBoardScreen(
            isEdit: args?.val1,
            sectionId: args?.arg1 ?? '',
            workboardId: args?.arg2 ?? '',
          ),
        );

      case REGISTER_FACE_WEB:
        return MaterialPageRoute(
          builder: (_) => FaceDeteWebview(
            url: 'https://xtranet.aitalkx.com/TAA/Attendance/RegisterFace',
            urlModuleName: 'Register Face',
          ),
        );

      case MARK_ATTENDANCE_WEB:
        return MaterialPageRoute(
          builder: (_) => FaceDeteWebview(
            url:
                'https://xtranet.aitalkx.com/TAA/Attendance/FaceDetectionAttendance',
            urlModuleName: 'Mark Attendance',
          ),
        );

      case WORKBOARD_SCREEN:
        return MaterialPageRoute(
          builder: (_) => WorkBoardScreen(),
        );

      case REIMBURSEMENT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ReimbursementScreen(),
        );

      case RESIGNATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ResignationScreen(),
        );

      case TERMINATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => TerminationScreen(),
        );

      case MISCONDUCT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MisconductScreen(),
        );

      case TIME_PERMISSION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => TimePermissionScreen(),
        );

      case CREATE_WORKBOARD_SCREEN:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => CreateEditWorkBoardScreen(
            isEdit: args.val1!,
            workBoardId: args.arg1,
            templateTypeText: args.arg2,
            workBoardType: (args.val1! == true) ? int.parse(args.arg3!) : 0,
          ),
        );

      case BUSINESS_TRIP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => BusinessTripScreen(),
        );

      case HR_DIRECT_CONTRACT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => HRDirectContractScreen(),
        );

      // case DMS_WORBOOK_SCREEN:
      //   final args = routeSettings.arguments as ScreenArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => DMSWorkbookScreen(
      //       workbookName: args.arg1!,
      //     ),
      //   );
      case DMS_WORBOOK_SCREEN:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DMSWorkbookScreen(
            workbookName: args.arg1!,
            bookId: args.arg2!,
          ),
        );

      case DMS_MOVE_WORBOOK_SCREEN:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DMSMoveWorkbookScreen(
            noteId: args.arg2!,
          ),
        );

      case DMS_EMAIL_LIST_SCREEN:
        final args = routeSettings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DMSEmailListScreen(
            workbookList: args.workbookReferenceList,
            isAddBelow: args.val1,
            index: args.num!,
          ),
        );

      case EMPLOYE_DASHBOARD:
        return MaterialPageRoute(
          builder: (_) => HrDirectChart(),
        );

      case POLICY_DOCUMENT:
        return MaterialPageRoute(
          builder: (_) => HrPolicyDocumentScreen(),
        );

      case EMPLOYE_ATTENDANCE_LIST_SCREEN:
        return MaterialPageRoute(
          builder: (_) => EmployeeAttendanceListScreen(),
        );

      case WORKLIST_BY_SERVICE:
        return MaterialPageRoute(
          builder: (_) =>
              WorkListMyServiceScreenCount(ntsType: NTSType.service),
        );

      case WORKLIST_BY_TASK:
        return MaterialPageRoute(
          builder: (_) => WorkListMyServiceScreenCount(ntsType: NTSType.task),
        );

      case SERVICE_HOME_NAV:
        return MaterialPageRoute(
          builder: (_) => ServiceHomeScreen(
              templateCode: 'TMS_GENERAL', isDelete: true, showBack: true),
        );

      // case MAP_SCREEN:
      //   return MaterialPageRoute(
      //     builder: (_) => MapScreen(),
      //   );

      // 404 route.
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text("Error 404"),
            ),
            drawer: DrawerWidget(),
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
