import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/constants/image_path_constants.dart';
import '../../../logic/blocs/nts_charts_bloc/nts_charts_bloc.dart';
import '../../../routes/route_constants.dart';

Widget drawerWidget(context) {
  var fontSize = 15.0;
  Color fontColor = Colors.black87;
  return Drawer(
    child: SingleChildScrollView(
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
          //     'FORMIO WEBVIEW POC',
          //     style: TextStyle(
          //       fontSize: fontSize,
          //       color: fontColor,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       HOME_ROUTE,
          //     );
          //   },
          // ),

          ListTile(
            title: Text(
              'WORKLIST DASHBOARD',
              style: TextStyle(fontSize: fontSize, color: fontColor),
            ),
            // trailing: Icon(Icons.dashboard_customize_outlined),
            onTap: () {
              Navigator.pushNamed(
                context,
                WORKLIST_DASHBOARD,
              );
            },
          ),
          ListTile(
            title: Text(
              'REQUESTED LEAVES',
              style: TextStyle(fontSize: fontSize, color: fontColor),
            ),
            trailing: Icon(Icons.request_page_outlined),
            onTap: () {
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
              ListTile(
                title: Text(
                  'REMOTE SIGNIN/SIGNOUT',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MARK_ATTENDANCE_ROUTE,
                  );
                },
              ),
              ListTile(
                title: Text(
                  'ACCESS LOGS',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
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
              ListTile(
                title: Text(
                  'MANAGE ACCRUAL',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  ntsChartBloc.subjectChartByStatus.sink.add(null);
                  ntsChartBloc.subjectChartByUserType.sink.add(null);
                  ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                  Navigator.pushNamed(
                    context,
                    MANAGE_ACCRUAL,
                  );
                },
              ),
              ListTile(
                title: Text(
                  'PAYSLIP',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
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
              ListTile(
                title: Text(
                  'TASK HOME DASHBOARD',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  ntsChartBloc.subjectChartByStatus.sink.add(null);
                  ntsChartBloc.subjectChartByUserType.sink.add(null);
                  ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                  Navigator.pushNamed(
                    context,
                    TASK_DASHBOARD,
                  );
                },
              ),
              ListTile(
                title: Text(
                  'TASK LIST',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    TASKLIST,
                  );
                },
              ),
              ListTile(
                title: Text(
                  'TASK HOME',
                  style: TextStyle(fontSize: fontSize, color: fontColor),
                ),
                onTap: () {
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
              ListTile(
                  title: Text(
                    'DOCUMENT TEMPLATE',
                    style: TextStyle(fontSize: fontSize, color: fontColor),
                  ),
                  onTap: () => Navigator.pushNamed(
                        context,
                        NTS_TEMPLATE_REQUEST,
                        arguments: ScreenArguments(
                          ntstype: NTSType.note,
                          arg4: 'Document',
                        ),
                      ))
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
        ],
      ),
    ),
  );
}
