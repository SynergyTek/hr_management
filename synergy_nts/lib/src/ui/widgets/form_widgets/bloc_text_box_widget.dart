// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:sizer/sizer.dart';

// class BlocTextBoxWidget extends StatelessWidget {
//   final String? labelName;
//   final String? fieldName;
//   final bool? readonly;
//   final bool? isRequired;
//   final TextFieldBloc? textFieldBloc;
//   final ValueChanged<String>? updateValue;
//   final TextInputType? keyboardType;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;

//   final Iterable<String>? autofillHints;
//   final SuffixButton? suffixButton;
//   final void Function(String)? onChanged;
//   final int? maxLines;
//   final bool? obscureText;

//   const BlocTextBoxWidget(
//       {this.labelName,
//       this.fieldName,
//       this.readonly,
//       this.isRequired,
//       this.textFieldBloc,
//       this.updateValue,
//       this.keyboardType,
//       this.prefixIcon,
//       this.autofillHints,
//       this.suffixButton,
//       this.onChanged,
//       this.maxLines,
//       this.obscureText,
//       Key? key,
//       this.suffixIcon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 2.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: labelName!.length > 30
//               ? CrossAxisAlignment.start
//               : CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 2.w,
//             ),
//             prefixIcon!,
//             SizedBox(
//               width: 3.w,
//             ),
//             (isRequired != null && isRequired == true)
//                 ? Text('*',
//                     style: TextStyle(
//                         color: Theme.of(context).primaryColor, fontSize: 25))
//                 : Container(),
//             (isRequired != null && isRequired == true)
//                 ? SizedBox(
//                     width: 1.w,
//                   )
//                 : Container(),
//             Expanded(
//               child: Text(
//                 labelName!,
//                 style: TextStyle(
//                   fontSize: 11.sp,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Container(
//           color: readonly.toString() == 'true' ? Colors.grey.shade200 : null,
//           // padding: const EdgeInsets.only(top: 0.0, left: 0.0, bottom: 1),
//           child: TextFieldBlocBuilder(
//             textAlign: TextAlign.justify,

//             padding: EdgeInsets.zero,
//             obscureText: obscureText ?? false,
//             maxLines: maxLines ?? 1,
//             key: Key(fieldName ?? ''),
//             textFieldBloc: textFieldBloc as TextFieldBloc,
//             readOnly: readonly ?? false,
//             keyboardType: keyboardType ?? TextInputType.name,
//             suffixButton: suffixButton,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.only(
//                   bottom: 20,
//                   left: (readonly.toString() == 'true' ||
//                           (isRequired == null && isRequired != true))
//                       ? 48
//                       : 60),
//               // helperText: labelName,
//               // helperText: labelName!.length >= 25 ? labelName : null,
//               // helperMaxLines: 10,
//               // labelText: labelName,
//               // hintText: labelName,
//               // prefixIcon: prefixIcon!,
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(0),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(0),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(0),
//               ),
//               // suffixIcon: (isRequired != null && isRequired == true)
//               //     ? Text('*',
//               //         style: TextStyle(
//               //             color: Theme.of(context).primaryColor, fontSize: 20))
//               //     : Container(),
//               floatingLabelBehavior: FloatingLabelBehavior.never,
//               // floatingLabelBehavior: labelName!.length >= 25
//               //     ? FloatingLabelBehavior.never
//               //     : FloatingLabelBehavior.auto,
//               // labelStyle: (isRequired != null && isRequired == true)
//               //     ? TextStyle(color: Theme.of(context).primaryColor)
//               //     : null,
//             ),

