import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../data/enums/enums.dart';
import '../../../logic/blocs/common_bloc/common_bloc.dart';
import '../../screens/tasks/widget/task_home_body.dart';
import '../appbar_widget.dart';
import '../internet_connectivity_widget.dart';

class NTSFilterWidget extends StatefulWidget {
  final FilterListTapCallBack? onListTap;
  final NTSType? ntsFilter;
  final bool? isDashboard;

  const NTSFilterWidget({
    Key? key,
    this.onListTap,
    this.ntsFilter,
    this.isDashboard,
  }) : super(key: key);

  @override
  _NTSFilterWidgetState createState() => _NTSFilterWidgetState();
}

class _NTSFilterWidgetState extends State<NTSFilterWidget> {
  bool modulesOptions = false;
  bool statusOptions = false;
  bool roleFilterOptions = false;
  bool serviceOwnedRequestedOptions = false;
  bool ownerOptions = false;
  bool assigneeOptions = false;

  Map<String, String> filterOptions = Map();
  List<String> filterList = [];
  FilterType? filterType;

  String? lovType;
  String? enumType;

  @override
  void initState() {
    super.initState();
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);
  }

  apiCallModuleId() {
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    queryparams['userId'] =
        BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "";

  

    commonBloc.getModuleTreeList(
      queryparams: queryparams,
    );
  }

  apiCallLOVId() {
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);

    assignFilterData();

    Map<String, dynamic> queryparams = Map();

    if (lovType != null) queryparams['lovType'] = lovType;

    commonBloc.getLOVIdNameList(queryparams: queryparams);
  }

  apiCallRoleFilter() {
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);

    assignFilterData();

    Map<String, dynamic> queryparams = Map();

    if (enumType != null) queryparams['enumType'] = enumType;

    commonBloc.getEnumAsTreeList(queryparams: queryparams);
  }

  apiCallEnumId() {
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (enumType != null) queryparams['enumType'] = enumType;

    commonBloc.getEnumIdNameList(queryparams: queryparams);
  }

  apiCallOwnerName() {
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    queryparams['userId'] =
        BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "";

    

    if (enumType != null) queryparams['enumType'] = enumType;

    commonBloc.getOwnerIdNameList(queryparams: queryparams);
  }

  apiCallUserId() {
    commonBloc.subjectCommonList.sink.add(null);
    commonBloc.subjectOwnerNameList.sink.add(null);
    commonBloc.subjectEnumTreeList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (enumType != null) queryparams['enumType'] = enumType;

    commonBloc.getUserIdNameList(queryparams: queryparams);
  }

  assignFilterData() {
    switch (widget.ntsFilter) {
      case NTSType.service:
        lovType = 'LOV_SERVICE_STATUS';
        enumType = 'ServiceSearchHomeByPersonEnum';
        break;
      case NTSType.task:
        lovType = 'LOV_TASK_STATUS';
        enumType = 'TaskSearchHomeByPersonEnum';
        break;
      case NTSType.note:
        lovType = 'LOV_NOTE_STATUS';
        enumType = 'NoteSearchHomeByPersonEnum';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (!widget.isDashboard!)
                              optionsRow(
                                text: 'Modules',
                                applied: modulesOptions,
                                onTap: () {
                                  setState(() {
                                    modulesOptions = true;
                                    statusOptions = false;
                                    roleFilterOptions = false;
                                    serviceOwnedRequestedOptions = false;
                                    ownerOptions = false;
                                    assigneeOptions = false;
                                  });
                                  filterType = FilterType.module;
                                  _setParamsToNull();
                                  apiCallModuleId();
                                },
                              ),
                            optionsRow(
                              text: 'Status',
                              applied: statusOptions,
                              onTap: () {
                                setState(() {
                                  modulesOptions = false;
                                  statusOptions = true;
                                  roleFilterOptions = false;
                                  serviceOwnedRequestedOptions = false;
                                  ownerOptions = false;
                                  assigneeOptions = false;
                                });
                                filterType = FilterType.status;
                                _setParamsToNull();
                                apiCallLOVId();
                              },
                            ),
                            if (!widget.isDashboard!)
                              optionsRow(
                                text: 'Role Filter',
                                applied: roleFilterOptions,
                                onTap: () {
                                  setState(() {
                                    modulesOptions = false;
                                    statusOptions = false;
                                    roleFilterOptions = true;
                                    serviceOwnedRequestedOptions = false;
                                    ownerOptions = false;
                                    assigneeOptions = false;
                                  });
                                  filterType = FilterType.role;
                                  _setParamsToNull();
                                  apiCallRoleFilter();
                                },
                              ),
                            if (widget.ntsFilter == NTSType.service &&
                                widget.isDashboard!)
                              optionsRow(
                                text: 'Service owned/Requested',
                                applied: serviceOwnedRequestedOptions,
                                onTap: () {
                                  setState(() {
                                    modulesOptions = false;
                                    statusOptions = false;
                                    roleFilterOptions = false;
                                    serviceOwnedRequestedOptions = true;
                                    ownerOptions = false;
                                    assigneeOptions = false;
                                  });
                                  filterType = FilterType.serviceOwnedRequested;
                                  _setParamsToNull();
                                  enumType = 'NtsUserTypeEnum';
                                  apiCallEnumId();
                                },
                              ),
                            if (widget.ntsFilter == NTSType.task &&
                                widget.isDashboard!)
                              optionsRow(
                                text: 'Owner',
                                applied: ownerOptions,
                                onTap: () {
                                  setState(() {
                                    modulesOptions = false;
                                    statusOptions = false;
                                    roleFilterOptions = false;
                                    serviceOwnedRequestedOptions = false;
                                    ownerOptions = true;
                                    assigneeOptions = false;
                                  });
                                  filterType = FilterType.owner;
                                  _setParamsToNull();
                                  apiCallOwnerName();
                                },
                              ),
                            if (widget.ntsFilter == NTSType.task &&
                                widget.isDashboard!)
                              optionsRow(
                                text: 'Assignee',
                                applied: assigneeOptions,
                                onTap: () {
                                  setState(() {
                                    modulesOptions = false;
                                    statusOptions = false;
                                    roleFilterOptions = false;
                                    serviceOwnedRequestedOptions = false;
                                    ownerOptions = false;
                                    assigneeOptions = true;
                                  });
                                  filterType = FilterType.assignee;
                                  _setParamsToNull();
                                  apiCallUserId();
                                },
                              ),
                          ],
                        ),
                      ),
                      VerticalDivider(color: Colors.grey),
                      Expanded(
                        flex: 3,
                        child: displayValues(),
                      ),
                    ],
                  ),
                ),
                // widget.ntsFilter == NTSType.service && widget.isDashboard
                //     ? Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           PrimaryButton(
                //             buttonText: 'Cancel',
                //             handleOnPressed: Navigator.pop,
                //             width: 100,
                //           ),
                //           PrimaryButton(
                //             buttonText: 'Apply',
                //             handleOnPressed: Navigator.pop,
                //             width: 100,
                //           )
                //         ],
                //       )
                //     : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  optionsRow({required String text, Function? onTap, required bool applied}) {
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
      onTap: onTap as void Function()?,
    );
  }

  _setParamsToNull() {
    lovType = null;
    enumType = null;
  }

  displayValues() {
    List<dynamic>? dataList = [];
    return StreamBuilder(
      stream: (widget.ntsFilter == NTSType.task && ownerOptions)
          ? commonBloc.subjectOwnerNameList.stream
          : (modulesOptions || roleFilterOptions)
              ? commonBloc.subjectEnumTreeList.stream
              : commonBloc.subjectCommonList.stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Center(
              child: Text(snapshot.data.error),
            );
          }
          dataList = snapshot.data.list;
          return ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dataList!.length,
            itemBuilder: (BuildContext context, int index) {
              print(dataList!.length);
              return ListTile(
                title: (widget.ntsFilter == NTSType.task && ownerOptions)
                    ? Text(dataList![index].ownerName != null
                        ? dataList![index].ownerName
                        : ' ')
                    : Text(dataList![index].name != null
                        ? dataList![index].name
                        : ' '),
                onTap: () {
                  manageValues(dataList, index);
                  // if (filterType == null) filterType = FilterType.status;
                  // widget.isDashboard ||
                  //         (widget.filterType == NTSType.task &&
                  //             (assigneeOptions || ownerOptions))
                  //     ? widget.onListTap(dataList[index].id, filterType)
                  //     : widget.onListTap(dataList[index].code, filterType);
                  // : widget.onListTap(dataList[index].id, filterType);

                  // title: Text(_lovList[index].name),
                  // onTap: () {
                  //   widget.isDashboard
                  //       ? widget.onListTap(_lovList[index].id)
                  //       : widget.onListTap(_lovList[index].code);
                  Navigator.pop(context);
                },
              );
            },
          );
        } else {
          if (modulesOptions ||
              statusOptions ||
              roleFilterOptions ||
              serviceOwnedRequestedOptions ||
              ownerOptions ||
              assigneeOptions)
            return Center(child: CircularProgressIndicator());
          else
            return Container();
        }
      },
    );
  }

  manageValues(List<dynamic>? dataList, int index) {
    // All module filters
    if (filterType == FilterType.module || filterType == FilterType.role)
      widget.onListTap!(dataList![index].id, filterType!);
    // Service Home
    else if (!widget.isDashboard! && widget.ntsFilter == NTSType.service)
      widget.onListTap!(dataList![index].code, filterType!);
    // Service Home Dashboard
    else if (widget.isDashboard! && widget.ntsFilter == NTSType.service)
      widget.onListTap!(dataList![index].id, filterType!);
    // Task Home
    else if (!widget.isDashboard! && widget.ntsFilter == NTSType.task)
      widget.onListTap!(dataList![index].code, filterType!);
    // Task Home Dashboard
    else if (widget.isDashboard! && widget.ntsFilter == NTSType.task)
      widget.onListTap!(dataList![index].id, filterType!);
    // Note Home
    else if (!widget.isDashboard! && widget.ntsFilter == NTSType.note)
      widget.onListTap!(dataList![index].code, filterType!);
    // Note Home Dashboard
    else if (widget.isDashboard! && widget.ntsFilter == NTSType.note)
      widget.onListTap!(dataList![index].id, filterType!);
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
}
