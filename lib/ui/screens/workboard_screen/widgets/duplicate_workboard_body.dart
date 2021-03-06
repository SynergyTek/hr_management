import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/workboard_model/workboard_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/snack_bar.dart';

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

  bool showProgressIndicator = false;

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
              if (snapshot.hasData) {
                workBoardModel = snapshot.data?.mapdata;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Duplicate This Workboard",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                        handleOnPressed: () async {
                          workboardBloc.subjectPostDuplicateWorkBoard.sink
                              .add(null);
                          workBoardModel?.portalName = "HR";
                          workBoardModel?.requestedByUserId =
                              BlocProvider.of<UserModelBloc>(context)
                                      .state
                                      .userModel
                                      ?.id ??
                                  '';
                          workBoardModel?.workboardId = widget.workBoardId;
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
                          setState(() {
                            showProgressIndicator = true;
                          });

                          await workboardBloc.postDuplicateWorkBoard(
                            workBoardModel: workBoardModel,
                          );

                          if (workboardBloc
                              .subjectPostDuplicateWorkBoard.hasValue) {
                            if (workboardBloc.subjectPostDuplicateWorkBoard
                                    .value?.isSuccess ==
                                true) {
                              await displaySnackBar(
                                  text:
                                      'Duplicate ${workBoardNameController?.text} WorkBoard Created Successfully',
                                  context: context);
                            }
                          }
                          setState(() {
                            showProgressIndicator = false;
                          });
                          Navigator.of(context).pop();
                        },
                        width: 100,
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
        Visibility(
            visible: showProgressIndicator,
            child: Center(
              child: CustomProgressIndicator(loadingText: 'Please Wait'),
            ))
      ],
    );
  }
}
