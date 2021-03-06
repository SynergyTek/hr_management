import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

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
      child: new Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: new TextFormField(
            key: new Key(fieldName),
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
              prefixIcon: Icon(Icons.note),
              // border: OutlineInputBorder(),
              hintText: labelName,
              // hintStyle: Theme.of(context).textTheme.display3,
              labelText: labelName,
              errorStyle: TextStyle(fontSize: 12.0),
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
    return new TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter(
              RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'),
              allow: true)
        ],
        textAlign: TextAlign.left,
        key: new Key(fieldName),
        controller: controller,
        onChanged: (String val) {
          updateValue(val);
        },
        textInputAction: TextInputAction.done,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.filter_1),
            hintText: labelName,
            labelText: labelName,
            errorStyle: TextStyle(fontSize: 12.0)),
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
    return new TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.left,
        key: new Key(fieldName),
        controller: controller,
        onChanged: (String val) {
          updateValue(val);
        },
        textInputAction: TextInputAction.done,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.looks_one),
            // border: OutlineInputBorder(),
            hintText: labelName,
            labelText: labelName,
            errorStyle: TextStyle(fontSize: 12.0)),
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
      child: new Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: new TextFormField(
            key: new Key(fieldName),
            controller: controller,
            //key: key,

            textInputAction: TextInputAction.done,
            //keyboardType: ,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.filter_1),
                // border: OutlineInputBorder(),
                hintText: labelName,
                // hintStyle: Theme.of(context).textTheme.display3,
                labelText: labelName,
                errorStyle: TextStyle(fontSize: 12.0)),
            maxLines: 1),

        // validationMessage: "Enter Subject",
      ),
    );
  }
}

class DateTimePicker extends StatelessWidget {
  const DateTimePicker(
      {Key? key,
      this.labelText,
      this.selectedDate,
      this.selectDateToModel,
      this.selectDate})
      : super(key: key);

  final String? labelText;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? selectDate;
  final ValueChanged<DateTime>? selectDateToModel;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? new DateTime.now(),
      firstDate: new DateTime(1970, 8),
      lastDate: new DateTime(2101),
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
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          // child: new ListTile(
          //   leading: Icon(Icons.calendar_today),
          //   title: Text(labelText),
          //   subtitle: Text(selectedDate != null
          //       ? new DateFormat.yMMMd().format(selectedDate)
          //       : "Select Date"),
          //   onTap: () {
          //     _selectDate(context);
          //   },
          // ),
          child: new _InputDropdown(
            labelText: labelText,
            valueText: selectedDate != null
                ? new DateFormat.yMMMd().format(selectedDate!)
                : "Select Date",
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
      ],
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key? key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String? labelText;
  final String? valueText;
  final TextStyle? valueStyle;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
            child: new InputDecorator(
              decoration: new InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: labelText,
              ),
              baseStyle: valueStyle,
              child: Text(valueText!, style: valueStyle),
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicDateTimeBox extends StatefulWidget {
  final String? name;
  final String? code;
  final ValueChanged<DateTime>? selectDate;
  DynamicDateTimeBox({
    this.name,
    this.code,
    Key? key,
    this.selectDate,
  }) : super(key: key);

  @override
  _DynamicDateTimeBoxState createState() => _DynamicDateTimeBoxState(
      // selectedDate: code != null ? DateTime.parse(code) : null,
      );
}

class _DynamicDateTimeBoxState extends State<DynamicDateTimeBox> {
  // String _value = '';

  DateTime? selectedDate;
  _DynamicDateTimeBoxState({this.selectedDate});

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
  //       initialDate: this.selectedDate ?? new DateTime.now(),
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     setState(() => _value = picked.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 11.h,
      width: MediaQuery.of(context).size.width,
      child: new Center(
        child: new Column(
          children: <Widget>[
            new DateTimePicker(
              key: widget.key,
              labelText: widget.name,
              selectedDate: selectedDate,
              selectDateToModel: widget.selectDate,
              selectDate: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicTimeBox extends StatefulWidget {
  final String? name;
  final String? code;
  final ValueChanged<TimeOfDay>? selectTime;
  DynamicTimeBox({this.name, this.code, Key? key, this.selectTime})
      : super(key: key);

  @override
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
  //       initialDate: this.selectedDate ?? new DateTime.now(),
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     setState(() => _value = picked.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 80,
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: new Center(
        child: new Column(
          children: <Widget>[
            new TimePicker(
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

class TimePicker extends StatelessWidget {
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

  Future<void> _selectDate(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (picked != null && picked != selectedTime) {
      selectTime!(picked);
      selectTimeToModel!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? valueStyle = Theme.of(context).textTheme.bodyText2;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: new _InputDropdown(
            labelText: labelText,
            valueText: selectTime != null
                ? selectTime.toString()
                // ? new DateFormat.yMMMd().format(selectTime)
                : "Select Date",
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
      ],
    );
  }
}

class DynamicCheckBoxValue extends StatefulWidget {
  final String? name;
  final String? code;
  final ValueChanged<bool?>? checkUpdate;
  DynamicCheckBoxValue({this.name, this.code, Key? key, this.checkUpdate})
      : super(key: key);
  @override
  _DynamicCheckBoxValueState createState() {
    return new _DynamicCheckBoxValueState();
  }
}

class _DynamicCheckBoxValueState extends State<DynamicCheckBoxValue> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new CheckboxListTile(
      secondary: Icon(Icons.check),
      title: new Text(widget.name!),
      value: _isChecked,
      onChanged: (val) {
        setState(() {
          _isChecked = val;
          widget.checkUpdate!(val);
        });
      },
    ));
  }
}

class DynamicLink extends StatelessWidget {
  // NetworkHelper _networkHelper = NetworkHelper();
  final String? name;
  final String? code;
  DynamicLink({this.name, this.code});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Padding(
        padding: const EdgeInsets.all(15.0),
        child: new RichText(
          text: new TextSpan(children: [
            new TextSpan(
              text: name,
              style: new TextStyle(color: Colors.blue, fontSize: 15),
              recognizer: new TapGestureRecognizer()
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
