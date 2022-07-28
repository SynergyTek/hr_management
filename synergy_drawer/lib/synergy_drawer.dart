library synergy_drawer;

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_nav_drawer_list/nav_drawer_list.dart';
import 'widgets/dotted_divider_widget.dart';
import 'widgets/drawer_list_tile.dart';
import 'widgets/expansion_list_tile_widget.dart';

class SynergyDrawer extends StatelessWidget {
  SynergyDrawer(
      {Key? key,
      required this.userName,
      required this.email,
      this.headerWidget,
      this.footerWidget,
      this.logoutFunction,
      required this.data,
      required this.mapRoute})
      : super(key: key);
  final List<Widget> drawerItemList = [];
  final Function? logoutFunction;
  final String userName;
  final String email;
  final List<dynamic> data;
  final Widget? headerWidget;
  final Widget? footerWidget;
  final Map<String, String> mapRoute;
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
                            userName.substring(0, 1),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          userName,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          email,
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
                      data: data,
                    ),
                  )
                ],
              ),
            ),

            //
            DrawerListTileWidget(
              isLast: true,
              title: email == null || email.isEmpty ? 'Login' : 'Logout',
              trailingIcon: Icons.logout,
              listTileOnTap: () => logoutFunction,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> drawerList({
    required BuildContext context,
    required List<dynamic?> data,
  }) {
    drawerItemList.clear();
    //if (data.isNotEmpty) {
    drawerItemList.addAll(getDrawerItemList(context));
    //}
    return drawerItemList;
  }

  List<Widget> getDrawerItemList(context) {
    List<Widget> list = [];
    List<Widget> childDraList = [];
    for (int j = 0; j < navDrawerList.length; j++) {
      childDraList = [];
      if (navDrawerList[j].isExpanded == true &&
          navDrawerList[j].isExpanded != null) {
        for (int k = 0; k < navDrawerList[j].childList.length; k++) {
          if (data.any((file) => file!.pageName != null)) {
            if (data.any((file) =>
                file!.pageName == navDrawerList[j].childList[k].pageName)) {
              childDraList.add(DrawerListTileWidget(
                title: ' ${navDrawerList[j].childList[k].title}',
                leadingIcon: navDrawerList[j].childList[k].leadingIcon,
                listTileOnTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    mapRoute[navDrawerList[j].childList[k].title].toString(),
                  );
                },
              ));
            }
          } else {
            childDraList.add(DrawerListTileWidget(
              title: '${navDrawerList[j].childList[k].title}',
              leadingIcon: navDrawerList[j].childList[k].leadingIcon,
              listTileOnTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  mapRoute[navDrawerList[j].childList[k].title].toString(),
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
          trailingIcon: navDrawerList[j].trailingIcon,
          listTileOnTap: () {
            Navigator.pushReplacementNamed(
              context,
              mapRoute[navDrawerList[j].title].toString(),
            );
          },
        ));
      }
    }
    return list;
  }
}
