import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import '../../../../themes/light_theme.dart';
import 'section_workboard_details_list_widget.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../../data/models/workboard_model/workboard_model.dart';
import '../../../../data/models/workboard_model/workboard_response_model.dart';
import '../../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../logic/blocs/workboard_bloc/workboard_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/nts_dropdown_select.dart';
import '../../../widgets/progress_indicator.dart';

class WorkBoardScreenBodyWidget extends StatefulWidget {
  const WorkBoardScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<WorkBoardScreenBodyWidget> createState() =>
      _WorkBoardScreenBodyWidgetState();
}

class _WorkBoardScreenBodyWidgetState extends State<WorkBoardScreenBodyWidget> {
  WorkBoardResponseModel? workboardModel = WorkBoardResponseModel();
  TextEditingController subjectController = TextEditingController();
  TextEditingController sortByController = TextEditingController();
  TextEditingController selectStatusController = TextEditingController();

  List<WorkboardModel>? list;
  List<WorkboardModel>? _searchResult;
  List<WorkboardModel>? fullList;

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
    return Column(
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
        Expanded(
          child: StreamBuilder<WorkBoardResponseModel?>(
            stream: workboardBloc.subjectWorkboardList.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.error != null &&
                    snapshot.data!.error!.length > 0) {
                  return Center(
                    child: Expanded(child: Text(snapshot.data!.error!)),
                  );
                }

                if (_searchResult != null && _searchResult!.length > 0) {
                  list = _searchResult;
                } else if (subjectController.text.isEmpty ||
                    _searchResult == null) {
                  list = snapshot.data?.data
                      ?.where((WorkboardModel element) =>
                          element.iconFileId != null)
                      .toList();
                  fullList = snapshot.data?.data
                      ?.where((WorkboardModel element) =>
                          element.iconFileId != null)
                      .toList();
                } else {
                  return Center(
                    child: Text('No Data Found for ${subjectController.text}'),
                  );
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

                return GridView.builder(
                  itemCount: list?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.1, crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Card(
                        margin: DEFAULT_PADDING,
                        elevation: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            (list![index].iconFileId != null)
                                ? CachedNetworkImage(
                                    imageUrl: APIEndpointConstants
                                            .PROFILE_PICTURE_ENDPOINT +
                                        list![index].iconFileId!,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(
                                          backgroundColor: LightTheme()
                                              .lightThemeData()
                                              .primaryColor,
                                        ))
                                : Container(),
                            (list?[index].workBoardName != null)
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              list![index]
                                                  .workBoardName
                                                  .toString(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: PopupMenuButton(
                                              child: Icon(
                                                Icons.more_vert,
                                              ),
                                              onSelected: (result) async {
                                                if (result == 0) {}
                                                if (result == 1) {
                                                  Navigator.pushNamed(
                                                    context,
                                                    DUPLICATE_WORKBOARD_SCREEN,
                                                    arguments: ScreenArguments(
                                                        arg1: list?[index]
                                                            .workboardId),
                                                  ).then((value) => apiCall());
                                                }

                                                if (result == 2) {
                                                  String? templateTypeText;
                                                  if (list?[index]
                                                          .templateTypeId ==
                                                      "1255fc6e-0e21-4709-a804-074fed296eb3") {
                                                    templateTypeText =
                                                        "Monthly";
                                                  } else if (list?[index]
                                                          .templateTypeId ==
                                                      "ee62b9f9-15dc-45da-a5d1-0bc9ab1fc0e0") {
                                                    templateTypeText = "Yearly";
                                                  } else if (list?[index]
                                                          .templateTypeId ==
                                                      "5958f94a-38c1-499e-aac1-8c1ef388c2d4") {
                                                    templateTypeText = "Weekly";
                                                  } else if (list?[index]
                                                          .templateTypeId ==
                                                      "3b1cb391-de1b-4df6-b0c1-90df23c273c6") {
                                                    templateTypeText = "Basic";
                                                  }
                                                  Navigator.pushNamed(
                                                    context,
                                                    CREATE_WORKBOARD_SCREEN,
                                                    arguments: ScreenArguments(
                                                        arg3: list?[index]
                                                            .workBoardType
                                                            .toString(),
                                                        val1: true,
                                                        arg1: list?[index]
                                                            .workboardId,
                                                        arg2: templateTypeText),
                                                  ).then((value) => apiCall());
                                                }
                                                if (result == 3) {
                                                  await workboardBloc
                                                      .getOpenCloseWorkboard(
                                                    queryparams: {
                                                      'id': list?[index]
                                                          .workboardId,
                                                      'status': 1,
                                                    },
                                                  );
                                                  if (workboardBloc
                                                      .subjectOpenCloseWorkboard
                                                      .hasValue) {
                                                    displaySnackBar(
                                                        context: context,
                                                        text: (workboardBloc
                                                                    .subjectOpenCloseWorkboard
                                                                    .value
                                                                    ?.booldata ==
                                                                true)
                                                            ? 'Successful'
                                                            : 'Please Try Again Later');
                                                  }
                                                  apiCall();
                                                }
                                                if (result == 4) {
                                                  await workboardBloc
                                                      .getOpenCloseWorkboard(
                                                    queryparams: {
                                                      'id': list?[index]
                                                          .workboardId,
                                                      'status': 0,
                                                    },
                                                  );
                                                  if (workboardBloc
                                                      .subjectOpenCloseWorkboard
                                                      .hasValue) {
                                                    displaySnackBar(
                                                        context: context,
                                                        text: (workboardBloc
                                                                    .subjectOpenCloseWorkboard
                                                                    .value
                                                                    ?.booldata ==
                                                                true)
                                                            ? 'Successful'
                                                            : 'Please Try Again Later');
                                                  }
                                                  apiCall();
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return (selectStatusController
                                                            .text ==
                                                        'Closed')
                                                    ? [
                                                        PopupMenuItem(
                                                          value: 4,
                                                          child:
                                                              IconTextRowWidget(
                                                            iconData: Icons
                                                                .arrow_forward_ios_outlined,
                                                            iconText:
                                                                'ReOpen Board',
                                                          ),
                                                        ),
                                                      ]
                                                    : [
                                                        PopupMenuItem(
                                                          value: 0,
                                                          child:
                                                              IconTextRowWidget(
                                                            iconData: Icons
                                                                .arrow_forward_ios_outlined,
                                                            iconText: 'Share',
                                                          ),
                                                        ),
                                                        PopupMenuItem(
                                                          value: 1,
                                                          child:
                                                              IconTextRowWidget(
                                                            iconData: Icons
                                                                .control_point_duplicate,
                                                            iconText:
                                                                'Duplicate Board',
                                                          ),
                                                        ),
                                                        PopupMenuItem(
                                                          value: 2,
                                                          child:
                                                              IconTextRowWidget(
                                                            iconData:
                                                                Icons.edit,
                                                            iconText:
                                                                'Edit Board',
                                                          ),
                                                        ),
                                                        PopupMenuItem(
                                                          value: 3,
                                                          child:
                                                              IconTextRowWidget(
                                                            iconData:
                                                                Icons.close,
                                                            iconText:
                                                                'Close Board',
                                                          ),
                                                        ),
                                                      ];
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      onTap: () {
                        workboardBloc.subjectManageWorkboardDetailsList.sink
                            .add(null);
                        print(list?[index].workboardId ?? '');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SectionWorkBoardDetailsList(
                              workboardModel: list?[index],
                            ),
                          ),
                        );
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
      ),
      child: TextField(
        onSubmitted: (v) => _handleOnpressedSearch(),
        controller: subjectController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                onTap: () => _handleOnpressedSearch(),
              ),
              (subjectController.text.isNotEmpty)
                  ? IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        subjectController.clear();
                        _searchResult?.clear();
                        apiCall();
                        setState(() {});
                      })
                  : SizedBox(
                      width: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _handleOnpressedSearch() {
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

class IconTextRowWidget extends StatelessWidget {
  final String iconText;
  final IconData iconData;

  const IconTextRowWidget({
    Key? key,
    required this.iconText,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(iconData),
        ),
        Text(iconText, textAlign: TextAlign.start),
      ],
    );
  }
}
