import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/workboard_model/workboard_section_model.dart';
import '../../../../data/helpers/hex_colot_convert.dart';
import '../../../../data/models/workboard_model/add_workboard_content_model.dart';
import '../../../../themes/theme_config.dart';
import 'section_workboard_details_list_widget.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../../data/models/workboard_model/workboard_model.dart';
import '../../../../data/models/workboard_model/workboard_response_model.dart';
import '../../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../logic/blocs/workboard_bloc/workboard_bloc.dart';
import '../../../widgets/nts_dropdown_select.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

class CopyMoveScreen extends StatefulWidget {
  final AddContentWorkBoardModel? addContentWorkBoardModel;
  const CopyMoveScreen({Key? key, this.addContentWorkBoardModel})
      : super(key: key);

  @override
  State<CopyMoveScreen> createState() => _CopyMoveScreenState();
}

class _CopyMoveScreenState extends State<CopyMoveScreen> {
  WorkBoardResponseModel? workboardModel = WorkBoardResponseModel();
  TextEditingController subjectController = TextEditingController();
  TextEditingController sortByController = TextEditingController();
  TextEditingController selectStatusController = TextEditingController();

  List<WorkboardModel>? list;
  List<WorkboardModel>? _searchResult;
  List<WorkboardModel>? fullList;

  WorkBoardSectionMapResponseModel? workBoardMapResponseModel;
  List<WorkBoardSectionModel>? workBoardSectionsList;

