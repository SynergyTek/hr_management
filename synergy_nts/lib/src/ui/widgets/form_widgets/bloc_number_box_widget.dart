// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:sizer/sizer.dart';

// class BlocNumberBoxWidget extends StatelessWidget {
//   final String? labelName;
//   final String? fieldName;
//   final bool? readonly;
//   final bool? isRequired;
//   final TextFieldBloc? textFieldBloc;
//   final ValueChanged<String>? updateValue;
//   final TextInputType? keyboardType;
//   final Widget? prefixIcon;
//   final Iterable<String>? autofillHints;
//   final SuffixButton? suffixButton;
//   final bool? decimal;
//   final TextAlign? textAlign;
//   final void Function(String)? onChanged;

//   const BlocNumberBoxWidget(
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
//       this.decimal,
//       this.textAlign,
//       this.onChanged,
//       Key? key})
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
//           padding: const EdgeInsets.only(top: 0.0),
//           child: TextFieldBlocBuilder(
//             key: Key(fieldName!),
//             textFieldBloc: textFieldBloc!,
//             readOnly: readonly ?? false,
//             suffixButton: suffixButton,
//             textAlign: textAlign ?? TextAlign.left,
//             textInputAction: TextInputAction.done,
//             maxLines: 1,
//             keyboardType: TextInputType.numberWithOptions(
//               decimal: decimal ?? false,
//               // decimal: false,
//               signed: false,
//             ),
//             maxLength: 10,
//             maxLengthEnforced: MaxLengthEnforcement.enforced,
//             // keyboardType: TextInputType.number,
//             // TextInputType.numberWithOptions(decimal: decimal ?? true),

//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.only(
//                   bottom: 20,
//                   left: (readonly.toString() == 'true' ||
//                           (isRequired == null && isRequired != true))
//                       ? 48
//                       : 60),
//               // helperText: labelName!.length >= 20 ? labelName : null,
//               // helperMaxLines: 10,
//               counterText: '',
//               // labelText: labelName,
//               // hintText: labelName,
//               floatingLabelBehavior: labelName!.length >= 25
//                   ? FloatingLabelBehavior.never
//                   : FloatingLabelBehavior.auto,
//               // prefixIcon: Container(
//               //     // padding: DEFAULT_HORIZONTAL_PADDING,
//               //     // width: 20,
//               //     child: Row(
//               //   // mainAxisSize: MainAxisSize.min,
//               //   mainAxisAlignment: MainAxisAlignment.start,
//               //   children: [
//               //     prefixIcon!,
//               //     // const SizedBox(
//               //     //   width: 12,
//               //     // ),
//               //     // (isRequired != null && isRequired == true)
//               //     //     ? Text('*',
//               //     //         style: TextStyle(
//               //     //             color: Theme.of(context).primaryColor,
//               //     //             fontSize: 20))
//               //     //     : Container(),
//               //   ],
//               // )),
//               errorStyle: const TextStyle(fontSize: 12.0),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: Colors.transparent,
//                 ),
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
//               // labelStyle: (isRequired != null && isRequired == true)
//               //     ? TextStyle(color: Theme.of(context).primaryColor)
//               //     : null,
//             ),
//             // autofillHints: const [
//             //   AutofillHints.username,
//             // ],
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(
//                 decimal == true
//                     ? RegExp('^\$|^(0|([0-9][0-9.]{0,}))?\$')
//                     : RegExp('^\$|^(0|([1-9][0-9]{0,}))?\$'),
//               )
//             ],
//             onChanged: onChanged,
//           ),
//         ),
//         Container(
//           color: Colors.black54,
//           height: 1,
//           width: double.infinity,
//         )
//       ],
//     );
//   }
// }
