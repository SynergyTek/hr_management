import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/misconduct_model/misconduct_model.dart';
import '../../../widgets/dotted_divider_widget.dart';
import '../../../widgets/widgets.dart';

class MisconductListTileWidget extends StatelessWidget {
  final MisconductModel data;

  const MisconductListTileWidget({
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
              color: statusToColorMap[data.status] ?? Colors.transparent,
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
                    title: data.misconductTypeName ?? '-',
                  ),
                ),
                subtitleWidget(
                  context: context,
                  caption: "Status",
                  customChild: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.status ?? '',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(width: 2.w),

                      //
                      statusContainerWidget(
                        statusColor:
                            statusToColorMap[data.status] ?? Colors.transparent,
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
                //
                Expanded(
                  child: subtitleWidget(
                    context: context,
                    caption: "Misconduct Date",
                    title:
                        "${formatDate(date: data.misconductDate.toString()) ?? "NA"}",
                  ),
                ),

                //
                subtitleWidget(
                  context: context,
                  caption: "Disciplinary Action",
                  title: data.disciplinaryActionTakenName ?? "",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
