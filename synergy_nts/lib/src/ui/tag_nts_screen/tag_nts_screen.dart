import 'package:flutter/material.dart';

import '../../../synergy_nts.dart';
import 'widget/tag_nts_body.dart';

class TagNTSScreen extends StatelessWidget {
  final NTSType? ntsType;
  final String? ntsId;

  const TagNTSScreen({
    required this.ntsType,
    required this.ntsId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tags"),
      ),
      body: SafeArea(
        child: TagNTSBodyWidget(
          ntsType: ntsType,
          ntsId: ntsId,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          // Navigator.pushNamed(
          //   context,
          //   NTS_TAG,
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
