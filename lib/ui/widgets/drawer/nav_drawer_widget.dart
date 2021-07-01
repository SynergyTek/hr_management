import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../routes/route_constants.dart';

Widget drawerWidget(context) {
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
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text('Home'),
          trailing: Icon(
            Icons.home,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              HOME_ROUTE,
            );
          },
        ),
        ListTile(
          title: Text('Remote Sign In/Out'),
          trailing: Icon(Icons.login),
          onTap: () {
            Navigator.pushNamed(
              context,
              MARK_ATTENDANCE_ROUTE,
            );
          },
        ),
        ListTile(
          title: Text('New Leave Request'),
          trailing: Icon(Icons.calendar_today_outlined),
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
        // ListTile(
        //   title: Text('Create Service'),
        //   trailing: Icon(Icons.create),
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       CREATE_SERVICE_ROUTE,
        //     );
        //   },
        // ),
      ],
    ),
  );
}
