import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/hr_direct_chart/hr_direct_chart.dart';
import 'package:hr_management/ui/screens/leaves/get_policy_documents_screen.dart';
import 'package:hr_management/ui/screens/worklist_my_service/worklist_my_service.dart';
import 'package:hr_management/ui/widgets/drawer/widgets/expansion_list_tile_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../data/lists/lists.dart';
import '../../../logic/blocs/permission_bloc/user_permission_bloc/user_permission_bloc.dart';
import '../../../routes/route_constants.dart';
import '../../screens/leaves/employee_attendance_list_screen.dart';
import '../dotted_divider_widget.dart';
import 'widgets/drawer_list_tile.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatefulWidget {
  DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<Widget> drawerItemList = [];
  List<UserPermissionModel?> permissionList = [];
  @override
  void initState() {
    getSavedPermissionList();
    super.initState();
  }

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
                  Column(
                    children: drawerList(
                      context: context,
                      data: permissionList,
                    ),
                  )
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

        //DMS
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

        //
        ExpansionListTileWidget(
          title: BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
          children: [
            //
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t Home',
            //   listTileOnTap: () {
            //     Navigator.pushReplacementNamed(
            //       context,
            //       "",
            //     );
            //   },
            // ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Employee Dashboard',
              listTileOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HrDirectChart(),
                  ),
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

            DrawerListTileWidget(
              title: '\t\t\t\t\t HR Direct',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  HR_DIRECT_CONTRACT_SCREEN,
                );
              },
            ),

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

            //POLICY DOCUMENT
            DrawerListTileWidget(
              title: '\t\t\t\t\t Policy Documents',
              listTileOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HrPolicyDocumentScreen()),
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
              title: '\t\t\t\t\t Salary Details',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  SALARY_DETAILS,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\t Payslip',
              listTileOnTap: () {
                Navigator.pushNamed(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EmployeeAttendanceListScreen()),
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
            // DrawerListTileWidget(
            //   title: '\t\t\t\t\t Roster Schedule',
            //   listTileOnTap: () {
            //     Navigator.pushReplacementNamed(
            //       context,
            //       "",
            //     );
            //   },
            // ),
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
            DrawerListTileWidget(
              title: 'WorkList My Notes',
              listTileOnTap: () {
                Navigator.pushNamed(context, NOTE_HOME);
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
                Navigator.pushNamed(
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
                  arguments: ScreenArguments(
                    arg4: "TMS_GENERAL",
                    val2: true,
                  ),
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

  List<Widget> drawerList({
    required BuildContext context,
    required List<UserPermissionModel?> data,
  }) {
    drawerItemList.clear();
    if (data.isNotEmpty) {
      drawerItemList.addAll(getDrawerItemList(data, context));
    }
    return drawerItemList;
  }

  List<Widget> getDrawerItemList(List<UserPermissionModel?> data, context) {
    List<Widget> list = [];
    List<Widget> childDraList = [];
    for (int j = 0; j < navDrawerList.length; j++) {
      childDraList = [];
      if (navDrawerList[j].isExpanded == true &&
          navDrawerList[j].isExpanded != null) {
        for (int k = 0; k < navDrawerList[j].childList.length; k++) {
          if (data.any((file) =>
              file!.pageName == navDrawerList[j].childList[k].pageName)) {
            childDraList.add(DrawerListTileWidget(
              title: '\t\t\t\t\t ${navDrawerList[j].childList[k].title}',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  navDrawerList[j].childList[k].route,
                );
              },
            ));
          }
        }
      }
      if (navDrawerList[j].isExpanded == true &&
          navDrawerList[j].isExpanded != null) {
        list.add(ExpansionListTileWidget(
            title: navDrawerList[j].title, children: childDraList));
      } else {
        list.add(DrawerListTileWidget(
          title: navDrawerList[j].title,
          icon: navDrawerList[j].icon,
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              navDrawerList[j].route,
            );
          },
        ));
      }
    }
    return list;
  }

  getSavedPermissionList() async {
    var prefs = await SharedPreferences.getInstance();
    final List parsedList = json.decode(prefs.getString('UserPermissions')!);
    setState(() {
      permissionList =
          parsedList.map((val) => UserPermissionModel.fromJson(val)).toList();
    });
  }

  // Widget _drawerListWidget(
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
