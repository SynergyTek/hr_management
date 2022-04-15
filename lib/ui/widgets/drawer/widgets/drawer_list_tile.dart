import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../dotted_divider_widget.dart';

class DrawerListTileWidget extends StatelessWidget {
  final String? title;
  final Function? listTileOnTap;
  final String? subtitle;
  final IconData? icon;
  final bool? isVisible;
  final bool? isLast;

  const DrawerListTileWidget({
    Key? key,
    required this.title,
    required this.listTileOnTap,
    this.subtitle,
    this.icon,
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
            trailing: Icon(icon),
            title: Text(
              title!,
              style: TextStyle(
                fontSize: 10.0.sp,
                color: const Color(0xFF444444),
                fontWeight: FontWeight.normal,
                letterSpacing: 1,
              ),
            ),
            onTap: () => listTileOnTap!(),
          ),

          //
          // Visibility(
          //   visible: !isLast!,
          //   child: const DottedDividerWidget(),
          // ),
        ],
      ),
    );
  }
}
