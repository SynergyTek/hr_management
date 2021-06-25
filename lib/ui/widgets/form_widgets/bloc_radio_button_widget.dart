import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocRadioButtonWidget extends StatelessWidget {
  final String labelName;
  final Widget prefixIcon;
  final SelectFieldBloc selectFieldBloc;

  const BlocRadioButtonWidget({
    this.labelName,
    this.prefixIcon,
    this.selectFieldBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: RadioButtonGroupFieldBlocBuilder<String>(
        selectFieldBloc: selectFieldBloc,
        decoration: InputDecoration(
          labelText: labelName,
          prefixIcon: prefixIcon ?? SizedBox(),
        ),
        itemBuilder: (context, item) => item,
      ),
    );
  }
}
