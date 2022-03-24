import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../ui/widgets/widgets.dart';

class CardBottomModalSheetWidget extends StatelessWidget {
  final String mainTitle;
  final String statusName;

  final String? row1E1Title;
  final String? row1E1Data;
  final String? row1E2Title;
  final String? row1E2Data;

  final String? row2E1Title;
  final String? row2E1Data;
  final String? row2E2Title;
  final String? row2E2Data;

  final String startDate;
  final String endDate;

  const CardBottomModalSheetWidget({
    Key? key,
    required this.statusName,
    this.row1E1Title,
    this.row1E1Data,
    this.row1E2Title,
    this.row1E2Data,
    required this.startDate,
    required this.endDate,
    this.row2E1Title,
    this.row2E1Data,
    this.row2E2Title,
    this.row2E2Data,
    required this.mainTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 2.5.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: titleWidget(
                    context: context, caption: "", title: mainTitle),
              ),
              subtitleWidget(
                context: context,
                caption: "Status",
                customChild: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      statusName,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(width: 2.w),
                    statusContainerWidget(
                      statusColor:
                          statusToColorMap[statusName] ?? Colors.transparent,
                    ),
                  ],
                ),
              )
            ],
          ),
          const DottedDividerWidget(),
          SizedBox(height: 1.h),

          //
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: subtitleWidget(
                  context: context,
                  caption: row1E1Title ?? '',
                  title: row1E1Data ?? "-",
                ),
              ),
              Expanded(
                child: subtitleWidget(
                  context: context,
                  caption: row1E2Title ?? '',
                  title: row1E2Data ?? "-",
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),

          //
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: subtitleWidget(
                    context: context,
                    caption: row2E1Title ?? '',
                    title: row2E1Data ?? ''),
              ),
              Expanded(
                child: subtitleWidget(
                    context: context,
                    caption: row2E2Title ?? '',
                    title: row2E2Data ?? ''),
              ),
            ],
          ),
          SizedBox(height: 1.h),

          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: subtitleWidget(
                  context: context,
                  caption: "Timeline",
                  title:
                      "${formatDate(date: startDate) ?? "NA"} - ${formatDate(date: endDate) ?? "NA"}",
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
