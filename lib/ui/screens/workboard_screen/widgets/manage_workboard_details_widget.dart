import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';

import '../../../../data/models/workboard_model/json_content_model.dart';
import '../../../../data/models/workboard_model/workboard_response_model.dart';
import '../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../logic/blocs/workboard_bloc/workboard_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';


class ManageWorkBoardDetailsList extends StatefulWidget {
  final String id;

  ManageWorkBoardDetailsList({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ManageWorkBoardDetailsList> createState() =>
      _ManageWorkBoardDetailsListState();
}

class _ManageWorkBoardDetailsListState
    extends State<ManageWorkBoardDetailsList> {
  @override
  void initState() {
    super.initState();
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
            WorkBoardMapResponseModel? list = snapshot.data;

            final jsonContentModel =
                jsonContentModelFromJson(snapshot.data?.mapdata?.jsonContent);

            List<JsonContentModel>? jsonContentList = jsonContentModel;

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  (list!.mapdata!.workBoardName != null)
                      ? list.mapdata!.workBoardName!
                      : '',
                  maxLines: 2,
                ),
              ),
              body: (jsonContentList.isNotEmpty && jsonContentList != null)
                  ? Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 10,
                                child: GridView.builder(
                                  padding: DEFAULT_PADDING,
                                  shrinkWrap: true,
                                  itemCount: jsonContentList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      elevation: 10,
                                      margin: DEFAULT_PADDING,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: DEFAULT_PADDING,
                                            decoration: BoxDecoration(
                                                color: Colors.blue.shade100,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                )),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      child: Text(
                                                          jsonContentList[index]
                                                                  .title ??
                                                              '')),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        child: Icon(Icons.add),
                                                        onTap: () {
                                                          print('add');
                                                        },
                                                      ),
                                                      GestureDetector(
                                                        child: Icon(Icons.edit),
                                                        onTap: () {
                                                          print('edit');
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(),
                                        ],
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 2.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonWidget(
                                buttonText: 'Collaboration',
                                onTap: () {},
                              ),
                              ButtonWidget(
                                isIconBeforeText: true,
                                icon: Icons.add,
                                buttonText: 'Create Section',
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  CREATE_SECTION_WORKBOARD_SCREEN,
                                ),
                              ),
                              ButtonWidget(
                                buttonText: 'Save',
                                onTap: () {},
                              ),
                              ButtonWidget(
                                buttonText: 'Back',
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
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
}

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String buttonText;
  final bool isIconBeforeText;

  final IconData? icon;

  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.buttonText,
    this.isIconBeforeText = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
          margin: DEFAULT_PADDING * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isIconBeforeText
                  ? Icon(
                      icon,
                      size: 20,
                      color: Colors.white,
                    )
                  : SizedBox(),
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          )),
    );
  }
}
