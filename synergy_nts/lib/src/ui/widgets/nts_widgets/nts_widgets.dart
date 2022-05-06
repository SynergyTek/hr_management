// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_colors.dart';

class DynamicTextBoxWidget extends StatelessWidget {
  final String labelName;
  final String fieldName;
  final bool readonly;
  final TextEditingController controller;
  final ValueChanged<String> updateValue;

  const DynamicTextBoxWidget(this.labelName, this.fieldName, this.controller,
      this.readonly, this.updateValue);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: TextFormField(
            key: Key(fieldName),
            controller: controller,
            onChanged: (String val) {
              updateValue(val);
            },
            readOnly: readonly,
            //key: key,

            textInputAction: TextInputAction.done,
            //keyboardType: ,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.note),
              // border: OutlineInputBorder(),
              hintText: labelName,
              // hintStyle: Theme.of(context).textTheme.display3,
              labelText: labelName,
              errorStyle: const TextStyle(fontSize: 12.0),
            ),
            maxLines: 1),

        // validationMessage: "Enter Subject",
      ),
    );
  }
}

class DynamicNumberBoxWidget extends StatelessWidget {
  final String labelName;
  final String fieldName;
  final ValueChanged<String> updateValue;
  final TextEditingController controller;

  const DynamicNumberBoxWidget(
      this.labelName, this.fieldName, this.controller, this.updateValue);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter(
              RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'),
              allow: true)
        ],
        textAlign: TextAlign.left,
        key: Key(fieldName),
        controller: controller,
        onChanged: (String val) {
          updateValue(val);
        },
        textInputAction: TextInputAction.done,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.filter_1),
            hintText: labelName,
            labelText: labelName,
            errorStyle: const TextStyle(fontSize: 12.0)),
        maxLines: 1);
  }
}

class DynamicIntegerBoxWidget extends StatelessWidget {
  final String labelName;
  final String fieldName;
  final ValueChanged<String> updateValue;
  final TextEditingController controller;

  const DynamicIntegerBoxWidget(
      this.labelName, this.fieldName, this.controller, this.updateValue);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.left,
        key: Key(fieldName),
        controller: controller,
        onChanged: (String val) {
          updateValue(val);
        },
        textInputAction: TextInputAction.done,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.looks_one),
            // border: OutlineInputBorder(),
            hintText: labelName,
            labelText: labelName,
            errorStyle: const TextStyle(fontSize: 12.0)),
        maxLines: 1);
  }
}

class DynamicDateBoxWidget extends StatelessWidget {
  final String labelName;
  final String fieldName;

  final TextEditingController controller;

  const DynamicDateBoxWidget(this.labelName, this.fieldName, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: TextFormField(
            key: Key(fieldName),
            controller: controller,
            //key: key,

            textInputAction: TextInputAction.done,
            //keyboardType: ,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.filter_1),
                // border: OutlineInputBorder(),
                hintText: labelName,
                // hintStyle: Theme.of(context).textTheme.display3,
                labelText: labelName,
                errorStyle: const TextStyle(fontSize: 12.0)),
            maxLines: 1),

        // validationMessage: "Enter Subject",
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker(
      {Key? key,
      this.labelText,
      this.isReadonly,
      this.selectedDate,
      this.isRequired,
      this.selectDateToModel,
      this.selectDate})
      : super(key: key);

  final String? labelText;
  final bool? isReadonly;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? selectDate;
  final ValueChanged<DateTime>? selectDateToModel;
  final bool? isRequired;

