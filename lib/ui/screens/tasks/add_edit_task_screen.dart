import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import 'package:synergy_nts/synergy_nts.dart';

import '../../widgets/appbar_widget.dart';

class AddEditTaskScreen extends StatelessWidget {
  final String? templateCode;
  final String? taskId;
  final String? title;
  const AddEditTaskScreen(
      {Key? key, this.templateCode, this.taskId, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: taskId == null || taskId!.isEmpty
            ? title ?? "Create Task"
            : "Edit Task",
      ),
      body: SafeArea(
        child: NTSWrapperWidget(
          templateCode: templateCode!,
          ntsID: taskId!,
          userID:
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          ntsType: NTSType.task,
        ),
        // TaskWidget(
        //   taskTemplateCode: templateCode,
        //   // serviceTemplateCode: serviceTemplateCode,
        //   taskId: taskId,
        //   title: title,
        //   userId:
        //       BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
        //   //TODO
        //   // isEmployeePortal: true,
        //   // isEmployeePortal: isEmployeePortal,
        // ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Material(
  //     child: SafeArea(
  //       child: InternetConnectivityWidget(
  //           child: AddEditTaskBody(
  //         templateCode: templateCode,
  //         taskId: taskId,
  //         title: title,
  //       )),
  //     ),
  //   );
  // }
}
