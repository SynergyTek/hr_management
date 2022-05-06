import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/models/service_models/service.dart';
import '../../../../../routes/route_constants.dart';
import '../../../../../routes/screen_arguments.dart';
import '../../../../widgets/dotted_divider_widget.dart';
import '../../../../widgets/widgets.dart';

class LeaveListTileWidget extends StatelessWidget {
  final Service data;

  const LeaveListTileWidget({
    Key? key,

    //
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        CREATE_SERVICE_ROUTE,
        arguments: ScreenArguments(
          arg1: "",
          arg2: data.serviceId,
          arg3: "",
          val1: true,
        ),
      ),
      child: Card(
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
                color: statusToColorMap[data.leaveStatus] ?? Colors.transparent,
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
                      title: data.serviceSubject ?? '-',
                    ),
                  ),
                  subtitleWidget(
                    context: context,
                    caption: "Status",
                    customChild: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.leaveStatus ?? '',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(width: 2.w),

                        //
                        statusContainerWidget(
                          statusColor: statusToColorMap[data.leaveStatus] ??
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
                          "${data.formattedStartDate ?? 'NA'} - ${data.formattedEndDate ?? "NA"}",
                      // "${formatDate(date: data.startDate) ?? "NA"} - ${formatDate(date: data.dueDate) ?? "NA"}",
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
      ),
    );
  }
}
