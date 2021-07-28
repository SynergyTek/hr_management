import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/service/create_service_form_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';
import 'widget/add_edit_service_body.dart';

class CreateServiceScreen extends StatefulWidget {
  final bool isLeave;
  final String templateCode;
  final String serviceId;
  final String title;
  const CreateServiceScreen(
      {Key key, this.templateCode, this.serviceId, this.title, this.isLeave})
      : super(key: key);

  @override
  _CreateServiceScreenState createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  CreateServiceFormBloc serviceFormBloc = CreateServiceFormBloc();
  Service serviceModel;
  @override
  void initState() {
    super.initState();
    serviceBloc
      ..getServiceDetail(
        templateCode: widget.templateCode,
        serviceId: widget.serviceId,
        userId: '45bba746-3309-49b7-9c03-b5793369d73c',
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: widget.serviceId == null || widget.serviceId.isEmpty
            ? "Create " + widget.templateCode
            : widget.title != null
                ? "Edit ${widget.title}"
                : "Edit",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: StreamBuilder<ServiceResponse>(
              stream: serviceBloc.subject.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return Center(
                      child: Text(snapshot.data.error),
                    );
                  }
                  serviceModel = snapshot.data.data;
                  return BlocProvider.value(
                    value: serviceFormBloc,
                    child: CreateServiceScreenBody(
                      isLeave: widget.isLeave,
                      serviceId: widget.serviceId,
                      serviceModel: serviceModel,
                    ),
                  );
                } else {
                  return Center(
                    child: CustomProgressIndicator(),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: buildSpeedDial(),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        backgroundColor: Colors.blue[900],
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          // SpeedDialChild(
          //   child:
          //       Icon(Icons.notifications_active_outlined, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Read Later'),
          //   label: 'Notification',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          //  Visibility(
          //     visible: widget.serviceModel.isAddCommentEnabled &&
          //         widget.serviceId != null &&
          //         widget.serviceId.isNotEmpty,
          //     child: PrimaryButton(
          //       buttonText: 'Add comment',
          //       handleOnPressed: () {

          //       },
          //       width: 100,
          //     ),
          //   ),
          SpeedDialChild(
            visible: serviceModel.isAddCommentEnabled &&
                widget.serviceId != null &&
                widget.serviceId.isNotEmpty,
            child: Icon(Icons.comment, color: Colors.white),
            backgroundColor: Colors.blue,
            onTap: () {
              Navigator.pushNamed(context, COMMENT_ROUTE,
                  arguments: ScreenArguments(
                    ntstype: NTSType.service,
                    arg1: serviceModel.serviceId,
                  ));
            },
            label: 'Comment',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          // SpeedDialChild(
          //   child: Icon(Icons.account_tree, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Process Design Result',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.share, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Share',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.border_all, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Adhoc Task',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.attachment, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Attachment',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.tag, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Tags',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
          // SpeedDialChild(
          //   child: Icon(Icons.email, color: Colors.white),
          //   backgroundColor: Colors.blue,
          //   onTap: () => print('Pressed Code'),
          //   label: 'Email',
          //   labelStyle:
          //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //   labelBackgroundColor: Colors.black,
          // ),
        ]);
  }
}
