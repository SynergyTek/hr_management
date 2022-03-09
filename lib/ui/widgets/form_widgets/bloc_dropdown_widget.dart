import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocDropDownWidget extends StatelessWidget {
  final String? labelName;
  final DateTime? selectedDate;
  final Widget? prefixIcon;
  final SelectFieldBloc? selectFieldBloc;
  final Function? onChanged;

  const BlocDropDownWidget({
    this.labelName,
    this.selectedDate,
    this.prefixIcon,
    this.selectFieldBloc,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: DropdownFieldBlocBuilder<String>(
        selectFieldBloc: selectFieldBloc as SelectFieldBloc<String, dynamic>,
        showEmptyItem: false,
        decoration: InputDecoration(
          labelText: labelName,
          prefixIcon: prefixIcon ?? Icon(Icons.sentiment_satisfied),
        ),
        itemBuilder: (context, value) => value,
        onChanged: onChanged as void Function(String?)?,
      ),
    );
  }
}
