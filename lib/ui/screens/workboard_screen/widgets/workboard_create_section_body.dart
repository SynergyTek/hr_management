import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_section_model.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

class CreateEditSectionWorkBoardBody extends StatefulWidget {
  final String sectionId;
  final String workboardId;
  final bool? isEdit;
  CreateEditSectionWorkBoardBody(
      {Key? key,
      required this.sectionId,
      required this.workboardId,
      this.isEdit})
      : super(key: key);

  @override
  State<CreateEditSectionWorkBoardBody> createState() =>
      _CreateEditSectionWorkBoardBodyState();
}

class _CreateEditSectionWorkBoardBodyState
    extends State<CreateEditSectionWorkBoardBody> {
  TextEditingController? digitController = TextEditingController();
  TextEditingController? titleController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();

  WorkBoardSectionModel? workBoardSectionModel;

  String? headerColor;

  Color? displayHeaderColor;

  bool? value;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    workboardBloc.getCreateSectionWorkboardData(
      queryparams: {
        "sectionId": widget.sectionId,
        "workboardId": widget.workboardId,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          child: StreamBuilder<WorkBoardSectionMapResponseModel?>(
              stream: workboardBloc.subjectCreateSectionWorkboardList.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<WorkBoardSectionMapResponseModel?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.mapdata != null) {
                    workBoardSectionModel = snapshot.data?.mapdata;
                    print(workBoardSectionModel);
                    if ((widget.isEdit == true &&
                        workBoardSectionModel?.sectionDigit != null &&
                        value == null)) {
                      digitController?.text =
                          workBoardSectionModel?.sectionDigit.toString() ?? '';
                      print(workBoardSectionModel?.sectionDigit);
                    }
                    if ((widget.isEdit == true &&
                        workBoardSectionModel?.sectionDescription != null &&
                        value == null)) {
                      descriptionController?.text =
                          workBoardSectionModel?.sectionDescription ?? '';
                      print(workBoardSectionModel?.sectionDescription);
                    }

                    if ((widget.isEdit == true &&
                        workBoardSectionModel?.sectionName != null &&
                        value == null)) {
                      titleController?.text =
                          workBoardSectionModel?.sectionName ?? '';
                      print(workBoardSectionModel?.sectionName);
                    }
                  }

                  return Container(
                    height: MediaQuery.of(context).size.height,
                    margin: DEFAULT_LARGE_HORIZONTAL_PADDING,
                    padding: EdgeInsets.only(bottom: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpansionTile(
                            key: UniqueKey(),
                            onExpansionChanged: (v) => value,
                            tilePadding: EdgeInsets.zero,
                            title: Row(
                              children: [
                                Text(
                                  'Header Color',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontSize: 18,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: (workBoardSectionModel
                                                    ?.headerColor !=
                                                null &&
                                            value != true)
                                        ? hexToColor(
                                            workBoardSectionModel?.headerColor)
                                        : (value == true)
                                            ? displayHeaderColor
                                            : Colors.black,
                                  ),
                                  margin: DEFAULT_PADDING,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              MaterialColorPicker(
                                shrinkWrap: true,
                                onColorChange: (Color color) {
                                  // Handle color changes

                                  setState(() {
                                    headerColor =
                                        '#${color.value.toRadixString(16).substring(2)}';
                                    print(headerColor);
                                    displayHeaderColor = color;
                                    value = true;
                                  });
                                },
                                selectedColor: (widget.isEdit == true &&
                                        workBoardSectionModel?.headerColor !=
                                            null &&
                                        displayHeaderColor == null)
                                    ? hexToColor(
                                        workBoardSectionModel?.headerColor)
                                    : displayHeaderColor,
                              ),
                            ],
                          ),
                          Text(
                            'Digit',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            controller: digitController,
                            onChanged: (v) {},
                            decoration: InputDecoration(
                              label: Text(
                                '',
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Text(
                            'Title',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextField(
                            controller: titleController,
                            onChanged: (v) {},
                            decoration: InputDecoration(
                              label: Text(
                                '',
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Text(
                            'Description',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextField(
                            maxLines: 5,
                            controller: descriptionController,
                            onChanged: (v) {},
                            decoration: InputDecoration(
                              label: Text(
                                '',
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return CustomProgressIndicator();
                }
              }),
        ),
        Padding(
          padding: DEFAULT_HORIZONTAL_PADDING,
          child: PrimaryButton(
            buttonText: 'Save',
            handleOnPressed: () async {
              if (headerColor == null) {
                return displaySnackBar(
                    context: context, text: 'Please Choose Header Color');
              }
              if (digitController!.text.isEmpty) {
                return displaySnackBar(
                    context: context, text: 'Please Enter Digit');
              }
              if (titleController!.text.isEmpty) {
                return displaySnackBar(
                    context: context, text: 'Please Enter Title');
              }
              if (descriptionController!.text.isEmpty) {
                return displaySnackBar(
                    context: context, text: 'Please Enter Description');
              }
              if (widget.isEdit == true) {
                workBoardSectionModel?.dataAction = "Edit";
              } else {
                workBoardSectionModel?.dataAction = "Create";
              }

              workBoardSectionModel?.portalName = "HR";
              workBoardSectionModel?.requestedByUserId =
                  BlocProvider.of<UserModelBloc>(context).state.userModel?.id ??
                      '';
              workBoardSectionModel?.sectionName = titleController?.text;
              workBoardSectionModel?.headerColor = headerColor;
              workBoardSectionModel?.sectionDigit =
                  int.parse(digitController!.text);
              workBoardSectionModel?.title = titleController?.text;
              workBoardSectionModel?.sectionDescription =
                  descriptionController?.text;
              await workboardBloc.postManageWorkBoardSection(
                  workBoardSectionModel: workBoardSectionModel);

              await displaySnackBar(
                  context: context,
                  text: 'Created ${titleController?.text} successfully');
              Navigator.of(context).pop();
            },
            width: 14.w,
          ),
        ),
      ],
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
