// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';

// class BlocTimePickerWidget extends StatelessWidget {
//   final String? labelName;
//   final InputFieldBloc? inputFieldBloc;
//   final Widget? prefixIcon;

//   const BlocTimePickerWidget({
//     this.labelName,
//     this.inputFieldBloc,
//     this.prefixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 0.0),
//       child: TimeFieldBlocBuilder(
//         timeFieldBloc: inputFieldBloc as InputFieldBloc<TimeOfDay, dynamic>,
//         format: DateFormat('hh:mm a'),
//         initialTime: TimeOfDay.now(),
//         decoration: InputDecoration(
//           labelText: labelName,
//           prefixIcon: prefixIcon ?? Icon(Icons.access_time),
//         ),
//       ),
//     );
//   }
// }
