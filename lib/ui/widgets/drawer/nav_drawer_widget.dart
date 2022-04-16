import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/ui/screens/hr_direct_chart/hr_direct_chart.dart';
import 'package:hr_management/ui/screens/leaves/get_policy_documents_screen.dart';
import 'package:hr_management/ui/screens/reimbursement_screens/reimbursement_screen.dart';
import 'package:hr_management/ui/screens/worklist_my_service/worklist_my_service.dart';
import 'package:hr_management/ui/widgets/drawer/widgets/expansion_list_tile_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/blocs/nts_charts_bloc/nts_charts_bloc.dart';
import '../../../logic/blocs/permission_bloc/user_permission_bloc/user_permission_bloc.dart';
import '../../../routes/route_constants.dart';
import '../../screens/leaves/employee_attendance_list_screen.dart';
import '../dotted_divider_widget.dart';
import 'widgets/drawer_list_tile.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return drawerWidget(context);
  }

  Widget drawerWidget(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(36),
        bottomRight: Radius.circular(36),
      ),
      child: Drawer(
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                children: [
                  Container(
                    height: 20.h,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 4.h,
                          backgroundColor: Colors.blue,
                          child: Text(
                            BlocProvider.of<UserModelBloc>(context)
                                    .state
                                    .userModel
                                    ?.userName
                                    ?.substring(0, 1) ??
                                'G',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          BlocProvider.of<UserModelBloc>(context)
                                  .state
                                  .userModel
                                  ?.userName ??
                              'Guest',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          BlocProvider.of<UserModelBloc>(context)
                                  .state
                                  .userModel
                                  ?.email ??
                              'guest@synergy.com',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const DottedDividerWidget(),

                  //
                  _drawerListWidget(
                    context,
                    BlocProvider.of<UserModelBloc>(context)
                            .state
                            .extraUserInformation
                            ?.userPermissionResponse
                            ?.data ??
                        [],
                  ),
                ],
              ),
            ),

            //
            DrawerListTileWidget(
              isLast: true,
              title: BlocProvider.of<UserModelBloc>(context)
                              .state
                              .userModel
                              ?.email ==
                          null ||
                      BlocProvider.of<UserModelBloc>(context)
                          .state
                          .userModel!
                          .email!
                          .isEmpty
                  ? 'Login'
                  : 'Logout',
              icon: Icons.logout,
              listTileOnTap: () => _handleLogoutOnPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerListWidget(
    BuildContext context,
    List<UserPermissionModel?> data,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        DrawerListTileWidget(
          title: 'Workboard',
          icon: Icons.home,
          listTileOnTap: () {
            Navigator.pushReplacementNamed(
              context,
              WORKBOARD_SCREEN,
            );
          },
        ),

        //
        ExpansionListTileWidget(
          title: "Document Management",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Workspace',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  DMS_WORKSPACE_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Documents',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_PARENT,
                );
              },
            ),
            DrawerListTileWidget(
              title: '\t\t\t\t\t Manage Documents',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  PERSON_PROFILE_ROUTE,
                );
              },
            ),

            DrawerListTileWidget(
              title: '\t\t\t\t\t Manage Dependents',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  MANAGE_DEPENDENTS,
                );
              },
            ),
          ],
        ),
        DrawerListTileWidget(
          title: 'HR Policy',
          listTileOnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HrPolicyDocumentScreen()),
            );
          },
        ),
        DrawerListTileWidget(
          title: 'HR Direct Chart',
          listTileOnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HrDirectChart(),
              ),
            );
          },
        ),

        DrawerListTileWidget(
          title: 'Employee Attendance List',
          listTileOnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EmployeeAttendanceListScreen()),
            );
          },
        ),

        //
        ExpansionListTileWidget(
          title: "HR",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Home',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "",
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Employee Dashboard',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "",
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Employee Profile',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  MYPROFILE,
                );
              },
            ),

            //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t HR Direct',
            //   listTileOnTap: () {
            //     Navigator.pushReplacementNamed(
            //       context,
            //       "",
            //     );
            //   },
            // ),

            //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t Work Structure',
            //   listTileOnTap: () {
            //     Navigator.pushReplacementNamed(
            //       context,
            //       "",
            //     );
            //   },
            // ),

            // //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t Reports',
            //   listTileOnTap: () {
            //     Navigator.pushReplacementNamed(
            //       context,
            //       "",
            //     );
            //   },
            // ),

            // //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t Master Data',
            //   listTileOnTap: () {
            //     Navigator.pushReplacementNamed(
            //       context,
            //       "",
            //     );
            //   },
            // ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Policy Documents',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "",
                );
              },
            ),
          ],
        ),

        //HR ONLY
        ExpansionListTileWidget(
          title: "HR Only",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Termination',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  TERMINATION_SCREEN,
                );
              },
            ),
          ],
        ),

        //SELF SERVICE
        ExpansionListTileWidget(
          title: "Self-service",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Resignation',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  RESIGNATION_SCREEN,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Misconduct',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  MISCONDUCT_SCREEN,
                );
              },
            ),
          ],
        ),

        //LEAVE
        ExpansionListTileWidget(
          title: "Leave",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Leave Details',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  DISPLAY_LEAVES,
                );
              },
            ),
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Business Trip',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  BUSINESS_TRIP_SCREEN,
                );
              },
            ),
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Time Permission',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  TIME_PERMISSION_SCREEN,
                );
              },
            ),
          ],
        ),

        //REIMBURSEMENT
        DrawerListTileWidget(
          title: 'Reimbursement',
          listTileOnTap: () {
            Navigator.pushReplacementNamed(
              context,
              REIMBURSEMENT_SCREEN,
            );
          },
        ),

        //PAYROLL
        ExpansionListTileWidget(
          title: "Payroll",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Salary Info',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "",
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Payslip',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  PAYSLIP,
                );
              },
            ),
          ],
        ),

        //ATTENDANCE
        ExpansionListTileWidget(
          title: "Attendance",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Remote Signin/Signout Request',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  MARK_ATTENDANCE_ROUTE,
                );
              },
            ),
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Attendance Details',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "",
                );
              },
            ),
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Access Logs',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  DISPLAY_ACCESS_LOG,
                );
              },
            ),
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Roster Schedule',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "",
                );
              },
            ),
          ],
        ),

        //WORKLIST
        ExpansionListTileWidget(
          title: "Worklist",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Dashboard',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  WORKLIST_DASHBOARD,
                );
              },
            ),
            DrawerListTileWidget(
              title: 'WorkList My Service',
              listTileOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => WorkListMyServiceScreenCount(
                            ntsType: NTSType.service,
                          )),
                );
              },
            ),
            DrawerListTileWidget(
              title: 'WorkList My Task',
              listTileOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => WorkListMyServiceScreenCount(
                            ntsType: NTSType.task,
                          )),
                );
              },
            ),
            //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t My Services',
            //   listTileOnTap: () {
            //     ntsChartBloc.subjectChartByStatus.sink.add(null);
            //     ntsChartBloc.subjectChartByUserType.sink.add(null);
            //     ntsChartBloc.subjectDatewiseSLA.sink.add(null);
            //     Navigator.pushReplacementNamed(
            //       context,
            //       SERVICE_DASHBOARD,
            //     );
            //   },
            // ),

            // //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t My Tasks',
            //   listTileOnTap: () {
            //     ntsChartBloc.subjectChartByStatus.sink.add(null);
            //     ntsChartBloc.subjectChartByUserType.sink.add(null);
            //     ntsChartBloc.subjectDatewiseSLA.sink.add(null);
            //     Navigator.pushReplacementNamed(
            //       context,
            //       TASK_DASHBOARD,
            //     );
            //   },
            // ),

            //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t My Notes',
            //   listTileOnTap: () {
            //     ntsChartBloc.subjectChartByStatus.sink.add(null);
            //     ntsChartBloc.subjectChartByUserType.sink.add(null);
            //     ntsChartBloc.subjectDatewiseSLA.sink.add(null);
            //     Navigator.pushReplacementNamed(
            //       context,
            //       NOTE_DASHBOARD,
            //     );
            //   },
            // ),
          ],
        ),

        //HELP DESK
        ExpansionListTileWidget(
          title: "Help-desk",
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Helpdesk Dashbaord',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  CASE_MANAGEMENT_HELPDESK_DASHBOARD_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t My Requests',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  SERVICE_HOME,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t My Tasks',
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  TASK_HOME,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  // Widget _drawerListWidget(
  //   BuildContext context,
  //   List<UserPermissionModel?> data,
  // ) {
  //   // print(data);

  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       //
  //       DrawerListTileWidget(
  //         title: 'Case Management',
  //         icon: Icons.manage_accounts,
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             CASE_MANAGEMENT_ROUTE,
  //           );
  //         },
  //       ),

  //       //
  //       DrawerListTileWidget(
  //         title: 'Workboard',
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             WORKBOARD_SCREEN,
  //           );
  //         },
  //       ),

  //       //
  //       DrawerListTileWidget(
  //         title: 'Document',
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             DMS_PARENT,
  //           );
  //         },
  //       ),

  //       //
  //       DrawerListTileWidget(
  //         title: 'Document Workspace',
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             DMS_WORKSPACE_ROUTE,
  //           );
  //         },
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           'Time & Attendance',
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Remote Attendance',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 MARK_ATTENDANCE_ROUTE,
  //               );
  //             },
  //           ),
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Access Logs',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DISPLAY_ACCESS_LOG,
  //               );
  //             },
  //           ),
  //         ],
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           'Time & Attendance (Web)',
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Register Face',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 REGISTER_FACE_WEB,
  //               );
  //             },
  //           ),
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Mark Attendance',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 MARK_ATTENDANCE_WEB,
  //               );
  //             },
  //           ),
  //         ],
  //       ),

  //       //
  //       DrawerListTileWidget(
  //         title: 'Worklist Dashboard',
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             WORKLIST_DASHBOARD,
  //           );
  //         },
  //       ),

  //       //
  //       DrawerListTileWidget(
  //         title: 'Requested Leaves',
  //         icon: Icons.hotel,
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             DISPLAY_LEAVES,
  //           );
  //         },
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           'Payroll',
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Manage Accrual',
  //             listTileOnTap: () {
  //               ntsChartBloc.subjectChartByStatus.sink.add(null);
  //               ntsChartBloc.subjectChartByUserType.sink.add(null);
  //               ntsChartBloc.subjectDatewiseSLA.sink.add(null);
  //               Navigator.pushNamed(
  //                 context,
  //                 MANAGE_ACCRUAL,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Payslip',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 PAYSLIP,
  //               );
  //             },
  //           ),
  //         ],
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           'Note',
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Note Home Dashboard',
  //             listTileOnTap: () {
  //               ntsChartBloc.subjectChartByStatus.sink.add(null);
  //               ntsChartBloc.subjectChartByUserType.sink.add(null);
  //               ntsChartBloc.subjectDatewiseSLA.sink.add(null);
  //               Navigator.pushNamed(
  //                 context,
  //                 NOTE_DASHBOARD,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Note Home',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 NOTE_HOME,
  //               );
  //             },
  //           ),
  //         ],
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           'Task',
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Task Home Dashboard',
  //             listTileOnTap: () {
  //               ntsChartBloc.subjectChartByStatus.sink.add(null);
  //               ntsChartBloc.subjectChartByUserType.sink.add(null);
  //               ntsChartBloc.subjectDatewiseSLA.sink.add(null);
  //               Navigator.pushNamed(
  //                 context,
  //                 TASK_DASHBOARD,
  //               );
  //             },
  //           ),
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Task List',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 TASKLIST,
  //               );
  //             },
  //           ),
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Task Home',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 TASK_HOME,
  //               );
  //             },
  //           ),
  //         ],
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           'Service',
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Service Home Dashboard',
  //             listTileOnTap: () {
  //               ntsChartBloc.subjectChartByStatus.sink.add(null);
  //               ntsChartBloc.subjectChartByUserType.sink.add(null);
  //               ntsChartBloc.subjectDatewiseSLA.sink.add(null);
  //               Navigator.pushNamed(
  //                 context,
  //                 SERVICE_DASHBOARD,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Service Home',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 SERVICE_HOME,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Component Result',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 SERVICE_COMPONENT_RESULT_ROUTE,
  //               );
  //             },
  //           ),
  //         ],
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           "Documents",
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Requested By HR',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 PERSON_DOCUMENTS_ROUTE,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Manage Documents',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 PERSON_PROFILE_ROUTE,
  //               );
  //             },
  //           ),
  //         ],
  //       ),

  //       //
  //       DrawerListTileWidget(
  //         title: 'Manage Dependents',
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             MANAGE_DEPENDENTS,
  //           );
  //         },
  //       ),

  //       //
  //       DrawerListTileWidget(
  //         title: 'Workboard Task List',
  //         listTileOnTap: () {
  //           Navigator.pushNamed(
  //             context,
  //             WORKBOARD_TASK_LIST,
  //           );
  //         },
  //       ),

  //       //
  //       ExpansionTile(
  //         title: Text(
  //           'DMS',
  //           style: TextStyle(
  //             fontSize: 10.0.sp,
  //             color: const Color(0xFF757575),
  //             fontWeight: FontWeight.normal,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         children: [
  //           //
  //           // DrawerListTileWidget(
  //           //   title: 'Document',
  //           //   listTileOnTap: () {
  //           //     Navigator.pushNamed(
  //           //       context,
  //           //       DMS_PARENT,
  //           //     );
  //           //   },
  //           // ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Documeny Search',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DMS_SEARCH_ROUTE,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Document History',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DMS_HISTORY_ROUTE,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Document Bin',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DMS_BIN_ROUTE,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Document Archive',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DMS_ARCHIVE_ROUTE,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t DMS Support',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DMS_SUPPORT,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Document Workspace',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DMS_WORKSPACE_ROUTE,
  //               );
  //             },
  //           ),

  //           //
  //           DrawerListTileWidget(
  //             title: '\t\t\t\t\t Document Permission',
  //             listTileOnTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 DMS_ADD_EDIT_PERMISSION_ROUTE,
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  void _handleLogoutOnPressed(context) {
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
  }
}
