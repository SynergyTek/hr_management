// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';

// class RegistrationFormBloc extends FormBloc<String, String> {
//   final firstName = TextFieldBloc(
//     validators: [
//       FieldBlocValidators.required,
//     ],
//   );
//   final lastName = TextFieldBloc(
//     validators: [
//       FieldBlocValidators.required,
//     ],
//   );

//   final email = TextFieldBloc(
//     validators: [
//       FieldBlocValidators.required,
//       FieldBlocValidators.email,
//     ],
//   );

//   final phoneNumber = TextFieldBloc(
//     validators: [
//       FieldBlocValidators.required,
//     ],
//   );

//   final phoneNumberType = SelectFieldBloc(
//     items: ['Home', 'Work'],
//   );

//   final dob = InputFieldBloc<DateTime?, dynamic>(initialValue: null);

//   final country = SelectFieldBloc(
//     items: ['India', 'UAE'],
//   );

//   final language = MultiSelectFieldBloc<String, dynamic>(
//     items: ['Hindi', 'English'],
//   );

//   final suitableTime = InputFieldBloc<TimeOfDay?, Object>(initialValue: null);

//   final mode = BooleanFieldBloc();

//   final saveData = BooleanFieldBloc();

//   RegistrationFormBloc() {
//     addFieldBlocs(fieldBlocs: [
//       firstName,
//       lastName,
//       email,
//       phoneNumber,
//       phoneNumberType,
//       dob,
//       country,
//       language,
//       suitableTime,
//       mode,
//       saveData,
//     ]);

//     // firstName.updateInitialValue('Vidhisha');
//   }

//   @override
//   void onSubmitting() {
//     print(dob.value);
//   }
// }
