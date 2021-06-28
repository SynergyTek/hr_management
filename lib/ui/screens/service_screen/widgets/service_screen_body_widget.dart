import 'package:flutter/material.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';

import '../../../../themes/theme_config.dart';

class ServiceScreenBodyWidget extends StatefulWidget {
  ServiceScreenBodyWidget();

  @override
  _ServiceScreenBodyWidgetState createState() =>
      _ServiceScreenBodyWidgetState();
}

class _ServiceScreenBodyWidgetState extends State<ServiceScreenBodyWidget> {
  @override
  void initState() {
    super.initState();

    // Getting the initial data.
    serviceBloc..getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<ServiceResponse>(
          stream: serviceBloc.subject.stream,
          builder: (context, AsyncSnapshot<ServiceResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }
              return _listWidget(
                snapshot.data,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.data.error),
              );
            } else {
              return _loadingWidget();
            }
          }),
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _listWidget(ServiceResponse response) {
    return Text("companyId: ${response?.data?.companyId ?? "-"}");
  }
}