//             // autofillHints: [
//             //   AutofillHints.username,
//             // ],
//             onChanged: onChanged,
//           ),
//         ),
//         Container(
//           color: Colors.black54,
//           height: 1,
//           width: double.infinity,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/theme_config.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  //
  final String? labelName;
  final String? fieldName;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final bool? isObsureText;
  final int? maxLines;
  final bool? readonly;
  final bool isRequired;
  final double? margin;
  final double? headerMargin;
  final EdgeInsets? contentPadding;
  final TextEditingController textEditingController;
  final Widget? suffixIcon;
  final String? Function(String)? validator;
  final int? maxLength;
  final Function? onTap;
  final bool? isCapitalText;
  final bool enabled;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function()? onEditingCompleted;

  final bool isAllowSpecialCharacters;
  final bool isTitleOnly;
  final bool isDigitOnly;
  final bool? isMobileType;
  final bool isAadhar;
  final bool isPan;
  final bool isDDN;
  final bool? obscureText;
  final bool? decimal;
  final bool isNumberBloc;

  const CustomTextFormFieldWidget({
    // super.key,
    this.labelName,
    this.fieldName,
    this.keyboardType,
    this.prefixIcon,
    this.isObsureText = false,
    this.maxLines = 1,
    this.readonly = false,
    this.isRequired = false,
    this.margin = 16,
    this.headerMargin,
    this.contentPadding,
    required this.textEditingController,
    this.suffixIcon,
    this.validator,
    this.maxLength = 256,
    this.onTap,
    this.isCapitalText,
    this.enabled = true,
    this.errorText,
    this.onChanged,
    this.isAllowSpecialCharacters = true,
    this.isTitleOnly = false,
    this.isDigitOnly = false,
    this.onEditingCompleted,
    this.isMobileType,
    this.isAadhar = false,
    this.isPan = false,
    this.isDDN = false,
    this.obscureText,
    this.decimal,
    this.isNumberBloc = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: headerMargin ?? 48,
              right: 16,
              bottom: 0,
            ),
            child: labelName != null
                ? Row(
                    children: [
                      Flexible(
                        child: Text(
                          labelName!,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      isRequired
                          ? Text(
                              '*',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                            )
                          : const SizedBox(),
                    ],
                  )
                : const SizedBox(),
          ),
          Row(
            children: [
              Padding(
                padding: DEFAULT_HORIZONTAL_PADDING,
                child: Icon(
                  prefixIcon?.icon,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(
                  margin: DEFAULT_PADDING,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    obscureText: obscureText ?? false,
                    readOnly: readonly!,
                    maxLines: maxLines,
                    onChanged: onChanged,
                    textCapitalization: isCapitalText == true || isPan == true
                        ? TextCapitalization.characters
                        : TextCapitalization.none,
                    onEditingComplete: onEditingCompleted,
                    autovalidateMode: AutovalidateMode.always,
                    onFieldSubmitted: (v) => onTap,
                    keyboardType: isMobileType == true
                        ? TextInputType.numberWithOptions(
                            decimal: decimal ?? false,
                            signed: false,
                          )
                        : isAadhar == true
                            ? TextInputType.number
                            : keyboardType ?? TextInputType.name,
                    maxLength: keyboardType == TextInputType.phone
                        ? 10
                        : isMobileType == true
                            ? 10
                            : maxLength,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    inputFormatters: [
                      if (isNumberBloc == true)
                        FilteringTextInputFormatter.allow(
                          decimal == true
                              ? RegExp('^\$|^(0|([0-9][0-9.]{0,}))?\$')
                              : RegExp('^\$|^(0|([1-9][0-9]{0,}))?\$'),
                        ),
                      LengthLimitingTextInputFormatter(
                        keyboardType == TextInputType.phone ? 10 : 256,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      ),
                      if (!isAllowSpecialCharacters)
                        // FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]")),
                        FilteringTextInputFormatter.deny(RegExp("[<>]")),
                      if (isTitleOnly)
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z .,_-]")),
                      if (isDigitOnly) FilteringTextInputFormatter.digitsOnly,
                      if (isAadhar) CardFormatter(separator: ' '),
                      if (isAadhar) LengthLimitingTextInputFormatter(14),
                      if (isPan) LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (str) => validator!(str!),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      // color: Color(0xff353535),
                    ),
                    controller: textEditingController,
                    decoration: InputDecoration(
                      fillColor: readonly.toString() == 'true'
                          ? Theme.of(context).focusColor
                          : null,
                      filled: true,
                      // contentPadding: contentPadding ?? const EdgeInsets.all(8),
                      contentPadding: EdgeInsets.only(
                          bottom: 20,
                          left: (readonly.toString() == 'true' ||
                                  (isRequired == null && isRequired != true))
                              ? 20
                              : 22),
                      counterText: "",
                      hintText: fieldName ?? "",
                      hintStyle: TextStyle(
                        fontSize: 10.5.sp,
                      ),
                      border: InputBorder.none,
                      enabled: enabled,
                      suffixIcon: suffixIcon,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.blue.shade700,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardFormatter extends TextInputFormatter {
  final String separator;

  CardFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    var endsWithSeparator = false;

    // if you add text
    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print(
          'Ends with separator: $endsWithSeparator, so we will add it with next digit.');

      var clean = newS.replaceAll(separator, '');
      print('CLEAN add: $clean');
      if (!endsWithSeparator && clean.length > 1 && clean.length % 4 == 1) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - 1) +
              separator +
              newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    // if you delete text
    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print('Ends with separator: $endsWithSeparator, so we removed it');

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');
      print('CLEAN remove: $clean');
      if (endsWithSeparator && clean.isNotEmpty && clean.length % 4 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }

    return newValue;
  }
}
