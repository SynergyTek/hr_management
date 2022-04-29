import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:synergy_nts/synergy_nts.dart';

class AddEditNote extends StatelessWidget {
  final String? templateCode;
  final String? noteId;
  final String? title;
  final bool? isDependent;
  // final PortalType portalType;

  const AddEditNote({
    Key? key,
    this.templateCode,
    this.noteId,
    this.title,
    this.isDependent,
    // required this.portalType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: noteId == null || noteId!.isEmpty
            ? title ?? "Create Note"
            : "Edit Note",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: NTSWrapperWidget(
            templateCode: templateCode!,
            ntsID: noteId!,
            // portalType: portalType,
            userID:
                BlocProvider.of<UserModelBloc>(context).state.userModel?.id ??
                    '',
            ntsType: NTSType.note,
          ),
        ),
      ),
    );
  }
}
