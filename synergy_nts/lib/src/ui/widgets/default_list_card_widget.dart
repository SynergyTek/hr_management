import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/task_bloc/abstract_task_bloc.dart';
import '../../ui/task_widgets/task_widgets/add_edit_task_screen.dart';
import '../../ui/widgets/widgets.dart';
import './card_bottom_model_sheet_widget.dart';

class DefaultListCardWidget extends StatelessWidget {
  final String userId;
  final bool isEmployeePortal;

  final String? titleData;
  final String? row1E1Text;
  final String? refNoRow1E1Data;
  final String? row1E2Text;
  final String? row1E2Data;

  final String? row2E1Text;
  final String? row2E1Data;
  final String? row2E2Title;

  final String? row2E2Data;

  final String? extraRow;

  //

  final String? statusName;
  final String? startDate;
  final String? endDate;

  final bool? borderSide;
  final bool? isStepTask;
  final List<StepTasksList>? stepTaskList;
  final int? index;
  final StepTasksList? task;
  final TaskListModel? taskList;

  //Added to fetch service details from dashboard
  final String? taskTemplateCode;
  final String? serviceId;
  final String? serviceSubject;

  final Widget? extraWidget;
  final bool? isPayment;
  final String? refNo;
  final String serviceTemplateCode;

  const DefaultListCardWidget({
    Key? key,
    //
    required this.userId,
    required this.isEmployeePortal,
    this.refNoRow1E1Data,
    this.titleData,
    this.statusName,
    this.startDate,
    this.endDate,
    this.row1E2Data,
    this.row2E2Data,
    this.row1E2Text,
    this.row2E2Title,
    this.row1E1Text,
    this.row2E1Text,
    this.row2E1Data,
    this.extraRow,
    this.borderSide = true,
    required this.isStepTask,
    this.stepTaskList,
    this.index,
    this.task,
    this.serviceId,
    this.serviceSubject,
    this.taskTemplateCode,
    this.taskList,
    this.extraWidget,
    this.isPayment = false,
    this.refNo,
    required this.serviceTemplateCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: (isPayment!) ? DEFAULT_PADDING : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      elevation: 2,

      child: GestureDetector(
        onTap: () => _handleStepTaskOnTap(context),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: borderSide == true
                    ? statusToColorMap[statusName] ?? Colors.transparent
                    : Colors.transparent,
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
                      caption: refNoRow1E1Data!,
                      title: titleData!,
                    ),
                  ),
                  subtitleWidget(
                    context: context,
                    caption: "Status",
                    customChild: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          (isPayment!)
                              ? (statusName! == 'In Progress'
                                  ? "Pending"
                                  : statusName! == 'Complete' ||
                                          statusName! == 'Completed'
                                      ? "Success"
                                      : statusName!)
                              : statusName!,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(width: 2.w),
                        statusContainerWidget(
                          statusColor: statusToColorMap[statusName] ??
                              Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              extraRow == null || extraRow!.isEmpty
                  ? const SizedBox()
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: subtitleWidget(
                            context: context,
                            title: extraRow!.trim(),
                          ),
                        ),
                      ],
                    ),
              const DottedDividerWidget(),

              (isPayment!)
                  ? Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (row2E2Data == null)
                                ? Text(
                                    row2E2Data!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: AppThemeColor.textColorDark,
                                        ),
                                  )
                                : Container(),
                            Text(
                              row2E1Data!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Bill Amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: AppThemeColor.textColorDark,
                                    ),
                              ),
                              Text(
                                row1E2Data!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              (isPayment!) ? const DottedDividerWidget() : const SizedBox(),

              //
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: (isPayment!) ? "Due Date" : "Timeline",
                      title: (isPayment!)
                          ? formatDate(date: endDate) ?? "NA"
                          : "${formatDate(date: startDate) ?? "NA"} - ${formatDate(date: endDate) ?? "NA"}",
                    ),
                  ),
                  extraWidget == null
                      ? Visibility(
                          visible: !isStepTask!,
                          child: TextButton(
                            onPressed: null,
                            // onPressed: () => _handleDetailsOnPressed(
                            //   context: context,
                            //   data: taskList![index!],
                            // ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("Details"),
                                Icon(
                                  Icons.chevron_right,
                                ),
                              ],
                            ),
                          ),
                        )
                      : (statusName! == 'Complete' ||
                              statusName! == 'Completed')
                          ? Padding(
                              padding: EdgeInsets.only(right: 4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Ref Number",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: AppThemeColor.textColorDark,
                                        ),
                                  ),
                                  Text(
                                    refNo!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : extraWidget!,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleDetailsOnPressed({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      elevation: 8,
      enableDrag: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return CardBottomModalSheetWidget(
          mainTitle: titleData!,
          statusName: statusName!,
          startDate: startDate!,
          endDate: endDate!,
          row1E1Title: row1E1Text,
          row1E1Data: refNoRow1E1Data,
          row1E2Title: row1E2Text,
          row1E2Data: row1E2Data,
          row2E1Title: row2E1Text,
          row2E1Data: row2E1Data,
          row2E2Title: row2E2Title,
          row2E2Data: row2E2Data,
        );
      },
    );
  }

  void _handleStepTaskOnTap(BuildContext context) {
    // Guard clause to disable the onClick for the Step task
    // when logged in as a citizen user.
    if (isEmployeePortal == false) return;

    taskBloc.subjectGetTaskDetails.sink.add(null);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddEditTaskScreen(
          title: task?.subjectLabelName ?? taskList?.subjectLabelName,
          taskId: task?.id ?? taskList?.id,
          taskTemplateCode: task?.templateCode ?? taskList?.templateCode,
          serviceTemplateCode: serviceTemplateCode,
          userId: userId,
          isEmployeePortal: isEmployeePortal,
          extraInformationMap: null,
          // val1: false,
        ),
      ),
    );
  }
}
