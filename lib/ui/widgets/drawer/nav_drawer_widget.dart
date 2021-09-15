import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/image_path_constants.dart';
import '../../../logic/blocs/nts_charts_bloc/nts_charts_bloc.dart';
import '../../../routes/route_constants.dart';
import 'widgets/drawer_list_tile.dart';

Widget drawerWidget(context) {
  var fontSize = 15.0;
  Color fontColor = Colors.black87;
  return Drawer(
    child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SafeArea(
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.85),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[800],
                      radius: 25,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'HR',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'HR Management',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              // ListTile(
              //   title: Text(
              //     'Test',
              //     style: TextStyle(fontSize: fontSize, color: fontColor),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(
              //       context,
              //       HOME_ROUTE,
              //     );
              //   },
              // ),

              DrawerListTileWidget(
                title: 'CASE MANAGEMENT',
                trailing: Icon(Icons.manage_accounts),
                listTileOnTap: () {
                  Navigator.pushNamed(
                    context,
                    CASE_MANAGEMENT_ROUTE,
                  );
                },
              ),

              ExpansionTile(
                title: Text(
                  'TIME AND ATTENEDANCE WEB',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                children: [
                  DrawerListTileWidget(
                    title: 'REGISTER FACE',
                    // trailing: Icon(Icons.payment),
                    listTileOnTap: () {
                      Navigator.pushNamed(
                        context,
                        REGISTER_FACE_WEB,
                      );
                    },
                  ),
                  DrawerListTileWidget(
                    title: 'MARK ATTENDANCE',
                    listTileOnTap: () {
                      Navigator.pushNamed(
                        context,
                        MARK_ATTENDANCE_WEB,
                      );
                    },
                  ),
                ],
              ),

              DrawerListTileWidget(
                title: 'WORKLIST DASHBOARD',
                listTileOnTap: () {
                  Navigator.pushNamed(
                    context,
                    WORKLIST_DASHBOARD,
                  );
                },
              ),

              DrawerListTileWidget(
                title: 'REQUESTED LEAVES',
                trailing: Icon(Icons.request_page_outlined),
                listTileOnTap: () {
                  Navigator.pushNamed(
                    context,
                    DISPLAY_LEAVES,
                  );
                },
              ),

              ExpansionTile(
                title: Text(
                  'TIME & ATTENDANCE',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                children: [
                  DrawerListTileWidget(
                    title: 'REMOTE SIGNIN/SIGNOUT',
                    trailing: Icon(Icons.login),
                    listTileOnTap: () {
                      Navigator.pushNamed(
                        context,
                        MARK_ATTENDANCE_ROUTE,
                      );
                    },
                  ),
                  DrawerListTileWidget(
                    title: 'ACCESS LOGS',
                    trailing: Icon(Icons.list_alt),
                    listTileOnTap: () {
                      Navigator.pushNamed(
                        context,
                        DISPLAY_ACCESS_LOG,
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'PAYROLL',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                children: [
                  DrawerListTileWidget(
                    title: 'MANAGE ACCRUAL',
                    // trailing: Icon(Icons.payment),
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
                  DrawerListTileWidget(
                    title: 'PAYSLIP',
                    // trailing: Icon(Icons.payment),
                    listTileOnTap: () {
                      Navigator.pushNamed(
                        context,
                        PAYSLIP,
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'TASK',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                children: [
                  DrawerListTileWidget(
                    title: 'TASK HOME DASHBOARD',
                    // trailing: Icon(Icons.payment),
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
                    title: 'TASK LIST',
                    // trailing: Icon(Icons.payment),
                    listTileOnTap: () {
                      Navigator.pushNamed(
                        context,
                        TASKLIST,
                      );
                    },
                  ),
                  DrawerListTileWidget(
                    title: 'TASK HOME',
                    // trailing: Icon(Icons.payment),
                    listTileOnTap: () {
                      Navigator.pushNamed(
                        context,
                        TASK_HOME,
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'SERVICE',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'SERVICE HOME DASHBOARD',
                      style: TextStyle(fontSize: fontSize, color: fontColor),
                    ),
                    onTap: () {
                      ntsChartBloc.subjectChartByStatus.sink.add(null);
                      ntsChartBloc.subjectChartByUserType.sink.add(null);
                      ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                      Navigator.pushNamed(
                        context,
                        SERVICE_DASHBOARD,
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'SERVICE HOME',
                      style: TextStyle(fontSize: fontSize, color: fontColor),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SERVICE_HOME,
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Component Result',
                      style: TextStyle(fontSize: fontSize, color: fontColor),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SERVICE_COMPONENT_RESULT_ROUTE,
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'NOTE',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'NOTE HOME DASHBOARD',
                      style: TextStyle(fontSize: fontSize, color: fontColor),
                    ),
                    onTap: () {
                      ntsChartBloc.subjectChartByStatus.sink.add(null);
                      ntsChartBloc.subjectChartByUserType.sink.add(null);
                      ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                      Navigator.pushNamed(
                        context,
                        NOTE_DASHBOARD,
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'NOTE HOME',
                      style: TextStyle(fontSize: fontSize, color: fontColor),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NOTE_HOME,
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("DOCUMENTS"),
                children: [
                  ListTile(
                    trailing: Image.asset(
                      DOCUMENTS_REQUESTED_BY_HR_ICON,
                      width: 24.0,
                      height: 24.0,
                    ),
                    title: Text(
                      'REQUESTED BY HR',
                      style: TextStyle(
                        fontSize: fontSize,
                        color: fontColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PERSON_DOCUMENTS_ROUTE,
                      );
                    },
                  ),
                  ListTile(
                    trailing: Image.asset(
                      MANAGE_DOCUMENTS_ICON,
                      width: 24.0,
                      height: 24.0,
                    ),
                    title: Text(
                      'MANAGE DOCUMENTS',
                      style: TextStyle(
                        fontSize: fontSize,
                        color: fontColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PERSON_PROFILE_ROUTE,
                      );
                    },
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  'MY PROFILE',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MYPROFILE,
                  );
                },
              ),
              ListTile(
                title: Text(
                  'MANAGE DEPENDENTS',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MANAGE_DEPENDENTS,
                  );
                },
              ),
              ListTile(
                title: Text(
                  'DMS',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DMS_PARENT,
                  );
                },
              ),
              ListTile(
                title: Text(
                  'DMS SUPPORT',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DMS_SUPPORT,
                  );
                },
              ),

              ListTile(), //Added to avoid the last option to be hidden under "LOG OUT"
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            child: ListTile(
              tileColor: Colors.white,
              title: Text(
                'LOG OUT',
                style: TextStyle(fontSize: fontSize, color: fontColor),
              ),
              trailing: Icon(Icons.logout),
              onTap: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.clear();

                BlocProvider.of<UserModelBloc>(context).add(
                  UserModelChangeEvent(
                    userModel: null,
                  ),
                );

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LOGIN_ROUTE,
                  ModalRoute.withName('/login'),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
