import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../routes/route_constants.dart';

Widget drawerWidget(context) {
  var fontSize = 15.0;
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

        ListTile(
          title: Text(
            'NEW TASK REQUEST',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.today),
          onTap: () {
            Navigator.pushNamed(
              context,
              TASK_REQUEST,
            );
          },
        ),

        ListTile(
          title: Text(
            'REQUESTED LEAVES',
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
        ListTile(
          title: Text(
            'TASK HOME DASHBOARAD',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.add_to_home_screen),
          onTap: () {
            Navigator.pushNamed(
              context,
              TASK_DASHBOARD,
            );
          },
        ),
        // ListTile(
        //   title: Text('Home'),
        //   trailing: Icon(Icons.home),
        //   onTap: () {
        //     Navigator.pushNamed(
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
            'SERVICE HOME DASHBOARAD',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.add_to_home_screen),
          onTap: () {
            Navigator.pushNamed(
              context,
              SERVICE_DASHBOARD,
            );
          },
        ),
        ListTile(
          title: Text(
            'NOTE HOME DASHBOARAD',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.add_to_home_screen),
          onTap: () {
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
          trailing: Icon(Icons.note),
          onTap: () {
            Navigator.pushNamed(
              context,
              NOTE_HOME,
            );
          },
        ),
        ListTile(
          title: Text(
            'SERVICE HOME',
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
          trailing: Icon(Icons.note),
          onTap: () {
            Navigator.pushNamed(
              context,
              SERVICE_HOME,
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
