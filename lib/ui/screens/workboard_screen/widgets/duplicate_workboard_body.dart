import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/data/models/workboard_model/workboard_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/primary_button.dart';

class DuplicateWorkboardBody extends StatefulWidget {
  final String workBoardId;
  DuplicateWorkboardBody({
    Key? key,
    required this.workBoardId,
  }) : super(key: key);

  @override
  State<DuplicateWorkboardBody> createState() => _DuplicateWorkboardBodyState();
}

class _DuplicateWorkboardBodyState extends State<DuplicateWorkboardBody> {
  TextEditingController? workBoardNameController = TextEditingController();

  WorkboardModel? workBoardModel;

  bool? isCharts;
  bool? isComments;
  bool? isTasks;
  bool? isUserData;

  @override
  void initState() {
    super.initState();
    workboardBloc
      ..getDuplicateWorkBoard(
        queryparams: {
          "workBoardId": widget.workBoardId,
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: DEFAULT_LARGE_HORIZONTAL_PADDING,
          child: StreamBuilder<WorkBoardMapResponseModel?>(
            stream: workboardBloc.subjectGetDuplicateWorkBoard.stream,
            builder: (BuildContext context,
                AsyncSnapshot<WorkBoardMapResponseModel?> snapshot) {
              workBoardModel = snapshot.data?.mapdata;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Duplicate This Workboard",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'New WorkBoard Name',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextField(
                      controller: workBoardNameController,
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
                    SizedBox(
                      height: 3.h,
                    ),
                    Text("Data to copy"),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          tristate: true,
                          value: (isUserData != null)
                              ? isUserData
                              : workBoardModel?.isUserData,
                          onChanged: (value) {
                            isUserData = value;
                            setState(() {});
                          },
                        ),
                        Text("Users and Workboard Data")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          tristate: true,
                          value: (isCharts != null)
                              ? isCharts
                              : workBoardModel?.isCharts,
                          onChanged: (value) {
                            isCharts = value;
                            setState(() {});
                          },
                        ),
                        Text("Charts")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          tristate: true,
                          value: (isComments != null)
                              ? isComments
                              : workBoardModel?.isComments,
                          onChanged: (value) {
                            isComments = value;
                            setState(() {});
                          },
                        ),
                        Text("Comments")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          tristate: true,
                          value: (isTasks != null)
                              ? isTasks
                              : workBoardModel?.isTasks,
                          onChanged: (value) {
                            isTasks = value;
                            setState(() {});
                          },
                        ),
                        Text("Tasks")
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    PrimaryButton(
                      buttonText: 'Duplicate',
                      handleOnPressed: () {
                        workBoardModel?.id = widget.workBoardId;
                        workBoardModel?.isTasks = (isTasks != null)
                            ? isTasks
                            : workBoardModel?.isTasks;
                        workBoardModel?.isComments = (isComments != null)
                            ? isComments
                            : workBoardModel?.isComments;
                        workBoardModel?.isCharts = (isCharts != null)
                            ? isCharts
                            : workBoardModel?.isCharts;
                        workBoardModel?.isUserData = (isUserData != null)
                            ? isUserData
                            : workBoardModel?.isUserData;
                        workBoardModel?.workBoardName =
                            workBoardNameController?.text;

                        workboardBloc.postDuplicateWorkBoard(
                          workBoardModel: workBoardModel,
                        );
                      },
                      width: 100,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
