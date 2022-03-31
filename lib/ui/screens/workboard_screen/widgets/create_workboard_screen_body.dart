import 'package:flutter/material.dart';
import 'package:hr_management/data/models/workboard_model/workboard_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/workboard_screen/choose_template_screen.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/snack_bar.dart';

typedef ListTapPressedCallBack = void Function(dynamic key);

class CreateWorkBoardScreenBody extends StatefulWidget {
  final bool? isEdit;
  final String? workBoardId;

  CreateWorkBoardScreenBody({
    Key? key,
    this.isEdit,
    this.workBoardId,
  }) : super(key: key);

  @override
  State<CreateWorkBoardScreenBody> createState() =>
      _CreateWorkBoardScreenBodyState();
}

class _CreateWorkBoardScreenBodyState extends State<CreateWorkBoardScreenBody> {
  TextEditingController? workBoardNameController = TextEditingController();
  TextEditingController? chooseTemplateController = TextEditingController();

  int? _groupValue = -1;

  WorkboardModel? workBoardModel;

  @override
  void initState() {
    super.initState();
    api();
    if (widget.isEdit == true) {
      refresh();
    } else {
      chooseTemplateController?.text = "Basic";
    }
  }

  Future<void> api() async {
    workboardBloc.subjectCreateWorkboardList.sink.add(null);

    if (widget.isEdit == true) {
      await workboardBloc.getCreateWorkboardData(
          queryparams: {"workboardId": widget.workBoardId});
    } else {
      await workboardBloc.getCreateWorkboardData();
    }
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: StreamBuilder<WorkBoardMapResponseModel?>(
            stream: workboardBloc.subjectCreateWorkboardList.stream,
            builder: (BuildContext context,
                AsyncSnapshot<WorkBoardMapResponseModel?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.mapdata == null) {
                  return EmptyListWidget();
                }

                if (snapshot.data?.mapdata != null) {
                  workBoardModel = snapshot.data?.mapdata;
                  if (widget.isEdit == true) {
                    workBoardNameController?.text =
                        workBoardModel?.workBoardName ?? '';
                    print(workBoardModel?.workBoardName);
                  }
                }

                return Container(
                  margin: DEFAULT_LARGE_HORIZONTAL_PADDING,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          (widget.isEdit == true)
                              ? 'Edit WorkBoard'
                              : 'New WorkBoard',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          '1) Name Your WorkBoard',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 15,
                                  ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          controller: workBoardNameController,
                          onChanged: (v) {},
                          decoration: InputDecoration(
                            label: Text('Enter WorkBoard Name'),
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          '2) Choose a WorkBoard Type',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 15,
                                  ),
                        ),
                        ListTileTheme(
                          horizontalTitleGap: 1,
                          child: RadioListTile(
                            value: 0,
                            groupValue: _groupValue,
                            title: Text(
                              "Personal WorkBoard",
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            onChanged: (
                              int? newValue,
                            ) {
                              setState(() {
                                _groupValue = newValue;
                              });
                            },
                            activeColor: Colors.blue,
                            selected: (widget.isEdit == true)
                                ? ((workBoardModel?.workBoardType == 0)
                                    ? true
                                    : false)
                                : false,
                          ),
                        ),
                        ListTileTheme(
                          horizontalTitleGap: 1,
                          child: RadioListTile(
                              value: 1,
                              groupValue: _groupValue,
                              title: Text(
                                "Team WorkBoard",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                ),
                              ),
                              onChanged: (
                                int? newValue,
                              ) {
                                setState(() {
                                  _groupValue = newValue;
                                });
                              },
                              activeColor: Colors.blue,
                              selected: (widget.isEdit == true)
                                  ? ((workBoardModel?.workBoardType == 1)
                                      ? true
                                      : false)
                                  : false),
                        ),
                        Text(
                          '3) Templates',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontSize: 15),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Choose a template now or get started with a basic Work Board. You can change the template any time by clicking the templates button once you're in your Work Board. We have templates available for all types of business processes — Kanban, Agile, Design Thinking, and more!",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChooseTempalteScreen(
                                    onListTap: (dynamic value) {
                                      WorkboardModel _chooseTemplateModel =
                                          value;
                                      chooseTemplateController?.text =
                                          _chooseTemplateModel
                                              .templateTypeNameString!;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              child: Text(
                                'Choose Template',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                            (widget.isEdit == true &&
                                    chooseTemplateController!.text.isEmpty)
                                ? Text(
                                    'Template Selected -  ${workBoardModel?.templateCode ?? "No Data"} WorkBoard')
                                : Text(
                                    'Template Selected -  ${chooseTemplateController?.text ?? 'Basic'} WorkBoard'),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return CustomProgressIndicator();
              }
            },
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Flexible(
                child: PrimaryButton(
                  buttonText: 'Save WorkBoard',
                  handleOnPressed: () async {
                    workboardBloc.subjectPostManageWorkBoard.sink.add(null);
                    if (workBoardNameController!.text.isEmpty) {
                      return displaySnackBar(
                          context: context,
                          text: 'Please Enter WorkBoard Name');
                    }
                    if (_groupValue == -1) {
                      return displaySnackBar(
                          context: context,
                          text: 'Please Choose WorkBoard Type');
                    }
                    if (chooseTemplateController!.text.isEmpty) {
                      return displaySnackBar(
                          context: context,
                          text: 'Please Choose WorkBoard Template');
                    }
                    if (widget.isEdit == true) {
                      workBoardModel?.dataAction = 1;
                    }

                    workBoardModel?.portalName = "HR";
                    workBoardModel?.requestedByUserId =
                        "45bba746-3309-49b7-9c03-b5793369d73c";
                    workBoardModel?.workBoardName =
                        workBoardNameController?.text;
                    if (_groupValue == 0) {
                      workBoardModel?.workBoardType = 'Personal';
                    } else if (_groupValue == 1) {
                      workBoardModel?.workBoardType = 'Team';
                    }
                    workBoardModel?.templateCode =
                        chooseTemplateController?.text ?? "Basic";

                    await workboardBloc.postManageWorkBoard(
                        workBoardModel: workBoardModel);

                    if (workboardBloc.subjectPostManageWorkBoard.hasValue) {
                      if (workboardBloc
                              .subjectPostManageWorkBoard.value?.isSuccess ==
                          true) {
                        await displaySnackBar(
                            text: (widget.isEdit != true)
                                ? '${workBoardNameController?.text} WorkBoard Created Successfully'
                                : '${workBoardNameController?.text} WorkBoard Edited Successfully',
                            context: context);
                      }
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Flexible(
                child: PrimaryButton(
                  buttonText: 'Cancel',
                  handleOnPressed: () => Navigator.of(context).pop(),
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
