import 'package:flutter/material.dart';
import 'package:hr_management/data/models/time_permission_model/time_permission_model.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/dotted_divider_widget.dart';
import '../../../widgets/widgets.dart';

class TimePermissionListTileWidget extends StatelessWidget {
  final TimePermission data;

  const TimePermissionListTileWidget({
    Key? key,

    //
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: statusToColorMap[data.serviceStatus] ?? Colors.transparent,
              width: 1.5.w,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: titleWidget(
                    context: context,
                    caption: data.serviceNo ?? '',
                    title: data.name ?? '-',
                  ),
                ),
                subtitleWidget(
                  context: context,
                  caption: "Status",
                  customChild: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.serviceStatus ?? '',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(width: 2.w),

                      //
                      statusContainerWidget(
                        statusColor: statusToColorMap[data.serviceStatus] ??
                            Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const DottedDividerWidget(),

            //
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: subtitleWidget(
                    context: context,
                    caption: "Timeline",
                    title:
                        "${formatDate(date: data.date) ?? "NA"} - ${formatDate(date: data.date) ?? "NA"}",
                  ),
                ),

                //

                // Padding(
                //   padding: EdgeInsets.only(right: 4.w),
                //   child: subtitleWidget(
                //     context: context,
                //     caption: "Amount",
                //     title: data.reimbursementAmount?.toStringAsFixed(2) ?? "0",
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
