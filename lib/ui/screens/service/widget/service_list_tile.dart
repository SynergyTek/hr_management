import 'package:flutter/material.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import 'package:synergy_nts/synergy_nts.dart';

import '../../../widgets/dotted_divider_widget.dart';
import '../../../widgets/widgets.dart';

class ServiceListCard extends StatelessWidget {
  final bool? onTap;
  final List<Service>? serviceList;
  final int index;
  final bool isDelete;
  const ServiceListCard(
      {Key? key,
      required this.serviceList,
      required this.index,
      this.onTap,
      this.isDelete = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: GestureDetector(
        onTap: onTap!
            ? () {
                serviceBloc.subject.sink.add(null);
                Navigator.pushNamed(
                  context,
                  CREATE_SERVICE_ROUTE,
                  arguments: ScreenArguments(
                    arg1: serviceList![index].templateCode,
                    arg2: serviceList![index].id,
                    arg3: serviceList![index].serviceSubject,
                    val1: false,
                    val2: isDelete,
                  ),
                );
              }
            : () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: statusToColorMap[noteStatusName(index)] ??
                    Colors.transparent,
                width: MediaQuery.of(context).size.width * 0.015,
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
                    flex: 2,
                    child: titleWidget(
                      context: context,
                      caption: serviceNoValue(index),
                      title: serviceSubject(index),
                    ),
                  ),
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Status",
                      customChild: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            noteStatusName(index),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          statusContainerWidget(
                            statusColor:
                                statusToColorMap[noteStatusName(index)] ??
                                    Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DottedDividerWidget(),
              subtitleWidget(
                context: context,
                caption: 'Requested By',
                title: ownerUserName(index),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: subtitleWidget(
                      context: context,
                      caption: "Requested Date",
                      title: requestedDate(index),
                    ),
                  ),
                  Expanded(
                    child: subtitleWidget(
                      context: context,
                      caption: "Due Date",
                      title: dueDate(index),
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

  String serviceSubject(int index) {
    return serviceList?[index].serviceName ?? "-";
  }

  String serviceNoValue(int index) {
    return serviceList?[index].serviceNo ?? "-";
  }

  String ownerUserName(int index) {
    return serviceList?[index].ownerDisplayName ??
        serviceList?[index].ownerUserUserName ??
        "-";
  }

  String noteStatusName(int index) {
    return serviceList?[index].serviceStatusName ?? "-";
  }

  String expiryDate(int index) {
    return serviceList?[index].dueDateDisplay ?? "-";
  }

  String dueDate(int index) {
    if (serviceList?[index].dueDate != null &&
        serviceList![index].dueDate!.isNotEmpty &&
        serviceList![index].dueDate!.contains("T")) {
      return serviceList![index].dueDate!.split("T")[0];
    } else {
      return serviceList?[index].dueDate ?? "-";
    }
  }

  String requestedDate(int index) {
    if (serviceList?[index].createdDate != null &&
        serviceList![index].createdDate!.isNotEmpty &&
        serviceList![index].createdDate!.contains("T")) {
      return serviceList![index].createdDate!.split("T")[0];
    } else {
      return serviceList?[index].createdDate ?? "-";
    }
  }
}
