import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/data/models/udf_json_model/udf_json_model.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/ui/screens/service/create_service_form_bloc.dart';
import 'package:hr_management/ui/widgets/webview_widget.dart';

import '../../../widgets/progress_indicator.dart';

import '../../../../themes/theme_config.dart';
import 'package:flutter/material.dart';

class HomeScreenBodyWidget extends StatefulWidget {
  HomeScreenBodyWidget();

  @override
  _HomeScreenBodyWidgetState createState() => _HomeScreenBodyWidgetState();
}

class _HomeScreenBodyWidgetState extends State<HomeScreenBodyWidget> {
  Service serviceModel;

  @override
  void initState() {
    super.initState();
    serviceBloc
      ..getServiceDetail(
        templateCode: 'AnnualLeave' ?? 'RETURN_TO_WORK',
        serviceId: '',
        userId: '45bba746-3309-49b7-9c03-b5793369d73c',
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ServiceResponse>(
        stream: serviceBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          print("Snapshot data: ${snapshot.data} ");

          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _webview(snapshot?.data?.data?.json);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _webview(String json) {
    return WebViewScreen(
      json: json,
    );
  }
}
