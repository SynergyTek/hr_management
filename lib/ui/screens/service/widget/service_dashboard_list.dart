import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/service_models/service.dart';
import '../../../../data/models/service_models/service_response.dart';
import '../../../../logic/blocs/service_bloc/service_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

import 'service_list_tile.dart';

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

    if (text != null) queryparams['text'] = text;
    if (serviceStatusIds != null)
      queryparams['serviceStatusIds'] = serviceStatusIds;
    if (userType != null) queryparams['userType'] = userType;

    queryparams['userId'] =
        BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? '';

    serviceBloc.getServiceDashBoardData(
      queryparams: queryparams,
    );
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
                    return ServiceListCard(
                      index: index,
                      serviceList: _serviceList,
                      onTap: false,
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
      text = subjectController.text;
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
    subjectController.text = '';
    _setParamsToNull();
    apiCall();
  }

  assignValues(dynamic value, FilterType filterType) {
    switch (filterType) {
      case FilterType.status:
        serviceStatusIds = value;
        break;
      case FilterType.serviceOwnedRequested:
        userType = value;
        break;
      default:
        break;
    }
  }

  _moreFilter() {
    _setParamsToNull();
    filterData(dynamic value, FilterType filterType) {
      if (value != '7e920184-c8f7-4b5b-ad2c-7a6f40f51823' && value != 'All')
        assignValues(value, filterType);
      apiCall();
    }

    Navigator.pushNamed(
      context,
      NTS_FILTER,
      arguments: ScreenArguments(
        func: filterData,
        ntstype: NTSType.service,
        val2: true,
      ),
    );
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
