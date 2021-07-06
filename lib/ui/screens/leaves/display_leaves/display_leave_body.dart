import 'package:flutter/material.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/circle_avatar.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class DisplayLeavesBody extends StatefulWidget {
  DisplayLeavesBody({Key key}) : super(key: key);

  @override
  _DisplayLeavesBodyState createState() => _DisplayLeavesBodyState();
}

class _DisplayLeavesBodyState extends State<DisplayLeavesBody> {
  List<Service> _serviceList = [];
  List<Service> _filteredServiceList = [];

  @override
  void initState() {
    serviceBloc..getLeaves();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<ServiceResponse>(
          stream: serviceBloc.subject.stream,
          builder: (context, AsyncSnapshot<ServiceResponse> snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.data == null ||
                  snapshot.data.list.length == 0) {
                return EmptyListWidget();
              }
              _serviceList = snapshot.data.list;
              return Listizer(
                showSearchBar: true,
                listItems: _serviceList,
                filteredSearchList: _filteredServiceList,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextCircleAvater(
                        text: _filteredServiceList[index].serviceSubject,
                        context: context,
                        radius: 20,
                        fontSize: 18,
                        color: Theme.of(context).primaryColorLight),
                    title: Text(
                      _filteredServiceList[index].serviceSubject != null
                          ? _filteredServiceList[index].serviceSubject
                          : "",
                      maxLines: 2,
                    ),
                    onTap: () {
                      // if (widget.onListTap != null) {
                      //   widget.onListTap(_filteredServiceList[index]);
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
    _serviceList = [];
    _filteredServiceList = [];
    super.dispose();
  }
}
