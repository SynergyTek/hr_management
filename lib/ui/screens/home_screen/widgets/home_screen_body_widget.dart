import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/webview_widget.dart';

class HomeScreenBodyWidget extends StatefulWidget {
  HomeScreenBodyWidget();

  @override
  _HomeScreenBodyWidgetState createState() => _HomeScreenBodyWidgetState();
}

class _HomeScreenBodyWidgetState extends State<HomeScreenBodyWidget> {
  @override
  void initState() {
    super.initState();

    serviceBloc
      ..getServiceDetail(
        queryparams: _handleQueryParams(),
      );
  }

  _handleQueryParams() {
    return {
      'templatecode': 'AnnualLeave' ?? 'RETURN_TO_WORK',
      'serviceId': '',
      'userId':
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? '',
      'userid':
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ServiceResponse>(
        stream: serviceBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            String k = jsonEncode(
              jsonDecode(snapshot?.data?.data?.json),
            );

            return _webview(k);
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
