import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_response.dart';
import 'package:hr_management/data/models/dms/permission/permission_response_model.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/logic/blocs/dms_bloc/permission_bloc/permission_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class DMSViewPermissionBody extends StatefulWidget {
  final String parentId;

  const DMSViewPermissionBody({Key key, this.parentId}) : super(key: key);

  @override
  _DMSViewPermissionBodyState createState() => _DMSViewPermissionBodyState();
}

class _DMSViewPermissionBodyState extends State<DMSViewPermissionBody> {
  List<Service> _serviceList = [];
  List<Service> _filteredServiceList = [];

  @override
  void initState() {
    permissionBloc
      ..getViewPermissionData(queryparams: {
        'NoteId': widget.parentId,
        'workspaceId': '',
        'parentId': ''
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<PermissionResponse>(
          stream: permissionBloc.subject.stream,
          builder: (context, AsyncSnapshot<PermissionResponse> snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              // if (snapshot.data == null ||
              //     snapshot.data.list.length == 0) {
              //   return EmptyListWidget();
              // }
              // _serviceList = snapshot.data.list.reversed.toList();
              return Listizer(
                listItems: _serviceList,
                filteredSearchList: _filteredServiceList,
                itemBuilder: (context, index) {
                  print(_serviceList[index].serviceNo);
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      tileColor: Theme.of(context).notInvertedColor,
                      title: Text(
                        widget.parentId,
                        // _serviceList[index].serviceSubject != null
                        //     ? _serviceList[index].serviceSubject
                        //     : "",
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
                              padding:
                                  const EdgeInsets.only(top: 6.0, bottom: 6.0),
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
                                        ? _serviceList[index].formattedStartDate
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
                                    _serviceList[index].formattedEndDate != null
                                        ? _serviceList[index].formattedEndDate
                                        : "",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              )),
                          Row(
                            children: <Widget>[
                              Text(
                                _serviceList[index].leaveStatus ?? '-',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
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
}
