import 'package:flutter/material.dart';
import 'package:hr_management/ui/screens/dms/document_action/widgets/archive_document_body.dart';
import 'package:hr_management/ui/screens/dms/document_action/widgets/bin_document_body.dart';
import 'package:hr_management/ui/screens/dms/document_action/widgets/document_history_body.dart';
import 'package:hr_management/ui/screens/dms/document_action/widgets/search_document_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

class DocumentActionScreen extends StatelessWidget {
  final String? action;
  const DocumentActionScreen({Key? key, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: action! + " Document",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(child: selectAction()),
      ),
    );
  }

  Widget selectAction() {
    switch (action) {
      case 'Archive':
        return ArchiveDocumentBody();
        break;
      case 'Bin':
        return BinDocumentBody();
        break;
      case 'History':
        return DocumentHistoryBody();
        break;
      case 'Search':
        return SearchDocumentBody();
        break;
    }
    return Container();
  }
}