  Future<void> _selectDate(BuildContext context) async {
    // isReadonly?():
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1970, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: Theme.of(context).primaryColor,
              onSurface: Colors.white,
            ),
            // dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      selectDate!(picked);
      selectDateToModel!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? valueStyle = Theme.of(context).textTheme.bodyText2;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 4,
          // child:  ListTile(
          //   leading: Icon(Icons.calendar_today),
          //   title: Text(labelText),
          //   subtitle: Text(selectedDate != null
          //       ?  DateFormat.yMMMd().format(selectedDate)
          //       : "Select Date"),
          //   onTap: () {
          //     _selectDate(context);
          //   },
          // ),
          child: _InputDropdown(
            isRequired: isRequired,
            labelText: labelText!,
            valueText: selectedDate != null
                ? DateFormat.yMMMd().format(selectedDate!)
                : "Select Date",
            valueStyle: valueStyle!,
            onPressed: isReadonly.toString() == 'true'
                ? () {}
                : () {
                    _selectDate(context);
                  },
          ),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key? key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed,
    this.isRequired,
  }) : super(key: key);

  final String? labelText;
  final String? valueText;
  final TextStyle? valueStyle;
  final VoidCallback? onPressed;
  final Widget? child;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    const Icon(
                      Icons.calendar_today,
                      color: AppThemeColor.iconColor,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    (isRequired != null && isRequired == true)
                        ? Text('*',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 25))
                        : Container(),
                    (isRequired != null && isRequired == true)
                        ? SizedBox(
                            width: 1.w,
                          )
                        : Container(),
                    Expanded(
                      child:
                          Text(labelText!, style: TextStyle(fontSize: 11.sp)),
                    ),
                  ],
                )
                    // InputDecorator(
                    //   decoration: InputDecoration(
                    //     labelStyle: TextStyle(fontSize: 15.sp),
                    //     contentPadding: EdgeInsets.zero,
                    //     icon: const Icon(Icons.calendar_today),
                    //     labelText: labelText,
                    //     suffixText:
                    //         (isRequired != null && isRequired == true) ? '*' : '',
                    //   ),
                    //   baseStyle: valueStyle,
                    //   textAlign: TextAlign.start,
                    // ),
                    ),
                Flexible(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      prefix: Center(
                        child: Text(
                          valueText!,
                          style: valueStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black54,
              height: 1,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicDateBox extends StatefulWidget {
  final String? name;
  final String? code;
  final bool? isReadonly;
  final bool? isRequired;
  final ValueChanged<DateTime>? selectDate;
  const DynamicDateBox({
    this.name,
    this.code,
    this.isReadonly,
    this.isRequired,
    Key? key,
    this.selectDate,
  }) : super(key: key);

  @override
  _DynamicDateBoxState createState() => _DynamicDateBoxState(
      // selectedDate: code != null ? DateTime.parse(code) : null,
      );
}

class _DynamicDateBoxState extends State<DynamicDateBox> {
  // String _value = '';

  DateTime? selectedDate;
  _DynamicDateBoxState({this.selectedDate});

  @override
  void initState() {
    super.initState();

    setState(() {
      selectedDate = widget.code == null ? null : DateTime.parse(widget.code!);
    });
  }

  // Future _selectDate() async {
  //   DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: this.selectedDate ??  DateTime.now(),
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     setState(() => _value = picked.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          widget.isReadonly.toString() == 'true' ? Colors.grey.shade200 : null,
      height: 12.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          DatePicker(
            isRequired: widget.isRequired,
            key: widget.key,
            labelText: widget.name,
            selectedDate: selectedDate,
            selectDateToModel: widget.selectDate,
            isReadonly: widget.isReadonly,
            selectDate: (DateTime date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ],
      ),
    );
  }
}

class DynamicTimeBox extends StatefulWidget {
  final String? name;
  final String? code;
  final ValueChanged<TimeOfDay>? selectTime;
  const DynamicTimeBox({this.name, this.code, Key? key, this.selectTime})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _DynamicTimeBoxState createState() => _DynamicTimeBoxState(
      selectedTime: code != null
          ? TimeOfDay(
              hour: int.parse(code!.split(":")[0]),
              minute: int.parse(code!.split(":")[1]))
          : null);
}

class _DynamicTimeBoxState extends State<DynamicTimeBox> {
  // String _value = '';
  TimeOfDay? selectedTime;
  _DynamicTimeBoxState({this.selectedTime});
  // Future _selectDate() async {
  //   DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: this.selectedDate ??  DateTime.now(),
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     setState(() => _value = picked.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width - 20,
      child: Center(
        child: Column(
          children: <Widget>[
            TimePicker(
              key: widget.key,
              labelText: widget.name,
              selectedTime: selectedTime,
              selectTimeToModel: widget.selectTime,
              selectTime: (TimeOfDay time) {
                setState(() {
                  selectedTime = time;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker(
      {Key? key,
      this.labelText,
      this.selectedTime,
      this.selectTimeToModel,
      this.selectTime})
      : super(key: key);

  final String? labelText;
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay>? selectTime;
  final ValueChanged<TimeOfDay>? selectTimeToModel;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  // TimeOfDay sellectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          widget.selectedTime ?? TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (picked != null && picked != widget.selectedTime) {
      widget.selectTime!(picked);
      widget.selectTimeToModel!(picked);
    }
  }

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked_s = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );

  //   if (picked_s != null && picked_s != selectedTime)
  //     // ignore: curly_braces_in_flow_control_structures
  //     setState(() {
  //       selectedTime = picked_s;
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    final TextStyle? valueStyle = Theme.of(context).textTheme.bodyText2;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: _InputDropdown(
            labelText: widget.labelText,
            valueText: widget.selectedTime != null
                ? '${widget.selectedTime?.format(context)}'
                // ?  DateFormat.yMMMd().format(selectTime)
                : "Select Time",
            valueStyle: valueStyle!,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),
        // const SizedBox(width: 12.0),
      ],
    );
  }
}

class DynamicCheckBoxValue extends StatefulWidget {
  final String? name;
  final String? code;
  final String? value;
  final ValueChanged<bool>? checkUpdate;
  final bool? readonly;
  const DynamicCheckBoxValue({
    this.name,
    this.code,
    Key? key,
    this.checkUpdate,
    this.value,
    this.readonly,
  }) : super(key: key);
  @override
  _DynamicCheckBoxValueState createState() {
    return _DynamicCheckBoxValueState();
  }
}

class _DynamicCheckBoxValueState extends State<DynamicCheckBoxValue> {
  bool _isChecked = false;
  @override
  void initState() {
    if (widget.value != null) {
      _isChecked = widget.value == 'true' ? true : false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 2.h),
        color:
            widget.readonly.toString() == 'true' ? Colors.grey.shade200 : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    widget.name!,
                  )),
            ),
            Checkbox(
              // secondary: const Icon(Icons.check),
              value: _isChecked,
              onChanged: (val) {
                if (widget.readonly.toString() != 'true') {
                  setState(() {
                    _isChecked = val!;
                    widget.checkUpdate!(val);
                  });
                }
              },
            ),
          ],
        ));
  }
}

