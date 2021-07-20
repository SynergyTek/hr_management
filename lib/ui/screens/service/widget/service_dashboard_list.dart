import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/maps/maps.dart';
import 'package:hr_management/data/models/service_models/service.dart';
import 'package:hr_management/data/models/service_models/service_response.dart';
import 'package:hr_management/logic/blocs/service_bloc/service_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
=======
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../widgets/progress_indicator.dart';
>>>>>>> d0baf061f65e518a3f6c509af4193b640e32c1cb
import 'package:listizer/listizer.dart';

class ServiceDashboardList extends StatefulWidget {
  ServiceDashboardList({Key key}) : super(key: key);

  @override
  _ServiceDashboardListState createState() => _ServiceDashboardListState();
}

class _ServiceDashboardListState extends State<ServiceDashboardList> {
  List<Service> _serviceList = [];
  List<Service> _filteredServiceList = [];

  TextEditingController subjectController = TextEditingController();

  String userId;
  String text;
  String serviceStatusIds;
  String userType;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    serviceBloc.subjectServiceList.sink.add(null);

    Map<String, dynamic> queryparams = Map();

    if (userId != null) queryparams['userId'] = userId;
    if (text != null) queryparams['text'] = text;
    if (serviceStatusIds != null)
      queryparams['serviceStatusIds'] = serviceStatusIds;
    if (userType != null) queryparams['userType'] = userType;

    serviceBloc.getServiceDashBoardData(queryparams: queryparams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          collapsedBackgroundColor: Colors.grey[200],
          backgroundColor: Colors.grey[200],
          trailing: Icon(Icons.filter_list),
          title: _searchField(),
          children: [wrappedButtons()],
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
      // subject = subjectController.text;
      apiCall();
    }
  }

  _setParamsToNull() {
    userId = null;
    text = null;
    serviceStatusIds = null;
    userType = null;
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

  _moreFilter() {
    filterData(dynamic value) {
      _setParamsToNull();
      // if (filterServiceOptionsMap.toString().contains(value))
      serviceStatusIds = value;
      // else
      //   userType = value;
      apiCall();
      print(serviceStatusIds);
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.service,
        val1: true,
        val2: true,
      ),
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
