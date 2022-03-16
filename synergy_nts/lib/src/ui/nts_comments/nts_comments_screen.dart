import 'package:flutter/material.dart';
import 'widget/nts_comments_body.dart';

class NTSCommentsScreen extends StatelessWidget {
  const NTSCommentsScreen({Key? key, this.ntsId, this.userId})
      : super(key: key);
  final String? ntsId;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: SafeArea(
          child: NTSCommentsBody(
        userId: userId,
        ntsId: ntsId,
      )),
    );
  }
}
