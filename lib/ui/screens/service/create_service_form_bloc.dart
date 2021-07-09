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
  }

  @override
  void onSubmitting() {}
}
