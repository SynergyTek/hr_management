import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
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

  @override
  void initState() {
    super.initState();
    workboardBloc
      ..getWorkboardData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() {
    return {
      'userId':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      'portalName': 'HR',
      'status': '0',
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
          children: [wrappedButtons()],
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
                  List<WorkboardModel>? list = snapshot.data!.data;
                  return GridView.builder(
                      itemCount: snapshot.data!.data?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.1, crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: DEFAULT_PADDING,
                          elevation: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              (list![index].iconFileId != null)
                                  ? Image.network(
                                      APIEndpointConstants.BASE_URL +
                                          '/common/query/GetFile?fileId=' +
                                          list[index].iconFileId!)
                                  : Container(),
                              (list[index].workBoardName != null)
                                  ? Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                list[index]
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
                                                onSelected: (v) {
                                                  if (v == 1) {
                                                    Navigator.pushNamed(
                                                      context,
                                                      DUPLICATE_WORKBOARD_SCREEN,
                                                    );
                                                  }
                                                },
                                                itemBuilder:
                                                    (BuildContext context) {
                                                  return [
                                                    PopupMenuItem(
                                                      value: 0,
                                                      onTap: () {},
                                                      child: IconTextRowWidget(
                                                          iconData: Icons
                                                              .arrow_forward_ios_outlined,
                                                          iconText: 'Share'),
                                                    ),
                                                    PopupMenuItem(
                                                      value: 1,
                                                      onTap: () {},
                                                      child: IconTextRowWidget(
                                                          iconData: Icons
                                                              .control_point_duplicate,
                                                          iconText:
                                                              'Duplicate Board'),
                                                    ),
                                                    PopupMenuItem(
                                                      value: 2,
                                                      onTap: () {},
                                                      child: IconTextRowWidget(
                                                          iconData: Icons.edit,
                                                          iconText:
                                                              'Edit Board'),
                                                    ),
                                                    PopupMenuItem(
                                                      value: 3,
                                                      onTap: () {},
                                                      child: IconTextRowWidget(
                                                          iconData: Icons.close,
                                                          iconText:
                                                              'Close Board'),
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
                        );
                      });
                } else {
                  return Center(
                    child: CustomProgressIndicator(),
                  );
                }
              }),
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
            onPressed: () {},
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
