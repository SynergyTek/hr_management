import 'package:flutter/material.dart';

import '../drawer_model.dart';

List<dynamic> navDrawerList = [
  NavDrawerModel(
      title: 'Employee Dashboard',
      // title: 'Workboard',
      trailingIcon: Icons.home,
      ////route: WORKBOARD_SCREEN,
      pageName: 'CustomDashboard',
      isExpanded: false),

  // Document Management
  // ExapnsionTileModel(
  //     title: 'Document Management',
  //     isExpanded: true,
  //     childList: [
  //       NavDrawerModel(
  //           title: 'Workspace',
  //           ////route: DMS_WORKSPACE_ROUTE,
  //           pageName: 'Workspace'),
  //       NavDrawerModel(
  //           title: 'Documents', //route: DMS_PARENT,
  //           pageName: 'CustomDashboard'),
  //       NavDrawerModel(
  //           title: 'Manage Documents',
  //           //route: PERSON_PROFILE_ROUTE,
  //           pageName: 'ManageDocuments'),
  //       NavDrawerModel(
  //           title: 'Manage Dependents',
  //           //route: MANAGE_DEPENDENTS,
  //           pageName: 'ManageDependants'),
  //     ]),

  NavDrawerModel(
      title: 'Employee Profile',
      //route: MYPROFILE,
      pageName: 'EmployeeProfile'),

  // HR
  // ExapnsionTileModel(title: 'HR', isExpanded: true, childList: [
  //   NavDrawerModel(
  //       title: 'Employee Dashboard',
  //       //route: EMPLOYE_DASHBOARD,
  //       pageName: 'CustomDashboard'),
  //   NavDrawerModel(
  //       title: 'Employee Profile',
  //       //route: MYPROFILE,
  //       pageName: 'EmployeeProfile'),
  //   // NavDrawerModel(
  //     title: 'HR Direct',
  //     //route: HR_DIRECT_CONTRACT_SCREEN,
  //     pageName: 'HRDirectHomePage'),
  // NavDrawerModel(
  //     title: 'Policy Documents',
  //     //route: POLICY_DOCUMENT,
  //     pageName: 'CustomDashboard'),
  // ]),

  // Attendance
  ExapnsionTileModel(title: 'Attendance', isExpanded: true, childList: [
    NavDrawerModel(
        title: 'Remote Signin/Signout Request',
        //route: MARK_ATTENDANCE_ROUTE,
        pageName: 'RemoteSignInSignOutRequest'),
    NavDrawerModel(
        title: 'Attendance Details',
        //route: EMPLOYE_ATTENDANCE_LIST_SCREEN,
        pageName: 'EmployeeAttendanceReport'),
    NavDrawerModel(
        title: 'Access Logs', //route: DISPLAY_ACCESS_LOG,
        pageName: 'AccessLog'),
    NavDrawerModel(
        title: 'Roster Schedule', //route: DISPLAY_ACCESS_LOG,
        pageName: 'RosterScheduleScreen'),
  ]),

  // Leave
  ExapnsionTileModel(title: 'Leave', isExpanded: true, childList: [
    NavDrawerModel(
        title: 'Leave Details',
        //route: DISPLAY_LEAVES,
        pageName: 'LeaveDetails'),
    NavDrawerModel(
        title: 'Business Trip',
        //route: BUSINESS_TRIP_SCREEN,
        pageName: 'BusinessTrip'),
    NavDrawerModel(
        title: 'Time Permission',
        //route: TIME_PERMISSION_SCREEN,
        pageName: 'TimePermissionRequests'),
  ]),

  // Worklist
  ExapnsionTileModel(title: 'Worklist', isExpanded: true, childList: [
    // NavDrawerModel(
    //     title: 'Dashboard',
    //     //route: WORKLIST_DASHBOARD,
    //     pageName: 'CustomDashboard'),
    NavDrawerModel(
        title: 'My Service',
        //route: WORKLIST_BY_SERVICE,
        pageName: 'MyServices'),
    NavDrawerModel(
        title: 'My Task',
        //route: WORKLIST_BY_TASK,
        pageName: 'MyTasks'),
    NavDrawerModel(
        title: 'My Note',
        //route: NOTE_HOME,
        pageName: 'CustomDashboard'),
  ]),

  // HR Only
  ExapnsionTileModel(title: 'HR Only', isExpanded: true, childList: [
    NavDrawerModel(
        title: 'Termination',
        //route: TERMINATION_SCREEN,
        pageName: 'CustomDashboard'),
    NavDrawerModel(
        title: 'Remote Signin/Signout Request',
        //route: MARK_ATTENDANCE_ROUTE,
        pageName: 'RemoteSignInSignOutRequest'),
  ]),

  // Self-service
  ExapnsionTileModel(title: 'Self-service', isExpanded: true, childList: [
    NavDrawerModel(
        title: 'Resignation',
        //route: RESIGNATION_SCREEN,
        pageName: 'CustomDashboard'),
    NavDrawerModel(
        title: 'Misconduct', //route: MISCONDUCT_SCREEN,
        pageName: 'Misconducts'),
  ]),

  // Policy Documents
  // ExapnsionTileModel(title: 'Policy Documents', isExpanded: true, childList: [
  NavDrawerModel(
      title: 'Policy Documents',
      //route: POLICY_DOCUMENT,
      pageName: 'CustomDashboard'),
  // ]),

  // Leave
  // ExapnsionTileModel(title: 'Leave', isExpanded: true, childList: [
  //   NavDrawerModel(
  //       title: 'Leave Details',
  //       //route: DISPLAY_LEAVES,
  //       pageName: 'LeaveDetails'),
  //   NavDrawerModel(
  //       title: 'Business Trip',
  //       //route: BUSINESS_TRIP_SCREEN,
  //       pageName: 'BusinessTrip'),
  //   NavDrawerModel(
  //       title: 'Time Permission',
  //       //route: TIME_PERMISSION_SCREEN,
  //       pageName: 'TimePermissionRequests'),
  // ]),

  // Reimbursement
  NavDrawerModel(
      title: 'Reimbursement',
      //route: REIMBURSEMENT_SCREEN,
      isExpanded: false,
      pageName: 'CustomDashboard'),

  // Payroll
  ExapnsionTileModel(title: 'Payroll', isExpanded: true, childList: [
    NavDrawerModel(
        title: 'Salary Details',
        //route: DISPLAY_LEAVES,
        pageName: 'ManageSalaryInfo'),
    NavDrawerModel(
        title: 'Payslip', //route: PAYSLIP,
        pageName: 'PaySlip'),
  ]),

  // Help-desk
  ExapnsionTileModel(title: 'Help-desk', isExpanded: true, childList: [
    NavDrawerModel(
        title: 'Helpdesk Dashbaord',
        //route: CASE_MANAGEMENT_HELPDESK_DASHBOARD_ROUTE,
        pageName: 'CustomDashboard'),
    NavDrawerModel(
        title: 'My Requests',
        //route: SERVICE_HOME_NAV,
        pageName: 'CustomDashboard'),
    NavDrawerModel(
        title: 'My Tasks', //route: TASK_HOME,
        pageName: 'MyTasks'),
  ]),
];
