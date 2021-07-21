import 'package:flutter/material.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../themes/theme_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

import 'widget/leave_details_bottom_sheet_widget.dart';

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
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ServiceListResponse>(
          stream: serviceBloc.subjectServiceList.stream,
          builder: (context, AsyncSnapshot<ServiceListResponse> snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.list == null ||
                  snapshot.data.list.length == 0) {
                return EmptyListWidget();
              }
              _serviceList = snapshot.data.list.reversed.toList();
              return Listizer(
                listItems: _serviceList,
                filteredSearchList: _filteredServiceList,
                itemBuilder: (context, index) {
                  print(_serviceList[index].serviceNo);
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        tileColor: Theme.of(context).notInvertedColor,
                        title: Text(
                          _serviceList[index].serviceSubject != null
                              ? _serviceList[index].serviceSubject
                              : "",
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Text("Service No: "),
                                      Text(_serviceList[index].serviceNo != null
                                          ? _serviceList[index].serviceNo
                                          : "-"),
                                    ])
                                  ]),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 6.0, bottom: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "From Date: ",
                                      ),
                                    ),
                                    Text(
                                      _serviceList[index].formattedStartDate !=
                                              null
                                          ? _serviceList[index]
                                              .formattedStartDate
                                          : "",
                                      style: TextStyle(color: Colors.blue[700]),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        "To Date: ",
                                      ),
                                    ),
                                    Text(
                                      _serviceList[index].formattedEndDate !=
                                              null
                                          ? _serviceList[index].formattedEndDate
                                          : "",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                )),
                            Row(
                              children: <Widget>[
                                // Expanded(
                                //   child: Text(
                                //     "Status: "+
                                //     _serviceList[index].leaveStatus !=
                                //               null
                                //           ? _serviceList[index].leaveStatus
                                //           : "",

                                //     maxLines: 2,
                                //     // overflow: TextOverflow.fade,
                                //   ),
                                // ),
                                Text(
                                  _serviceList[index].leaveStatus,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // onTap: () async {},
                        // onTap: () => _handleListTileOnTap(index, context),
                        // ),
                        onTap: () {
                          serviceBloc.subject.sink.add(null);
                          Navigator.pushNamed(
                            context,
                            CREATE_SERVICE_ROUTE,
                            arguments: ScreenArguments(
                              arg1: '',
                              arg2: _serviceList[index].serviceId,
                              arg3: _serviceList[index].templateCode,
                              val1: true,
                            ),
                          );
                        },
                      ),
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

  void _handleListTileOnTap(int index, BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return LeaveDetailsBottomSheetWidget(
          duration: _serviceList[index].duration,
        );
      },
    );
  }

  @override
  void dispose() {
    _serviceList = [];
    _filteredServiceList = [];
    super.dispose();
  }
}
