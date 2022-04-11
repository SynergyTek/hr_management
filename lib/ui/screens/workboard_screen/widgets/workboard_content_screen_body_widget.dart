import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hr_management/data/models/attacment/attachment_model.dart';
import 'package:hr_management/data/models/workboard_model/add_workboard_content_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/workboard_screen/widgets/section_workboard_details_list_widget.dart';
import 'package:hr_management/ui/widgets/attachment_view_webview.dart';
import 'package:hr_management/ui/widgets/custom_controls/attachment_widget.dart';
import 'package:hr_management/ui/widgets/custom_icons.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/api_endpoints.dart';
import '../whiteboard.dart';

class WorkBoardContentScreenBodyWidget extends StatefulWidget {
  final String id;
  final String workBoardId;
  final String workBoardSectionId;
  final String parentId;
  final int? itemType;
  final bool? isEdit;

  WorkBoardContentScreenBodyWidget({
    Key? key,
    required this.id,
    required this.workBoardId,
    required this.workBoardSectionId,
    required this.parentId,
    this.itemType,
    this.isEdit,
  }) : super(key: key);

  @override
  State<WorkBoardContentScreenBodyWidget> createState() =>
      _WorkBoardContentScreenBodyWidgetState();
}

class _WorkBoardContentScreenBodyWidgetState
    extends State<WorkBoardContentScreenBodyWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String? headerColor;

  Color? displayHeaderColor;

  bool? value;

  TextEditingController textcontroller = TextEditingController();
  TextEditingController imageAttachmentController =
      TextEditingController(text: 'Upload Image');

  TextEditingController videoAttachmentController =
      TextEditingController(text: 'Upload Video');

  TextEditingController fileAttachmentController =
      TextEditingController(text: 'Upload File');

  AddContentWorkBoardModel? addContentWorkBoardModel;

  TextEditingController indexCardController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 6, vsync: this, initialIndex: widget.itemType ?? 0);
    workboardBloc.getItemWorkBoardContent(queryparams: {
      "Id": (widget.id.isEmpty) ? null : widget.id,
      "workboardId": widget.workBoardId,
      "workBoardSectionId": widget.workBoardSectionId,
      "parentId": null,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: StreamBuilder<AddContentWorkBoardMapResponseModel?>(
          stream: workboardBloc.subjectGetItemWorkBoardContent.stream,
          builder: (BuildContext context,
              AsyncSnapshot<AddContentWorkBoardMapResponseModel?> snapshot) {
            if (snapshot.hasData) {
              addContentWorkBoardModel = snapshot.data?.mapdata;
              print(addContentWorkBoardModel);
              if (widget.isEdit == true && widget.itemType == 0) {
                textcontroller.text = addContentWorkBoardModel?.itemName;
                if (addContentWorkBoardModel?.colorCode != null) {
                  headerColor = addContentWorkBoardModel?.colorCode;
                }
              } else if (widget.isEdit == true && widget.itemType == 1) {
                indexCardController.text = addContentWorkBoardModel?.itemName;
                if (addContentWorkBoardModel?.colorCode != null) {
                  headerColor = addContentWorkBoardModel?.colorCode;
                }
              } else if (widget.isEdit == true && widget.itemType == 2) {
                if (addContentWorkBoardModel?.colorCode != null) {
                  headerColor = addContentWorkBoardModel?.colorCode;
                }

                WidgetsBinding.instance
                    ?.addPostFrameCallback((_) => _afterLayout(context));
              }
              return Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: ExpansionTile(
                            onExpansionChanged: (v) => value,
                            key: UniqueKey(),
                            tilePadding: EdgeInsets.zero,
                            title: Padding(
                              padding: DEFAULT_PADDING,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: (headerColor != null)
                                          ? hexToColor(headerColor ?? '')
                                          : Colors.black,
                                    ),
                                    margin: DEFAULT_PADDING,
                                    height: 3.h,
                                    width: 3.h,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Header Color',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              MaterialColorPicker(
                                shrinkWrap: true,
                                onColorChange: (Color color) {
                                  // Handle color changes
                                  headerColor =
                                      '#${color.value.toRadixString(16).substring(2)}';
                                  print(headerColor);
                                  setState(() {});
                                  displayHeaderColor = color;
                                  value = true;
                                },
                                selectedColor: displayHeaderColor,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ButtonWidget(
                                  onTap: () async {
                                    addContentWorkBoardModel?.colorCode =
                                        headerColor;

                                    if (textcontroller.text.isNotEmpty) {
                                      addContentWorkBoardModel?.itemContent =
                                          textcontroller.text;
                                      addContentWorkBoardModel?.itemType =
                                          "Text";
                                    }

                                    await workboardBloc
                                        .postItemWorkBoardContent(
                                            addContentWorkBoardModel:
                                                addContentWorkBoardModel);

                                    if (workboardBloc
                                        .subjectPostItemWorkBoardContent
                                        .stream
                                        .hasValue) {
                                      await displaySnackBar(
                                          context: context,
                                          text: workboardBloc
                                                      .subjectPostItemWorkBoardContent
                                                      .stream
                                                      .value
                                                      ?.isSuccess ==
                                                  true
                                              ? 'Added Successfully'
                                              : 'Error Occurred Please Try Again');
                                    } else {
                                      return Center(
                                          child: CustomProgressIndicator());
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  buttonText: 'Add'),
                              ButtonWidget(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  buttonText: 'Close'),
                            ],
                          ),
                        )
                      ],
                    ),
                    TabBar(
                      indicatorWeight: 4,
                      indicatorColor: Colors.blue,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(
                          text: 'Text',
                          icon: Icon(Icons.text_fields),
                        ),
                        Tab(
                          text: "Index Card",
                          icon: Icon(
                            CustomIcons.clipboard,
                          ),
                        ),
                        Tab(
                          text: "WhiteBoard",
                          icon: Icon(CustomIcons.game_board),
                        ),
                        Tab(
                          text: "Image",
                          icon: Icon(CustomIcons.image),
                        ),
                        Tab(
                          text: "Video",
                          icon: Icon(CustomIcons.video),
                        ),
                        Tab(
                          text: "File",
                          icon: Icon(CustomIcons.file),
                        ),
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TextTab(textcontroller: textcontroller),
                          IndexCardTab(
                              indexCardController: indexCardController),
                          WhiteBoardTab(),
                          ImageTab(
                              imageAttachmentController:
                                  imageAttachmentController),
                          VideoTab(
                              videoAttachmentController:
                                  videoAttachmentController),
                          FileTab(
                              fileAttachmentController:
                                  fileAttachmentController),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return CustomProgressIndicator();
            }
          },
        ),
      ),
    ]);
  }

  _afterLayout(BuildContext context) {
    // Image image = (APIEndpointConstants.BASE_URL +
    //     '/common/query/GetFile?fileId=' +
    //     addContentWorkBoardModel?.itemFileId);

    // TODO
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WhiteBoardWidget(
          imageString: APIEndpointConstants.BASE_URL +
              '/common/query/GetFile?fileId=' +
              addContentWorkBoardModel?.itemFileId,
        ),
      ),
    );
  }
}

