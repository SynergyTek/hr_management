import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/blocs/nts_charts_bloc/nts_charts_bloc.dart';
import '../../../logic/blocs/permission_bloc/user_permission_bloc/user_permission_bloc.dart';
import '../../../routes/route_constants.dart';
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
                  FutureBuilder<UserPermissionResponse?>(
                    future: _handleUserPermissions(context),
                    builder: (BuildContext context,
                        AsyncSnapshot<UserPermissionResponse?> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "An error occurred while fetching user permissions metadata.",
                          ),
                        );
                      } else if (snapshot.hasData) {
                        print(snapshot.data);

                        if (snapshot.data?.data == null ||
                            snapshot.data!.data.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                  "An error occurred, please try again later."),
                            ),
                          );
                        }

                        return drawerListWidget(
                          context,
                          snapshot.data!.data,
                        );
                      }

                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.25,
                          ),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            //
            DrawerListTileWidget(
              title: 'Profile',
              icon: Icons.person,
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  MYPROFILE,
                );
              },
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

  Widget drawerListWidget(
    BuildContext context,
    List<UserPermissionModel?> data,
  ) {
    // print(data);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        DrawerListTileWidget(
          title: 'Case Management',
          icon: Icons.manage_accounts,
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              CASE_MANAGEMENT_ROUTE,
            );
          },
        ),

        //
        DrawerListTileWidget(
          title: 'Workboard',
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              WORKBOARD_SCREEN,
            );
          },
        ),

        //
        DrawerListTileWidget(
          title: 'Document',
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              DMS_PARENT,
            );
          },
        ),

        //
        DrawerListTileWidget(
          title: 'Document Workspace',
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              DMS_WORKSPACE_ROUTE,
            );
          },
        ),

        //
        ExpansionTile(
          title: Text(
            'Time & Attendance',
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            DrawerListTileWidget(
              title: '\t\t\t\t\tRemote Attendance',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  MARK_ATTENDANCE_ROUTE,
                );
              },
            ),
            DrawerListTileWidget(
              title: '\t\t\t\t\tAccess Logs',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DISPLAY_ACCESS_LOG,
                );
              },
            ),
          ],
        ),

        //
        ExpansionTile(
          title: Text(
            'Time & Attendance (Web)',
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            DrawerListTileWidget(
              title: '\t\t\t\t\tRegister Face',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  REGISTER_FACE_WEB,
                );
              },
            ),
            DrawerListTileWidget(
              title: '\t\t\t\t\tMark Attendance',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  MARK_ATTENDANCE_WEB,
                );
              },
            ),
          ],
        ),

        //
        DrawerListTileWidget(
          title: 'Worklist Dashboard',
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              WORKLIST_DASHBOARD,
            );
          },
        ),

        //
        DrawerListTileWidget(
          title: 'Requested Leaves',
          icon: Icons.hotel,
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              DISPLAY_LEAVES,
            );
          },
        ),

        //
        ExpansionTile(
          title: Text(
            'Payroll',
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tManage Accrual',
              listTileOnTap: () {
                ntsChartBloc.subjectChartByStatus.sink.add(null);
                ntsChartBloc.subjectChartByUserType.sink.add(null);
                ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                Navigator.pushNamed(
                  context,
                  MANAGE_ACCRUAL,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tPayslip',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  PAYSLIP,
                );
              },
            ),
          ],
        ),

        //
        ExpansionTile(
          title: Text(
            'Note',
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tNote Home Dashboard',
              listTileOnTap: () {
                ntsChartBloc.subjectChartByStatus.sink.add(null);
                ntsChartBloc.subjectChartByUserType.sink.add(null);
                ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                Navigator.pushNamed(
                  context,
                  NOTE_DASHBOARD,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tNote Home',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  NOTE_HOME,
                );
              },
            ),
          ],
        ),

        //
        ExpansionTile(
          title: Text(
            'Task',
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            DrawerListTileWidget(
              title: '\t\t\t\t\tTask Home Dashboard',
              listTileOnTap: () {
                ntsChartBloc.subjectChartByStatus.sink.add(null);
                ntsChartBloc.subjectChartByUserType.sink.add(null);
                ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                Navigator.pushNamed(
                  context,
                  TASK_DASHBOARD,
                );
              },
            ),
            DrawerListTileWidget(
              title: '\t\t\t\t\tTask List',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  TASKLIST,
                );
              },
            ),
            DrawerListTileWidget(
              title: '\t\t\t\t\tTask Home',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  TASK_HOME,
                );
              },
            ),
          ],
        ),

        //
        ExpansionTile(
          title: Text(
            'Service',
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tService Home Dashboard',
              listTileOnTap: () {
                ntsChartBloc.subjectChartByStatus.sink.add(null);
                ntsChartBloc.subjectChartByUserType.sink.add(null);
                ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                Navigator.pushNamed(
                  context,
                  SERVICE_DASHBOARD,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tService Home',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  SERVICE_HOME,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tComponent Result',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  SERVICE_COMPONENT_RESULT_ROUTE,
                );
              },
            ),
          ],
        ),

        //
        ExpansionTile(
          title: Text(
            "Documents",
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tRequested By HR',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  PERSON_DOCUMENTS_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tManage Documents',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  PERSON_PROFILE_ROUTE,
                );
              },
            ),
          ],
        ),

        //
        DrawerListTileWidget(
          title: 'Manage Dependents',
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              MANAGE_DEPENDENTS,
            );
          },
        ),

        //
        DrawerListTileWidget(
          title: 'Workboard Task List',
          listTileOnTap: () {
            Navigator.pushNamed(
              context,
              WORKBOARD_TASK_LIST,
            );
          },
        ),

        //
        ExpansionTile(
          title: Text(
            'DMS',
            style: TextStyle(
              fontSize: 10.0.sp,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          ),
          children: [
            //
            // DrawerListTileWidget(
            //   title: 'Document',
            //   listTileOnTap: () {
            //     Navigator.pushNamed(
            //       context,
            //       DMS_PARENT,
            //     );
            //   },
            // ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tDocumeny Search',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_SEARCH_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tDocument History',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_HISTORY_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tDocument Bin',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_BIN_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tDocument Archive',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_ARCHIVE_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tDMS Support',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_SUPPORT,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tDocument Workspace',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_WORKSPACE_ROUTE,
                );
              },
            ),

            //
            DrawerListTileWidget(
              title: '\t\t\t\t\tDocument Permission',
              listTileOnTap: () {
                Navigator.pushNamed(
                  context,
                  DMS_ADD_EDIT_PERMISSION_ROUTE,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

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

  Future<UserPermissionResponse?> _handleUserPermissions(
      BuildContext context) async {
    UserPermissionResponse? response =
        await UserPermissionBloc().getUserPermission(
      queryparams: {
        "userId": BlocProvider.of<UserModelBloc>(context).state.userModel?.id,
        "portalName": portalMap[BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType]
            ?.name,
      },
    );

    return response;
  }
}
