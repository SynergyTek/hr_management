import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
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

  DateTime startDate;
  DateTime endDate;

  @override
  void initState() {
    accessLogBloc..getAccessLogsListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: Column(
        children: [
          ExpansionTile(
            trailing: Icon(Icons.filter_list),
            title: Text("Filter"),
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: DynamicDateTimeBox(
                      code: startDate?.toString() ?? null,
                      name: 'Start Date',
                      key: new Key('Start Date'),
                      selectDate: (DateTime date) {
                        if (date != null) {
                          setState(() async {
                            startDate = date;
                          });

                          print(startDate);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: DynamicDateTimeBox(
                      code: endDate?.toString() ?? null,
                      name: 'End Date',
                      key: new Key('End Date'),
                      selectDate: (DateTime date) {
                        if (date != null) {
                          setState(() async {
                            endDate = date;
                          });

                          print(endDate);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: Icon(Icons.save),
                    onPressed: () => _handleFilterOnPressed(),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<AccessLogListDataResponse>(
                stream: accessLogBloc.getAccessLogListDataSubject.stream,
                builder: (context,
                    AsyncSnapshot<AccessLogListDataResponse> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.data == null ||
                        snapshot.data.data.length == 0) {
                      return EmptyListWidget();
                    }
                    _accessLogList = snapshot.data.data;
                    return Listizer(
                      listItems: _accessLogList,
                      filteredSearchList: _filteredAccessLogList,
                      itemBuilder: (context, index) {
                        return AccessLogListTileWidget(
                          // TODO: @Vani figure out which one needs to be shown.
                          // eachAccessLogModelElement: _filteredAccessLogList.elementAt(index),
                          eachAccessLogModelElement:
                              _accessLogList.elementAt(index),
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
          ),
        ],
      ),
    );
  }

  void _handleFilterOnPressed() {
    if (startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be empty."),
        ),
      );
      return;
    }

    if (endDate != null && startDate.compareTo(endDate) > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be greater than the End date."),
        ),
      );
      return;
    }

    Map<String, dynamic> queryparams = Map();
    queryparams['startDate'] = startDate;

    if (endDate != null) queryparams['dueDate'] = endDate;
    // queryparams['userId'] = 'cb9272df-0a2c-401b-aed8-b73488ae03aa';

    // call bloc with updated query params.
    accessLogBloc..getAccessLogsListData(queryparams: queryparams);
  }

  @override
  void dispose() {
    _accessLogList = [];
    _filteredAccessLogList = [];
    super.dispose();
  }
}
