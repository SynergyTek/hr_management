import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/common/common_list_model.dart';
import 'package:hr_management/logic/blocs/common_bloc/common_bloc.dart';

import 'package:hr_management/ui/screens/tasks/widget/task_home_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

import '../primary_button.dart';

class NTSFilterWidget extends StatefulWidget {
  final FilterListTapCallBack onListTap;
  final NTSType filterType;
  final bool isServiceDashboard;
  final bool isDashboard;

  const NTSFilterWidget({
    Key key,
    this.onListTap,
    this.filterType,
    this.isServiceDashboard,
    this.isDashboard,
  }) : super(key: key);

  @override
  _NTSFilterWidgetState createState() => _NTSFilterWidgetState();
}

class _NTSFilterWidgetState extends State<NTSFilterWidget> {
  bool showFilter = true;
  bool serviceDashboardOptions = false;
  Map<String, String> filterOptions = Map();
  List<String> filterList = [];
  List<CommonListModel> _lovList = [];

  String lovType;

  List<String> serviceOptions = [
    'Owner',
    'Assignee',
    'Shared',
    'All',
    'StepServiceOwner',
    'ServiceStepAssignee',
    'Requester',
    'ManualUser',
    'Holder',
    'PermittedUser',
  ];

  @override
  void initState() {
    super.initState();
    print(widget.filterType);
    assignFilterData();
    apiCall();
  }

  apiCall() {
    commonBloc.subjectCommonList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (lovType != null) queryparams['lovType'] = lovType;

    commonBloc.getLOVList(queryparams: queryparams);
  }

  assignFilterData() {
    switch (widget.filterType) {
      case NTSType.service:
        // filterOptions = filterServiceOptionsMap;
        lovType = 'LOV_SERVICE_STATUS';
        break;
      case NTSType.task:
        // filterOptions = filterServiceOptionsMap;
        lovType = 'LOV_TASK_STATUS';
        break;
      case NTSType.note:
        // filterOptions = filterServiceOptionsMap;
        lovType = 'LOV_NOTE_STATUS';
        break;
      default:
    }
    filterOptions.values.forEach((element) {
      filterList.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Filter By",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: Container(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            optionsRow(
                              text: 'Status',
                              applied: showFilter,
                              // text: 'Filters',
                              onTap: () {
                                setState(() {
                                  showFilter = true;
                                  serviceDashboardOptions = false;
                                });
                              },
                            ),
                            // if (widget.isServiceDashboard)
                            //   optionsRow(
                            //     text: 'Service owned/Requested',
                            //     applied: serviceDashboardOptions,
                            //     onTap: () {
                            //       setState(() {
                            //         serviceDashboardOptions = true;
                            //         showFilter = false;
                            //       });
                            //     },
                            //   ),
                          ],
                        ),
                      ),
                      VerticalDivider(color: Colors.grey),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            if (showFilter)
                              StreamBuilder(
                                  stream: commonBloc.subjectCommonList.stream,
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.error != null &&
                                          snapshot.data.error.length > 0) {
                                        return Center(
                                          child: Text(snapshot.data.error),
                                        );
                                      }
                                      _lovList = snapshot.data.list;
                                      print(_lovList[0].name);
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _lovList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(_lovList[index].name),
                                            onTap: () {
                                              widget.isDashboard
                                                  ? widget.onListTap(
                                                      _lovList[index].id)
                                                  : widget.onListTap(
                                                      _lovList[index].code);
                                              // widget.onListTap(filterOptions
                                              //     .keys
                                              //     .elementAt(index));
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  })
                            // valueslist()
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   itemCount: filterOptions.keys.length,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return ListTile(
                            //       title: Text(filterOptions[
                            //           filterOptions.keys.elementAt(index)]),
                            //       onTap: () {
                            //         widget.onListTap(
                            //             filterOptions.keys.elementAt(index));
                            //         Navigator.pop(context);
                            //       },
                            //     );
                            //   },
                            // )
                            else if (serviceDashboardOptions)
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: serviceOptions.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(serviceOptions[index]),
                                    onTap: () {
                                      widget.onListTap(serviceOptions[index]);
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                widget.isServiceDashboard
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButton(
                            buttonText: 'Cancel',
                            handleOnPressed: Navigator.pop,
                            width: 100,
                          ),
                          PrimaryButton(
                            buttonText: 'Apply',
                            handleOnPressed: Navigator.pop,
                            width: 100,
                          )
                        ],
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  valueslist() {
    // return Listizer(
    //   listItems: filterList,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       title: Text(filterOptions[filterOptions.keys.elementAt(index)]),
    //       onTap: () {
    //         widget.onListTap(filterOptions.keys.elementAt(index));
    //         Navigator.pop(context);
    //       },
    //     );
    //   },
    // );
    // return ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: filterOptions.keys.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       title: Text(filterOptions[filterOptions.keys.elementAt(index)]),
    //       onTap: () {
    //         widget.onListTap(filterOptions.keys.elementAt(index));
    //         Navigator.pop(context);
    //       },
    //     );
    //   },
    // );
  }

  optionsRow({String text, Function onTap, bool applied}) {
    return InkWell(
      child: Container(
        color: applied ? Colors.blue[300] : null,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