class TextTab extends StatelessWidget {
  const TextTab({
    Key? key,
    required this.textcontroller,
  }) : super(key: key);

  final TextEditingController textcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DEFAULT_PADDING,
      child: TextField(
        autofocus: true,
        controller: textcontroller,
        expands: true,
        maxLines: null,
        minLines: null,
      ),
    );
  }
}

class WhiteBoardTab extends StatelessWidget {
  const WhiteBoardTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      margin: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Whiteboarding sessions are collaborative, realtime, and automatically save as you work.'),
          SizedBox(
            height: 2.h,
          ),
          ButtonWidget(
              height: 5.h,
              textColor: Colors.white,
              color: Colors.blue,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => WhiteBoardWidget()));
              },
              buttonText: 'Start A New WhiteBoard')
        ],
      ),
    );
  }
}

class ImageTab extends StatelessWidget {
  final TextEditingController imageAttachmentController;

  const ImageTab({
    Key? key,
    required this.imageAttachmentController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      margin: DEFAULT_LARGE_PADDING,
      child: Column(
        children: [
          DynamicAttchmentWidget(
            callBack: () {},
            fieldName: 'Image',
            controller: imageAttachmentController,
          ),
        ],
      ),
    );
  }
}

class VideoTab extends StatelessWidget {
  final TextEditingController videoAttachmentController;

  const VideoTab({
    Key? key,
    required this.videoAttachmentController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      margin: DEFAULT_LARGE_PADDING,
      child: Column(
        children: [
          DynamicAttchmentWidget(
            callBack: () {},
            fieldName: 'Video',
            controller: videoAttachmentController,
          ),
        ],
      ),
    );
  }
}

class FileTab extends StatelessWidget {
  final TextEditingController fileAttachmentController;

  const FileTab({
    Key? key,
    required this.fileAttachmentController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      margin: DEFAULT_LARGE_PADDING,
      child: Column(
        children: [
          DynamicAttchmentWidget(
            callBack: () {},
            fieldName: 'File',
            controller: fileAttachmentController,
          ),
        ],
      ),
    );
  }
}

class IndexCardTab extends StatelessWidget {
  final TextEditingController indexCardController;
  const IndexCardTab({
    Key? key,
    required this.indexCardController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DEFAULT_PADDING,
      child: TextField(
        autofocus: true,
        controller: indexCardController,
        expands: true,
        maxLines: null,
        minLines: null,
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
