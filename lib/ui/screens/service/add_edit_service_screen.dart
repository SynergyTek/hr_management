import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

import '../../../logic/blocs/location_bloc/location_bloc.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../widgets/appbar_widget.dart';

// Service
import 'package:synergy_nts/synergy_nts.dart';

class CreateServiceScreen extends StatelessWidget {
  final bool? isLeave;
  final String? templateCode;
  final String? serviceId;
  final String? title;
  final bool isDelete;
  final String? categoryCode;

  // final PortalType? portalType;

  final Map<String, dynamic>? extraInformationMap;

  const CreateServiceScreen({
    Key? key,
    this.isLeave,
    this.templateCode,
    this.serviceId,
    this.title,
    this.isDelete = false,
    this.categoryCode,
    this.extraInformationMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InternetConnectivityWidget(
      child: Scaffold(
        appBar: AppbarWidget(
          title: serviceId == null || serviceId!.isEmpty
              ? title ?? "Create Service"
              : "Edit Service",
        ),
        body: SafeArea(
          child: BlocProvider<LocationBloc>.value(
            value: LocationBloc()..add(LocationStartedEvent()),
            child: NTSWrapperWidget(
              isDelete: isDelete,
              templateCode: templateCode ?? '',
              ntsID: serviceId ?? '',
              // portalType: portalType!,
              userID:
                  BlocProvider.of<UserModelBloc>(context).state.userModel?.id ??
                      '',
              ntsType: NTSType.service,
              categoryCode: categoryCode ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
