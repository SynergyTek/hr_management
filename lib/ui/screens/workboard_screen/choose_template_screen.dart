import 'package:flutter/material.dart';
import 'package:hr_management/data/models/workboard_model/workboard_model.dart';
import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../themes/theme_config.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/progress_indicator.dart';

typedef ListTapPressedCallBack = void Function(dynamic key);

class ChooseTempalteScreen extends StatefulWidget {
  final ListTapPressedCallBack? onListTap;

  ChooseTempalteScreen({
    Key? key,
    this.onListTap,
  }) : super(key: key);

  @override
  State<ChooseTempalteScreen> createState() => _ChooseTempalteScreenState();
}

class _ChooseTempalteScreenState extends State<ChooseTempalteScreen> {
  List<WorkboardModel>? chooseTemplateList;
  List<WorkboardModel>? drawerTemplateList;

  List<bool> value = [false, false, false, false];

  TextEditingController subjectController = TextEditingController();

  List<WorkboardModel>? isGeneralList;
  List<WorkboardModel>? isCalendarList;

  bool? isGeneral = false;
  bool? isCalendar = false;

  @override
  void initState() {
    super.initState();
    api();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: DEFAULT_LARGE_PADDING,
          margin: DEFAULT_LARGE_PADDING,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Templates',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              _searchField(),
              SizedBox(
                height: 2.h,
              ),
              StreamBuilder<WorkBoardResponseModel?>(
                stream: workboardBloc.subjectChooseTemplate.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<WorkBoardResponseModel?> snapshot) {
                  drawerTemplateList = snapshot.data?.data;
                  List<dynamic>? drawerList = drawerTemplateList
                      ?.map((e) => e.templateDisplayName)
                      .toSet()
                      .toList();

                  drawerList?.add('All');

                  if (snapshot.hasData) {
                    if (snapshot.data!.data == null ||
                        snapshot.data!.data?.length == 0) {
                      return EmptyListWidget();
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: drawerList?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Container(
                                padding: DEFAULT_PADDING,
                                margin: DEFAULT_PADDING,
                                child: Column(
                                  children: [
                                    Text(
                                      drawerList![index]!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                if (drawerList[index]! == "General") {
                                  isGeneralList = snapshot.data?.data
                                      ?.where((element) =>
                                          element.templateDisplayName ==
                                          "General")
                                      .toList();
                                  isGeneral = true;
                                  isCalendar = false;
                                  api();
                                  Navigator.of(context).pop();
                                } else if (drawerList[index]! == "Calendar") {
                                  isCalendarList = snapshot.data?.data
                                      ?.where((element) =>
                                          element.templateDisplayName ==
                                          "Calendar")
                                      .toList();
                                  isCalendar = true;
                                  isGeneral = false;
                                  api();
                                  Navigator.of(context).pop();
                                } else {
                                  isCalendar = false;
                                  isGeneral = false;
                                  api();
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ],
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
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text('Choose Template')),
      body: Container(
        padding: DEFAULT_LARGE_PADDING,
        child: StreamBuilder<WorkBoardResponseModel?>(
          stream: workboardBloc.subjectChooseTemplate.stream,
          builder: (
            context,
            AsyncSnapshot<WorkBoardResponseModel?> snapshot,
          ) {
            if (snapshot.hasData) {
              if (snapshot.data!.data == null ||
                  snapshot.data!.data?.length == 0) {
                return EmptyListWidget();
              }
              chooseTemplateList = snapshot.data!.data;

              if (isGeneral == true) {
                chooseTemplateList = isGeneralList;
              }

              if (isCalendar == true) {
                chooseTemplateList = isCalendarList;
              }
              return ListView.builder(
                itemCount: chooseTemplateList?.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    elevation: 10,
                    margin: DEFAULT_LARGE_VERTICAL_PADDING,
                    child: Padding(
                      padding: DEFAULT_PADDING,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              APIEndpointConstants.BASE_URL +
                                  '/common/query/GetFile?fileId=' +
                                  chooseTemplateList![index].contentImage!,
                            ),
                          ),
                          Text(
                            chooseTemplateList?[index].templateTypeNameString !=
                                    null
                                ? chooseTemplateList![index]
                                    .templateTypeNameString!
                                : "",
                            maxLines: 2,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            chooseTemplateList?[index].templateTypeNameString !=
                                    null
                                ? chooseTemplateList![index]
                                    .templateDescription!
                                : "",
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: value[index],
                                      onChanged: (v) {
                                        setState(
                                          () {
                                            value[index] = v!;
                                          },
                                        );
                                      },
                                    ),
                                    Flexible(
                                        child: Text('Include Sample Content')),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  child: Container(
                                    padding: DEFAULT_PADDING * 1.5,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    child: Text(
                                      'Choose Template',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onTap: () {
                                    if (widget.onListTap != null) {
                                      widget.onListTap!(
                                          chooseTemplateList?[index]);
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
    );
  }

  api() {
    workboardBloc..getChooseTemplate();
  }

  Widget _searchField() {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.blue),
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
}