  int? jsonIndex;
  int? index1;
  var tappedIndex;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    workboardBloc.subjectWorkboardList.sink.add(null);
    workboardBloc
      ..getWorkboardData(
        queryparams: _handleQueryparams(),
      );
  }

  apiCall2() {
    workboardBloc.subjectManageWorkboardDetailsList.sink.add(null);
    workboardBloc.getManageWorkBoardDetailsList(
      queryparams: {
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            "HR",
        "id": list?[tappedIndex].workboardId ?? '',
      },
    );
  }

  _handleQueryparams() {
    return {
      'userId':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      'portalName': BlocProvider.of<UserModelBloc>(context)
              .state
              .extraUserInformation
              ?.portalType ??
          'HR',
      'status': (selectStatusController.text == 'Closed') ? '1' : '0',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Copy/Move To'),
      ),
      body: Column(
        children: [
          ExpansionTile(
            collapsedBackgroundColor: Colors.grey[200],
            backgroundColor: Colors.grey[200],
            trailing: Icon(Icons.filter_list),
            title: _searchField(),
            children: [
              wrappedButtons(),
            ],
          ),
          Container(
            height: 30.h,
            child: StreamBuilder<WorkBoardResponseModel?>(
              stream: workboardBloc.subjectWorkboardList.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error != null &&
                      snapshot.data!.error!.length > 0) {
                    return Center(
                      child: Text(snapshot.data!.error!),
                    );
                  }

                  if (_searchResult != null) {
                    list = _searchResult;
                  } else if (subjectController.text.isEmpty ||
                      _searchResult == null) {
                    list = snapshot.data?.data;
                    fullList = snapshot.data?.data;
                  }

                  if (sortByController.text == "Alphabetical") {
                    list?.sort(
                      (a, b) =>
                          a.workBoardName.toString().toLowerCase().compareTo(
                                b.workBoardName.toString().toLowerCase(),
                              ),
                    );
                  }
                  if (sortByController.text == "Recent Activity") {
                    list?.sort(
                      (a, b) =>
                          a.lastUpdatedDate.toString().toLowerCase().compareTo(
                                b.lastUpdatedDate.toString().toLowerCase(),
                              ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list?.length,
                    itemBuilder: (BuildContext context, int index) {
                      index1 = index;
                      print(index1);
                      return GestureDetector(
                        child: Card(
                          margin: DEFAULT_PADDING,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: tappedIndex == index
                              ? Colors.lightBlueAccent
                              : null,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              (list![index].iconFileId != null)
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        color: tappedIndex == index
                                            ? Colors.blue
                                            : null,
                                      ),
                                      child: Image.network(
                                        APIEndpointConstants
                                                .PROFILE_PICTURE_ENDPOINT +
                                            list![index].iconFileId!,
                                        height: 20.h,
                                      ),
                                    )
                                  : Container(),
                              (list?[index].workBoardName != null)
                                  ? Text(list![index].workBoardName.toString(),
                                      style: TextStyle(
                                        color: tappedIndex == index
                                            ? Colors.white
                                            : null,
                                      ))
                                  : Container(),
                            ],
                          ),
                        ),
                        onTap: () {
                          workboardBloc.subjectManageWorkboardDetailsList.sink
                              .add(null);
                          print(list?[index].workboardId ?? '');
                          workboardBloc.getManageWorkBoardDetailsList(
                            queryparams: {
                              "userId": BlocProvider.of<UserModelBloc>(context)
                                      .state
                                      .userModel
                                      ?.id ??
                                  '',
                              "portalName":
                                  BlocProvider.of<UserModelBloc>(context)
                                          .state
                                          .extraUserInformation
                                          ?.portalType ??
                                      "HR",
                              "id": list?[index].workboardId ?? '',
                            },
                          );

                          setState(() {
                            tappedIndex = index;
                          });
                        },
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
          ),
          Flexible(
            flex: 2,
            child: Container(
              child: StreamBuilder<WorkBoardSectionMapResponseModel?>(
                stream: workboardBloc.subjectManageWorkboardDetailsList.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<WorkBoardSectionMapResponseModel?> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.mapdata != null) {
                      workBoardMapResponseModel = snapshot.data;

                      workBoardSectionsList =
                          workBoardMapResponseModel?.mapdata?.workBoardSections;
                    }

                    return (workBoardSectionsList != null &&
                            workBoardSectionsList!.isNotEmpty &&
                            tappedIndex != null)
                        ? Container(
                            margin: DEFAULT_PADDING,
                            child: ListView.builder(
                              padding: DEFAULT_PADDING * 0.5,
                              shrinkWrap: true,
                              itemCount: workBoardSectionsList?.length,
                              itemBuilder: (BuildContext context, int index) {
                                jsonIndex = index;
                                return Card(
                                  color: (workBoardSectionsList?[index]
                                              .headerColor !=
                                          null)
                                      ?
                                      // Colors.grey.shade100
                                      hexToColor(workBoardSectionsList?[index]
                                                  .headerColor ??
                                              '')
                                          .withOpacity(0.2)
                                      : Colors.grey.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  elevation: 6,
                                  margin: EdgeInsets.only(
                                      bottom: 16, left: 4, right: 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: DEFAULT_PADDING,
                                        decoration: BoxDecoration(
                                          color: (workBoardSectionsList?[index]
                                                      .headerColor !=
                                                  null)
                                              ? hexToColor(
                                                  workBoardSectionsList?[index]
                                                          .headerColor ??
                                                      '')
                                              : Colors.blueGrey,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  workBoardSectionsList?[index]
                                                          .sectionDigit
                                                          .toString() ??
                                                      '',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '.',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  workBoardSectionsList?[index]
                                                          .sectionName ??
                                                      '',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                ButtonWidget(
                                                    textColor: Colors.white,
                                                    height: 5.h,
                                                    color: Colors.black54,
                                                    onTap: () {
                                                      workboardBloc
                                                          .postSharingMoveCopy(
                                                              queryparams: {
                                                            "portalName": BlocProvider.of<
                                                                            UserModelBloc>(
                                                                        context)
                                                                    .state
                                                                    .extraUserInformation
                                                                    ?.portalType ??
                                                                "HR",
                                                            "secId":
                                                                workBoardSectionsList?[
                                                                        index]
                                                                    .id,
                                                            "workboardId":
                                                                workBoardSectionsList?[
                                                                        index]
                                                                    .workboardId,
                                                            "userId": BlocProvider.of<
                                                                            UserModelBloc>(
                                                                        context)
                                                                    .state
                                                                    .userModel
                                                                    ?.id ??
                                                                '',
                                                            "postAction":
                                                                "Move",
                                                            "workboardItemId": widget
                                                                .addContentWorkBoardModel
                                                                ?.workBoardItemId,
                                                          });
                                                      apiCall2();
                                                      Navigator.of(context)
                                                          .pop();
                                                      // Navigator.of(context)
                                                      //     .pop();
                                                    },
                                                    buttonText: 'Move'),
                                                ButtonWidget(
                                                    textColor: Colors.white,
                                                    height: 5.h,
                                                    color: Colors.black54,
                                                    onTap: () {
                                                      workboardBloc
                                                          .postSharingMoveCopy(
                                                              queryparams: {
                                                            "portalName": BlocProvider.of<
                                                                            UserModelBloc>(
                                                                        context)
                                                                    .state
                                                                    .extraUserInformation
                                                                    ?.portalType ??
                                                                "HR",
                                                            "secId":
                                                                workBoardSectionsList?[
                                                                        index]
                                                                    .id,
                                                            "workboardId":
                                                                workBoardSectionsList?[
                                                                        index]
                                                                    .workBoardId,
                                                            "userId": BlocProvider.of<
                                                                            UserModelBloc>(
                                                                        context)
                                                                    .state
                                                                    .userModel
                                                                    ?.id ??
                                                                '',
                                                            "postAction":
                                                                "Copy",
                                                            "workboardItemId": widget
                                                                .addContentWorkBoardModel
                                                                ?.workBoardItemId,
                                                          });
                                                      apiCall2();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    buttonText: 'Copy'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: (tappedIndex != null)
                                ? Text('NO Data Found')
                                : Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue),
                                    margin: DEFAULT_LARGE_PADDING,
                                    padding: DEFAULT_LARGE_PADDING,
                                    child: Text(
                                      'Please Select the WorkBoard Above',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )),
                          );
                  } else {
                    return Center(
                      child: CustomProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
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
            onPressed: () {
              _searchResult = null;
              if (subjectController.text.isNotEmpty) {
                list = fullList;
                _searchResult = list
                    ?.where((workBoardElement) => workBoardElement.workBoardName
                        .toString()
                        .toLowerCase()
                        .contains(subjectController.text.toLowerCase()))
                    .toList();

                setState(() {});
              } else
                return;
            },
          ),
        ),
      ),
    );
  }

  Widget wrappedButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: double.infinity,
      child: Wrap(
        children: [
          Row(
            children: [
              Expanded(
                child: NTSDropDownSelect(
                  url: APIEndpointConstants.WORKBOARD_SORTING,
                  idKey: 'Id',
                  nameKey: 'Name',
                  prefixIcon: Icon(Icons.sort),
                  isInitial: false,
                  isTeamList: false,
                  isUserList: false,
                  title: 'Sort By',
                  hint: 'Sort By',
                  isShowArrow: true,
                  controller: sortByController,
                  onListTap: (dynamic value) {
                    ntsDdBloc.subject.sink.add(null);
                    NTSDropdownModel _workBoardSortingModel = value;
                    sortByController.text = _workBoardSortingModel.name!;
                    setState(() {});
                    apiCall();
                  },
                ),
              ),
              Expanded(
                child: NTSDropDownSelect(
                  url: APIEndpointConstants.WORKBOARD_STATUS,
                  prefixIcon: Icon(Icons.control_point_duplicate_outlined),
                  idKey: 'Id',
                  nameKey: 'Name',
                  hint: 'Status',
                  isTeamList: false,
                  isUserList: false,
                  title: 'Status',
                  isShowArrow: true,
                  controller: selectStatusController,
                  onListTap: (dynamic value) {
                    ntsDdBloc.subject.sink.add(null);

                    NTSDropdownModel _selectedWorkBoardStatusModel = value;
                    selectStatusController.text =
                        _selectedWorkBoardStatusModel.name!;
                    setState(() {});
                    apiCall();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
