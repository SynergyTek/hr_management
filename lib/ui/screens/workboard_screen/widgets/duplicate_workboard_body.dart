import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/primary_button.dart';

class DuplicateWorkboardBody extends StatefulWidget {
  DuplicateWorkboardBody({Key? key}) : super(key: key);

  @override
  State<DuplicateWorkboardBody> createState() => _DuplicateWorkboardBodyState();
}

class _DuplicateWorkboardBodyState extends State<DuplicateWorkboardBody> {
  TextEditingController? workBoardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          margin: DEFAULT_LARGE_HORIZONTAL_PADDING,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  "Duplicate This Workboard",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text("Users and Workboard Data")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text("Comments")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
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
                  handleOnPressed: () {},
                  width: 100,
                ),
              ])))
    ]);
  }
}
