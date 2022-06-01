import 'package:flutter/material.dart';
import 'package:synergy_nts/src/ui/email_nts_screen/widgets/email_nts_body_widget.dart';

class EmailNtsScreen extends StatelessWidget {
  const EmailNtsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email'),
      ),
      body: const EmailNtsScreenBody(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        label: const Text('Create New Email'),
        onPressed: () => _handleCreateEmailOnPressed(),
      ),
    );
  }

  _handleCreateEmailOnPressed() {}
}
