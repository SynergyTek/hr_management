import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  final Widget? childWidget;
  // final SettingInheritedWidget settingsInheritedWidget;
  BodyLayout({this.childWidget, 
  // this.settingsInheritedWidget
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(padding: EdgeInsets.only(right: 15.0, left: 15.0, top: 20.0),
      child: childWidget,));
        // child: Container(
        //     // padding: settingsInheritedWidget.isMobileLayout
        //         ? EdgeInsets.only(right: 15.0, left: 15.0, top: 20.0)
        //         : _setTabletLayout(),
        //     child: childWidget));
  }

  // _setTabletLayout() {
    // if (settingsInheritedWidget.orientation == Orientation.portrait &&
    //     !settingsInheritedWidget.isMobileLayout) {
    //   return EdgeInsets.only(right: 100.0, left: 100.0, top: 50.0);
    // } else {
      // return EdgeInsets.only(right: 200.0, left: 200.0, top: 50.0);
    // }
  // }
}