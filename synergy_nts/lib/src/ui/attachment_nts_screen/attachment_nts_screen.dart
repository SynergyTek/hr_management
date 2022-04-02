import 'package:flutter/material.dart';
import '../../constants/enums.dart';
import '../widgets/form_widgets/attachment.dart';
import 'widgets/attachment_nts_body_widget.dart';

class AttachmentNTSScreen extends StatelessWidget {
  final NTSType? ntsType;
  final String? ntsId;
  final String? userId;

  const AttachmentNTSScreen({
    required this.ntsType,
    required this.ntsId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text("Attachments"),
      ),
      body: SafeArea(
        child: AttachmentNTSBodyWidget(
          ntsType: ntsType,
          ntsId: ntsId,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.attach_file,
          size: 32,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return SelectAttachment(
                userId: userId!,
                ntsId: 'Note',
                onListTap: (dynamic value, dynamic value2, dynamic value3) {
                  // setState(() {
                  //   selectValue[i] = value2;
                  //   model[i].label = value2;
                  //   udfJson[model[i].key] = value;
                  //   attachmentController.text =
                  //       " (1) File Attached: " + selectValue[i]!;
                  // });
                },
              );
            }),
          );

          // Navigator.pushNamed(
          //   context,
          //   NTS_ATTACHMENT,
          //   arguments: ScreenArguments(
          //       arg1: ntsId,
          //       ntstype: ntsType,
          //       callBack: (dynamic value, dynamic value2, dynamic value3) {}),
          // );
        },
      ),
    );
  }
}
