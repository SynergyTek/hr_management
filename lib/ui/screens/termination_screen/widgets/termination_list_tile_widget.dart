import 'package:flutter/material.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/blocs/resignation_termination_bloc/resignation_termination_bloc.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/dotted_divider_widget.dart';
import '../../../widgets/widgets.dart';

class TerminationListTileWidget extends StatelessWidget {
  final TerminationModel data;

  const TerminationListTileWidget({
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
          arg2: data.id,
          arg3: "",
          val1: false,
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
                color:
                    statusToColorMap[data.serviceStatus] ?? Colors.transparent,
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
                      title: data.subject ?? '-',
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
                  //
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Termination Date",
                      title:
                          "${formatDate(date: data.resignationTerminationDate.toString()) ?? "NA"}",
                    ),
                  ),

                  //
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Last Working Date",
                      title:
                          "${formatDate(date: data.lastWorkingDate.toString()) ?? "NA"}",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
