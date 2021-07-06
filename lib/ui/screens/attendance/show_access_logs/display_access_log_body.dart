import 'package:flutter/material.dart';
import '../../../../data/models/access_log/access_log_model.dart';
import '../../../../data/models/access_log/access_log_response.dart';
import '../../../../logic/blocs/access_log_bloc/access_log_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

import 'widgets/access_log_list_tile_widget.dart';

class DisplayAccessLogBody extends StatefulWidget {
  DisplayAccessLogBody({Key key}) : super(key: key);

  @override
  _DisplayAccessLogBodyState createState() => _DisplayAccessLogBodyState();
}

class _DisplayAccessLogBodyState extends State<DisplayAccessLogBody> {
  List<AccessLogModel> _accessLogList = [];
  List<AccessLogModel> _filteredAccessLogList = [];

  @override
  void initState() {
    accessLogBloc..getAccessLogsListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<AccessLogListDataResponse>(
          stream: accessLogBloc.getAccessLogListDataSubject.stream,
          builder:
              (context, AsyncSnapshot<AccessLogListDataResponse> snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.data == null ||
                  snapshot.data.data.length == 0) {
                return EmptyListWidget();
              }
              _accessLogList = snapshot.data.data;
              return Listizer(
                showSearchBar: true,
                listItems: _accessLogList,
                filteredSearchList: _filteredAccessLogList,
                itemBuilder: (context, index) {
                  return AccessLogListTileWidget(
                    // TODO: figure out which one needs to be shown.
                    // eachAccessLogModelElement: _filteredAccessLogList.elementAt(index),
                    eachAccessLogModelElement: _accessLogList.elementAt(index),
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(
                  loadingText: 'Fetching data',
                ),
              );
            }
          }),
    );
  }

  @override
  void dispose() {
    _accessLogList = [];
    _filteredAccessLogList = [];
    super.dispose();
  }
}
