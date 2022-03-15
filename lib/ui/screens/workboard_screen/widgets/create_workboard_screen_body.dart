import 'package:flutter/material.dart';
import 'package:hr_management/logic/blocs/workboard_bloc/workboard_bloc.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../../routes/route_constants.dart';

class CreateWorkBoardScreenBody extends StatefulWidget {
  CreateWorkBoardScreenBody({Key? key}) : super(key: key);

  @override
  State<CreateWorkBoardScreenBody> createState() =>
      _CreateWorkBoardScreenBodyState();
}

class _CreateWorkBoardScreenBodyState extends State<CreateWorkBoardScreenBody> {
  TextEditingController? workBoardNameController = TextEditingController();
  TextEditingController? chooseTemplateController =
      TextEditingController(text: 'Basic');

  int _groupValue = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // workboardBloc.getCreateWorkboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: DEFAULT_LARGE_HORIZONTAL_PADDING,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'New WorkBoard',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '1) Name Your WorkBoard',
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
                      'Enter Your WorkBoard Name',
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
                  height: 1.h,
                ),
                Text(
                  '2) Choose a WorkBoard Type',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
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
                    ) =>
                        setState(
                      () => _groupValue = newValue!,
                    ),
                    activeColor: Colors.blue,
                    selected: false,
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
                    onChanged: (int? newValue) => setState(
                      () => _groupValue = newValue!,
                    ),
                    activeColor: Colors.blue,
                    selected: false,
                  ),
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
                      onTap: () => Navigator.of(context).pushNamed(
                        NTS_DROPDOWN,
                        arguments: ScreenArguments(
                          arg1: APIEndpointConstants.CHOOSE_TEMPLATE,
                          arg2: 'Id',
                          arg3: 'TemplateTypeName',
                          arg4: 'Choose Template',
                          func: (dynamic value) {
                            ntsDdBloc.subject.sink.add(null);
                            NTSDropdownModel _chooseTemplateModel = value;
                            chooseTemplateController?.text =
                                _chooseTemplateModel.name!;
                            setState(() {});
                          },
                        ),
                      ),
                      child: Text(
                        'Choose Template',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    Text(
                        'Template - ${chooseTemplateController?.text} WorkBoard'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Flexible(
                child: PrimaryButton(
                  buttonText: 'Save WorkBoard',
                  handleOnPressed: () {},
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
