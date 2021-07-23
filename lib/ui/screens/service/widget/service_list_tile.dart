import 'package:flutter/material.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';

class ServiceListCard extends StatelessWidget {
  final List<Service> serviceList;
  final int index;
  const ServiceListCard(
      {Key key, @required this.serviceList, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: Row(
                children: <Widget>[
                  Text("From: "),
                  Text(
                    ownerUserName(index),
                    style: TextStyle(color: Colors.deepPurple[900]),
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
        onTap: () {
          serviceBloc.subject.sink.add(null);
          Navigator.pushNamed(
            context,
            CREATE_SERVICE_ROUTE,
            arguments: ScreenArguments(
              arg1: serviceList[index].templateCode,
              arg2: serviceList[index].id,
              arg3: serviceList[index].serviceSubject,
              val1: false,
            ),
          );
        },
      ),
    );
  }

  String serviceSubject(int index) {
    return serviceList[index].serviceSubject ?? "-";
  }

  String serviceNoValue(int index) {
    return serviceList[index].serviceNo ?? "-";
  }

  String ownerUserName(int index) {
    return serviceList[index].ownerUserUserName ?? "-";
  }

  String noteStatusName(int index) {
    return serviceList[index].serviceStatusName ?? "-";
  }

  String expiryDate(int index) {
    return serviceList[index].dueDateDisplay ?? "-";
  }
}
