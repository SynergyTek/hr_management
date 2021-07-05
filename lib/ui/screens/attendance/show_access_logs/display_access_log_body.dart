import 'package:flutter/material.dart';
import 'package:hr_management/data/models/access_log/access_log.dart';
import 'package:hr_management/data/models/access_log/access_log_response.dart';
import 'package:hr_management/logic/blocs/access_log_bloc/access_log_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/circle_avatar.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class DisplayAccessLogBody extends StatefulWidget {
  DisplayAccessLogBody({Key key}) : super(key: key);

  @override
  _DisplayAccessLogBodyState createState() => _DisplayAccessLogBodyState();
}

class _DisplayAccessLogBodyState extends State<DisplayAccessLogBody> {
List<AccessLog> _accessLogList = [];
  List<AccessLog> _filteredAccessLogList = [];

  @override
  void initState() {
    accessLogBloc
      ..getAccessLogs();
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<AccessLogResponse>(
          stream: accessLogBloc.subject.stream,
          builder: (context, AsyncSnapshot<AccessLogResponse> snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.list == null ||
                  snapshot.data.list.length == 0) {
                return EmptyListWidget();
              }
              _accessLogList = snapshot.data.list;
              return Listizer(
                showSearchBar: true,
                listItems: _accessLogList,
                filteredSearchList: _filteredAccessLogList,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextCircleAvater(
                        text: _filteredAccessLogList[index].name,
                        context: context,
                        radius: 20,
                        fontSize: 18,
                        color: Theme.of(context).primaryColorLight),
                    title: Text(
                      _filteredAccessLogList[index].name != null
                          ? _filteredAccessLogList[index].name
                          : "",
                      maxLines: 2,
                    ),
                    onTap: () {
                      // if (widget.onListTap != null) {
                      //   widget.onListTap(_filteredAccessLogList[index]);
                      //   Navigator.pop(context);
                      // }
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(),
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