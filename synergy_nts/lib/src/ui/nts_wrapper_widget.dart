import 'package:flutter/material.dart';
import 'package:synergy_nts/src/ui/note_widget.dart';
import 'package:synergy_nts/src/ui/service_widget.dart';
import 'package:synergy_nts/src/ui/task_widget.dart';

import '../constants/enums.dart';

class NTSWrapperWidget extends StatelessWidget {
  final String userID;
  final NTSType ntsType;
  final bool isView;
  final String categoryCode;

  // final PortalType portalType;

  /// Can be interchanged with either of the following:
  ///  - NoteID,
  ///  - TaskID,
  ///  - ServiceID.
  ///
  ///  Note:
  ///  Can be nullable/emptied in case of Edit, and not-null & not-empty in case of Create mode.
  final String ntsID;
  final String templateCode;

  final Map<String, dynamic>? extraInformationMap;
  final bool isDelete;

  const NTSWrapperWidget({
    Key? key,
    // Optional
    required this.userID,
    required this.ntsType,
    this.isView = false,
    this.categoryCode = "",
    this.ntsID = "",
    this.templateCode = "",
    this.extraInformationMap,
    this.isDelete = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ntsType == NTSType.service) {
      return ServiceWidget(
        isDelete: isDelete,
        userID: userID,
        serviceId: ntsID,
        templateCode: templateCode,
        extraInformationMap: extraInformationMap,

        // TODO:
        categoryCode: categoryCode,
        // isEmployeePortal: ,
      );
    } else if (ntsType == NTSType.task) {
      return TaskWidget(
        userId: userID,
        taskId: ntsID,
        taskTemplateCode: templateCode,
        extraInformationMap: extraInformationMap,
      );
    } else if (ntsType == NTSType.note) {
      return NoteWidget(
        isView: isView,
        userID: userID,
        noteId: ntsID,
        templateCode: templateCode,
        extraInformationMap: extraInformationMap,
      );
    }

    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Unable to render the selected NTS type. Please try again later.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
