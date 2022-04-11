import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExpansionListTileWidget extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const ExpansionListTileWidget({
    Key? key,

    //
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title ?? '',
        style: TextStyle(
          fontSize: 10.0.sp,
          color: const Color(0xFF757575),
          fontWeight: FontWeight.normal,
          letterSpacing: 1.2,
        ),
      ),
      children: children,
    );
  }
}
