import 'package:flutter/material.dart';

import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import '../../../../data/models/work_book_models/get_note_book_report_model.dart';
import 'widgets/dms_email_list_body.dart';

class DMSEmailListScreen extends StatelessWidget {
  final List<NtsItem>? workbookList;
  final bool? isAddBelow;
  final int index;
  const DMSEmailListScreen({
    Key? key,
    required this.workbookList,
    this.isAddBelow,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Select Email',
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: DMSEmailListBody(
            workbookList: workbookList,
            isAddBelow: isAddBelow!,
            index: index,
          ),
        ),
      ),
    );
  }
}
