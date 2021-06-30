import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocNumberBoxWidget extends StatelessWidget {
  final String labelName;
  final String fieldName;
  final bool readonly;
  final TextFieldBloc textFieldBloc;
  final ValueChanged<String> updateValue;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Iterable<String> autofillHints;
  final SuffixButton suffixButton;
  final bool decimal;
  final TextAlign textAlign;
  final Function onChanged;

  const BlocNumberBoxWidget(
      {this.labelName,
      this.fieldName,
      this.readonly,
      this.textFieldBloc,
      this.updateValue,
      this.keyboardType,
      this.prefixIcon,
      this.autofillHints,
      this.suffixButton,
      this.decimal,
      this.textAlign,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: TextFieldBlocBuilder(
        key: Key(fieldName),
        textFieldBloc: textFieldBloc,
        readOnly: readonly,
        suffixButton: suffixButton,
        textAlign: textAlign ?? TextAlign.left,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        keyboardType: TextInputType.numberWithOptions(
          decimal: false,
          signed: false,
        ),

        // keyboardType: TextInputType.number,
        // TextInputType.numberWithOptions(decimal: decimal ?? true),
        decoration: InputDecoration(
          labelText: labelName,
          hintText: labelName,
          prefixIcon: prefixIcon ?? Icon(Icons.filter_1),
          errorStyle: TextStyle(fontSize: 12.0),
        ),
        autofillHints: [
          AutofillHints.username,
        ],
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              new RegExp('^\$|^(0|([1-9][0-9]{0,}))?\$'))
          // new RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'))
        ],
        onChanged: onChanged,
      ),
    );
  }
}
