import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class DottedDividerWidget extends StatelessWidget {
  final double height;
  final Color? color;
  final EdgeInsets? padding;

  const DottedDividerWidget({
    Key? key,
    this.height = 0.75,
    this.color = AppThemeColor.textColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 1.h),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth = 1.25.w;
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}
