import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hr_management/data/helpers/hex_colot_convert.dart';
import 'package:hr_management/data/models/workboard_model/add_workboard_content_model.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/copymove_screen.dart';
import 'package:hr_management/ui/screens/workboard_screen/workboard_content_screen.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/workboard_model/workboard_response_model.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../logic/blocs/workboard_bloc/workboard_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

class SectionWorkBoardDetailsList extends StatefulWidget {
  final AddContentWorkBoardModel? addContentWorkBoardModel;
  final String id;
  final bool? isCopyMove;

  SectionWorkBoardDetailsList({
    Key? key,
    required this.id,
    this.isCopyMove,
    this.addContentWorkBoardModel,
  }) : super(key: key);

  @override
  State<SectionWorkBoardDetailsList> createState() =>
      _SectionWorkBoardDetailsListState();
}

class _SectionWorkBoardDetailsListState
    extends State<SectionWorkBoardDetailsList> {
  WorkBoardMapResponseModel? workBoardMapResponseModel;

  int? jsonIndex;

  ScrollController scrollController = ScrollController();

  var workBoardSectionsList;

  var itemList;

  var itemContent;

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
        "portalName": "HR",
        "id": widget.id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StreamBuilder<WorkBoardMapResponseModel?>(
        stream: workboardBloc.subjectManageWorkboardDetailsList.stream,
        builder: (BuildContext context,
            AsyncSnapshot<WorkBoardMapResponseModel?> snapshot) {
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
                  actions: (workBoardSectionsList!.isNotEmpty &&
                          workBoardSectionsList != null)
                      ? [
                          (widget.isCopyMove == false)
                              ? ButtonWidget(
                                  buttonText: 'Save',
                                  onTap: () {},
                                )
                              : SizedBox(),
                        ]
                      : []),
              body:
                  (workBoardSectionsList!.isNotEmpty &&
                          workBoardSectionsList != null)
                      ? Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              margin: DEFAULT_PADDING,
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                children: [
                                  (widget.isCopyMove == true)
                                      ? SizedBox(
                                          height: 3.h,
                                        )
                                      : SizedBox(),
                                  Flexible(
                                    flex: 10,
                                    child: GridView.builder(
                                      controller: scrollController,
                                      padding: DEFAULT_PADDING * 0.5,
                                      shrinkWrap: true,
                                      itemCount: workBoardSectionsList?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        jsonIndex = index;
                                        return Card(
                                          color: (widget.isCopyMove == true)
                                              ? (workBoardSectionsList?[index]
                                                          ['HeaderColor'] !=
                                                      null)
                                                  ?
                                                  // Colors.grey.shade100
                                                  hexToColor(
                                                          workBoardSectionsList?[
                                                                  index]
                                                              ['HeaderColor'])
                                                      .withOpacity(0.2)
                                                  : Colors.grey.shade100
                                              : null,
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
                                                              ['HeaderColor'] !=
                                                          null)
                                                      ? hexToColor(
                                                          workBoardSectionsList?[
                                                                  index]
                                                              ['HeaderColor'])
                                                      : Colors.blueGrey,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    topRight:
                                                        Radius.circular(16),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
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
                                                                          [
                                                                          'SectionDigit']
                                                                      .toString() ??
                                                                  '',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '.',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                workBoardSectionsList?[
                                                                            index]
                                                                        [
                                                                        'SectionName'] ??
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
                                                          (widget.isCopyMove ==
                                                                  false)
                                                              ? GestureDetector(
                                                                  child: Icon(
                                                                    Icons.add,
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (_) =>
                                                                                WorkBoardContentScreen(
                                                                          isEdit:
                                                                              false,
                                                                          id: '',
                                                                          parentId:
                                                                              '',
                                                                          workBoardId:
                                                                              widget.id,
                                                                          workBoardSectionId:
                                                                              workBoardSectionsList?[index]['Id'],
                                                                        ),
                                                                      ),
                                                                    ).then((value) =>
                                                                        apiCall());
                                                                    print(
                                                                        'add');
                                                                  },
                                                                )
                                                              : ButtonWidget(
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  height: 5.h,
                                                                  color: Colors
                                                                      .black54,
                                                                  onTap: () {
                                                                    workboardBloc
                                                                        .postSharingMoveCopy(
                                                                            queryparams: {
                                                                          "portalName":
                                                                              "HR",
                                                                          "secId":
                                                                              workBoardSectionsList?[index]['Id'],
                                                                          "workboardId":
                                                                              workBoardSectionsList?[index]["WorkBoardId"],
                                                                          "userId":
                                                                              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
                                                                          "postAction":
                                                                              "Move",
                                                                          "workboardItemId": widget
                                                                              .addContentWorkBoardModel
                                                                              ?.workBoardItemId,
                                                                        });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  buttonText:
                                                                      'Move'),
                                                          (widget.isCopyMove ==
                                                                  false)
                                                              ? GestureDetector(
                                                                  child: Icon(
                                                                      Icons
                                                                          .edit),
                                                                  onTap: () {
                                                                    print(
                                                                        'edit');
                                                                    Navigator
                                                                        .pushNamed(
                                                                      context,
                                                                      CREATE_EDIT_SECTION_WORKBOARD_SCREEN,
                                                                      arguments:
                                                                          ScreenArguments(
                                                                        arg1: workBoardSectionsList?[index]
                                                                            [
                                                                            'Id'],
                                                                        arg2: workBoardMapResponseModel
                                                                            ?.mapdata
                                                                            ?.id,
                                                                        val1:
                                                                            true,
                                                                      ),
                                                                    ).then((value) =>
                                                                        apiCall());
                                                                  },
                                                                )
                                                              : ButtonWidget(
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  height: 5.h,
                                                                  color: Colors
                                                                      .black54,
                                                                  onTap: () {
                                                                    workboardBloc
                                                                        .postSharingMoveCopy(
                                                                            queryparams: {
                                                                          "portalName":
                                                                              "HR",
                                                                          "secId":
                                                                              workBoardSectionsList?[index]['Id'],
                                                                          "workboardId":
                                                                              workBoardSectionsList?[index]["WorkBoardId"],
                                                                          "userId":
                                                                              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
                                                                          "postAction":
                                                                              "Copy",
                                                                          "workboardItemId": widget
                                                                              .addContentWorkBoardModel
                                                                              ?.workBoardItemId,
                                                                        });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  buttonText:
                                                                      'Copy'),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              (widget.isCopyMove == false)
                                                  ? Expanded(
                                                      child: Container(
                                                        child: ListView.builder(
                                                          controller:
                                                              scrollController,
                                                          itemCount:
                                                              workBoardSectionsList?[
                                                                          index]
                                                                      ['item']
                                                                  ?.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index2) {
                                                            itemList =
                                                                workBoardSectionsList?[
                                                                        index]
                                                                    ['item'];

                                                            return Column(
                                                              children: [
                                                                ItemWidget(
                                                                  context:
                                                                      context,
                                                                  id: widget.id,
                                                                  isSquare: (itemList[index2]['WorkBoardItemShape'] ==
                                                                              0 &&
                                                                          itemList[index2]['WorkBoardItemSize'] ==
                                                                              2)
                                                                      ? true
                                                                      : false,
                                                                  ntsNoteId: itemList[
                                                                          index2]
                                                                      [
                                                                      'NtsNoteId'],
                                                                  workBoardId:
                                                                      workBoardMapResponseModel
                                                                          ?.mapdata
                                                                          ?.id,
                                                                  sectionId:
                                                                      itemList[
                                                                              index2]
                                                                          [
                                                                          'Id'],
                                                                  itemfileId: itemList[
                                                                          index2]
                                                                      [
                                                                      'ItemFileId'],
                                                                  itemType: itemList[
                                                                          index2]
                                                                      [
                                                                      'ItemType'],
                                                                  color: (itemList?[index2]
                                                                              [
                                                                              'ColorCode'] !=
                                                                          null)
                                                                      ? hexToColor(
                                                                          itemList?[index2]
                                                                              [
                                                                              'ColorCode'],
                                                                        )
                                                                      : null,
                                                                  itemName:
                                                                      itemList?[index2]
                                                                              [
                                                                              'ItemName'] ??
                                                                          '',
                                                                  itemContent:
                                                                      (itemList?[index2]
                                                                              [
                                                                              'ItemContent'] ??
                                                                          ''),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(),
                                            ],
                                          ),
                                        );
                                      },
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio:
                                            (widget.isCopyMove == false)
                                                ? 0.6
                                                : 4.2,
                                        crossAxisCount:
                                            (widget.isCopyMove == false)
                                                ? 2
                                                : 1,
                                      ),
                                    ),
                                  ),
                                  (widget.isCopyMove == false)
                                      ? Flexible(
                                          child: SizedBox(
                                            height: 2.h,
                                          ),
                                        )
                                      : SizedBox(),
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
      backgroundColor: Colors.blue[900],
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
          onTap: () =>
              Navigator.pushNamed(context, CREATE_EDIT_SECTION_WORKBOARD_SCREEN,
                  arguments: ScreenArguments(
                    arg1: workBoardSectionsList?[jsonIndex]['Id'],
                    arg2: workBoardMapResponseModel?.mapdata?.id,
                    val1: false,
                  )).then((value) => apiCall()),
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

class ItemWidget extends StatelessWidget {
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
  }) : super(key: key);

  apiCall() {
    workboardBloc.subjectManageWorkboardDetailsList.sink.add(null);
    workboardBloc.getManageWorkBoardDetailsList(
      queryparams: {
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "portalName": "HR",
        "id": id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: (isSquare == true)
          ? DEFAULT_LARGE_HORIZONTAL_PADDING
          : DEFAULT_PADDING * 0.5,
      color: (color != null) ? color?.withOpacity(0.3) : Colors.blue.shade100,
      child: Container(
        color: (itemType == 3)
            ? (Colors.white)
            : ((color != null)
                ? color?.withOpacity(0.3)
                : Colors.blue.shade100),
        height: (isSquare == true) ? 17.h : 14.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: DEFAULT_PADDING,
              decoration: BoxDecoration(
                color: (color != null) ? color : Colors.blue,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      itemName ?? '',
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
                                  arg1: ntsNoteId ?? '',
                                )).then((value) => apiCall());

                            print('onTap :msg');
                          },
                        ),
                        GestureDetector(
                          child: Icon(Icons.list),
                          onTap: () {
                            print('onTap :list');
                          },
                        ),
                        Container(
                          width: 15,
                          alignment: Alignment.topRight,
                          child: PopupMenuButton(
                            onSelected: (result) async {
                              if (result == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WorkBoardContentScreen(
                                      isEdit: true,
                                      id: ntsNoteId ?? '',
                                      workBoardId: workBoardId ?? '',
                                      workBoardSectionId: sectionId ?? '',
                                      parentId: '',
                                      itemType: (itemType)! - (1),
                                    ),
                                  ),
                                ).then((value) => apiCall());
                              }
                              if (result == 1) {}
                              if (result == 2) {
                                await workboardBloc.getCopyMoveItems(
                                  queryparams: {
                                    "workboardId": workBoardId ?? '',
                                    "itemNoteId": ntsNoteId ?? '',
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
                                            ))).then((value) => apiCall());
                              }
                              if (result == 3) {
                                await workboardBloc
                                    .postDuplicateItem(queryParams: {
                                  "portalName": "HR",
                                  "workboardId": workBoardId ?? '',
                                  "itemId": ntsNoteId ?? '',
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
                                      GestureDetector(
                                        child: Text('Size'),
                                        onTap: () {
                                          print('size');
                                        },
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      GestureDetector(
                                        child: Text('Color'),
                                        onTap: () {
                                          print('Color');
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: DEFAULT_PADDING * 0.5,
                child: Column(
                  children: [
                    Expanded(
                        child: (itemType == 3)
                            ? Image.network(APIEndpointConstants.BASE_URL +
                                '/common/query/GetFile?fileId=' +
                                itemfileId!)
                            : Text(itemContent ?? '')),
                  ],
                ),
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
