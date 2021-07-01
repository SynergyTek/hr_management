import 'package:flutter/material.dart';

class DropdownFormField<T> extends StatelessWidget {
  final String hint;
  dynamic value;
  final List<T> items;
  final Function onChanged;
  final Function validator;
  final Function onSaved;
  dynamic initialValue;
  final bool isExpanded;
  final Widget prefixWidget;

  DropdownFormField(
      {this.hint,
      dynamic value,
      this.items,
      this.onChanged,
      this.validator,
      dynamic initialValue,
      this.onSaved,
      this.isExpanded,
      this.prefixWidget}) {
    this.value = items.contains(value) ? value : null;
    this.initialValue = items.contains(value) ? value : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: FormField<T>(
        initialValue: initialValue,
        onSaved: (val) => onSaved,
        validator: validator,
        builder: (FormFieldState<T> state) {
          return InputDecorator(
            decoration: InputDecoration(
                prefixIcon: prefixWidget,
                prefixStyle: TextStyle(color: Theme.of(context).primaryColor),
                errorText: state.hasError ? state.errorText : null,
                errorStyle: TextStyle(fontSize: 12.0)),
            isEmpty: value == '' || value == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: value,
                hint: Text(hint == null ? "" : hint),
                isDense: true,
                onChanged: (dynamic newValue) {
                  state.didChange(newValue);
                  onChanged(newValue);
                },
                items: items.map((dynamic value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: isExpanded == true
                        ? new Text(
                            value.toString(),
                            style: Theme.of(context).textTheme.bodyText2,
                            // overflow: TextOverflow.ellipsis,
                          )
                        : Container(
                            width: 180.0,
                            child: new Text(
                              value.toString(),
                              style: Theme.of(context).textTheme.bodyText2,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
