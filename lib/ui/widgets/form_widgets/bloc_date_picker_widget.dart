import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocDatePickerWidget extends StatelessWidget {
  final String labelName;
  final InputFieldBloc inputFieldBloc;
  final DateTime selectedDate;
  final Widget prefixIcon;
  final bool canSelectTime;

  const BlocDatePickerWidget({
    this.labelName,
    this.inputFieldBloc,
    this.selectedDate,
    this.prefixIcon,
    this.canSelectTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: DateTimeFieldBlocBuilder(
        canSelectTime: canSelectTime ?? false,
        dateTimeFieldBloc: inputFieldBloc,
        format: DateFormat(canSelectTime ? 'dd-MM-yyyy  hh:mm' : 'dd-MM-yyyy'),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialDate: selectedDate ?? new DateTime.now(),
        decoration: InputDecoration(
          labelText: labelName,
          prefixIcon: prefixIcon ?? Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
