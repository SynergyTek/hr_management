import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocCheckBoxWidget extends StatelessWidget {
  final String labelName;
  final BooleanFieldBloc booleanFieldBloc;
  final AlignmentGeometry alignment;

  const BlocCheckBoxWidget({
    this.labelName,
    this.booleanFieldBloc,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: CheckboxFieldBlocBuilder(
        booleanFieldBloc: booleanFieldBloc,
        body: Container(
          alignment: alignment ?? Alignment.centerLeft,
          child: Text(labelName),
        ),
      ),
    );
  }
}
