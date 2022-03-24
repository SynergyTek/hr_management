import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sizer/sizer.dart';

class BlocTextBoxWidget extends StatelessWidget {
  final String? labelName;
  final String? fieldName;
  final bool? readonly;
  final bool? isRequired;
  final TextFieldBloc? textFieldBloc;
  final ValueChanged<String>? updateValue;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final Iterable<String>? autofillHints;
  final SuffixButton? suffixButton;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool? obscureText;

  const BlocTextBoxWidget(
      {this.labelName,
      this.fieldName,
      this.readonly,
      this.isRequired,
      this.textFieldBloc,
      this.updateValue,
      this.keyboardType,
      this.prefixIcon,
      this.autofillHints,
      this.suffixButton,
      this.onChanged,
      this.maxLines,
      this.obscureText,
      Key? key,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: labelName!.length > 30
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 2.w,
            ),
            prefixIcon!,
            SizedBox(
              width: 3.w,
            ),
            (isRequired != null && isRequired == true)
                ? Text('*',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 25))
                : Container(),
            (isRequired != null && isRequired == true)
                ? SizedBox(
                    width: 1.w,
                  )
                : Container(),
            Expanded(
              child: Text(
                labelName!,
                style: TextStyle(
                  fontSize: 11.sp,
                ),
              ),
            ),
          ],
        ),
        Container(
          color: readonly.toString() == 'true' ? Colors.grey.shade200 : null,
          // padding: const EdgeInsets.only(top: 0.0, left: 0.0, bottom: 1),
          child: TextFieldBlocBuilder(
            textAlign: TextAlign.justify,

            padding: EdgeInsets.zero,
            obscureText: obscureText ?? false,
            maxLines: maxLines ?? 1,
            key: Key(fieldName ?? ''),
            textFieldBloc: textFieldBloc as TextFieldBloc,
            readOnly: readonly ?? false,
            keyboardType: keyboardType ?? TextInputType.name,
            suffixButton: suffixButton,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  bottom: 20,
                  left: (readonly.toString() == 'true' ||
                          (isRequired == null && isRequired != true))
                      ? 48
                      : 60),
              // helperText: labelName,
              // helperText: labelName!.length >= 25 ? labelName : null,
              // helperMaxLines: 10,
              // labelText: labelName,
              // hintText: labelName,
              // prefixIcon: prefixIcon!,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(0),
              ),
              // suffixIcon: (isRequired != null && isRequired == true)
              //     ? Text('*',
              //         style: TextStyle(
              //             color: Theme.of(context).primaryColor, fontSize: 20))
              //     : Container(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // floatingLabelBehavior: labelName!.length >= 25
              //     ? FloatingLabelBehavior.never
              //     : FloatingLabelBehavior.auto,
              // labelStyle: (isRequired != null && isRequired == true)
              //     ? TextStyle(color: Theme.of(context).primaryColor)
              //     : null,
            ),

            // autofillHints: [
            //   AutofillHints.username,
            // ],
            onChanged: onChanged,
          ),
        ),
        Container(
          color: Colors.black54,
          height: 1,
          width: double.infinity,
        ),
      ],
    );
  }
}
