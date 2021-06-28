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
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[800],
                radius: 25,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'T',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Title',
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
            Navigator.pushReplacementNamed(
              context,
              MARK_ATTENDANCE_ROUTE,
            );
          },
        ),
        ListTile(
          title: Text('New Leave Request'),
          trailing: Icon(Icons.calendar_today_outlined),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              LEAVE_REQUEST,
            );
          },
        ),
        ListTile(
          title: Text('UDF Demo'),
          trailing: Icon(Icons.calendar_today_outlined),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              REGISTRATION_ROUTE,
            );
          },
        ),
        // ListTile(
        //   title: Text('Create Service'),
        //   trailing: Icon(Icons.create),
        //   onTap: () {
        //     Navigator.pushReplacementNamed(
        //       context,
        //       CREATE_SERVICE,
        //     );
        //   },
        // ),
      ],
    ),
  );
}
