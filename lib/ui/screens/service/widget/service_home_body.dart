import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/nts_widgets.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

typedef FilterListTapCallBack = void Function(dynamic key1, FilterType key2);

class ServiceHomeBody extends StatefulWidget {
  final String serviceStatus;
  final String moduleId;
  final String mode;

  const ServiceHomeBody({Key key, this.serviceStatus, this.moduleId, this.mode})
      : super(key: key);
  @override
  _ServiceHomeBodyState createState() => _ServiceHomeBodyState();
}

class _ServiceHomeBodyState extends State<ServiceHomeBody> {
  List<Service> _serviceList = [];
  List<Service> _filteredServiceList = [];

  FilterListTapCallBack filterData;
  bool dateFilterVisible = false;

  DateTime startDateValue;
  DateTime dueDateValue;

  TextEditingController subjectController = TextEditingController();

  String userId;
  String text;
  String templateCategoryCode;
  String filterUserId;
  String moduleId;
  String mode;
  String serviceNo;
  String serviceStatus;
  String subject;
  DateTime startDate;
  DateTime dueDate;
  DateTime completionDate;
  String templateMasterCode;

  @override
  void initState() {
    serviceStatus = widget.serviceStatus;
    moduleId = widget.moduleId;
    mode = widget.mode;
    super.initState();
    apiCall();
  }

  apiCall() {
    serviceBloc.subjectServiceList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (userId != null) {
      queryparams['userId'] = userId;
    }
    if (text != null) {
      queryparams['text'] = text;
    }
    if (templateCategoryCode != null) {
      queryparams['templateCategoryCode'] = templateCategoryCode;
    }
    if (filterUserId != null) {
      queryparams['filterUserId'] = filterUserId;
    }
    if (moduleId != null) {
      queryparams['moduleId'] = moduleId;
    }
    if (mode != null) {
      queryparams['mode'] = mode;
    }
    if (serviceNo != null) {
      queryparams['serviceNo'] = serviceNo;
    }
    if (serviceStatus != null) {
      queryparams['serviceStatus'] = serviceStatus;
    }
    if (subject != null) {
      queryparams['subject'] = subject;
    }
    if (startDate != null) {
      queryparams['startDate'] = startDate.toString().split(' ')[0];
    }
    if (dueDate != null) {
      queryparams['dueDate'] = dueDate.toString().split(' ')[0];
    }
    if (completionDate != null) {
      queryparams['completionDate'] = completionDate;
    }
    if (templateMasterCode != null) {
      queryparams['templateMasterCode'] = templateMasterCode;
    }

    serviceBloc.getServiceHomeListData(queryparams: queryparams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          onExpansionChanged: (value) => _onExpansionChanged(value),
          collapsedBackgroundColor: Colors.grey[200],
          backgroundColor: Colors.grey[200],
          trailing: Icon(Icons.filter_list),
          title: _searchField(),
          children: [wrappedButtons()],
        ),
        Visibility(
          visible: dateFilterVisible,
          child: _dateFilterWidget(),
        ),
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

                if (snapshot.data.list == null ||
                    snapshot.data.list.length == 0) {
                  return EmptyListWidget();
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
                        onTap: () {
                          serviceBloc.subject.sink.add(null);
                          Navigator.pushNamed(
                            context,
                            CREATE_SERVICE_ROUTE,
                            arguments: ScreenArguments(
                              arg1: _serviceList[index].templateCode,
                              arg2: _serviceList[index].id,
                              arg3: _serviceList[index].serviceSubject,
                              val1: false,
                            ),
                          );
                        },
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

  _onExpansionChanged(bool value) {
    if (!value)
      setState(() {
        dateFilterVisible = false;
      });
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

  Widget wrappedButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: double.infinity,
      child: Wrap(
        children: [
          customButton(
            buttonText: 'Home',
            handleOnPressed: () => _homeFilter(),
          ),
          customButton(
            buttonText: 'Pending Till Today',
            handleOnPressed: () => _pendingTillTodayFilter(),
          ),
          customButton(
            buttonText: 'Ending in Next 7 Days',
            handleOnPressed: () => _endingInWeekFilter(),
          ),
          customButton(
            buttonText: 'Date',
            handleOnPressed: () => _dateFilter(),
          ),
          customButton(
            buttonText: 'More...',
            handleOnPressed: () => _moreFilter(),
          ),
        ],
      ),
    );
  }

  _homeFilter() {
    _setParamsToNull();
    apiCall();
  }

  _pendingTillTodayFilter() {
    _setParamsToNull();

    text = 'Today';
    apiCall();
  }

  _endingInWeekFilter() {
    _setParamsToNull();

    text = 'Week';
    apiCall();
  }

  _dateFilter() {
    setState(() {
      dateFilterVisible = !dateFilterVisible;
    });
  }

  assignValues(dynamic value, FilterType filterType) {
    switch (filterType) {
      case FilterType.status:
        serviceStatus = value;
        break;
      case FilterType.module:
        moduleId = value;
        break;
      case FilterType.role:
        mode = value;
        break;
      default:
        break;
    }
  }

  _moreFilter() {
    filterData(dynamic value, FilterType filterType) {
      _setParamsToNull();
      assignValues(value, filterType);
      apiCall();
      print(serviceStatus);
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.service,
        val2: false,
      ),
    );
  }

  _setParamsToNull() {
    userId = null;
    text = null;
    templateCategoryCode = null;
    filterUserId = null;
    moduleId = null;
    mode = null;
    serviceNo = null;
    serviceStatus = null;
    subject = null;
    startDate = null;
    dueDate = null;
    completionDate = null;
    templateMasterCode = null;
  }

  Widget _dateFilterWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: DynamicDateTimeBox(
            code: startDateValue?.toString() ?? null,
            name: 'Start Date',
            key: new Key('Start Date'),
            selectDate: (DateTime date) {
              if (date != null) {
                setState(() async {
                  startDateValue = date;
                });

                print(startDateValue);
              }
            },
          ),
        ),
        Expanded(
          child: DynamicDateTimeBox(
            code: dueDateValue?.toString() ?? null,
            name: 'End Date',
            key: new Key('End Date'),
            selectDate: (DateTime date) {
              if (date != null) {
                setState(() async {
                  dueDateValue = date;
                });
              }
            },
          ),
        ),
        IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.save),
          // onPressed: () {},
          onPressed: () => _handleFilterOnPressed(),
        )
      ],
    );
  }

  void _handleFilterOnPressed() {
    if (startDateValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be empty."),
        ),
      );
      return;
    }

    if (dueDateValue != null && startDateValue.compareTo(dueDateValue) > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be greater than the End date."),
        ),
      );
      return;
    }

    _setParamsToNull();
    startDate = startDateValue;
    dueDate = dueDateValue;
    apiCall();
  }

  Widget _searchField() {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(100),
        // color: Colors.white,
      ),
      child: TextField(
        controller: subjectController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onPressed: () => _searchSubject(),
          ),
        ),
      ),
    );
  }

  _searchSubject() {
    if (subjectController.text != null && subjectController.text.isNotEmpty) {
      _setParamsToNull();
      subject = subjectController.text;
      apiCall();
    }
  }

  customButton({
    String buttonText,
    Function handleOnPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
          // MaterialStateProperty.all(Theme.of(context).textHeadingColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        onPressed: () => handleOnPressed(),
        child: Text(buttonText),
      ),
    );
  }
}
