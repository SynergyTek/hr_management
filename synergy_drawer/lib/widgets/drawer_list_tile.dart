import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawerListTileWidget extends StatelessWidget {
  final String? title;
  final Function? listTileOnTap;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool? isVisible;
  final bool? isLast;

  const DrawerListTileWidget({
    Key? key,
    required this.title,
    required this.listTileOnTap,
    this.subtitle,
    this.trailingIcon,
    this.leadingIcon,
    this.isVisible = true,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          ListTile(
            enabled: true,
            dense: true,
            leading: leadingIcon != null
                ? Icon(
                    leadingIcon,
                    color: Color.fromARGB(255, 175, 174, 174),
                  )
                : null,
            trailing: Icon(
              trailingIcon,
              color: Color.fromARGB(255, 175, 174, 174),
            ),
            title: Text(
              title!,
              style: TextStyle(
                fontSize: 12.5.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.normal,
                letterSpacing: 1,
              ),
            ),
            onTap: () => listTileOnTap!(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
            child: Container(
              height: 1,
              color: Color.fromARGB(255, 236, 235, 235),
            ),
          )
        ],
      ),
    );
  }
}
