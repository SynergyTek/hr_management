import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../../constants/api_endpoints.dart';
import '../../../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../../listizer/listizer.dart';
import '../../../../../data/models/access_log/access_log_model.dart';
import '../../../../../data/models/access_log/access_log_response.dart';
import '../../../../../logic/blocs/access_log_bloc/access_log_bloc.dart';
import '../../../../../themes/theme_config.dart';
import '../../../../widgets/empty_list_widget.dart';
import '../../../../widgets/nts_dropdown_select.dart';
import '../../../../widgets/nts_widgets.dart';
import '../../../../widgets/progress_indicator.dart';
import 'access_log_list_tile_widget.dart';

class DisplayAccessLogBody extends StatefulWidget {
  DisplayAccessLogBody({Key? key}) : super(key: key);

  @override
  _DisplayAccessLogBodyState createState() => _DisplayAccessLogBodyState();
}

class _DisplayAccessLogBodyState extends State<DisplayAccessLogBody> {
  List<AccessLogModel> _accessLogList = [];
  List<AccessLogModel> _filteredAccessLogList = [];

  DateTime? startDate;
  DateTime? endDate;

  TextEditingController selectEmployeeController = TextEditingController();

  @override
  void initState() {
    accessLogBloc
      ..getAccessLogsListData(
        queryparams: _handleQueryparams(),
      );
    super.initState();
  }

  _handleQueryparams({
    DateTime? startDate,
    DateTime? dueDate,
  }) {
    if (startDate == null)
      return {
        'startdate': DateTime.now(),
        'startDate': DateTime.now(),
        'userId':
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      };

    return {
      'startdate': startDate,
      'startDate': startDate,
      'dueDate': dueDate,
      'userId':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: Column(
        children: [
          ExpansionTile(
            trailing: Icon(Icons.filter_list),
            title: Text("Filter"),
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: DynamicDateTimeBox(
                      code: startDate?.toString() ?? null,
                      name: 'Start Date',
                      key: new Key('Start Date'),
                      selectDate: (DateTime date) {
                        if (date != null) {
                          setState(() async {
                            startDate = date;
                          });

                          print(startDate);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: DynamicDateTimeBox(
                      code: endDate?.toString() ?? null,
                      name: 'End Date',
                      key: new Key('End Date'),
                      selectDate: (DateTime date) {
                        if (date != null) {
                          setState(() async {
                            endDate = date;
                          });

                          print(endDate);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: Icon(Icons.save),
                    onPressed: () => _handleFilterOnPressed(),
                  )
                ],
              ),
              Container(
                child: NTSDropDownSelect(
                  url: APIEndpointConstants.EMPLOYEE_DROPDOWN_LIST,
                  prefixIcon: Icon(Icons.control_point_duplicate_outlined),
                  idKey: 'Id',
                  nameKey: 'Name',
                  hint: 'Status',
                  isTeamList: false,
                  isUserList: false,
                  title: 'Status',
                  isShowArrow: true,
                  controller: selectEmployeeController,
                  onListTap: (dynamic value) {
                    ntsDdBloc.subject.sink.add(null);

                    NTSDropdownModel _selectedemployeeModel = value;
                    selectEmployeeController.text =
                        _selectedemployeeModel.name!;
                    setState(() {});
                    // apiCall();
                  },
                ),
              )
            ],
          ),
          Expanded(
            child: StreamBuilder<AccessLogListDataResponse>(
                stream: accessLogBloc.getAccessLogListDataSubject.stream,
                builder: (context,
                    AsyncSnapshot<AccessLogListDataResponse> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.data == null ||
                        snapshot.data!.data.length == 0) {
                      return EmptyListWidget();
                    }
                    _accessLogList = snapshot.data!.data.reversed.toList();
                    return Listizer(
                      listItems: _accessLogList,
                      filteredSearchList: _filteredAccessLogList,
                      itemBuilder: (context, index) {
                        return AccessLogListTileWidget(
                          // TODO: @Vani figure out which one needs to be shown.
                          // eachAccessLogModelElement: _filteredAccessLogList.elementAt(index),
                          eachAccessLogModelElement:
                              _accessLogList.elementAt(index),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CustomProgressIndicator(
                        loadingText: 'Fetching data',
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  void _handleFilterOnPressed() {
    if (startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be empty."),
        ),
      );
      return;
    }

    if (endDate != null && startDate!.compareTo(endDate!) > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Start date cannot be greater than the End date."),
        ),
      );
      return;
    }

    // call bloc with updated query params.
    accessLogBloc
      ..getAccessLogsListData(
        queryparams: _handleQueryparams(
          startDate: startDate,
          dueDate: endDate ?? null,
        ),
      );
  }

  @override
  void dispose() {
    _accessLogList = [];
    _filteredAccessLogList = [];
    super.dispose();
  }
}
