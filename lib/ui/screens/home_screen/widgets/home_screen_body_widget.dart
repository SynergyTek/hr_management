import 'dart:convert';

import 'package:flutter/material.dart';

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

    // noteBloc
    //   ..getNoteDetails(
    //     noteId: '4ae6674b-40a9-4df8-803d-a37f0a1131c6',
    //     // templateCode: '',
    //     userId: '45bba746-3309-49b7-9c03-b5793369d73c',
    //   );

    serviceBloc
      ..getServiceDetail(
        // templateCode: 'AnnualLeave',
        serviceId: 'b340ec84-68ba-4401-bd71-c2d14504ecoh',
        userId: '45bba746-3309-49b7-9c03-b5793369d73c',
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ServiceResponse>(
        stream: serviceBloc.subject.stream,
        // child: StreamBuilder<NoteResponse>(
        //   stream: noteBloc.subjectNoteDetails.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            String k = jsonEncode(jsonDecode(snapshot?.data?.data?.json));

//  TODO: ...

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
