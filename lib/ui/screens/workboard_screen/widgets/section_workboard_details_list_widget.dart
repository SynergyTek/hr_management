import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hr_management/data/helpers/hex_colot_convert.dart';
import 'package:hr_management/data/models/workboard_model/add_workboard_content_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_model.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/copymove_screen.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/workboard_screen_body_widget.dart';
import 'package:hr_management/ui/screens/workboard_screen/workboard_content_screen.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/workboard_model/workboard_response_model.dart';
import '../../../../data/models/workboard_model/workboard_section_model.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../logic/blocs/workboard_bloc/workboard_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../themes/light_theme.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

import 'item_task_list_widget.dart';

class SectionWorkBoardDetailsList extends StatefulWidget {
  final AddContentWorkBoardModel? addContentWorkBoardModel;
  final WorkboardModel? workboardModel;

  SectionWorkBoardDetailsList({
    Key? key,
    required this.workboardModel,
    this.addContentWorkBoardModel,
  }) : super(key: key);

  @override
  State<SectionWorkBoardDetailsList> createState() =>
      _SectionWorkBoardDetailsListState();
}

class _SectionWorkBoardDetailsListState
    extends State<SectionWorkBoardDetailsList> {
  WorkBoardSectionMapResponseModel? workBoardMapResponseModel;
  WorkBoardSectionModel? workBoardSectionModel;

  int? sectionindex;
  ScrollController scrollController = ScrollController();
  List<WorkBoardSectionModel>? workBoardSectionsList;
  List<WorkBoardSectionModel>? itemList;
  List? itemContent;
  int? index02;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
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
        "id": widget.workboardModel?.workboardId,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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

            return Scaffold(
              floatingActionButton: buildSpeedDial(),
              appBar: AppBar(
                  title: Text(
                    (workBoardMapResponseModel?.mapdata?.workBoardName != null)
                        ? workBoardMapResponseModel!.mapdata!.workBoardName!
                        : '',
                    maxLines: 2,
                  ),
                  actions: (workBoardSectionsList != null)
                      ? [
                          ButtonWidget(
                            buttonText: 'Save',
                            onTap: () {},
                          )
                        ]
                      : []),
              body: (workBoardSectionsList != null &&
                      workBoardSectionsList!.isNotEmpty)
                  ? Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: DEFAULT_PADDING,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 40,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.55,
                                    crossAxisCount: 2,
                                  ),
                                  controller: scrollController,
                                  padding: DEFAULT_PADDING * 0.5,
                                  shrinkWrap: true,
                                  itemCount: workBoardSectionsList?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    sectionindex = index;
                                    return Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      elevation: 6,
                                      margin: EdgeInsets.only(
                                          bottom: 16, left: 4, right: 4),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: DEFAULT_PADDING,
                                            decoration: BoxDecoration(
                                              color: (workBoardSectionsList?[
                                                              index]
                                                          .headerColor !=
                                                      null)
                                                  ? hexToColor(
                                                      workBoardSectionsList?[
                                                                  index]
                                                              .headerColor ??
                                                          '')
                                                  : Colors.blueGrey,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          workBoardSectionsList?[
                                                                      index]
                                                                  .sectionDigit
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '.',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            workBoardSectionsList?[
                                                                        index]
                                                                    .sectionName ??
                                                                '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        child: Icon(
                                                          Icons.add,
                                                        ),
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (_) =>
                                                                  WorkBoardContentScreen(
                                                                isEdit: false,
                                                                id: '',
                                                                parentId: '',
                                                                workBoardId: widget
                                                                        .workboardModel
                                                                        ?.id ??
                                                                    '',
                                                                workBoardSectionId:
                                                                    workBoardSectionsList?[index]
                                                                            .id ??
                                                                        '',
                                                              ),
                                                            ),
                                                          ).then((value) =>
                                                              apiCall());
                                                          print('add');
                                                        },
                                                      ),
                                                      PopupMenuButton(
                                                        onSelected: (result) {
                                                          if (result == 0) {
                                                            workboardBloc
                                                                .subjectCreateSectionWorkboardList
                                                                .sink
                                                                .add(null);
                                                            print('edit');
                                                            Navigator.pushNamed(
                                                              context,
                                                              CREATE_EDIT_SECTION_WORKBOARD_SCREEN,
                                                              arguments:
                                                                  ScreenArguments(
                                                                arg1: workBoardSectionsList?[
                                                                        index]
                                                                    .id,
                                                                arg2:
                                                                    workBoardMapResponseModel
                                                                        ?.mapdata
                                                                        ?.id,
                                                                val1: true,
                                                              ),
                                                            ).then((value) =>
                                                                apiCall());
                                                          }
                                                        },
                                                        child: Icon(Icons.edit),
                                                        itemBuilder:
                                                            (BuildContext
                                                                context) {
                                                          return [
                                                            PopupMenuItem(
                                                              value: 0,
                                                              child:
                                                                  IconTextRowWidget(
                                                                iconData:
                                                                    Icons.edit,
                                                                iconText:
                                                                    'Edit Section',
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              value: 1,
                                                              child:
                                                                  IconTextRowWidget(
                                                                iconData: Icons
                                                                    .delete,
                                                                iconText:
                                                                    'Remove Section',
                                                              ),
                                                            ),
                                                          ];
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 3),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20)),
                                                child: ListView.builder(
                                                  controller: scrollController,
                                                  itemCount:
                                                      workBoardSectionsList?[
                                                              index]
                                                          .item
                                                          ?.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index2) {
                                                    index02 = index2;
                                                    itemList =
                                                        workBoardSectionsList?[
                                                                index]
                                                            .item;

                                                    workBoardSectionModel =
                                                        workBoardSectionsList?[
                                                            index];

                                                    return Column(
                                                      children: [
                                                        ItemWidget(
                                                          workboardModel: widget
                                                              .workboardModel,
                                                          index2: index02,
                                                          workBoardSectionModel:
                                                              workBoardSectionModel,
                                                          context: context,
                                                          id: widget
                                                                  .workboardModel
                                                                  ?.workboardId ??
                                                              '',
                                                          isSquare: (itemList?[
                                                                              index2]
                                                                          .workBoardItemShape ==
                                                                      0 &&
                                                                  itemList?[index2]
                                                                          .workBoardItemSize ==
                                                                      2)
                                                              ? true
                                                              : false,
                                                          ntsNoteId:
                                                              itemList?[index2]
                                                                  .ntsNoteId,
                                                          workBoardId:
                                                              workBoardMapResponseModel
                                                                  ?.mapdata?.id,
                                                          sectionId:
                                                              itemList?[index2]
                                                                  .id,
                                                          itemfileId:
                                                              itemList?[index2]
                                                                  .itemFileId,
                                                          itemType:
                                                              itemList?[index2]
                                                                  .itemType,
                                                          color: (itemList?[index2]
                                                                          .colorCode !=
                                                                      null &&
                                                                  itemList?[index2]
                                                                          .colorCode !=
                                                                      "")
                                                              ? hexToColor(
                                                                  itemList?[index2]
                                                                          .colorCode ??
                                                                      '',
                                                                )
                                                              : null,
                                                          itemName: itemList?[
                                                                      index2]
                                                                  .itemName ??
                                                              '',
                                                          itemContent: (itemList?[
                                                                      index2]
                                                                  .itemContent ??
                                                              ''),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 2.h,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text('NO Data Found'),
                    ),
            );
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: LightTheme().lightThemeData().primaryColor,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          onTap: () {},
          label: 'Collaboration',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          labelBackgroundColor: Colors.black,
          child: Icon(
            Icons.collections_bookmark,
          ),
        ),
        SpeedDialChild(
          onTap: () {
            workboardBloc.subjectCreateSectionWorkboardList.sink.add(null);

            Navigator.pushNamed(context, CREATE_EDIT_SECTION_WORKBOARD_SCREEN,
                arguments: ScreenArguments(
                  arg1: (workBoardSectionsList!.isNotEmpty)
                      ? (workBoardSectionsList?[sectionindex!].id)
                      : null,
                  arg2: workBoardMapResponseModel?.mapdata?.id,
                  val1: false,
                )).then((value) => apiCall());
          },
          label: 'Create Section',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          labelBackgroundColor: Colors.black,
          child: Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}

class ItemWidget extends StatefulWidget {
  final String id;
  final BuildContext context;
  final bool? isSquare;
  final Color? color;
  final String? itemName;
  final String? itemContent;
  final int? itemType;
  final String? itemfileId;
  final String? workBoardId;
  final String? sectionId;
  final String? ntsNoteId;
  final WorkBoardSectionModel? workBoardSectionModel;
  final WorkboardModel? workboardModel;

  final int? index2;

  const ItemWidget({
    Key? key,
    this.isSquare,
    this.itemName,
    this.color,
    this.itemContent,
    this.itemType,
    this.itemfileId,
    this.workBoardId,
    this.sectionId,
    this.ntsNoteId,
    required this.context,
    required this.id,
    this.workBoardSectionModel,
    this.index2,
    this.workboardModel,
  }) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  String? headerColor;

  Color? displayHeaderColor;

  WorkBoardSectionModel? itemdata;

  apiCall() {
    workboardBloc.subjectManageWorkboardDetailsList.sink.add(null);
    workboardBloc.getManageWorkBoardDetailsList(
      queryparams: {
        "userId": BlocProvider.of<UserModelBloc>(widget.context)
                .state
                .userModel
                ?.id ??
            '',
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            "HR",
        "id": widget.id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: (widget.isSquare == true)
          ? DEFAULT_LARGE_HORIZONTAL_PADDING
          : DEFAULT_PADDING * 0.5,
      color: (widget.color != null)
          ? widget.color?.withOpacity(0.3)
          : Colors.blue.shade100,
      child: Container(
        color: (widget.itemType == 3)
            ? (Colors.white)
            : ((widget.color != null)
                ? widget.color?.withOpacity(0.3)
                : Colors.blue.shade100),
        width: (widget.isSquare == true) ? 17.h : null,
        height: (widget.isSquare == true) ? 17.h : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                padding: DEFAULT_PADDING,
                decoration: BoxDecoration(
                  color: (widget.color != null) ? widget.color : Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(
                      widget.itemName ?? '',
                      style: TextStyle(color: Colors.black),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.message),
                          onTap: () {
                            Navigator.pushNamed(context, COMMENT_ROUTE,
                                arguments: ScreenArguments(
                                  ntstype: NTSType.workboard,
                                  arg1: widget.ntsNoteId ?? '',
                                )).then((value) => apiCall());

                            print('onTap :msg');
                          },
                        ),
                        GestureDetector(
                          child: Icon(Icons.list),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ItemTaskListScreen(),
                            ),
                          ),
                        ),
                        Container(
                          width: 15,
                          child: PopupMenuButton(
                            onSelected: (result) async {
                              if (result == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WorkBoardContentScreen(
                                      isEdit: true,
                                      id: widget.ntsNoteId ?? '',
                                      workBoardId: widget.workBoardId ?? '',
                                      workBoardSectionId:
                                          widget.sectionId ?? '',
                                      parentId: '',
                                      itemType: (widget.itemType)! - (1),
                                    ),
                                  ),
                                ).then((value) => apiCall());
                              }
                              if (result == 1) {}
                              if (result == 2) {
                                await workboardBloc.getCopyMoveItems(
                                  queryparams: {
                                    "workboardId": widget.workBoardId ?? '',
                                    "itemNoteId": widget.ntsNoteId ?? '',
                                  },
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CopyMoveScreen(
                                              addContentWorkBoardModel:
                                                  (workboardBloc
                                                          .subjectGetCopyMoveItems
                                                          .stream
                                                          .hasValue)
                                                      ? workboardBloc
                                                          .subjectGetCopyMoveItems
                                                          .stream
                                                          .value
                                                          ?.mapdata
                                                      : null,
                                            )));
                              }
                              if (result == 3) {
                                await workboardBloc
                                    .postDuplicateItem(queryParams: {
                                  "portalName":
                                      BlocProvider.of<UserModelBloc>(context)
                                              .state
                                              .extraUserInformation
                                              ?.portalType ??
                                          "HR",
                                  "workboardId": widget.workBoardId ?? '',
                                  "itemId": widget.ntsNoteId ?? '',
                                  "userId":
                                      BlocProvider.of<UserModelBloc>(context)
                                              .state
                                              .userModel
                                              ?.id ??
                                          '',
                                });
                                if (workboardBloc
                                    .subjectpostDuplicateItem.hasValue) {
                                  await displaySnackBar(
                                      context: context,
                                      text: (workboardBloc
                                                  .subjectpostDuplicateItem
                                                  .value
                                                  ?.isSuccess ==
                                              true)
                                          ? 'Duplicated Succesfully'
                                          : 'Duplication Failed');
                                }
                                apiCall();
                              }
                              if (result == 4) {}
                            },
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  value: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.delete),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text('Remove'),
                                      ],
                                    ),
                                    onTap: () {}),
                                PopupMenuItem(
                                  value: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.copy),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text('Copy/Move'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                    value: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.control_point_duplicate),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text('Duplicate'),
                                      ],
                                    ),
                                    onTap: () {}),
                                PopupMenuItem(
                                  value: 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      PopupMenuButton(
                                        child: Text('Size'),
                                        onSelected: (result) async {
                                          if (result == 1) {
                                            itemdata = widget
                                                .workBoardSectionModel
                                                ?.item?[widget.index2!];

                                            itemdata?.workBoardItemSize =
                                                "Standard";
                                            itemdata?.workBoardItemShape =
                                                "Square";
                                            widget.workboardModel?.boards =
                                                jsonEncode(widget
                                                    .workBoardSectionModel);

                                            workboardBloc
                                                .postUpdateWorkBoardSectionAndItem(
                                                    workboardModel:
                                                        widget.workboardModel);
                                            Navigator.of(context).pop();
                                            apiCall();
                                          }
                                          if (result == 2) {
                                            itemdata = widget
                                                .workBoardSectionModel
                                                ?.item?[widget.index2!];

                                            itemdata?.workBoardItemSize =
                                                "Wide";
                                            itemdata?.workBoardItemShape =
                                                "Square";
                                            widget.workboardModel?.boards =
                                                jsonEncode(widget
                                                    .workBoardSectionModel);
                                            workboardBloc
                                                .postUpdateWorkBoardSectionAndItem(
                                                    workboardModel:
                                                        widget.workboardModel);
                                            Navigator.of(context).pop();
                                            apiCall();
                                          }
                                        },
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    color: Colors.black,
                                                    height: 12,
                                                    width: 12,
                                                  ),
                                                  Text('Square'),
                                                ],
                                              ),
                                              value: 1,
                                            ),
                                            PopupMenuItem(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    color: Colors.black,
                                                    height: 12,
                                                    width: 18,
                                                  ),
                                                  Text('Rectangle'),
                                                ],
                                              ),
                                              value: 2,
                                            )
                                          ];
                                        },
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      PopupMenuButton(
                                        child: Text("Color"),
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem(
                                              value: 0,
                                              child: MaterialColorPicker(
                                                shrinkWrap: true,
                                                onColorChange:
                                                    (Color color) async {
                                                  // Handle color changes

                                                  setState(() {
                                                    headerColor =
                                                        '#${color.value.toRadixString(16).substring(2)}';
                                                    print(headerColor);

                                                    displayHeaderColor = color;
                                                  });
                                                  Navigator.of(context).pop();

                                                  itemdata = widget
                                                      .workBoardSectionModel
                                                      ?.item?[widget.index2!];
                                                  itemdata?.colorCode =
                                                      headerColor;

                                                  widget.workboardModel
                                                          ?.boards =
                                                      jsonEncode(widget
                                                          .workBoardSectionModel);

                                                  await workboardBloc
                                                      .postUpdateWorkBoardSectionAndItem(
                                                          workboardModel: widget
                                                              .workboardModel);

                                                  Navigator.of(context).pop();
                                                  apiCall();
                                                },
                                                selectedColor:
                                                    displayHeaderColor,
                                              ),
                                            ),
                                          ];
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: DEFAULT_PADDING * 0.5,
                child: ((widget.itemType == 3 ||
                            widget.itemType == 4 ||
                            widget.itemType == 5 ||
                            widget.itemType == 6) &&
                        widget.itemfileId != null)
                    ? Image.network(
                        APIEndpointConstants.PROFILE_PICTURE_ENDPOINT +
                            widget.itemfileId!,
                        fit: BoxFit.contain,
                      )
                    : Text(widget.itemContent ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String buttonText;
  final bool isIconBeforeText;
  final IconData? icon;
  final double? iconSize;
  final Color? color;

  final Color? textColor;

  final double? height;

  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.buttonText,
    this.isIconBeforeText = false,
    this.icon,
    this.iconSize,
    this.color,
    this.textColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color ?? null),
        padding: DEFAULT_HORIZONTAL_PADDING,
        margin: DEFAULT_PADDING * 0.5,
        child: Row(
          mainAxisAlignment: isIconBeforeText
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            isIconBeforeText
                ? Icon(
                    icon,
                    size: iconSize ?? 20,
                    color: Colors.white,
                  )
                : SizedBox(),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor ?? Colors.blue,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
