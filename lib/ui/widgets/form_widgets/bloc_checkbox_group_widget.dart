import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BlocCheckboxGroupWidget extends StatelessWidget {
  final String? labelName;
  final Widget? prefixIcon;
  final MultiSelectFieldBloc? multiSelectFieldBloc;

  const BlocCheckboxGroupWidget(
      {this.labelName, this.prefixIcon, this.multiSelectFieldBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: CheckboxGroupFieldBlocBuilder<String>(
        multiSelectFieldBloc:
            multiSelectFieldBloc as MultiSelectFieldBloc<String, dynamic>,
        itemBuilder: (context, item) => FieldItem(child: Text(item)),
        decoration: InputDecoration(
          labelText: labelName,
          prefixIcon: prefixIcon ?? SizedBox(),
        ),
      ),
    );
  }
}