class DynamicLink extends StatelessWidget {
  // NetworkHelper _networkHelper = NetworkHelper();
  final String? name;
  final String? code;
  const DynamicLink({this.name, this.code});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: name,
              style: const TextStyle(color: Colors.blue, fontSize: 15),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // _networkHelper.initConnectivity().then((value) {
                  //   if (value) {
                  //     var domainuri = ApiEnvironment()
                  //         .getDomainUri(GraphQLConfiguration.synergyClient);
                  //     launch(domainuri + code);
                  //   } else {
                  //     return networkRaisedToast(context);
                  //   }
                  // }, onError: (error) {
                  //   // print(error);
                  // });
                },
            ),
          ]),
        ),
      ),
    );
  }
}

class DynamicTextDisplay extends StatelessWidget {
  final String text;
  const DynamicTextDisplay({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: AppThemeColor.textColorDark,
          fontSize: 16,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class DynamicDateTimeBox extends StatefulWidget {
  final String? name;
  final String? code;
  final bool? isReadonly;
  final bool? isRequired;
  final ValueChanged<DateTime>? selectDate;
  final ValueChanged<TimeOfDay>? selectTime;
  const DynamicDateTimeBox({
    this.name,
    this.code,
    this.isReadonly,
    this.isRequired,
    Key? key,
    this.selectDate,
    this.selectTime,
  }) : super(key: key);

  @override
  _DynamicDateTimeBoxState createState() => _DynamicDateTimeBoxState();
}

class _DynamicDateTimeBoxState extends State<DynamicDateTimeBox> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  _DynamicDateTimeBoxState({
    this.selectedDate,
    this.selectedTime,
  });

  @override
  void initState() {
    super.initState();

    setState(() {
      selectedDate = widget.code == null || widget.code!.isEmpty
          ? null
          : widget.code!.contains('T')
              ? DateFormat('yyyy-MM-ddThh:mm:ss').parse(widget.code!)
              : DateFormat('yyyy-MM-dd hh:mm:ss').parse(widget.code!);
      // : DateFormat('dd MMM yyyy hh:mm a').parse(widget.code!);
      selectedTime = widget.code == null || widget.code!.isEmpty
          ? null
          : TimeOfDay.fromDateTime(widget.code!.contains('T')
              ? DateFormat('yyyy-MM-ddThh:mm:ss').parse(widget.code!)
              : widget.code!.contains(' ')
                  ? DateFormat('yyyy-MM-dd hh:mm:ss').parse(widget.code!)
                  : DateFormat('yyyy-MM-ddhh:mm:ss').parse(widget.code!));
      // DateFormat('dd MMM yyyy hh:mm a').parse(widget.code!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          widget.isReadonly.toString() == 'true' ? Colors.grey.shade200 : null,
      height: 16.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          DateTimePicker(
            isRequired: widget.isRequired,
            isReadonly: widget.isReadonly,
            key: widget.key,
            labelText: widget.name,
            selectedDate: selectedDate,
            selectDateToModel: widget.selectDate,
            selectDate: (DateTime date) {
              setState(() {
                selectedDate = date;
              });
            },
            selectedTime: selectedTime,
            selectTimeToModel: widget.selectTime,
            selectTime: (TimeOfDay time) {
              setState(() {
                selectedTime = time;
              });
            },
          ),
        ],
      ),
    );
  }
}

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    Key? key,
    this.labelText,
    this.isReadonly,
    this.isRequired,
    this.selectDate,
    this.selectedDate,
    this.selectDateToModel,
    this.selectTime,
    this.selectedTime,
    this.selectTimeToModel,
  }) : super(key: key);

  final String? labelText;
  final bool? isReadonly;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final ValueChanged<DateTime>? selectDate;
  final ValueChanged<DateTime>? selectDateToModel;
  final ValueChanged<TimeOfDay>? selectTime;
  final ValueChanged<TimeOfDay>? selectTimeToModel;
  final bool? isRequired;

  Future<void> _selectDate(BuildContext context) async {
    // isReadonly?():
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1970, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: Theme.of(context).primaryColor,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      selectDate!(picked);
      selectDateToModel!(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (picked != null && picked != selectedTime) {
      selectTime!(picked);
      selectTimeToModel!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? valueStyle = Theme.of(context).textTheme.bodyText2;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: _InputDropdown2(
            isRequired: isRequired,
            labelText: labelText!,
            valueTextDate: selectedDate != null
                ? DateFormat.yMMMd().format(selectedDate!)
                : "Select Date",
            valueTextTime: selectedTime != null
                ? '${selectedTime?.format(context)}'
                : "Select Time",
            valueStyle: valueStyle!,
            onPressedDate: isReadonly.toString() == 'true'
                ? () {}
                : () {
                    _selectDate(context);
                  },
            onPressedTime: isReadonly.toString() == 'true'
                ? () {}
                : () {
                    _selectTime(context);
                  },
          ),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}

class _InputDropdown2 extends StatelessWidget {
  const _InputDropdown2({
    Key? key,
    this.child,
    this.labelText,
    this.valueTextDate,
    this.valueTextTime,
    this.valueStyle,
    this.onPressedDate,
    this.onPressedTime,
    this.isRequired,
  }) : super(key: key);

  final String? labelText;
  final String? valueTextDate;
  final String? valueTextTime;
  final TextStyle? valueStyle;
  final VoidCallback? onPressedDate;
  final VoidCallback? onPressedTime;
  final Widget? child;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  const Icon(
                    Icons.calendar_today,
                    color: AppThemeColor.iconColor,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  (isRequired != null && isRequired == true)
                      ? Text('*',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25))
                      : Container(),
                  (isRequired != null && isRequired == true)
                      ? SizedBox(
                          width: 1.w,
                        )
                      : Container(),
                  Expanded(
                    child: Text(labelText!, style: TextStyle(fontSize: 11.sp)),
                  ),
                ],
              )),
              Flexible(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: onPressedDate,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          prefix: Center(
                            child: Text(
                              valueTextDate!,
                              style: valueStyle,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onPressedTime,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          prefix: Center(
                            child: Text(
                              valueTextTime!,
                              style: valueStyle,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black54,
            height: 1,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
