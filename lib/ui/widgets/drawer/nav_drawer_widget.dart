import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../routes/route_constants.dart';

Widget drawerWidget(context) {
  var fontSize = 16.0;
  Color fontColor = Colors.black87;
  return Drawer(
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
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              title: Text(
                'HR Management',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        // ListTile(
        //   title: Text('Home'),
        //   trailing: Icon(
        //     Icons.home,
        //   ),
        //   onTap: () {
        //     Navigator.pushReplacementNamed(
        //       context,
        //       HOME_ROUTE,
        //     );
        //   },
        // ),
        ListTile(
          title: Text(
            'REMOTE SIGNIN/SIGNOUT',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.settings_remote),
          onTap: () {
            Navigator.pushNamed(
              context,
              MARK_ATTENDANCE_ROUTE,
            );
          },
        ),
        ListTile(
          title: Text(
            'NEW LEAVE REQUEST',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.loupe),
          onTap: () {
            Navigator.pushNamed(
              context,
              LEAVE_REQUEST,
            );
          },
        ),

        // ListTile(
        //   title: Text('UDF Demo'),
        //   trailing: Icon(Icons.app_registration),
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       REGISTRATION_ROUTE,
        //     );
        //   },
        // ),
        ListTile(
          title: Text(
            'TASK HOME',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.add_to_home_screen),
          onTap: () {
            Navigator.pushNamed(
              context,
              TASK_HOME,
            );
          },
        ),

        // ListTile(
        //   title: Text('Task Home'),
        //   // trailing: Icon(Icons.task),
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       TASK_HOME,
        //     );
        //   },
        // ),

        // ListTile(
        //   title: Text('Create Service'),
        //   trailing: Icon(Icons.create),
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       CREATE_SERVICE_ROUTE,
        //       // arguments: ScreenArguments(
        //       //   arg1: "",
        //       // ),
        //     );
        //   },
        // ),
        ListTile(
          title: Text(
            'ACCESS LOGS',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.sync_alt),
          onTap: () {
            Navigator.pushNamed(
              context,
              DISPLAY_ACCESS_LOG,
            );
          },
        ),
        ListTile(
          title: Text(
            'LEAVES',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.fact_check),
          onTap: () {
            Navigator.pushNamed(
              context,
              DISPLAY_LEAVES,
            );
          },
        ),
        // ListTile(
        //   title: Text(
        //     'LOGOUT',
        //     style: TextStyle(fontSize: fontSize, color: fontColor),
        //   ),
        //   trailing: Icon(Icons.logout),
        //   onTap: () {
        //     Navigator.pushReplacementNamed(
        //       context,
        //       LOGIN_ROUTE,
        //     );
        //   },
        // ),
      ],
    ),
  );
}
