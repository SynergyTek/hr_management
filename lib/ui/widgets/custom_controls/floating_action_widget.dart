import 'package:flutter/material.dart';

import '../../../themes/light_theme.dart';

class FloatingActionWidget extends StatelessWidget {
  final VoidCallback? callBack;
  FloatingActionWidget({Key? key, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: LightTheme().lightThemeData().primaryColor,
      onPressed: () {
        onNetworkOnPressEventTap(callBack, context);
      },
      child: Icon(Icons.add),
    );
  }
}

onNetworkOnPressEventTap(Function? callback, context) {
  // NetworkHelper _networkHelper = NetworkHelper();
  // _networkHelper.initConnectivity().then((value) {
  //   if (value) {
  //     callback();
  //   } else {
  //     return networkRaisedToast(context);
  //   }
  // }, onError: (error) {
  //   // print(error);
  // });
}
