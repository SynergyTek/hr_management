import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreateServiceFormBloc extends FormBloc<String, String> {
  final subject = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final description = TextFieldBloc();
  final startDate = InputFieldBloc<DateTime, dynamic>();
  final endDate = InputFieldBloc<DateTime, dynamic>();
  final sla = TextFieldBloc();
  final expiryDate = InputFieldBloc<DateTime, dynamic>();

  CreateServiceFormBloc() {
    addFieldBlocs(fieldBlocs: [
      subject,
      description,
      startDate,
      endDate,
      sla,
      expiryDate
    ]);

    endDate.onValueChanges(onData: (previous, current) async* {
      if (current.value != null && startDate.value != null) {
        // compareStartEndDate(startDate.value, current.value);
      }
    });

    startDate.onValueChanges(onData: (previous, current) async* {
      if (current.value != null && endDate.value != null) {
        // compareStartEndDate(startDate.value, current.value);
      }
    });
  }

  @override
  void onSubmitting() {}

  // bool compareStartEndDate(DateTime startDate, DateTime enddate) {
  //   if (enddate.isBefore(startDate)) {
  //     _showMyDialog();

  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Alert'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: const <Widget>[
  //               Text('Start Date Should be greater than End Date.'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
