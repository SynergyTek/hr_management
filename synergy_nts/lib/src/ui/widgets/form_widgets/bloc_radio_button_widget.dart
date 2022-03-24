import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocRadioButtonWidget extends StatelessWidget {
  final String? labelName;
  final Widget? prefixIcon;
  final SelectFieldBloc? selectFieldBloc;

  const BlocRadioButtonWidget(
      {this.labelName, this.prefixIcon, this.selectFieldBloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: RadioButtonGroupFieldBlocBuilder<dynamic>(
        selectFieldBloc: selectFieldBloc!,
        decoration: InputDecoration(
          labelText: labelName,
          prefixIcon: prefixIcon ?? const SizedBox(),
        ),
        itemBuilder: (context, item) => item,
      ),
    );
  }
}
