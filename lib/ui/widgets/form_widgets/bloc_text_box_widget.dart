import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocTextBoxWidget extends StatelessWidget {
  final String labelName;
  final String fieldName;
  final bool readonly;
  final TextFieldBloc textFieldBloc;
  final ValueChanged<String> updateValue;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Iterable<String> autofillHints;
  final SuffixButton suffixButton;
  final Function onChanged;
  final int maxLines;
  final bool obscureText;

  const BlocTextBoxWidget(
      {this.labelName,
      this.fieldName,
      this.readonly,
      this.textFieldBloc,
      this.updateValue,
      this.keyboardType,
      this.prefixIcon,
      this.autofillHints,
      this.suffixButton,
      this.onChanged,
      this.maxLines,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0, left: 0.0),
      child: TextFieldBlocBuilder(
        obscureText: obscureText ?? false,
        maxLines: maxLines ?? 1,
        key: Key(fieldName),
        textFieldBloc: textFieldBloc,
        readOnly: readonly ?? false,
        keyboardType: keyboardType ?? TextInputType.name,
        suffixButton: suffixButton,
        decoration: InputDecoration(
          labelText: labelName,
          hintText:  labelName,
          prefixIcon: prefixIcon,
        ),
        
        // autofillHints: [
        //   AutofillHints.username,
        // ],
        onChanged: onChanged,
      ),
    );
  }
}
