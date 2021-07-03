// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// import 'package:hr_management/ui/widgets/primary_button.dart';

// class EnterDataAlertDialog extends StatelessWidget {
//   final TextEditingController dataController; // = TextEditingController();
//   final String title;
//   final String labelText;
//   final confrimButtonTitle;
//   final cancelButtonTitle;
//   final VoidCallback confirmOnPressed;
//   final VoidCallback cancelOnPressed;

//   const EnterDataAlertDialog({
//     this.dataController,
//     this.labelText,
//     this.title,
//     this.confrimButtonTitle,
//     this.cancelButtonTitle,
//     this.confirmOnPressed,
//     this.cancelOnPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // GlobalKey<FormState> formReason = GlobalKey<FormState>();
//     return AlertDialog(
//       title: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.black),
//       ),
//       backgroundColor: Colors.grey[350],
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(15.0))),
//       content: Form(
//         key: formReason,
//         child: new TextFormField(
//           controller: dataController,
//           decoration: InputDecoration(
//               border: OutlineInputBorder(), labelText: labelText),
//           validator: (value) {
//             return ((value == null || value.isEmpty) ? labelText : null);
//           },
//         ),
//       ),
//       actions: <Widget>[
//         Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               PrimaryButton(
//                 buttonText: cancelButtonTitle,
//                 handleOnPressed: cancelOnPressed,
//                 width: 80,
//               ),
//               SizedBox(width: 2.w),
//               PrimaryButton(
//                 buttonText: confrimButtonTitle,
//                 handleOnPressed: confirmOnPressed,
//                 width: 80,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
