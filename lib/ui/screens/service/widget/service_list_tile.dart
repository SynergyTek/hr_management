import 'package:flutter/material.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';

class ServiceListCard extends StatelessWidget {
  final bool? onTap;
  final List<Service>? serviceList;
  final int index;
  const ServiceListCard(
      {Key? key, required this.serviceList, required this.index, this.onTap})
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
                  Text("Service Status: "),
                  Flexible(
                    child: Text(
                      ownerUserName(index),
                      style: TextStyle(color: Colors.deepPurple[900]),
                      overflow: TextOverflow.ellipsis,
                    ),
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
        onTap: onTap!
            ? () {
                serviceBloc.subject.sink.add(null);
                Navigator.pushNamed(
                  context,
                  CREATE_SERVICE_ROUTE,
                  arguments: ScreenArguments(
                    arg1: serviceList![index].templateCode,
                    arg2: serviceList![index].id,
                    arg3: serviceList![index].serviceSubject,
                    val1: false,
                  ),
                );
              }
            : () {},
      ),
    );
  }

  String serviceSubject(int index) {
    return serviceList?[index].serviceName ?? "-";
  }

  String serviceNoValue(int index) {
    return serviceList?[index].serviceNo ?? "-";
  }

  String ownerUserName(int index) {
    return serviceList?[index].ownerUserUserName ?? "-";
  }

  String noteStatusName(int index) {
    return serviceList?[index].serviceStatusName ?? "-";
  }

  String expiryDate(int index) {
    return serviceList?[index].dueDateDisplay ?? "-";
  }
}
