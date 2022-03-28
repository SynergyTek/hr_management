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
  TextEditingController? descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          margin: DEFAULT_LARGE_HORIZONTAL_PADDING,
          padding: EdgeInsets.only(bottom: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    'Header Color',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    MaterialColorPicker(
                        onColorChange: (Color color) {
                          // Handle color changes
                        },
                        selectedColor: Colors.red),
                  ],
                ),
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
        ),
        Padding(
          padding: DEFAULT_HORIZONTAL_PADDING,
          child: PrimaryButton(
            buttonText: 'Save',
            handleOnPressed: () {},
            width: 14.w,
          ),
        ),
      ],
    );
  }
}
