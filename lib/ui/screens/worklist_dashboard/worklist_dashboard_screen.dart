import 'package:flutter/material.dart';
import '../../../data/models/nts_template_tree_list_models/nts_template_tree_list_model.dart';
import '../../../data/models/nts_template_tree_list_models/nts_template_tree_list_response.dart';
import '../../../logic/blocs/nts_template_tree_list_bloc/nts_template_tree_list_bloc.dart';
import '../../../data/enums/enums.dart';
import '../../../themes/light_theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'widgets/note_worklist.dart';
import 'widgets/task_service_worklist.dart';

class WorklistDashboard extends StatefulWidget {
  const WorklistDashboard({Key? key}) : super(key: key);

  @override
  _WorklistDashboardState createState() => _WorklistDashboardState();
}

class _WorklistDashboardState extends State<WorklistDashboard> {
  Map<String, TreeViewModelChildren> _checkedFilterSelectedItemsMap = Map();
  String title = 'Task';
  int _selectedIndex = 0;
  NTSType ntsType = NTSType.task;
  List<Widget>? _widgetOptions = [];
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      TaskServiceWorklist(
        ntsType: NTSType.task,
      ),
      TaskServiceWorklist(
        ntsType: NTSType.service,
      ),
      NoteWorklist(),
    ];

    ntsTemplateTreeListBloc..getData(queryparams: _handleQueryParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      // drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Worklist Dashboard (" + title + ")",
      ),
      body: SafeArea(
        // child: InternetConnectivityWidget(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<NTSTemplateTreeListResponse?>(
                stream: ntsTemplateTreeListBloc.subject.stream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.error != null &&
                        snapshot.data.error.length > 0) {
                      return Expanded(
                        child: Center(
                          child: Text(snapshot.data.error),
                        ),
                      );
                    }

                    return Container();
                    //  _filterWidget(snapshot.data.data);
                  } else {
                    return CircularProgressIndicator(
                      backgroundColor:
                          LightTheme().lightThemeData().primaryColor,
                    );
                  }
                },
              ),
              Expanded(
                child: _widgetOptions!.elementAt(_selectedIndex),
              ),
            ],
          ),
        ),
      ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: Icon(
      //     Icons.add,
      //     size: 32,
      //   ),
      //   onPressed: () {
      //     if (ntsType == NTSType.task) {
      //       Navigator.pushNamed(
      //         context,
      //         NTS_TEMPLATE_REQUEST,
      //         arguments: ScreenArguments(
      //           ntstype: NTSType.task,
      //           arg4: '', //'STEP_TASK_CATEGORY',
      //         ),
      //       );
      //     } else if (ntsType == NTSType.service) {
      //       Navigator.pushNamed(
      //         context,
      //         NTS_TEMPLATE_REQUEST,
      //         arguments: ScreenArguments(
      //           ntstype: NTSType.service,
      //           arg4: '',
      //         ),
      //       );
      //     } else if (ntsType == NTSType.note) {
      //       Navigator.pushNamed(
      //         context,
      //         NTS_TEMPLATE_REQUEST,
      //         arguments: ScreenArguments(
      //           ntstype: NTSType.note,
      //           arg4: '',
      //         ),
      //       );
      //     }
      //   },
      // ),
      // bottomNavigationBar: StreamBuilder<WorklistDashboardResponse>(
      //     stream: null,
      //     builder: (context, snapshot) {
      //       return BottomNavigationBar(
      //         items: const <BottomNavigationBarItem>[
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.file_copy),
      //             tooltip: 'TASK',
      //             // icon: Icon(Icons.task),
      //             label: 'TASK',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.miscellaneous_services),
      //             label: 'SERVICE',
      //             tooltip: 'SERVICE',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.note),
      //             label: 'NOTE',
      //             tooltip: 'NOTE',
      //           ),
      //         ],
      //         currentIndex: _selectedIndex,
      //         selectedItemColor: Theme.of(context).primaryColor,
      //         onTap: _onItemTapped,
      //       );
      //     }),
    );
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     if (_selectedIndex == 0) {
  //       ntsType = NTSType.task;
  //       title = 'Task';
  //     } else if (_selectedIndex == 1) {
  //       ntsType = NTSType.service;
  //       title = 'Service';
  //     } else if (_selectedIndex == 2) {
  //       ntsType = NTSType.note;
  //       title = 'Note';
  //     }

  //     // Clearing old filter values.
  //     ntsTemplateTreeListBloc..subject.add(null);

  //     // Refreshing the filter data accroding to the selected type.
  //     ntsTemplateTreeListBloc..getData(queryparams: _handleQueryParams());

  //     // Clearing all the selected filters.
  //     _checkedFilterSelectedItemsMap.clear();
  //   });
  // }

  @override
  void dispose() {
    _widgetOptions = null;
    super.dispose();
  }

  /// Helper function to handle query params for the API
  _handleQueryParams() {
    if (_selectedIndex == 0) return {'id': 'Task'};
    if (_selectedIndex == 1) return {'id': 'Service'};
    if (_selectedIndex == 2) return {'id': 'Note'};
  }

  // Widget _filterWidget(List data) {
  //   return Row(
  //     mainAxisSize: MainAxisSize.max,
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       Expanded(
  //         child: Container(
  //           height: 80.0,
  //           child: _handleFilterChips(),
  //         ),
  //       ),
  //       IconButton(
  //         icon: Icon(Icons.filter_list),
  //         onPressed: () => _handleFilterOnPressed(data),
  //       ),
  //     ],
  //   );
  // }

  // _handleFilterOnPressed(List<NTSTemplateTreeListModel> data) {
  //   showModalBottomSheet(
  //     context: context,
  //     enableDrag: true,
  //     isScrollControlled: false,
  //     backgroundColor: Colors.transparent,
  //     builder: (BuildContext context) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           color: Theme.of(context).backgroundColor,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(
  //               16.0,
  //             ),
  //             topRight: Radius.circular(
  //               16.0,
  //             ),
  //           ),
  //         ),
  //         width: double.infinity,
  //         padding: DEFAULT_LARGE_PADDING,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               leading: Icon(Icons.filter_list),
  //               title: Text("Filter"),
  //               trailing: IconButton(
  //                 icon: Icon(
  //                   Icons.close,
  //                   color: Theme.of(context).canvasColor,
  //                 ),
  //                 onPressed: () => Navigator.of(context).pop(),
  //               ),
  //             ),
  //             Expanded(
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: data.length,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return _eachItemExpansionTile(
  //                     data.elementAt(index),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _eachItemExpansionTile(NTSTemplateTreeListModel eachData) {
  //   return ExpansionTile(
  //     title: Text(eachData.name),
  //     children: _expansionTileChildren(eachData),
  //   );
  // }

  // List<Widget> _expansionTileChildren(NTSTemplateTreeListModel eachData) {
  //   List<Widget> _expansionTileWidgetList = [];

  //   if (eachData?.treeViewModelChildren == null)
  //     return _expansionTileWidgetList..add(Container());

  //   eachData.treeViewModelChildren.forEach((eachItem) {
  //     _expansionTileWidgetList
  //       ..add(
  //         StatefulBuilder(
  //           builder: (BuildContext context, innerSetState) {
  //             // return ListTile(
  //             // leading: Icon(Icons.filter_list),
  //             return CheckboxListTile(
  //               title: Text(eachItem.displayName ?? ""),
  //               value: eachItem?.checked ?? false,
  //               onChanged: (bool hasChanged) {
  //                 // onTap: () {
  //                 innerSetState(() {
  //                   setState(() {
  //                     // Updating the value of the checkbox listtile.
  //                     eachItem.checked = !eachItem.checked;

  //                     // If key is already present remove the entry from the map.
  //                     // If the id is not present in the map then add a new entry to the map.
  //                     if (!_checkedFilterSelectedItemsMap
  //                         .containsKey(eachItem.id)) {
  //                       _checkedFilterSelectedItemsMap[eachItem.id] = eachItem;
  //                     } else {
  //                       _checkedFilterSelectedItemsMap.remove(eachItem.id);
  //                     }

  //                     if (_selectedIndex != 2)
  //                       worklistDashboardBloc
  //                         ..getWorklistDashboardData(
  //                           queryparams: _handleWorkListDashboardQueryParams(),
  //                         );

  //                     if (_selectedIndex == 2)
  //                       worklistDashboardBloc
  //                         ..getWorklistDashboardNoteData(
  //                           queryparams: _handleWorkListDashboardQueryParams(),
  //                         );
  //                   });
  //                 });
  //               },
  //             );
  //           },
  //         ),
  //       );
  //   });

  //   return _expansionTileWidgetList;
  // }

  // Widget _handleFilterChips() {
  //   List<Widget> _chips = [];

  //   _checkedFilterSelectedItemsMap.values.forEach((eachChip) {
  //     _chips
  //       ..add(
  //         Container(
  //           padding: DEFAULT_HORIZONTAL_PADDING,
  //           child: _chips == []
  //               ? Text('Select Templates')
  //               : Chip(
  //                   backgroundColor: Theme.of(context).textHeadingColor,
  //                   label: Text(
  //                     eachChip.displayName ?? "",
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //         ),
  //       );
  //   });

  //   return ListView(
  //     shrinkWrap: true,
  //     scrollDirection: Axis.horizontal,
  //     children: _chips,
  //   );
  // }

  // _handleWorkListDashboardQueryParams() {
  //   if (_selectedIndex == 0)
  //     return {
  //       'taskTemplateIds': _checkedFilterSelectedItemsMap.keys.join(','),
  //       'userid':
  //           BlocProvider.of<UserModelBloc>(context).state.userModel.id ?? '',
  //     };
  //   if (_selectedIndex == 1)
  //     return {
  //       'serviceTemplateIds': _checkedFilterSelectedItemsMap.keys.join(','),
  //       'userid':
  //           BlocProvider.of<UserModelBloc>(context).state.userModel.id ?? '',
  //     };
  //   if (_selectedIndex == 2)
  //     return {
  //       'noteTemplateIds': _checkedFilterSelectedItemsMap.keys.join(','),
  //       'userid':
  //           BlocProvider.of<UserModelBloc>(context).state.userModel.id ?? '',
  //     };
  // }
}
