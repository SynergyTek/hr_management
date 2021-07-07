import 'package:flutter/material.dart';
import 'package:hr_management/constants/formats.dart';
import 'package:hr_management/ui/widgets/circle_avatar.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../themes/theme_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    serviceBloc..getLeavesDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<ServiceListResponse>(
          stream: serviceBloc.subjectServiceList.stream,
          builder: (context, AsyncSnapshot<ServiceListResponse> snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.list == null ||
                  snapshot.data.list.length == 0) {
                return EmptyListWidget();
              }
              _serviceList = snapshot.data.list;
              return Listizer(
                showSearchBar: true,
                listItems: _serviceList,
                filteredSearchList: _filteredServiceList,
                itemBuilder: (context, index) {
                   return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      leading: TextCircleAvater(
                        text: _filteredServiceList[index].serviceSubject,
                        context: context,
                        radius: 20,
                        fontSize: 18,
                        color: Theme.of(context).primaryColorLight),
                      title: Text(
                        _serviceList[index].serviceSubject != null
                            ? _serviceList[index].serviceSubject
                            : "",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Text("Service No: "),
                                      Text(_serviceList[index].serviceNo),
                                    ])
                                  ]),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "From Date: ",
                                    ),
                                    Text(
                                      dayformatter.format(DateTime.parse(
                                          _serviceList[index]
                                              .startDate
                                              .substring(0, 19))),
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Text(
                                      " to ",
                                    ),
                                    Text(
                                      dayformatter.format(DateTime.parse(
                                          _serviceList[index]
                                              .dueDate
                                              .substring(0, 19))),
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                )),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Assigned by: " +
                                        _serviceList[index].ownerUserName,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                Text(
                                  _serviceList[index].serviceStatusCode,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        
                      },
                    ),
                    // secondaryActions: _slideWidget(index),
                  );
                
                  // return ListTile(
                  //   leading: TextCircleAvater(
                  //       text: _filteredServiceList[index].serviceSubject,
                  //       context: context,
                  //       radius: 20,
                  //       fontSize: 18,
                  //       color: Theme.of(context).primaryColorLight),
                  //   title: Text(
                  //     _filteredServiceList[index].serviceSubject != null
                  //         ? _filteredServiceList[index].serviceSubject
                  //         : "",
                  //     maxLines: 2,
                  //   ),
                  //   onTap: () {
                  //     // if (widget.onListTap != null) {
                  //     //   widget.onListTap(_filteredServiceList[index]);
                  //     //   Navigator.pop(context);
                  //     // }
                  //   },
                  // );
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
