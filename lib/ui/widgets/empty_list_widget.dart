import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';

import '../../themes/theme_config.dart';

class EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Card(
          elevation: 0,
          child: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.list_alt_sharp,
                  color: Theme.of(context).primaryColorLight,
                  size: 125.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "No Record Found",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).invertedColor,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class EmptyFolderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Card(
          elevation: 0,
          child: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CustomIcons.folder_open,
                  color: Theme.of(context).primaryColorLight,
                  size: 125.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "This Folder Is Empty",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).invertedColor,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
