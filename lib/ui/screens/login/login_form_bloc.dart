import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreateLoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  CreateLoginFormBloc() {
    addFieldBlocs(fieldBlocs: [
      email,
      password,
    ]);
  }

  @override
  void onSubmitting() {}
}
