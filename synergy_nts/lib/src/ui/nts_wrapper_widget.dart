import 'package:flutter/material.dart';
import 'package:synergy_nts/src/ui/note_widget.dart';
import 'package:synergy_nts/src/ui/service_widget.dart';

import '../constants/enums.dart';

class NTSWrapperWidget extends StatelessWidget {
  final String userID;
  final NTSType ntsType;

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

  const NTSWrapperWidget({
    Key? key,

    //
    required this.userID,
    required this.ntsType,

    // Optional
    this.ntsID = "",
    this.templateCode = "",
    this.extraInformationMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ntsType == NTSType.service) {
      return ServiceWidget(
        userID: userID,
        serviceId: ntsID,
        templateCode: templateCode,
        extraInformationMap: extraInformationMap,

        // TODO:
        // categoryCode: ,
        // isEmployeePortal: ,
      );
    } else if (ntsType == NTSType.task) {
      // TODO:
      return Container();
    } else if (ntsType == NTSType.note) {
      return NoteWidget(
        userID: userID,
        noteId: ntsID,
        templateCode: templateCode,

        // TODO:
        // isDependent: ,
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
