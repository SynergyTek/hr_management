import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

class CreateSectionWorkBoardBody extends StatefulWidget {
  CreateSectionWorkBoardBody({Key? key}) : super(key: key);

  @override
  State<CreateSectionWorkBoardBody> createState() =>
      _CreateSectionWorkBoardBodyState();
}

class _CreateSectionWorkBoardBodyState
    extends State<CreateSectionWorkBoardBody> {
  TextEditingController? digitController = TextEditingController();
  TextEditingController? titleController = TextEditingController();

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
                  'Header Color',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                MaterialColorPicker(
                    onColorChange: (Color color) {
                      // Handle color changes
                    },
                    selectedColor: Colors.red),
                Text(
                  'Digit',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                  style: Theme.of(context).textTheme.headline6?.copyWith(
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
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextField(
                  maxLines: 5,
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
                SizedBox(
                  height: 2.h,
                ),
                PrimaryButton(
                  buttonText: 'Save',
                  handleOnPressed: () {},
                  width: 100,
                ),
              ])))
    ]);
  }
}
