import 'package:flutter/material.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class ServiceDashboardList extends StatefulWidget {
  ServiceDashboardList({Key key}) : super(key: key);

  @override
  _ServiceDashboardListState createState() => _ServiceDashboardListState();
}

class _ServiceDashboardListState extends State<ServiceDashboardList> {
  List<Service> _serviceList = [];
  List<Service> _filteredServiceList = [];

  @override
  void initState() {
    super.initState();
    serviceBloc.getServiceDashBoardData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<ServiceListResponse>(
            stream: serviceBloc.subjectServiceList.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return Center(
                    child: Text(snapshot.data.error),
                  );
                }
                _serviceList = snapshot.data.list;
                return Listizer(
                  listItems: _serviceList,
                  filteredSearchList: _filteredServiceList,
                  itemBuilder: (context, index) {
                    print("Snapshot data: ${snapshot.data.list[index]}");
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          serviceSubject(index),
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("Service No: "),
                                      Text(serviceNoValue(index)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 6.0, bottom: 6.0),
                              child: Row(
                                children: <Widget>[
                                  Text("From: "),
                                  Text(
                                    ownerUserName(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    noteStatusName(index),
                                    style: TextStyle(color: Colors.green[800]),
                                  ),
                                ),
                                Text(
                                  expiryDate(index),
                                  style: TextStyle(color: Colors.red[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // onTap: () {
                        //   serviceBloc.subject.sink.add(null);
                        //   Navigator.pushNamed(
                        //     context,
                        //     CREATE_SERVICE_ROUTE,
                        //     arguments: ScreenArguments(
                        //         arg1: _serviceList[index].templateCode,
                        //         arg2: _serviceList[index].id,
                        //         arg3: _serviceList[index].serviceSubject),
                        //   );
                        // },
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CustomProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }

  String serviceSubject(int index) {
    return _serviceList[index].serviceSubject ?? "-";
  }

  String serviceNoValue(int index) {
    return _serviceList[index].serviceNo ?? "-";
  }

  String ownerUserName(int index) {
    return _serviceList[index].ownerUserUserName ?? "-";
  }

  String noteStatusName(int index) {
    return _serviceList[index].serviceStatusName ?? "-";
  }

  String expiryDate(int index) {
    return _serviceList[index].dueDateDisplay ?? "-";
  }
}
